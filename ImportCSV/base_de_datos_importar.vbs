Option Explicit
On Error Resume Next
' ***********************************************************
' ユーザDB（東京地区システム用）CSV取込スクリプト
' 作成者:K.Tanaka
' 変更日付   Rev   変更履歴内容----------------------------->
' 2017/06/30(1.0.0)新規作成
' 2017/06/30(1.0.1)DDL実行FATALリトライ待ち時間、メール送信情報、スクリプト終了コード追加
' ***********************************************************

' テスト用フラグ（テスト実施時に"1"にするとDB接続を伴う処理中にスクリプト実行を一時停止することができる。
' 本番運用中は常に"0"）
Const PRUEBA_DE_UNIDAD = 0

' INIファイル名フルパス
Const INI_NOMBRE_DEL_ARCHIVO = "C:\Work\TOYOTA\DB取込\base_de_datos_importar.ini"
' ログファイル名
Const NOMBRE_DEL_REGISTRO = "insert_csv_"
' ログレベル
Const LL_TRACE = "TRACE"
Const LL_DEBUG = "DEBUG"
Const LL_INFO  = "INFO"
Const LL_WARN  = "WARN"
Const LL_ERROR = "ERROR"
Const LL_FATAL = "FATAL"
' DB接続FATALリトライ回数
Const NUM_REVER = 3
' DB接続FATALリトライ待ち時間
Const TIEMPO_DE_ESPERA = 3000
' ワークテーブル内データ数カウントバッチ名フルパス
Const BAT_TABLA_DE_CONTEO = "C:\Work\TOYOTA\DB取込\CSV取込\count_tbl.bat"
' ワークテーブル作成SQLファイル名
Const SQL_CREAR_TABLA = "crear_tabla_temporal.sql"
' テーブルリネーム・削除SQLファイル名
Const SQL_REB_BOR_TABLA = "reb_bor_tabla.sql"
' ---------------------------------------------------------------------------------------------------------------
' 復旧モデルを「単純」にすることでトランザクションログ肥大化の心配をしなくてよくなったためコメントアウト
' ---------------------------------------------------------------------------------------------------------------
' トランザクションログ名
'Const NOM_TRANSACCION_REGISTRO = "JINJI_log.ldf"
' SQLServerサービス名
'Const NOMBRE_DEL_SERVICIO = "MSSQL$SID1"
' サービス開始停止待ち時間
'Const TIEMPO_DE_ESPERA = 5000
' ---------------------------------------------------------------------------------------------------------------

' メール送信情報
Const ENVIAR_CORREO_NOMBRE_DEL_SERVIDOR = "schedule.jys.pref.chiba.lg.jp"		'送信メールサーバ(SMTP)名
Const PUERTO_NUM = 25															'ポート番号
Const DEFAULT_MAIL_ADDRESS = "admin <admin@mail.toyota.co.jp>"					'デフォルトメールアドレス

' 変数定義
Dim objFso						'FileSystemObject
Dim objWShell					'WScript.Shell
Dim blnError					'エラーフラグ
Dim cueNivelRegistro, cueRegistroArchivoCamino, cueCsvArchivoCamino, cueCsvNombreDelArchivo		'INIファイル代入変数
Dim entCsvComprobarFilaNum, cueCsvComprobarFormato, cueEjecDDLNombreDelArchivo					'INIファイル代入変数
Dim cueImportarGuionNombreDelArchivo
'Dim cueEnviarCorreoNombreDelServidor, cuePuertoNum												'（INIファイル項目削除）
Dim cueToDireccion, cueCcDireccion																'INIファイル代入変数
'Dim cueTransaccionRegistroCamino																'（INIファイル項目削除）
Dim cueNombreDelRegistro		'ログファイル名
Dim fcnCSVArchivos				'CSVファイル名の配列
Dim fecCSVActualizacion			'各CSVファイルのヘッダー日付
Dim fcnCSVNumeroEncabezados(8)	'各CSVファイルのヘッダー件数の配列
Dim fcnCSVComprobarFormatos		'各CSVファイルのデータ整合性確認内容の配列
'Dim fcnCSVFilaDatos				'各CSVファイルの行データの配列
Dim fcnCSVNumeroDeDatos(8)		'各CSVファイルの行数の配列
Dim entradaArchivo				'インプットファイル
Dim cueLinea					'読込行文字列
Dim entFila						'行番号
Dim entDigitos					'項目最大桁数
Dim entElementos				'項目数
Dim cueProceso					'処理名
Dim cueError					'エラーコード

'Dim fcnTODirecciones			'宛先メールアドレス（TO）の配列
'Dim fcnCCDirecciones			'CCメールアドレス（CC）の配列
Dim e, entLazo, entLazo2		'ループ用変数
Dim resultado					'リターンコード

Dim fcnTablaDeConteo			'ワークテーブル名配列
fcnTablaDeConteo = Array("WK_PERSON_OF_COMPANY", "WK_PERSON_OF_OTHER_COMPANY", "WK_BU_INFORMATION", "WK_SHITSU_INFORMATION", "WK_KAKARI_INFORMATION", "WK_STAFF_DIVISION", "WK_ABOUT_WORK", "WK_JOB_CATEGORY", "WK_QUALIFICATION")

' エラーフラグ初期化
blnError = False
cueError = "000"

' FileSystemObjectオブジェクト割当
Set objFso = CreateObject("Scripting.FileSystemObject")

' INIファイル存在確認
If Not objFso.FileExists(INI_NOMBRE_DEL_ARCHIVO) Then
	' ログ出力用変数設定
	blnError = True
	cueProceso = "初期設定ファイル読込"
	cueError = "001"
	' この時点ではINIファイルに記載されているログファイル格納パスはわからないためバッチ実行パスにログ出力する
	cueNombreDelRegistro = objFso.getParentFolderName(WScript.ScriptFullName) & "\" & NOMBRE_DEL_REGISTRO & _
		Replace(Replace(Replace(Now(), "/", "-"), ":", "-"), " ", "-") & ".log"
	Call SendErrMail(ENVIAR_CORREO_NOMBRE_DEL_SERVIDOR, PUERTO_NUM, DEFAULT_MAIL_ADDRESS,"" , cueProceso, cueError)
	Call SysWriter(LL_ERROR,"エラー通知メール送信 処理名=" & cueProceso & " エラーCD=" & cueError & " エラー詳細=" & _
		 "INIファイル読込不可",cueNombreDelRegistro)
	Set objFso = Nothing
	WScript.Quit CInt(cueError)
End If

' INIファイル読込
cueNivelRegistro = GetProfileString( INI_NOMBRE_DEL_ARCHIVO, "log", "loglevel" )
cueRegistroArchivoCamino = GetProfileString( INI_NOMBRE_DEL_ARCHIVO, "log", "log_file_path" )
cueCsvArchivoCamino = GetProfileString( INI_NOMBRE_DEL_ARCHIVO, "csv_file", "csv_file_path" )
cueCsvNombreDelArchivo = GetProfileString( INI_NOMBRE_DEL_ARCHIVO, "csv_file", "csv_filename" )
entCsvComprobarFilaNum = CInt(GetProfileString( INI_NOMBRE_DEL_ARCHIVO, "csv_file", "csv_check_row_num" ))
If Err.Number <> 0 Then		'エラーになった場合の処理
	' ログ出力用変数設定
	blnError = True
	cueProceso = "初期設定ファイル読込"
	cueError = "001"
	' この時点ではINIファイルに記載されているログファイル格納パスはわからないためバッチ実行パスにログ出力する
	cueNombreDelRegistro = objFso.getParentFolderName(WScript.ScriptFullName) & "\" & NOMBRE_DEL_REGISTRO & _
		Replace(Replace(Replace(Now(), "/", "-"), ":", "-"), " ", "-") & ".log"
	Call SendErrMail(ENVIAR_CORREO_NOMBRE_DEL_SERVIDOR, PUERTO_NUM, DEFAULT_MAIL_ADDRESS,"" , cueProceso, cueError)
	Call SysWriter(LL_ERROR,"エラー通知メール送信 処理名=" & cueProceso & " エラーCD=" & cueError & " エラー詳細=" & _
		 "CSVファイル確認時読込行数（項目桁数）不正",cueNombreDelRegistro)
	Set objFso = Nothing
	WScript.Quit CInt(cueError)
End If
cueCsvComprobarFormato = GetProfileString( INI_NOMBRE_DEL_ARCHIVO, "csv_file", "csv_check_format" )
cueEjecDDLNombreDelArchivo = GetProfileString( INI_NOMBRE_DEL_ARCHIVO, "db_import", "exec_ddl_filename" )
cueImportarGuionNombreDelArchivo = GetProfileString( INI_NOMBRE_DEL_ARCHIVO, "db_import", "import_script_filename" )
'cueEnviarCorreoNombreDelServidor = GetProfileString( INI_NOMBRE_DEL_ARCHIVO, "mail_send", "sendmail_server_name" )
'cuePuertoNum = GetProfileString( INI_NOMBRE_DEL_ARCHIVO, "mail_send", "port_num" )
cueToDireccion = GetProfileString( INI_NOMBRE_DEL_ARCHIVO, "mail_send", "to_address" ) & "," & DEFAULT_MAIL_ADDRESS
cueCcDireccion = GetProfileString( INI_NOMBRE_DEL_ARCHIVO, "mail_send", "cc_address" )
'cueTransaccionRegistroCamino = GetProfileString( INI_NOMBRE_DEL_ARCHIVO, "sqlserver", "transaction_log_path" )

' LOGファイル準備
cueNombreDelRegistro = cueRegistroArchivoCamino & "\" & NOMBRE_DEL_REGISTRO & _
						Replace(Replace(Replace(Now(), "/", "-"), ":", "-"), " ", "-") & ".log"

' ---------------------------------------------------------------------------------------------------------------
' 復旧モデルを「単純」にすることでトランザクションログ肥大化の心配をしなくてよくなったためコメントアウト
' ---------------------------------------------------------------------------------------------------------------
' 管理者権限に昇格
'Set objWShell = CreateObject("Shell.Application")
'objWShell.ShellExecute "wscript.exe", """" & WScript.ScriptFullName & """ uac", "", "runas"
'Set objWShell = Nothing
'Call runasCheck()
'Call SysWriter(LL_INFO,"管理者権限に昇格",cueNombreDelRegistro)
' ---------------------------------------------------------------------------------------------------------------

' メインプロシージャ呼び出し
Call Main

' 処理終了
WScript.Quit CInt(cueError)

' ***********************************************************
' スタート
' ***********************************************************
Sub Main()

	Call SysWriter(LL_INFO,"====== CSV Import Report ======",cueNombreDelRegistro)

	' CSVファイル存在確認
	cueProceso = "CSVファイル存在確認"
	Call SysWriter(LL_INFO,cueProceso & "開始",cueNombreDelRegistro)
	fcnCSVArchivos = Split(cueCsvNombreDelArchivo, ",")
	For Each e In fcnCSVArchivos
		If objFso.FileExists(cueCsvArchivoCamino & "\" & e) Then
			Select Case cueNivelRegistro
			Case LL_TRACE,LL_DEBUG	'トレース情報,デバッグ情報
				Call SysWriter(cueNivelRegistro,cueCsvArchivoCamino & "\" & e & " " & cueProceso & "=OK",cueNombreDelRegistro)
			Case LL_INFO			'情報
				Call SysWriter(cueNivelRegistro,e & " " & cueProceso & "=OK",cueNombreDelRegistro)
			Case Else
				'WARN,ERROR,FATALは正常ログ出さない
			End Select
		Else
			Call SysWriter(LL_ERROR,cueCsvArchivoCamino & "\" & e & " " & cueProceso & "=NG",cueNombreDelRegistro)
			' メール送信用変数設定
			cueError = "002"
			blnError = True
			Exit For
		End If
	Next

	' CSVファイル更新日確認（ついでにデータ件数も取得）
	If Not blnError Then
		cueProceso = "CSVファイル更新日"
		Call SysWriter(LL_INFO,cueProceso & "確認開始",cueNombreDelRegistro)
		entLazo = 0
		For Each e In fcnCSVArchivos
			Set entradaArchivo = objFso.OpenTextFile(cueCsvArchivoCamino & "\" & e, 1, False, 0)
			cueLinea = entradaArchivo.ReadLine
			entradaArchivo.Close
			' CSVファイル更新日フォーマット確認
			If IsDate(Mid(cueLinea, 6, 10)) Then
				fecCSVActualizacion = CDate(Mid(cueLinea, 6, 10))
				fcnCSVNumeroEncabezados(entLazo) = CInt(Mid(cueLinea, 23, Len(cueLinea) - 1 - 22))
				' CSVファイル更新日確認
				If DateDiff("d", fecCSVActualizacion, Now()) = 0 Then
					Select Case cueNivelRegistro
					Case LL_TRACE	'トレース情報
						Call SysWriter(LL_TRACE,e & " 本日日付=" & Date() & " 更新日=" & fecCSVActualizacion & " OK",cueNombreDelRegistro)
						Call SysWriter(LL_TRACE,e & " データ件数=" & fcnCSVNumeroEncabezados(entLazo) & "件",cueNombreDelRegistro)
					Case LL_DEBUG	'デバッグ情報
						Call SysWriter(LL_DEBUG,e & " 更新日=" & fecCSVActualizacion & " OK",cueNombreDelRegistro)
						Call SysWriter(LL_DEBUG,e & " データ件数=" & fcnCSVNumeroEncabezados(entLazo) & "件",cueNombreDelRegistro)
					Case LL_INFO	'情報
						Call SysWriter(LL_INFO,e & " 更新日=" & fecCSVActualizacion & " OK",cueNombreDelRegistro)
					Case Else
						'WARN,ERROR,FATALは正常ログ出さない
					End Select
				Else
					Call SysWriter(LL_ERROR,e & " 更新日=" & fecCSVActualizacion & " NG",cueNombreDelRegistro)
					' メール送信用変数設定
					cueProceso = cueProceso & "確認"
					cueError = "004"
					blnError = True
					Exit For
				End If
			Else
				Call SysWriter(LL_ERROR,e & " 更新日文字列=" & Mid(cueLinea, 6, 10) & " NG",cueNombreDelRegistro)
				' メール送信用変数設定
				cueProceso = cueProceso & "フォーマット"
				cueError = "003"
				blnError = True
				Exit For
			End If
			entLazo = entLazo + 1
		Next
	End If

	' CSVファイルデータ整合性確認
	If Not blnError Then
		cueProceso = "CSVファイルデータ整合性確認"
		Call SysWriter(LL_INFO,cueProceso & "開始",cueNombreDelRegistro)
		fcnCSVComprobarFormatos = Split(cueCsvComprobarFormato, ",")
		' CSVファイルごとにループ
		entLazo2 = 0
		For Each e In fcnCSVArchivos
			Set entradaArchivo = objFso.OpenTextFile(cueCsvArchivoCamino & "\" & e, 1, False, 0)
			cueLinea = entradaArchivo.ReadLine	'1行目の読込
			entFila = 1
			'2行目以降を読込ながらループ
			Do Until entradaArchivo.AtEndOfStream
				cueLinea = entradaArchivo.ReadLine
				entFila = entFila + 1
				'項目の最大桁数チェック要否
				If entFila <= entCsvComprobarFilaNum + 1 Then
				'読み込んだ行ごとに項目の最大桁数と項目数が正しいか確認
					'読み込んだ行ごとに項目の最大桁数チェック
					entElementos = 0
					For entLazo = 0 To UBound(fcnCSVComprobarFormatos)
						'整合性確認内容がCSVファイル名と等しい場合
						If Mid(fcnCSVComprobarFormatos(entLazo), 2, 7) = Left(e, 7) Then
							'CSVデータ整合性チェック（項目桁数確認）
							resultado = ComprobarFila(cueLinea, fcnCSVComprobarFormatos(entLazo), entFila)
							If cueNivelRegistro = LL_DEBUG Then	'デバッグ情報
								Call SysWriter(LL_DEBUG,e & " " & cueProceso & "（項目桁数確認） " & entFila & "行目" & entLazo & "番目",cueNombreDelRegistro)
								Call SysWriter(LL_DEBUG,e & " " & cueProceso & "（項目桁数確認） 結果=" & resultado,cueNombreDelRegistro)
							End If
							If resultado <> "NORMAL" Then
								' メール送信用変数設定
								cueProceso = cueProceso & "（項目桁数）"
								cueError = "005"
								blnError = True
								Exit Do
							End If
							entElementos = entElementos + 1
						End If
					Next
					'読み込んだ行ごとに項目数チェック
					resultado = ObtenerElementosNum(cueLinea, entElementos, entFila)
					If cueNivelRegistro = LL_DEBUG Then	'デバッグ情報
						Call SysWriter(LL_DEBUG,e & " " & cueProceso & "（項目数確認） 項目数=" & entElementos & "個",cueNombreDelRegistro)
						Call SysWriter(LL_DEBUG,e & " " & cueProceso & "（項目数確認） 結果=" & resultado,cueNombreDelRegistro)
					End If
					If resultado <> "NORMAL" Then
						' メール送信用変数設定
						cueProceso = cueProceso & "（項目数）"
						cueError = "006"
						blnError = True
						Exit Do
					End If
				Else
				'読み込んだ行ごとに項目数のみが正しいか確認
					'INIファイルに記載されている項目数取得
					entElementos = 0
					For entLazo = 0 To UBound(fcnCSVComprobarFormatos)
						'整合性確認内容がCSVファイル名と等しい場合
						If Mid(fcnCSVComprobarFormatos(entLazo), 2, 7) = Left(e, 7) Then
							entElementos = entElementos + 1
						End If
					Next
					'CSVデータ整合性チェック（項目数確認）
					resultado = ObtenerElementosNum(cueLinea, entElementos, entFila)
					If cueNivelRegistro = LL_DEBUG Then	'デバッグ情報
						Call SysWriter(LL_DEBUG,e & " " & cueProceso & "（項目数確認） 項目数=" & entElementos & "個",cueNombreDelRegistro)
						Call SysWriter(LL_DEBUG,e & " " & cueProceso & "（項目数確認） 結果=" & resultado,cueNombreDelRegistro)
					End If
					If resultado <> "NORMAL" Then
						' メール送信用変数設定
						cueProceso = cueProceso & "（項目数）"
						cueError = "006"
						blnError = True
						Exit Do
					End If
				End If
			Loop
			entradaArchivo.Close
			If Not blnError Then
				Call SysWriter(LL_INFO,e & " " & cueProceso & "=OK",cueNombreDelRegistro)
			Else
				Call SysWriter(LL_ERROR,e & " " & cueProceso & "=NG " & resultado,cueNombreDelRegistro)
				Exit For
			End If
			'CSVファイル行数を配列に格納（1行目を除くデータ行のみをカウントするため1を引く）
			fcnCSVNumeroDeDatos(entLazo2) = entFila - 1
			entLazo2 = entLazo2 + 1
		Next
	End If

	' ワークテーブル作成
	If Not blnError Then
		cueProceso = "ワークテーブル作成"
		Call SysWriter(LL_INFO,cueProceso & "開始",cueNombreDelRegistro)
		Set objWShell = CreateObject("WScript.Shell")
		For entLazo = 1 To NUM_REVER
			' 単体テスト用コード
			If PRUEBA_DE_UNIDAD = 1 Then
				MsgBox "スクリプト実行一時停止" & vbCrLf & "処理名=" & cueProceso & " 実行回数=" & entLazo & "回目", vbInformation, "単体テスト用"
			End If
			resultado = objWShell.Run(cueEjecDDLNombreDelArchivo & " " & SQL_CREAR_TABLA, 1, True)
			Select Case cueNivelRegistro
			Case LL_TRACE,LL_DEBUG	'トレース情報,デバッグ情報
				Call SysWriter(cueNivelRegistro,cueProceso & "：" & entLazo & "回目",cueNombreDelRegistro)
				Call SysWriter(cueNivelRegistro,cueProceso & "：実行コマンド=" & cueEjecDDLNombreDelArchivo & " " & SQL_CREAR_TABLA,cueNombreDelRegistro)
			Case Else
				'WARN,ERROR,FATALは正常ログ出さない
			End Select
			If resultado = 0 Then
				Call SysWriter(LL_INFO,cueProceso & "完了",cueNombreDelRegistro)
				blnError = False
				Exit For
			Else
				Call SysWriter(LL_ERROR,cueProceso & "=NG リトライ回数=" & entLazo & "回",cueNombreDelRegistro)
				' メール送信用変数設定
				cueError = "007"
				blnError = True
			End If
			' 指定秒数待つ
			Call WScript.Sleep(TIEMPO_DE_ESPERA)
		Next
		Set objWShell = Nothing
	End If

	' DB取込
	If Not blnError Then
		cueProceso = "DB取込"
		Call SysWriter(LL_INFO,cueProceso & "開始",cueNombreDelRegistro)
		Set objWShell = CreateObject("WScript.Shell")
		For entLazo = 1 To NUM_REVER
			' 単体テスト用コード
			If PRUEBA_DE_UNIDAD = 1 Then
				MsgBox "スクリプト実行一時停止" & vbCrLf & "処理名=" & cueProceso & " 実行回数=" & entLazo & "回目", vbInformation, "単体テスト用"
			End If
			resultado = objWShell.Run(cueImportarGuionNombreDelArchivo & " " & cueCsvArchivoCamino, 1, True)
			Select Case cueNivelRegistro
			Case LL_TRACE,LL_DEBUG	'トレース情報,デバッグ情報
				Call SysWriter(cueNivelRegistro,cueProceso & "：" & entLazo & "回目",cueNombreDelRegistro)
				Call SysWriter(cueNivelRegistro,cueProceso & "：実行コマンド=" & cueImportarGuionNombreDelArchivo & " " & cueCsvArchivoCamino,cueNombreDelRegistro)
			Case Else
				'WARN,ERROR,FATALは正常ログ出さない
			End Select
			If resultado = 0 Then
				Call SysWriter(LL_INFO,cueProceso & "完了",cueNombreDelRegistro)
				blnError = False
				Exit For
			Else
				Call SysWriter(LL_ERROR,cueProceso & "=NG リトライ回数=" & entLazo & "回",cueNombreDelRegistro)
				' メール送信用変数設定
				cueError = "008"
				blnError = True
			End If
			' 指定秒数待つ
			Call WScript.Sleep(TIEMPO_DE_ESPERA)
		Next
		Set objWShell = Nothing
	End If

	' ワークテーブル内データ数チェック
	If Not blnError Then
		cueProceso = "ワークテーブル内データ数チェック"
		Call SysWriter(LL_INFO,cueProceso & "開始",cueNombreDelRegistro)
		Set objWShell = CreateObject("WScript.Shell")
		For entLazo = 0 To UBound(fcnTablaDeConteo)
			' 各ワークテーブル内のデータ件数取得
			resultado =  objWShell.Run(BAT_TABLA_DE_CONTEO & " " & fcnTablaDeConteo(entLazo), 1, True)
			Select Case cueNivelRegistro
			Case LL_TRACE,LL_DEBUG	'トレース情報,デバッグ情報
				Call SysWriter(cueNivelRegistro,cueProceso & "：" & fcnCSVArchivos(entLazo),cueNombreDelRegistro)
				Call SysWriter(cueNivelRegistro,cueProceso & "：実行コマンド=" & BAT_TABLA_DE_CONTEO & " " & fcnTablaDeConteo(entLazo),cueNombreDelRegistro)
			Case Else
				'WARN,ERROR,FATALは正常ログ出さない
			End Select
			' 各CSVファイルヘッダー記載件数・CSVファイル行数・ワークテーブル内のデータ件数比較
			If Not(fcnCSVNumeroEncabezados(entLazo) = fcnCSVNumeroDeDatos(entLazo) And fcnCSVNumeroDeDatos(entLazo) = resultado) Then
				Call SysWriter(LL_ERROR,cueProceso & "=NG " & fcnCSVArchivos(entLazo) & "ヘッダー記載件数=" & fcnCSVNumeroEncabezados(entLazo) & "件、" & _
				"CSVファイル行数=" & fcnCSVNumeroDeDatos(entLazo) & "行、" & fcnTablaDeConteo(entLazo) & "内のデータ件数=" & resultado & "件",cueNombreDelRegistro)
				' メール送信用変数設定
				cueError = "009"
				blnError = True
				Exit For
			End If
			Call SysWriter(LL_INFO,cueProceso & "=OK " & fcnCSVArchivos(entLazo) & "ヘッダー記載件数=" & fcnCSVNumeroEncabezados(entLazo) & "件、" & _
			"CSVファイル行数=" & fcnCSVNumeroDeDatos(entLazo) & "行、" & fcnTablaDeConteo(entLazo) & "内のデータ件数=" & resultado & "件",cueNombreDelRegistro)
		Next
		Set objWShell = Nothing
	End If

	' テーブルリネーム・削除
	If Not blnError Then
		cueProceso = "テーブルリネーム・削除"
		Call SysWriter(LL_INFO,cueProceso & "開始",cueNombreDelRegistro)
		Set objWShell = CreateObject("WScript.Shell")
		For entLazo = 1 To NUM_REVER
			' 単体テスト用コード
			If PRUEBA_DE_UNIDAD = 1 Then
				MsgBox "スクリプト実行一時停止" & vbCrLf & "処理名=" & cueProceso & " 実行回数=" & entLazo & "回目", vbInformation, "単体テスト用"
			End If
			resultado = objWShell.Run(cueEjecDDLNombreDelArchivo & " " & SQL_REB_BOR_TABLA, 1, True)
			Select Case cueNivelRegistro
			Case LL_TRACE,LL_DEBUG	'トレース情報,デバッグ情報
				Call SysWriter(cueNivelRegistro,cueProceso & "：" & entLazo & "回目",cueNombreDelRegistro)
				Call SysWriter(cueNivelRegistro,cueProceso & "：実行コマンド=" & cueEjecDDLNombreDelArchivo & " " & SQL_REB_BOR_TABLA,cueNombreDelRegistro)
			Case Else
				'WARN,ERROR,FATALは正常ログ出さない
			End Select
			If resultado = 0 Then
				Call SysWriter(LL_INFO,cueProceso & "完了",cueNombreDelRegistro)
				blnError = False
				Exit For
			Else
				Call SysWriter(LL_ERROR,cueProceso & "=NG リトライ回数=" & entLazo & "回",cueNombreDelRegistro)
				' メール送信用変数設定
				cueError = "010"
				blnError = True
			End If
			' 指定秒数待つ
			Call WScript.Sleep(TIEMPO_DE_ESPERA)
		Next
		Set objWShell = Nothing
	End If

' ---------------------------------------------------------------------------------------------------------------
' 復旧モデルを「単純」にすることでトランザクションログ肥大化の心配をしなくてよくなったためコメントアウト
' ---------------------------------------------------------------------------------------------------------------
'	' SQL Server のサービス停止
'	If Not blnError Then
'		Call SysWriter(LL_INFO,"SQL Server のサービス停止",cueNombreDelRegistro)
'		For entLazo = 1 To NUM_REVER
'			Select Case cueNivelRegistro
'			Case LL_TRACE,LL_DEBUG	'トレース情報,デバッグ情報
'				Call SysWriter(cueNivelRegistro,"SQL Server のサービス停止：" & entLazo & "回目",cueNombreDelRegistro)
'			Case Else
'				'WARN,ERROR,FATALは正常ログ出さない
'			End Select
'			'SQL Server のサービス停止
'			If StopService(NOMBRE_DEL_SERVICIO) Then
'				Call SysWriter(LL_INFO,"SQL Server のサービス停止完了",cueNombreDelRegistro)
'				blnError = False
'				Exit For
'			Else
'				Call SysWriter(LL_ERROR,"SQL Server のサービス停止=NG リトライ回数=" & entLazo & "回",cueNombreDelRegistro)
'				' メール送信用変数設定
'				cueProceso = "SQL Server のサービス停止"
'				cueError = "009"
'				blnError = True
'			End If
'		Next
'	End If
'
'	' トランザクションログ削除
'	If Not blnError Then
'		Call SysWriter(LL_INFO,"トランザクションログ削除開始",cueNombreDelRegistro)
'		Select Case cueNivelRegistro
'		Case LL_TRACE,LL_DEBUG	'トレース情報,デバッグ情報
'			Call SysWriter(cueNivelRegistro,"トランザクションログ削除：ログパス=" & cueTransaccionRegistroCamino & "\" & NOM_TRANSACCION_REGISTRO,cueNombreDelRegistro)
'		Case Else
'			'WARN,ERROR,FATALは正常ログ出さない
'		End Select
'		objFso.DeleteFile cueTransaccionRegistroCamino & "\" & NOM_TRANSACCION_REGISTRO, True
'		If Err.Number = 0 Then
'			Call SysWriter(LL_INFO,"トランザクションログ削除完了",cueNombreDelRegistro)
'		Else
'			Call SysWriter(LL_ERROR,"トランザクションログ削除=NG " & Err.Description,cueNombreDelRegistro)
'			' メール送信用変数設定
'			cueProceso = "トランザクションログ削除"
'			cueError = "010"
'			blnError = True
'		End If
'	End If
'
'	' SQL Server のサービス開始
'	If Not blnError Then
'		Call SysWriter(LL_INFO,"SQL Server のサービス開始",cueNombreDelRegistro)
'		For entLazo = 1 To NUM_REVER
'			Select Case cueNivelRegistro
'			Case LL_TRACE,LL_DEBUG	'トレース情報,デバッグ情報
'				Call SysWriter(cueNivelRegistro,"SQL Server のサービス開始：" & entLazo & "回目",cueNombreDelRegistro)
'			Case Else
'				'WARN,ERROR,FATALは正常ログ出さない
'			End Select
'			'SQL Server のサービス開始
'			If StartService(NOMBRE_DEL_SERVICIO) Then
'				Call SysWriter(LL_INFO,"SQL Server のサービス開始完了",cueNombreDelRegistro)
'				blnError = False
'				Exit For
'			Else
'				Call SysWriter(LL_ERROR,"SQL Server のサービス開始=NG リトライ回数=" & entLazo & "回",cueNombreDelRegistro)
'				' メール送信用変数設定
'				cueProceso = "SQL Server のサービス開始"
'				cueError = "011"
'				blnError = True
'			End If
'		Next
'	End If
' ---------------------------------------------------------------------------------------------------------------

	' エラーがあった場合メール送信
	If blnError Then
		Call SendErrMail(ENVIAR_CORREO_NOMBRE_DEL_SERVIDOR, PUERTO_NUM, cueToDireccion, cueCcDireccion, cueProceso, cueError)
		Call SysWriter(LL_ERROR,"エラー通知メール送信 処理名=" & cueProceso & " エラーCD=" & cueError,cueNombreDelRegistro)
	End If

	Call SysWriter(LL_INFO,"====== CSV Import Report ======",cueNombreDelRegistro)

	Set objFso = Nothing
	Set objWShell = Nothing

End Sub

' ***********************************************************
' Log出力
' -----------------------------------------------------------
' strLogLevel	:ログレベル
' strMsg		:ログメッセージ
' strLogPath	:ログファイルパス
' ***********************************************************
Sub SysWriter(strLogLevel,strMsg,strLogPath)

	Dim objFSO, objFile
	'1:読み取り 2:上書き 8:追加
	Const ForReading = 1, ForWriting = 2, ForAppending = 8

	Set objFSO = CreateObject("Scripting.FileSystemObject")

	'ファイルを開く
	'もしも存在しない場合には作成する
	Set objFile = objFSO.OpenTextFile(strLogPath, ForAppending, true)
	objFile.WriteLine (Date() & " " & Time() & " [" & strLogLevel & "] " & strMsg)
	objFile.Close

	Set objFile = Nothing
	Set objFSO = Nothing

End Sub

' ***********************************************************
' INIファイル読み出し ( 無ければ Empty を返す )
' ***********************************************************
Function GetProfileString( strPath, strSection, strEntry )

	Dim Fso,objHandle,aData,bFound,strWork,aWork,I

	Set Fso = CreateObject("Scripting.FileSystemObject")
	Set objHandle = Fso.OpenTextFile( strPath, 1 )
	aData = Split( objHandle.ReadAll, vbCrLf )
	objHandle.Close

	GetProfileString = Empty

	bFound = False
	For I = 0 to Ubound( aData )-1
		if bFound then
			if Left( aData( I ), 1 ) = "[" then
				Exit For
			end if

			strWork = LTrim( aData( I ) )
			if Left( strWork, Len(strEntry)) = strEntry then
				aWork = Split( strWork, "=" )
				if Trim(aWork(0)) = strEntry then
					if Ubound( aWork ) = 1 then
						GetProfileString = Trim( aWork( 1 ) )
						Exit For
					end if
				end if
			end if
		end if

		if aData(I) = "[" & strSection & "]" then
			bFound = True
		end if
	Next

	Set Fso = Nothing
	Set objHandle = Nothing

End Function

' ***********************************************************
' CSVデータ整合性チェック（項目桁数確認）
' -----------------------------------------------------------
' strLine		:行文字列
' strCheckItem	:項目別桁数確認内容
' intRowNum		:行番号
' ***********************************************************
Function ComprobarFila(strLine, strCheckItem, intRowNum)

	Dim aryChkDigits				'項目別桁数確認内容の配列
	Dim aryLineData					'行データ項目ごとの配列
	Dim intLoop						'ループ用変数

	ComprobarFila = "NORMAL"
	aryChkDigits = Split(strCheckItem, "/")
	aryChkDigits(0) = Replace(aryChkDigits(0), "(", "")
	aryChkDigits(3) = Replace(aryChkDigits(3), ")", "")
	aryLineData = Split(strLine,""",""",-1,vbBinaryCompare)
	For intLoop = 0 To UBound(aryLineData)
		aryLineData(intLoop) = Replace(aryLineData(intLoop), """", "")
	Next

	'項目桁数比較
	If aryChkDigits(1) - 1 <= UBound(aryLineData) Then
		Select Case aryChkDigits(3)
		Case "EXACT"
			If MyLen(aryLineData(aryChkDigits(1) - 1)) <> CInt(aryChkDigits(2)) Then
				ComprobarFila = aryChkDigits(0) & ".csv " & CStr(intRowNum) & "行目" & aryChkDigits(1) & "番目"
			End If
		Case "LESS"
			If MyLen(aryLineData(aryChkDigits(1) - 1)) > CInt(aryChkDigits(2)) Then
				ComprobarFila = aryChkDigits(0) & ".csv " & CStr(intRowNum) & "行目" & aryChkDigits(1) & "番目"
			End If
		End Select
		'トレース情報
		If cueNivelRegistro = LL_TRACE And ComprobarFila = "NORMAL" Then
			Call SysWriter(cueNivelRegistro,"CSVデータ整合性チェック（項目桁数確認） " & ComprobarFila,cueNombreDelRegistro)
			Call SysWriter(cueNivelRegistro,"値=" & aryLineData(aryChkDigits(1) - 1) & " 比較種別=" & aryChkDigits(3),cueNombreDelRegistro)
			Call SysWriter(cueNivelRegistro,"文字列バイト数=" & MyLen(aryLineData(aryChkDigits(1) - 1)) & " 桁数=" & aryChkDigits(2) & " 結果=OK",cueNombreDelRegistro)
		ElseIf cueNivelRegistro = LL_TRACE And ComprobarFila <> "NORMAL" Then
			Call SysWriter(cueNivelRegistro,"CSVデータ整合性チェック（項目桁数確認） " & ComprobarFila,cueNombreDelRegistro)
			Call SysWriter(cueNivelRegistro,"値=" & aryLineData(aryChkDigits(1) - 1) & " 比較種別=" & aryChkDigits(3),cueNombreDelRegistro)
			Call SysWriter(cueNivelRegistro,"文字列バイト数=" & MyLen(aryLineData(aryChkDigits(1) - 1)) & " 桁数=" & aryChkDigits(2) & " 結果=項目桁数誤り",cueNombreDelRegistro)
		End If
	Else
		ComprobarFila = aryChkDigits(0) & ".csv " & CStr(intRowNum) & "行目" & aryChkDigits(1) & "番目"
		'トレース情報
		If cueNivelRegistro = LL_TRACE Then
			Call SysWriter(cueNivelRegistro,"CSVデータ整合性チェック（項目桁数確認） " & ComprobarFila,cueNombreDelRegistro)
			Call SysWriter(cueNivelRegistro,"値=" & aryLineData(aryChkDigits(1) - 1) & " 比較種別=" & aryChkDigits(3),cueNombreDelRegistro)
			Call SysWriter(cueNivelRegistro,"文字列バイト数=" & MyLen(aryLineData(aryChkDigits(1) - 1)) & " 桁数=" & aryChkDigits(2) & " 結果=項目数相違",cueNombreDelRegistro)
		End If
	End If

End Function

' ***********************************************************
' CSVデータ整合性チェック（項目数確認）
' -----------------------------------------------------------
' strLine		:行文字列
' intItem		:項目数
' intRowNum		:行番号
' ***********************************************************
Function ObtenerElementosNum(strLine, intItem, intRowNum)

	Dim aryLineData					'行データ項目ごとの配列

	ObtenerElementosNum = "NORMAL"
	aryLineData = Split(strLine,""",""",-1,vbBinaryCompare)

	If UBound(aryLineData) <> intItem - 1 Then
'		ObtenerElementosNum = "ANORMALIDAD"
		ObtenerElementosNum = intRowNum & "行目 文字列項目数=" & UBound(aryLineData) + 1 & "個 項目数=" & intItem & "個"
	End If

	'トレース情報
	If cueNivelRegistro = LL_TRACE Then
		Call SysWriter(LL_TRACE,"CSVデータ整合性チェック（項目数確認） " & intRowNum & "行目 文字列項目数=" & UBound(aryLineData) + 1 & "個 項目数=" & intItem & "個",cueNombreDelRegistro)
		Call SysWriter(LL_TRACE,"CSVデータ整合性チェック（項目数確認） 結果=" & ObtenerElementosNum,cueNombreDelRegistro)
	End If

End Function

' ***********************************************************
' メール 送信
' -----------------------------------------------------------
' strSMTPServer	:SMTPサーバ名
' intSMTPPort	:送信サーバポート番号
' strTo			:メール宛先
' strCc			:メールCC
' strProc		:処理名
' strErr		:エラーコード
' ***********************************************************
Function SendErrMail(strSMTPServer, intSMTPPort, strTo, strCc, strProc, strErr)
	Const useLocalSMTPService = 1
	Const useRemoteSMTPService = 2
	Const useLocalExchangeService = 3

	Dim objMessage
	Dim mySMTPServer
	Dim mySMTPPort
'	Dim myAttachment
	Dim strSubject		'メール件名
	Dim strBody			'メール本文

	mySMTPServer = strSMTPServer
	mySMTPPort = intSMTPPort
'	myAttachment = ""

	'メール件名編集
	strSubject = "【CSV Import Report】" & vbCrLf & strProc & "NG(エラーCD=" & strErr & ")"

	'メール本文編集
	strBody = "ご担当者の方へ" & vbCrLf & _
			"CSVファイルデータ取込処理中に" & strProc & "NGエラーが発生しました。" & vbCrLf & _
			"エラーCD=" & strErr & vbCrLf & _
			"ログを確認し、手動で取込処理を行ってください。"

	Set objMessage = CreateObject("CDO.Message")
	objMessage.From = "admin@mail.toyota.co.jp"
	objMessage.To = strTo
	objMessage.Cc = strCc
	objMessage.Subject = strSubject
	objMessage.TextBody = strBody & vbCrLf & Now
'	objMessage.AddAttachment(myAttachment)
	objMessage.Configuration.Fields.Item("http://schemas.microsoft.com/cdo/configuration/sendusing") = useRemoteSMTPService
	objMessage.Configuration.Fields.Item("http://schemas.microsoft.com/cdo/configuration/smtpserver") = mySMTPServer
	objMessage.Configuration.Fields.Item("http://schemas.microsoft.com/cdo/configuration/smtpserverport") = mySMTPPort
	objMessage.Configuration.Fields.Update
	objMessage.Send

	Set objMessage = Nothing
End Function

' ---------------------------------------------------------------------------------------------------------------
' 復旧モデルを「単純」にすることでトランザクションログ肥大化の心配をしなくてよくなったためコメントアウト
' ---------------------------------------------------------------------------------------------------------------
' ***********************************************************
' サービスの開始
' -----------------------------------------------------------
' ServiceName	:サービス名
' 戻り値		:True=サービス開始成功/False=サービス開始失敗
' ***********************************************************
'Function StartService(ServiceName)
'	Dim strSvc, colSvcs, RetVal
'
'	Set colSvcs = GetObject("winmgmts:").ExecQuery("Select * from Win32_Service Where Name='" & ServiceName & "'")
'
'	'トレース情報
'	If cueNivelRegistro = LL_TRACE Then
'		Call SysWriter(LL_TRACE,"SQL Server のサービス開始 SQL Serverサービス確認=Select * from Win32_Service Where Name='" & ServiceName & "'",cueNombreDelRegistro)
'		Call SysWriter(LL_TRACE,"SQL Server のサービス開始 '" & ServiceName & "'=" & colSvcs.Count,cueNombreDelRegistro)
'	End If
'
'	If colSvcs.Count = 0 Then
'		StartService = False
'	Else
'		StartService = False
'		For Each strSvc in colSvcs
'			RetVal = strSvc.StartService()
'			'トレース情報
'			If cueNivelRegistro = LL_TRACE Then
'				Call SysWriter(LL_TRACE,"SQL Server のサービス開始 結果=" & RetVal & " " & TIEMPO_DE_ESPERA & "ミリ秒待つ",cueNombreDelRegistro)
'			End If
'			' サービス開始するまでしばらく待つ
'			Call WScript.Sleep(TIEMPO_DE_ESPERA)
'			Select Case RetVal
'				Case 0
'					'Service Started
'					StartService = True
'					'トレース情報
'					If cueNivelRegistro = LL_TRACE Then
'						Call SysWriter(LL_TRACE,"SQL Server のサービス開始 結果=" & RetVal & " Service Started",cueNombreDelRegistro)
'					End If
'				Case 10
'					'Service Running
'					StartService = True
'					'トレース情報
'					If cueNivelRegistro = LL_TRACE Then
'						Call SysWriter(LL_TRACE,"SQL Server のサービス開始 結果=" & RetVal & " Service Running",cueNombreDelRegistro)
'					End If
'				Case Else
'					'Other
'					StartService = False
'					'トレース情報
'					If cueNivelRegistro = LL_TRACE Then
'						Call SysWriter(LL_TRACE,"SQL Server のサービス開始 結果=" & RetVal & " Other",cueNombreDelRegistro)
'					End If
'			End Select
'			Exit For
'		Next
'	End If
'
'	Set colSvcs = Nothing
'
'End Function
'
' ***********************************************************
' サービスの停止
' -----------------------------------------------------------
' ServiceName	:サービス名
' 戻り値		:True=サービス停止成功/False=サービス停止失敗
' ***********************************************************
'Function StopService(ServiceName)
'	Dim strSvc, colSvcs, RetVal
'
'	Set colSvcs = GetObject("winmgmts:").ExecQuery("Select * from Win32_Service Where Name='" & ServiceName & "'")
'
'	'トレース情報
'	If cueNivelRegistro = LL_TRACE Then
'		Call SysWriter(LL_TRACE,"SQL Server のサービス停止 SQL Serverサービス確認=Select * from Win32_Service Where Name='" & ServiceName & "'",cueNombreDelRegistro)
'		Call SysWriter(LL_TRACE,"SQL Server のサービス停止 '" & ServiceName & "'=" & colSvcs.Count,cueNombreDelRegistro)
'	End If
'
'	If colSvcs.Count = 0 Then
'		StopService = False
'	Else
'		StopService = False
'		For Each strSvc in colSvcs
'			RetVal = strSvc.StopService()
'			'トレース情報
'			If cueNivelRegistro = LL_TRACE Then
'				Call SysWriter(LL_TRACE,"SQL Server のサービス停止 結果=" & RetVal & " " & TIEMPO_DE_ESPERA & "ミリ秒待つ",cueNombreDelRegistro)
'			End If
'			' サービス停止するまでしばらく待つ
'			Call WScript.Sleep(TIEMPO_DE_ESPERA)
'			Select Case RetVal
'				Case 0
'					'Service Stopped
'					StopService = True
'					'トレース情報
'					If cueNivelRegistro = LL_TRACE Then
'						Call SysWriter(LL_TRACE,"SQL Server のサービス停止 結果=" & RetVal & " Service Stopped",cueNombreDelRegistro)
'					End If
'				Case 5
'					'Service Already Stopped
'					StopService = True
'					'トレース情報
'					If cueNivelRegistro = LL_TRACE Then
'						Call SysWriter(LL_TRACE,"SQL Server のサービス停止 結果=" & RetVal & " Service Already Stopped",cueNombreDelRegistro)
'					End If
'				Case Else
'					'Other
'					StopService = False
'					'トレース情報
'					If cueNivelRegistro = LL_TRACE Then
'						Call SysWriter(LL_TRACE,"SQL Server のサービス停止 結果=" & RetVal & " Other",cueNombreDelRegistro)
'					End If
'			End Select
'			Exit For
'		Next
'	End If
'
'	Set colSvcs = Nothing
'
'End Function
'
' ***********************************************************
' サービス開始停止ステータス取得
' -----------------------------------------------------------
' strService	:サービス名
' 戻り値		:Started=サービス開始中/Stopped=サービス停止中
' ***********************************************************
'Function GetServiceState(ByVal strService)
'
'	Set objQfeSet = objService.ExecQuery("Select * From Win32_Service Where Name='" & strService & "'")
'
'	For Each objQfe in objQfeSet
'		GetServiceState = "Start Pending Or Stop Pending"
'		If Trim(UCase(objQfe.State)) = "RUNNING" Or Trim(objQfe.State) = "実行中" Then
'			GetServiceState = "Started"
'		Else
'			If Trim(UCase(objQfe.State)) = "STOPPED" Or Trim(objQfe.State) = "停止" Then
'				GetServiceState = "Stopped"
'			End If
'		End If
'	Next
'
'	Set objQfeSet = Nothing
'
'End Function

' ***********************************************************
' 文字列のバイト数カウント
' -----------------------------------------------------------
' a				:シフトJIS文字列
' 戻り値		:バイト数
' ***********************************************************
Function MyLen(ByVal a)
	Dim c
	Dim i
	c = 0
	For i = 0 To Len(a) - 1
		Dim k
		k = Mid(a, i + 1, 1)
		If (Asc(k) And &HFF00) = 0 Then
			c = c + 1
		Else
			c = c + 2
		End If
	Next
	MyLen = c
End Function

' ***********************************************************
' 管理者権限に昇格
' ***********************************************************
'Function runasCheck()
'	Dim strScriptPathName
'
'	Dim flgRunasMode
'	Dim objWMI, osInfo, flag, objShell, os
'	Dim strArgs
'	Dim args
'
'	Set args = WScript.Arguments
'
'	flgRunasMode = False
'	strArgs = ""
'
'	' フラグの取得
'	If args.Count > 0 Then
'		If UCase(args.item(0)) = "/RUNAS" Then
'			flgRunasMode = True
'		End If
'		strArgs = strArgs & " " & args.item(0)
'	End If
'
'
'	Set objWMI = GetObject("winmgmts:" & "{impersonationLevel=impersonate}!\\.\root\cimv2")
'	Set osInfo = objWMI.ExecQuery("SELECT * FROM Win32_OperatingSystem")
'	flag = false
'	For Each os in osInfo
'		If Left(os.Version, 3) >= 6.0 Then
'			flag = True
'		End If
'	Next
'
'	Set objShell = CreateObject("Shell.Application")
'	If flgRunasMode = False Then
'		If flag = True Then
'			objShell.ShellExecute "wscript.exe", """" & WScript.ScriptFullName & """" & " /RUNAS " & strArgs, "", "runas", 1
'			Wscript.Quit
'		End If
'	End If
'	Set objShell = Nothing
'	Set osInfo = Nothing
'	Set objWMI = Nothing
'	Set args = Nothing
'End Function
