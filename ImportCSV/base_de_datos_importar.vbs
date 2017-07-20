Option Explicit
On Error Resume Next
' ***********************************************************
' ���[�UDB�i�����n��V�X�e���p�jCSV�捞�X�N���v�g
' �쐬��:K.Tanaka
' �ύX���t   Rev   �ύX������e----------------------------->
' 2017/06/30(0.1.0)�V�K�쐬
' 2017/06/30(0.2.0)DDL���sFATAL���g���C�҂����ԁA���[�����M���A�X�N���v�g�I���R�[�h�ǉ�
' 2017/06/30(0.2.1)�����ӂ�̂���CInt��CLng�ɕύX
' 2017/07/10(0.3.0)�捞�ς�CSV�t�@�C���o�b�N�A�b�v�����ǉ�
' 2017/07/12(0.4.0)�f�t�H���g���[���A�h���X�݂̂̐ݒ�ł��\�ɂ��邽�߂̏C��
' 2017/07/18(0.5.0)�ċA�I�Ƀ��O�t�H���_���쐬�ł���悤�ɏC��
' 2017/07/20(0.6.0)Sub Main��On Error Resume Next�ǉ�
' ***********************************************************

' �e�X�g�p�t���O�i�e�X�g���{����"1"�ɂ����DB�ڑ��𔺂��������ɃX�N���v�g���s���ꎞ��~���邱�Ƃ��ł���B
' �{�ԉ^�p���͏��"0"�j
Const PRUEBA_DE_UNIDAD = 0

' INI�t�@�C�����t���p�X
Const INI_NOMBRE_DEL_ARCHIVO = "D:\ImportCSV\base_de_datos_importar.ini"
' ���O�t�@�C����
Const NOMBRE_DEL_REGISTRO = "insert_csv_"
' ���O���x��
Const LL_TRACE = "TRACE"
Const LL_DEBUG = "DEBUG"
Const LL_INFO  = "INFO"
Const LL_WARN  = "WARN"
Const LL_ERROR = "ERROR"
Const LL_FATAL = "FATAL"
' DB�ڑ�FATAL���g���C��
Const NUM_REVER = 3
' DB�ڑ�FATAL���g���C�҂�����
Const TIEMPO_DE_ESPERA = 3000
' ���[�N�e�[�u�����f�[�^���J�E���g�o�b�`���t���p�X
Const BAT_TABLA_DE_CONTEO = "D:\ImportCSV\CSV�捞\count_tbl.bat"
' ���[�N�e�[�u���쐬SQL�t�@�C����
Const SQL_CREAR_TABLA = "crear_tabla_temporal.sql"
' �e�[�u�����l�[���E�폜SQL�t�@�C����
Const SQL_REB_BOR_TABLA = "reb_bor_tabla.sql"
' ---------------------------------------------------------------------------------------------------------------
' �������f�����u�P���v�ɂ��邱�ƂŃg�����U�N�V�������O��剻�̐S�z�����Ȃ��Ă悭�Ȃ������߃R�����g�A�E�g
' ---------------------------------------------------------------------------------------------------------------
' �g�����U�N�V�������O��
'Const NOM_TRANSACCION_REGISTRO = "JINJI_log.ldf"
' SQLServer�T�[�r�X��
'Const NOMBRE_DEL_SERVICIO = "MSSQL$SID1"
' �T�[�r�X�J�n��~�҂�����
'Const TIEMPO_DE_ESPERA = 5000
' ---------------------------------------------------------------------------------------------------------------
Const NOM_BASE_DE_DATOS = "D:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\JINJI.mdf"
Const NOM_TRANSACCION_REGISTRO = "D:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\JINJI_log.ldf"

' ���[�����M���
Const ENVIAR_CORREO_NOMBRE_DEL_SERVIDOR = "mail.toyota.co.jp"					'���M���[���T�[�o(SMTP)��
Const PUERTO_NUM = 25															'�|�[�g�ԍ�
Const DEFAULT_MAIL_ADDRESS = "�����n��@�V�X�e���J���x������ <xb-si@mail.toyota.co.jp>"			'�f�t�H���g���[���A�h���X
Const FROM_MAIL_ADDRESS = "�����n��@�V�X�e���J���x������ <xb-si@mail.toyota.co.jp>"			'���o�l���[���A�h���X
' �捞�ς�CSV�t�@�C���o�b�N�A�b�v
Const CARPETA_DE_CSV_RESERVA = "backup"								'�捞�ς�CSV�t�@�C���o�b�N�A�b�v��t�H���_
Const LA_VIDA_UTIL = 7												'�捞�ς�CSV�t�@�C���o�b�N�A�b�v�ۑ�����

' �ϐ���`
Dim objFso						'FileSystemObject
Dim objWShell					'WScript.Shell
Dim blnError					'�G���[�t���O
Dim cueNivelRegistro, cueRegistroArchivoCamino, cueCsvArchivoCamino, cueCsvNombreDelArchivo		'INI�t�@�C������ϐ�
Dim entCsvComprobarFilaNum, cueCsvComprobarFormato, cueEjecDDLNombreDelArchivo					'INI�t�@�C������ϐ�
Dim cueImportarGuionNombreDelArchivo
'Dim cueEnviarCorreoNombreDelServidor, cuePuertoNum												'�iINI�t�@�C�����ڍ폜�j
Dim cueToDireccion, cueCcDireccion																'INI�t�@�C������ϐ�
'Dim cueTransaccionRegistroCamino																'�iINI�t�@�C�����ڍ폜�j
Dim cueNombreDelRegistro		'���O�t�@�C����
Dim fcnCSVArchivos				'CSV�t�@�C�����̔z��
Dim fecCSVActualizacion			'�eCSV�t�@�C���̃w�b�_�[���t
Dim fcnCSVNumeroEncabezados(8)	'�eCSV�t�@�C���̃w�b�_�[�����̔z��
Dim fcnCSVComprobarFormatos		'�eCSV�t�@�C���̃f�[�^�������m�F���e�̔z��
'Dim fcnCSVFilaDatos				'�eCSV�t�@�C���̍s�f�[�^�̔z��
Dim fcnCSVNumeroDeDatos(8)		'�eCSV�t�@�C���̍s���̔z��
Dim entradaArchivo				'�C���v�b�g�t�@�C��
Dim cueLinea					'�Ǎ��s������
Dim entFila						'�s�ԍ�
Dim entDigitos					'���ڍő包��
Dim entElementos				'���ڐ�
Dim cueProceso					'������
Dim cueError					'�G���[�R�[�h
Dim path						'�ċA�I���O�t�H���_�쐬�p�p�X
Dim arrEachFolderName			'�ċA�I���O�t�H���_�쐬�p�t�H���_��
Dim FolderName					'�ċA�I���O�t�H���_�쐬���[�v�p�ϐ�

'Dim fcnTODirecciones			'���惁�[���A�h���X�iTO�j�̔z��
'Dim fcnCCDirecciones			'CC���[���A�h���X�iCC�j�̔z��
Dim e, entLazo, entLazo2		'���[�v�p�ϐ�
Dim resultado					'���^�[���R�[�h

Dim objFile						'�t�@�C���T�C�Y�擾�p�t�@�C���I�u�W�F�N�g
Dim DBFileSize					'�f�[�^�x�[�X�t�@�C���T�C�X
Dim TLFileSize					'�g�����U�N�V�����t�@�C���T�C�Y

Dim cueOrigenCopia				'�R�s�[���t�@�C����
Dim cueDestinoCopia				'�R�s�[��t�@�C����

Dim cueNombreDelArchivo			'�폜�t�@�C����

Dim fcnTablaDeConteo			'���[�N�e�[�u�����z��
fcnTablaDeConteo = Array("WK_PERSON_OF_COMPANY", "WK_PERSON_OF_OTHER_COMPANY", "WK_BU_INFORMATION", "WK_SHITSU_INFORMATION", "WK_KAKARI_INFORMATION", "WK_STAFF_DIVISION", "WK_ABOUT_WORK", "WK_JOB_CATEGORY", "WK_QUALIFICATION")

' �G���[�t���O������
blnError = False
cueError = "000"

' FileSystemObject�I�u�W�F�N�g����
Set objFso = CreateObject("Scripting.FileSystemObject")

' INI�t�@�C�����݊m�F
If Not objFso.FileExists(INI_NOMBRE_DEL_ARCHIVO) Then
	' ���O�o�͗p�ϐ��ݒ�
	blnError = True
	cueProceso = "�����ݒ�t�@�C���Ǎ�"
	cueError = "001"
	' ���̎��_�ł�INI�t�@�C���ɋL�ڂ���Ă��郍�O�t�@�C���i�[�p�X�͂킩��Ȃ����߃o�b�`���s�p�X�Ƀ��O�o�͂���
	cueNombreDelRegistro = objFso.getParentFolderName(WScript.ScriptFullName) & "\" & NOMBRE_DEL_REGISTRO & _
		Replace(Replace(Replace(Now(), "/", "-"), ":", "-"), " ", "-") & ".log"
	Call SendErrMail(ENVIAR_CORREO_NOMBRE_DEL_SERVIDOR, PUERTO_NUM, DEFAULT_MAIL_ADDRESS,"" , cueProceso, cueError)
	Call SysWriter(LL_ERROR,"�G���[�ʒm���[�����M ������=" & cueProceso & " �G���[CD=" & cueError & " �G���[�ڍ�=" & _
		 "INI�t�@�C���Ǎ��s��",cueNombreDelRegistro)
	Set objFso = Nothing
	WScript.Quit CInt(cueError)
End If

' INI�t�@�C���Ǎ�
cueNivelRegistro = GetProfileString( INI_NOMBRE_DEL_ARCHIVO, "log", "loglevel" )
cueRegistroArchivoCamino = GetProfileString( INI_NOMBRE_DEL_ARCHIVO, "log", "log_file_path" )
cueCsvArchivoCamino = GetProfileString( INI_NOMBRE_DEL_ARCHIVO, "csv_file", "csv_file_path" )
cueCsvNombreDelArchivo = GetProfileString( INI_NOMBRE_DEL_ARCHIVO, "csv_file", "csv_filename" )
entCsvComprobarFilaNum = CLng(GetProfileString( INI_NOMBRE_DEL_ARCHIVO, "csv_file", "csv_check_row_num" ))
If Err.Number <> 0 Then		'�G���[�ɂȂ����ꍇ�̏���
	' ���O�o�͗p�ϐ��ݒ�
	blnError = True
	cueProceso = "�����ݒ�t�@�C���Ǎ�"
	cueError = "001"
	' ���̎��_�ł�INI�t�@�C���ɋL�ڂ���Ă��郍�O�t�@�C���i�[�p�X�͂킩��Ȃ����߃o�b�`���s�p�X�Ƀ��O�o�͂���
	cueNombreDelRegistro = objFso.getParentFolderName(WScript.ScriptFullName) & "\" & NOMBRE_DEL_REGISTRO & _
		Replace(Replace(Replace(Now(), "/", "-"), ":", "-"), " ", "-") & ".log"
	Call SendErrMail(ENVIAR_CORREO_NOMBRE_DEL_SERVIDOR, PUERTO_NUM, DEFAULT_MAIL_ADDRESS,"" , cueProceso, cueError)
	Call SysWriter(LL_ERROR,"�G���[�ʒm���[�����M ������=" & cueProceso & " �G���[CD=" & cueError & " �G���[�ڍ�=" & _
		 "CSV�t�@�C���m�F���Ǎ��s���i���ڌ����j�s��",cueNombreDelRegistro)
	Set objFso = Nothing
	WScript.Quit CInt(cueError)
End If
cueCsvComprobarFormato = GetProfileString( INI_NOMBRE_DEL_ARCHIVO, "csv_file", "csv_check_format" )
cueEjecDDLNombreDelArchivo = GetProfileString( INI_NOMBRE_DEL_ARCHIVO, "db_import", "exec_ddl_filename" )
cueImportarGuionNombreDelArchivo = GetProfileString( INI_NOMBRE_DEL_ARCHIVO, "db_import", "import_script_filename" )
'cueEnviarCorreoNombreDelServidor = GetProfileString( INI_NOMBRE_DEL_ARCHIVO, "mail_send", "sendmail_server_name" )
'cuePuertoNum = GetProfileString( INI_NOMBRE_DEL_ARCHIVO, "mail_send", "port_num" )
cueToDireccion = GetProfileString( INI_NOMBRE_DEL_ARCHIVO, "mail_send", "to_address" )
cueCcDireccion = GetProfileString( INI_NOMBRE_DEL_ARCHIVO, "mail_send", "cc_address" )
'cueTransaccionRegistroCamino = GetProfileString( INI_NOMBRE_DEL_ARCHIVO, "sqlserver", "transaction_log_path" )

' LOG�t�@�C������
cueNombreDelRegistro = cueRegistroArchivoCamino & "\" & NOMBRE_DEL_REGISTRO & _
						Replace(Replace(Replace(Now(), "/", "-"), ":", "-"), " ", "-") & ".log"
' LOG�o�͐�t�H���_�����݂��Ȃ��Ƃ��͍쐬����
If Not objFso.FolderExists(cueRegistroArchivoCamino) Then
	arrEachFolderName = Split(cueRegistroArchivoCamino, "\")
	path = ""

	' �e�t�H���_�������Ԃɍ쐬���� 
	For Each FolderName In arrEachFolderName
		If path <> "" Then
			path = path & "\"
		End If

		path = path & FolderName
		If Not objFso.FolderExists(path) Then
			objFso.CreateFolder(path)
			If Err.Number <> 0 Then		'�G���[�ɂȂ����ꍇ�̏���
				' ���O�o�͗p�ϐ��ݒ�
				blnError = True
				cueProceso = "LOG�o�͐�t�H���_�쐬"
				cueError = "001"
				' ���̎��_�ł�INI�t�@�C���ɋL�ڂ���Ă��郍�O�t�@�C���i�[�p�X�͂킩��Ȃ����߃o�b�`���s�p�X�Ƀ��O�o�͂���
				cueNombreDelRegistro = objFso.getParentFolderName(WScript.ScriptFullName) & "\" & NOMBRE_DEL_REGISTRO & _
					Replace(Replace(Replace(Now(), "/", "-"), ":", "-"), " ", "-") & ".log"
				Call SendErrMail(ENVIAR_CORREO_NOMBRE_DEL_SERVIDOR, PUERTO_NUM, DEFAULT_MAIL_ADDRESS,"" , cueProceso, cueError)
				Call SysWriter(LL_ERROR,"�G���[�ʒm���[�����M ������=" & cueProceso & " �G���[CD=" & cueError & " �G���[�ڍ�=" & _
					 "LOG�o�͐�t�H���_�쐬���s",cueNombreDelRegistro)
				Set objFso = Nothing
				WScript.Quit CInt(cueError)
			End If
		End If
	Next
End If

' ---------------------------------------------------------------------------------------------------------------
' �������f�����u�P���v�ɂ��邱�ƂŃg�����U�N�V�������O��剻�̐S�z�����Ȃ��Ă悭�Ȃ������߃R�����g�A�E�g
' ---------------------------------------------------------------------------------------------------------------
' �Ǘ��Ҍ����ɏ��i
'Set objWShell = CreateObject("Shell.Application")
'objWShell.ShellExecute "wscript.exe", """" & WScript.ScriptFullName & """ uac", "", "runas"
'Set objWShell = Nothing
'Call runasCheck()
'Call SysWriter(LL_INFO,"�Ǘ��Ҍ����ɏ��i",cueNombreDelRegistro)
' ---------------------------------------------------------------------------------------------------------------

' ���C���v���V�[�W���Ăяo��
Call Main

' �����I��
WScript.Quit CInt(cueError)

' ***********************************************************
' �X�^�[�g
' ***********************************************************
Sub Main()
	On Error Resume Next

	Call SysWriter(LL_INFO,"====== CSV Import Report ======",cueNombreDelRegistro)

	' CSV�t�@�C�����݊m�F
	cueProceso = "CSV�t�@�C�����݊m�F"
	Call SysWriter(LL_INFO,cueProceso & "�J�n",cueNombreDelRegistro)
	fcnCSVArchivos = Split(cueCsvNombreDelArchivo, ",")
	For Each e In fcnCSVArchivos
		If objFso.FileExists(cueCsvArchivoCamino & "\" & e) Then
			Select Case cueNivelRegistro
			Case LL_TRACE,LL_DEBUG	'�g���[�X���,�f�o�b�O���
				Call SysWriter(cueNivelRegistro,cueCsvArchivoCamino & "\" & e & " " & cueProceso & "=OK",cueNombreDelRegistro)
			Case LL_INFO			'���
				Call SysWriter(cueNivelRegistro,e & " " & cueProceso & "=OK",cueNombreDelRegistro)
			Case Else
				'WARN,ERROR,FATAL�͐��탍�O�o���Ȃ�
			End Select
		Else
			Call SysWriter(LL_ERROR,cueCsvArchivoCamino & "\" & e & " " & cueProceso & "=NG",cueNombreDelRegistro)
			' ���[�����M�p�ϐ��ݒ�
			cueError = "002"
			blnError = True
			Exit For
		End If
	Next

	' CSV�t�@�C���X�V���m�F�i���łɃf�[�^�������擾�j
	If Not blnError Then
		cueProceso = "CSV�t�@�C���X�V��"
		Call SysWriter(LL_INFO,cueProceso & "�m�F�J�n",cueNombreDelRegistro)
		entLazo = 0
		For Each e In fcnCSVArchivos
			Set entradaArchivo = objFso.OpenTextFile(cueCsvArchivoCamino & "\" & e, 1, False, 0)
			cueLinea = entradaArchivo.ReadLine
			entradaArchivo.Close
			' CSV�t�@�C���X�V���t�H�[�}�b�g�m�F
			If IsDate(Mid(cueLinea, 6, 10)) Then
				fecCSVActualizacion = CDate(Mid(cueLinea, 6, 10))
				fcnCSVNumeroEncabezados(entLazo) = CLng(Mid(cueLinea, 23, Len(cueLinea) - 1 - 22))
				' CSV�t�@�C���X�V���m�F
				If DateDiff("d", fecCSVActualizacion, Now()) = 0 Then
					Select Case cueNivelRegistro
					Case LL_TRACE	'�g���[�X���
						Call SysWriter(LL_TRACE,e & " �{�����t=" & Date() & " �X�V��=" & fecCSVActualizacion & " OK",cueNombreDelRegistro)
						Call SysWriter(LL_TRACE,e & " �f�[�^����=" & fcnCSVNumeroEncabezados(entLazo) & "��",cueNombreDelRegistro)
					Case LL_DEBUG	'�f�o�b�O���
						Call SysWriter(LL_DEBUG,e & " �X�V��=" & fecCSVActualizacion & " OK",cueNombreDelRegistro)
						Call SysWriter(LL_DEBUG,e & " �f�[�^����=" & fcnCSVNumeroEncabezados(entLazo) & "��",cueNombreDelRegistro)
					Case LL_INFO	'���
						Call SysWriter(LL_INFO,e & " �X�V��=" & fecCSVActualizacion & " OK",cueNombreDelRegistro)
					Case Else
						'WARN,ERROR,FATAL�͐��탍�O�o���Ȃ�
					End Select
				Else
					Call SysWriter(LL_ERROR,e & " �X�V��=" & fecCSVActualizacion & " NG",cueNombreDelRegistro)
					' ���[�����M�p�ϐ��ݒ�
					cueProceso = cueProceso & "�m�F"
					cueError = "004"
					blnError = True
					Exit For
				End If
			Else
				Call SysWriter(LL_ERROR,e & " �X�V��������=" & Mid(cueLinea, 6, 10) & " NG",cueNombreDelRegistro)
				' ���[�����M�p�ϐ��ݒ�
				cueProceso = cueProceso & "�t�H�[�}�b�g"
				cueError = "003"
				blnError = True
				Exit For
			End If
			entLazo = entLazo + 1
		Next
	End If

	' CSV�t�@�C���f�[�^�������m�F
	If Not blnError Then
		cueProceso = "CSV�t�@�C���f�[�^�������m�F"
		Call SysWriter(LL_INFO,cueProceso & "�J�n",cueNombreDelRegistro)
		fcnCSVComprobarFormatos = Split(cueCsvComprobarFormato, ",")
		' CSV�t�@�C�����ƂɃ��[�v
		entLazo2 = 0
		For Each e In fcnCSVArchivos
			Set entradaArchivo = objFso.OpenTextFile(cueCsvArchivoCamino & "\" & e, 1, False, 0)
			cueLinea = entradaArchivo.ReadLine	'1�s�ڂ̓Ǎ�
			entFila = 1
			'2�s�ڈȍ~��Ǎ��Ȃ��烋�[�v
			Do Until entradaArchivo.AtEndOfStream
				cueLinea = entradaArchivo.ReadLine
				entFila = entFila + 1
				'���ڂ̍ő包���`�F�b�N�v��
				If entFila <= entCsvComprobarFilaNum + 1 Then
				'�ǂݍ��񂾍s���Ƃɍ��ڂ̍ő包���ƍ��ڐ������������m�F
					'�ǂݍ��񂾍s���Ƃɍ��ڂ̍ő包���`�F�b�N
					entElementos = 0
					For entLazo = 0 To UBound(fcnCSVComprobarFormatos)
						'�������m�F���e��CSV�t�@�C�����Ɠ������ꍇ
						If Mid(fcnCSVComprobarFormatos(entLazo), 2, 7) = Left(e, 7) Then
							'CSV�f�[�^�������`�F�b�N�i���ڌ����m�F�j
							resultado = ComprobarFila(cueLinea, fcnCSVComprobarFormatos(entLazo), entFila)
							If cueNivelRegistro = LL_DEBUG Then	'�f�o�b�O���
								Call SysWriter(LL_DEBUG,e & " " & cueProceso & "�i���ڌ����m�F�j " & entFila & "�s��" & entLazo & "�Ԗ�",cueNombreDelRegistro)
								Call SysWriter(LL_DEBUG,e & " " & cueProceso & "�i���ڌ����m�F�j ����=" & resultado,cueNombreDelRegistro)
							End If
							If resultado <> "NORMAL" Then
								' ���[�����M�p�ϐ��ݒ�
								cueProceso = cueProceso & "�i���ڌ����j"
								cueError = "005"
								blnError = True
								Exit Do
							End If
							entElementos = entElementos + 1
						End If
					Next
					'�ǂݍ��񂾍s���Ƃɍ��ڐ��`�F�b�N
					resultado = ObtenerElementosNum(cueLinea, entElementos, entFila)
					If cueNivelRegistro = LL_DEBUG Then	'�f�o�b�O���
						Call SysWriter(LL_DEBUG,e & " " & cueProceso & "�i���ڐ��m�F�j ���ڐ�=" & entElementos & "��",cueNombreDelRegistro)
						Call SysWriter(LL_DEBUG,e & " " & cueProceso & "�i���ڐ��m�F�j ����=" & resultado,cueNombreDelRegistro)
					End If
					If resultado <> "NORMAL" Then
						' ���[�����M�p�ϐ��ݒ�
						cueProceso = cueProceso & "�i���ڐ��j"
						cueError = "006"
						blnError = True
						Exit Do
					End If
				Else
				'�ǂݍ��񂾍s���Ƃɍ��ڐ��݂̂����������m�F
					'INI�t�@�C���ɋL�ڂ���Ă��鍀�ڐ��擾
					entElementos = 0
					For entLazo = 0 To UBound(fcnCSVComprobarFormatos)
						'�������m�F���e��CSV�t�@�C�����Ɠ������ꍇ
						If Mid(fcnCSVComprobarFormatos(entLazo), 2, 7) = Left(e, 7) Then
							entElementos = entElementos + 1
						End If
					Next
					'CSV�f�[�^�������`�F�b�N�i���ڐ��m�F�j
					resultado = ObtenerElementosNum(cueLinea, entElementos, entFila)
					If cueNivelRegistro = LL_DEBUG Then	'�f�o�b�O���
						Call SysWriter(LL_DEBUG,e & " " & cueProceso & "�i���ڐ��m�F�j ���ڐ�=" & entElementos & "��",cueNombreDelRegistro)
						Call SysWriter(LL_DEBUG,e & " " & cueProceso & "�i���ڐ��m�F�j ����=" & resultado,cueNombreDelRegistro)
					End If
					If resultado <> "NORMAL" Then
						' ���[�����M�p�ϐ��ݒ�
						cueProceso = cueProceso & "�i���ڐ��j"
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
			'CSV�t�@�C���s����z��Ɋi�[�i1�s�ڂ������f�[�^�s�݂̂��J�E���g���邽��1�������j
			fcnCSVNumeroDeDatos(entLazo2) = entFila - 1
			entLazo2 = entLazo2 + 1
		Next
	End If

	' ���[�N�e�[�u���쐬
	If Not blnError Then
		cueProceso = "���[�N�e�[�u���쐬"
		Call SysWriter(LL_INFO,cueProceso & "�J�n",cueNombreDelRegistro)
		Set objWShell = CreateObject("WScript.Shell")
		For entLazo = 1 To NUM_REVER
			' �P�̃e�X�g�p�R�[�h
			If PRUEBA_DE_UNIDAD = 1 Then
				MsgBox "�X�N���v�g���s�ꎞ��~" & vbCrLf & "������=" & cueProceso & " ���s��=" & entLazo & "���", vbInformation, "�P�̃e�X�g�p"
			End If
			resultado = objWShell.Run(cueEjecDDLNombreDelArchivo & " " & SQL_CREAR_TABLA, 1, True)
			Select Case cueNivelRegistro
			Case LL_TRACE,LL_DEBUG	'�g���[�X���,�f�o�b�O���
				Call SysWriter(cueNivelRegistro,cueProceso & "�F" & entLazo & "���",cueNombreDelRegistro)
				Call SysWriter(cueNivelRegistro,cueProceso & "�F���s�R�}���h=" & cueEjecDDLNombreDelArchivo & " " & SQL_CREAR_TABLA,cueNombreDelRegistro)
			Case Else
				'WARN,ERROR,FATAL�͐��탍�O�o���Ȃ�
			End Select
			If resultado = 0 Then
				Call SysWriter(LL_INFO,cueProceso & "����",cueNombreDelRegistro)
				blnError = False
				Exit For
			Else
				Call SysWriter(LL_ERROR,cueProceso & "=NG ���g���C��=" & entLazo & "��",cueNombreDelRegistro)
				' ���[�����M�p�ϐ��ݒ�
				cueError = "007"
				blnError = True
			End If
			' �w��b���҂�
			Call WScript.Sleep(TIEMPO_DE_ESPERA)
		Next
		Set objWShell = Nothing
	End If

	' DB�捞
	If Not blnError Then
		cueProceso = "DB�捞"
		Call SysWriter(LL_INFO,cueProceso & "�J�n",cueNombreDelRegistro)
		Set objWShell = CreateObject("WScript.Shell")
		For entLazo = 1 To NUM_REVER
			' �P�̃e�X�g�p�R�[�h
			If PRUEBA_DE_UNIDAD = 1 Then
				MsgBox "�X�N���v�g���s�ꎞ��~" & vbCrLf & "������=" & cueProceso & " ���s��=" & entLazo & "���", vbInformation, "�P�̃e�X�g�p"
			End If
			resultado = objWShell.Run(cueImportarGuionNombreDelArchivo & " " & cueCsvArchivoCamino, 1, True)
			Select Case cueNivelRegistro
			Case LL_TRACE,LL_DEBUG	'�g���[�X���,�f�o�b�O���
				Call SysWriter(cueNivelRegistro,cueProceso & "�F" & entLazo & "���",cueNombreDelRegistro)
				Call SysWriter(cueNivelRegistro,cueProceso & "�F���s�R�}���h=" & cueImportarGuionNombreDelArchivo & " " & cueCsvArchivoCamino,cueNombreDelRegistro)
			Case Else
				'WARN,ERROR,FATAL�͐��탍�O�o���Ȃ�
			End Select
			If resultado = 0 Then
				Call SysWriter(LL_INFO,cueProceso & "����",cueNombreDelRegistro)
				blnError = False
				Exit For
			Else
				Call SysWriter(LL_ERROR,cueProceso & "=NG ���g���C��=" & entLazo & "��",cueNombreDelRegistro)
				' ���[�����M�p�ϐ��ݒ�
				cueError = "008"
				blnError = True
			End If
			' �w��b���҂�
			Call WScript.Sleep(TIEMPO_DE_ESPERA)
		Next
		Set objWShell = Nothing
	End If

	' ���[�N�e�[�u�����f�[�^���`�F�b�N
	If Not blnError Then
		cueProceso = "���[�N�e�[�u�����f�[�^���`�F�b�N"
		Call SysWriter(LL_INFO,cueProceso & "�J�n",cueNombreDelRegistro)
		Set objWShell = CreateObject("WScript.Shell")
		For entLazo = 0 To UBound(fcnTablaDeConteo)
			' �e���[�N�e�[�u�����̃f�[�^�����擾
			resultado =  objWShell.Run(BAT_TABLA_DE_CONTEO & " " & fcnTablaDeConteo(entLazo), 1, True)
			Select Case cueNivelRegistro
			Case LL_TRACE,LL_DEBUG	'�g���[�X���,�f�o�b�O���
				Call SysWriter(cueNivelRegistro,cueProceso & "�F" & fcnCSVArchivos(entLazo),cueNombreDelRegistro)
				Call SysWriter(cueNivelRegistro,cueProceso & "�F���s�R�}���h=" & BAT_TABLA_DE_CONTEO & " " & fcnTablaDeConteo(entLazo),cueNombreDelRegistro)
			Case Else
				'WARN,ERROR,FATAL�͐��탍�O�o���Ȃ�
			End Select
			' �eCSV�t�@�C���w�b�_�[�L�ڌ����ECSV�t�@�C���s���E���[�N�e�[�u�����̃f�[�^������r
			If Not(fcnCSVNumeroEncabezados(entLazo) = fcnCSVNumeroDeDatos(entLazo) And fcnCSVNumeroDeDatos(entLazo) = resultado) Then
				Call SysWriter(LL_ERROR,cueProceso & "=NG " & fcnCSVArchivos(entLazo) & "�w�b�_�[�L�ڌ���=" & fcnCSVNumeroEncabezados(entLazo) & "���A" & _
				"CSV�t�@�C���s��=" & fcnCSVNumeroDeDatos(entLazo) & "�s�A" & fcnTablaDeConteo(entLazo) & "���̃f�[�^����=" & resultado & "��",cueNombreDelRegistro)
				' ���[�����M�p�ϐ��ݒ�
				cueError = "009"
				blnError = True
				Exit For
			End If
			Call SysWriter(LL_INFO,cueProceso & "=OK " & fcnCSVArchivos(entLazo) & "�w�b�_�[�L�ڌ���=" & fcnCSVNumeroEncabezados(entLazo) & "���A" & _
			"CSV�t�@�C���s��=" & fcnCSVNumeroDeDatos(entLazo) & "�s�A" & fcnTablaDeConteo(entLazo) & "���̃f�[�^����=" & resultado & "��",cueNombreDelRegistro)
		Next
		Set objWShell = Nothing
	End If

	' �e�[�u�����l�[���E�폜
	If Not blnError Then
		cueProceso = "�e�[�u�����l�[���E�폜"
		Call SysWriter(LL_INFO,cueProceso & "�J�n",cueNombreDelRegistro)
		Set objWShell = CreateObject("WScript.Shell")
		For entLazo = 1 To NUM_REVER
			' �P�̃e�X�g�p�R�[�h
			If PRUEBA_DE_UNIDAD = 1 Then
				MsgBox "�X�N���v�g���s�ꎞ��~" & vbCrLf & "������=" & cueProceso & " ���s��=" & entLazo & "���", vbInformation, "�P�̃e�X�g�p"
			End If
			resultado = objWShell.Run(cueEjecDDLNombreDelArchivo & " " & SQL_REB_BOR_TABLA, 1, True)
			Select Case cueNivelRegistro
			Case LL_TRACE,LL_DEBUG	'�g���[�X���,�f�o�b�O���
				Call SysWriter(cueNivelRegistro,cueProceso & "�F" & entLazo & "���",cueNombreDelRegistro)
				Call SysWriter(cueNivelRegistro,cueProceso & "�F���s�R�}���h=" & cueEjecDDLNombreDelArchivo & " " & SQL_REB_BOR_TABLA,cueNombreDelRegistro)
			Case Else
				'WARN,ERROR,FATAL�͐��탍�O�o���Ȃ�
			End Select
			If resultado = 0 Then
				Call SysWriter(LL_INFO,cueProceso & "����",cueNombreDelRegistro)
				blnError = False
				Exit For
			Else
				Call SysWriter(LL_ERROR,cueProceso & "=NG ���g���C��=" & entLazo & "��",cueNombreDelRegistro)
				' ���[�����M�p�ϐ��ݒ�
				cueError = "010"
				blnError = True
			End If
			' �w��b���҂�
			Call WScript.Sleep(TIEMPO_DE_ESPERA)
		Next
		Set objWShell = Nothing
	End If

' ---------------------------------------------------------------------------------------------------------------
' �������f�����u�P���v�ɂ��邱�ƂŃg�����U�N�V�������O��剻�̐S�z�����Ȃ��Ă悭�Ȃ������߃R�����g�A�E�g
' ---------------------------------------------------------------------------------------------------------------
'	' SQL Server �̃T�[�r�X��~
'	If Not blnError Then
'		Call SysWriter(LL_INFO,"SQL Server �̃T�[�r�X��~",cueNombreDelRegistro)
'		For entLazo = 1 To NUM_REVER
'			Select Case cueNivelRegistro
'			Case LL_TRACE,LL_DEBUG	'�g���[�X���,�f�o�b�O���
'				Call SysWriter(cueNivelRegistro,"SQL Server �̃T�[�r�X��~�F" & entLazo & "���",cueNombreDelRegistro)
'			Case Else
'				'WARN,ERROR,FATAL�͐��탍�O�o���Ȃ�
'			End Select
'			'SQL Server �̃T�[�r�X��~
'			If StopService(NOMBRE_DEL_SERVICIO) Then
'				Call SysWriter(LL_INFO,"SQL Server �̃T�[�r�X��~����",cueNombreDelRegistro)
'				blnError = False
'				Exit For
'			Else
'				Call SysWriter(LL_ERROR,"SQL Server �̃T�[�r�X��~=NG ���g���C��=" & entLazo & "��",cueNombreDelRegistro)
'				' ���[�����M�p�ϐ��ݒ�
'				cueProceso = "SQL Server �̃T�[�r�X��~"
'				cueError = "009"
'				blnError = True
'			End If
'		Next
'	End If
'
'	' �g�����U�N�V�������O�폜
'	If Not blnError Then
'		Call SysWriter(LL_INFO,"�g�����U�N�V�������O�폜�J�n",cueNombreDelRegistro)
'		Select Case cueNivelRegistro
'		Case LL_TRACE,LL_DEBUG	'�g���[�X���,�f�o�b�O���
'			Call SysWriter(cueNivelRegistro,"�g�����U�N�V�������O�폜�F���O�p�X=" & cueTransaccionRegistroCamino & "\" & NOM_TRANSACCION_REGISTRO,cueNombreDelRegistro)
'		Case Else
'			'WARN,ERROR,FATAL�͐��탍�O�o���Ȃ�
'		End Select
'		objFso.DeleteFile cueTransaccionRegistroCamino & "\" & NOM_TRANSACCION_REGISTRO, True
'		If Err.Number = 0 Then
'			Call SysWriter(LL_INFO,"�g�����U�N�V�������O�폜����",cueNombreDelRegistro)
'		Else
'			Call SysWriter(LL_ERROR,"�g�����U�N�V�������O�폜=NG " & Err.Description,cueNombreDelRegistro)
'			' ���[�����M�p�ϐ��ݒ�
'			cueProceso = "�g�����U�N�V�������O�폜"
'			cueError = "010"
'			blnError = True
'		End If
'	End If
'
'	' SQL Server �̃T�[�r�X�J�n
'	If Not blnError Then
'		Call SysWriter(LL_INFO,"SQL Server �̃T�[�r�X�J�n",cueNombreDelRegistro)
'		For entLazo = 1 To NUM_REVER
'			Select Case cueNivelRegistro
'			Case LL_TRACE,LL_DEBUG	'�g���[�X���,�f�o�b�O���
'				Call SysWriter(cueNivelRegistro,"SQL Server �̃T�[�r�X�J�n�F" & entLazo & "���",cueNombreDelRegistro)
'			Case Else
'				'WARN,ERROR,FATAL�͐��탍�O�o���Ȃ�
'			End Select
'			'SQL Server �̃T�[�r�X�J�n
'			If StartService(NOMBRE_DEL_SERVICIO) Then
'				Call SysWriter(LL_INFO,"SQL Server �̃T�[�r�X�J�n����",cueNombreDelRegistro)
'				blnError = False
'				Exit For
'			Else
'				Call SysWriter(LL_ERROR,"SQL Server �̃T�[�r�X�J�n=NG ���g���C��=" & entLazo & "��",cueNombreDelRegistro)
'				' ���[�����M�p�ϐ��ݒ�
'				cueProceso = "SQL Server �̃T�[�r�X�J�n"
'				cueError = "011"
'				blnError = True
'			End If
'		Next
'	End If
' ---------------------------------------------------------------------------------------------------------------

	' �捞�ς�CSV�t�@�C���o�b�N�A�b�v
	' �o�b�N�A�b�v��t�H���_�����݂��Ȃ��Ƃ��͍쐬����
	If Not blnError Then
		cueProceso = "�捞�ς�CSV�t�@�C���o�b�N�A�b�v"
		Call SysWriter(LL_INFO,cueProceso & "�J�n",cueNombreDelRegistro)

		If Not objFso.FolderExists(cueCsvArchivoCamino & "\" & CARPETA_DE_CSV_RESERVA) Then
			objFso.CreateFolder(cueCsvArchivoCamino & "\" & CARPETA_DE_CSV_RESERVA)
			If Err.Number = 0 Then
				Select Case cueNivelRegistro
				Case LL_TRACE,LL_DEBUG,LL_INFO	'�g���[�X���,�f�o�b�O���,���
					Call SysWriter(cueNivelRegistro,"�o�b�N�A�b�v��t�H���_=" & cueCsvArchivoCamino & "\" & CARPETA_DE_CSV_RESERVA & " �쐬",cueNombreDelRegistro)
				Case Else
					'WARN,ERROR,FATAL�͐��탍�O�o���Ȃ�
				End Select
			Else
				Call SysWriter(LL_ERROR,"�o�b�N�A�b�v��t�H���_=" & cueCsvArchivoCamino & "\" & CARPETA_DE_CSV_RESERVA & " �쐬���s",cueNombreDelRegistro)
				' ���[�����M�p�ϐ��ݒ�
				cueError = "011"
				blnError = True
			End If
		End If
	End If

	If Not blnError Then
		' �o�b�N�A�b�v�t�H���_����8���O�ȑO�̃t�@�C���̍폜
		For Each e In objFso.GetFolder(cueCsvArchivoCamino & "\" & CARPETA_DE_CSV_RESERVA).Files
			fecCSVActualizacion = CDate(objFso.GetFile(e.Path).DateLastModified)
			If DateDiff("d", fecCSVActualizacion, Now()) > LA_VIDA_UTIL Then
				cueNombreDelArchivo = e.Name
				e.Delete
				If Err.Number = 0 Then
					Select Case cueNivelRegistro
					Case LL_TRACE	'�g���[�X���
						Call SysWriter(LL_TRACE,cueNombreDelArchivo & " �{�����t=" & Date() & " �X�V��=" & fecCSVActualizacion & " �폜",cueNombreDelRegistro)
					Case LL_DEBUG	'�f�o�b�O���
						Call SysWriter(LL_DEBUG,cueNombreDelArchivo & " �X�V��=" & fecCSVActualizacion & " �폜",cueNombreDelRegistro)
					Case LL_INFO	'���
						Call SysWriter(LL_INFO,cueNombreDelArchivo & " �폜",cueNombreDelRegistro)
					Case Else
						'WARN,ERROR,FATAL�͐��탍�O�o���Ȃ�
					End Select
				Else
					Call SysWriter(LL_ERROR,cueNombreDelArchivo & " �X�V��=" & fecCSVActualizacion & " �폜���s",cueNombreDelRegistro)
					' ���[�����M�p�ϐ��ݒ�
					cueError = "011"
					blnError = True
					Exit For
				End If
			End If
		Next
	End If

	' ������MCSV�t�@�C���̃R�s�[
	If Not blnError Then
		For Each e In fcnCSVArchivos
			cueOrigenCopia = cueCsvArchivoCamino & "\" & e
			cueDestinoCopia = cueCsvArchivoCamino & "\" & CARPETA_DE_CSV_RESERVA & "\" & Left(e, 7) & "_" & _
				Replace(Left(Now(),10), "/", "") & ".csv"
			' �t�@�C���R�s�[
			objFso.CopyFile cueOrigenCopia, cueDestinoCopia, True
			If Err.Number = 0 Then
				Select Case cueNivelRegistro
				Case LL_TRACE,LL_DEBUG	'�g���[�X���,�f�o�b�O���
					Call SysWriter(cueNivelRegistro,cueOrigenCopia & "\" & e & "��" & cueDestinoCopia & "�փR�s�[ " & cueProceso & "=OK",cueNombreDelRegistro)
				Case LL_INFO			'���
					Call SysWriter(cueNivelRegistro,e & " �� " & Left(e, 7) & "_" & Replace(Left(Now(),10), "/", "") & _
						".csv " & cueProceso & "=OK",cueNombreDelRegistro)
				Case Else
					'WARN,ERROR,FATAL�͐��탍�O�o���Ȃ�
				End Select
			Else
				Call SysWriter(LL_ERROR,cueOrigenCopia & "\" & e & "����" & cueDestinoCopia & "�փR�s�[���s " & cueProceso & "=NG",cueNombreDelRegistro)
				' ���[�����M�p�ϐ��ݒ�
				cueError = "011"
				blnError = True
				Exit For
			End If
		Next
	End If

	' �G���[���������ꍇ���[�����M
	If blnError Then
		Call SendErrMail(ENVIAR_CORREO_NOMBRE_DEL_SERVIDOR, PUERTO_NUM, cueToDireccion, cueCcDireccion, cueProceso, cueError)
		Call SysWriter(LL_ERROR,"�G���[�ʒm���[�����M ������=" & cueProceso & " �G���[CD=" & cueError,cueNombreDelRegistro)
	End If

	'�g�����U�N�V�������O�t�@�C���T�C�Y�擾
	Set objFile = objFso.GetFile(NOM_BASE_DE_DATOS)
	DBFileSize = objFile.Size
	Set objFile = objFso.GetFile(NOM_TRANSACCION_REGISTRO)
	TLFileSize = objFile.Size
	Call SysWriter(LL_INFO,"DataBaseFileSize:" & DBFileSize & "   TransactionLogFileSize:" & TLFileSize,cueNombreDelRegistro)

	Call SysWriter(LL_INFO,"====== CSV Import Report ======",cueNombreDelRegistro)

	Set objFile = Nothing
	Set objFso = Nothing
	Set objWShell = Nothing

End Sub

' ***********************************************************
' Log�o��
' -----------------------------------------------------------
' strLogLevel	:���O���x��
' strMsg		:���O���b�Z�[�W
' strLogPath	:���O�t�@�C���p�X
' ***********************************************************
Sub SysWriter(strLogLevel,strMsg,strLogPath)

	Dim objFSO, objFile
	'1:�ǂݎ�� 2:�㏑�� 8:�ǉ�
	Const ForReading = 1, ForWriting = 2, ForAppending = 8

	Set objFSO = CreateObject("Scripting.FileSystemObject")

	'�t�@�C�����J��
	'���������݂��Ȃ��ꍇ�ɂ͍쐬����
	Set objFile = objFSO.OpenTextFile(strLogPath, ForAppending, true)
	objFile.WriteLine (Date() & " " & Time() & " [" & strLogLevel & "] " & strMsg)
	objFile.Close

	Set objFile = Nothing
	Set objFSO = Nothing

End Sub

' ***********************************************************
' INI�t�@�C���ǂݏo�� ( ������� Empty ��Ԃ� )
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
' CSV�f�[�^�������`�F�b�N�i���ڌ����m�F�j
' -----------------------------------------------------------
' strLine		:�s������
' strCheckItem	:���ڕʌ����m�F���e
' intRowNum		:�s�ԍ�
' ***********************************************************
Function ComprobarFila(strLine, strCheckItem, intRowNum)

	Dim aryChkDigits				'���ڕʌ����m�F���e�̔z��
	Dim aryLineData					'�s�f�[�^���ڂ��Ƃ̔z��
	Dim intLoop						'���[�v�p�ϐ�

	ComprobarFila = "NORMAL"
	aryChkDigits = Split(strCheckItem, "/")
	aryChkDigits(0) = Replace(aryChkDigits(0), "(", "")
	aryChkDigits(3) = Replace(aryChkDigits(3), ")", "")
	aryLineData = Split(strLine,""",""",-1,vbBinaryCompare)
	For intLoop = 0 To UBound(aryLineData)
		aryLineData(intLoop) = Replace(aryLineData(intLoop), """", "")
	Next

	'���ڌ�����r
	If aryChkDigits(1) - 1 <= UBound(aryLineData) Then
		Select Case aryChkDigits(3)
		Case "EXACT"
			If MyLen(aryLineData(aryChkDigits(1) - 1)) <> CLng(aryChkDigits(2)) Then
				ComprobarFila = aryChkDigits(0) & ".csv " & CStr(intRowNum) & "�s��" & aryChkDigits(1) & "�Ԗ�"
			End If
		Case "LESS"
			If MyLen(aryLineData(aryChkDigits(1) - 1)) > CLng(aryChkDigits(2)) Then
				ComprobarFila = aryChkDigits(0) & ".csv " & CStr(intRowNum) & "�s��" & aryChkDigits(1) & "�Ԗ�"
			End If
		End Select
		'�g���[�X���
		If cueNivelRegistro = LL_TRACE And ComprobarFila = "NORMAL" Then
			Call SysWriter(cueNivelRegistro,"CSV�f�[�^�������`�F�b�N�i���ڌ����m�F�j " & ComprobarFila,cueNombreDelRegistro)
			Call SysWriter(cueNivelRegistro,"�l=" & aryLineData(aryChkDigits(1) - 1) & " ��r���=" & aryChkDigits(3),cueNombreDelRegistro)
			Call SysWriter(cueNivelRegistro,"������o�C�g��=" & MyLen(aryLineData(aryChkDigits(1) - 1)) & " ����=" & aryChkDigits(2) & " ����=OK",cueNombreDelRegistro)
		ElseIf cueNivelRegistro = LL_TRACE And ComprobarFila <> "NORMAL" Then
			Call SysWriter(cueNivelRegistro,"CSV�f�[�^�������`�F�b�N�i���ڌ����m�F�j " & ComprobarFila,cueNombreDelRegistro)
			Call SysWriter(cueNivelRegistro,"�l=" & aryLineData(aryChkDigits(1) - 1) & " ��r���=" & aryChkDigits(3),cueNombreDelRegistro)
			Call SysWriter(cueNivelRegistro,"������o�C�g��=" & MyLen(aryLineData(aryChkDigits(1) - 1)) & " ����=" & aryChkDigits(2) & " ����=���ڌ������",cueNombreDelRegistro)
		End If
	Else
		ComprobarFila = aryChkDigits(0) & ".csv " & CStr(intRowNum) & "�s��" & aryChkDigits(1) & "�Ԗ�"
		'�g���[�X���
		If cueNivelRegistro = LL_TRACE Then
			Call SysWriter(cueNivelRegistro,"CSV�f�[�^�������`�F�b�N�i���ڌ����m�F�j " & ComprobarFila,cueNombreDelRegistro)
			Call SysWriter(cueNivelRegistro,"�l=" & aryLineData(aryChkDigits(1) - 1) & " ��r���=" & aryChkDigits(3),cueNombreDelRegistro)
			Call SysWriter(cueNivelRegistro,"������o�C�g��=" & MyLen(aryLineData(aryChkDigits(1) - 1)) & " ����=" & aryChkDigits(2) & " ����=���ڐ�����",cueNombreDelRegistro)
		End If
	End If

End Function

' ***********************************************************
' CSV�f�[�^�������`�F�b�N�i���ڐ��m�F�j
' -----------------------------------------------------------
' strLine		:�s������
' intItem		:���ڐ�
' intRowNum		:�s�ԍ�
' ***********************************************************
Function ObtenerElementosNum(strLine, intItem, intRowNum)

	Dim aryLineData					'�s�f�[�^���ڂ��Ƃ̔z��

	ObtenerElementosNum = "NORMAL"
	aryLineData = Split(strLine,""",""",-1,vbBinaryCompare)

	If UBound(aryLineData) <> intItem - 1 Then
'		ObtenerElementosNum = "ANORMALIDAD"
		ObtenerElementosNum = intRowNum & "�s�� �����񍀖ڐ�=" & UBound(aryLineData) + 1 & "�� ���ڐ�=" & intItem & "��"
	End If

	'�g���[�X���
	If cueNivelRegistro = LL_TRACE Then
		Call SysWriter(LL_TRACE,"CSV�f�[�^�������`�F�b�N�i���ڐ��m�F�j " & intRowNum & "�s�� �����񍀖ڐ�=" & UBound(aryLineData) + 1 & "�� ���ڐ�=" & intItem & "��",cueNombreDelRegistro)
		Call SysWriter(LL_TRACE,"CSV�f�[�^�������`�F�b�N�i���ڐ��m�F�j ����=" & ObtenerElementosNum,cueNombreDelRegistro)
	End If

End Function

' ***********************************************************
' ���[�� ���M
' -----------------------------------------------------------
' strSMTPServer	:SMTP�T�[�o��
' intSMTPPort	:���M�T�[�o�|�[�g�ԍ�
' strTo			:���[������
' strCc			:���[��CC
' strProc		:������
' strErr		:�G���[�R�[�h
' ***********************************************************
Function SendErrMail(strSMTPServer, intSMTPPort, strTo, strCc, strProc, strErr)
	Const useLocalSMTPService = 1
	Const useRemoteSMTPService = 2
	Const useLocalExchangeService = 3

	Dim objMessage
	Dim mySMTPServer
	Dim mySMTPPort
'	Dim myAttachment
	Dim strSubject		'���[������
	Dim strBody			'���[���{��

	mySMTPServer = strSMTPServer
	mySMTPPort = intSMTPPort
'	myAttachment = ""

	'���[�������ҏW
	strSubject = "�yCSV Import Report�z" & vbCrLf & strProc & "NG(�G���[CD=" & strErr & ")"

	'���[���{���ҏW
	strBody = "���S���҂̕���" & vbCrLf & _
			"CSV�t�@�C���f�[�^�捞��������" & strProc & "NG�G���[���������܂����B" & vbCrLf & _
			"�G���[CD=" & strErr & vbCrLf & _
			"���O���m�F���A�蓮�Ŏ捞�������s���Ă��������B"

	Set objMessage = CreateObject("CDO.Message")
	objMessage.From = FROM_MAIL_ADDRESS
	If strTo = DEFAULT_MAIL_ADDRESS Or strTo = "" Then
		objMessage.To = DEFAULT_MAIL_ADDRESS
	Else
		objMessage.To = strTo & "," & DEFAULT_MAIL_ADDRESS
	End If
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
' �������f�����u�P���v�ɂ��邱�ƂŃg�����U�N�V�������O��剻�̐S�z�����Ȃ��Ă悭�Ȃ������߃R�����g�A�E�g
' ---------------------------------------------------------------------------------------------------------------
' ***********************************************************
' �T�[�r�X�̊J�n
' -----------------------------------------------------------
' ServiceName	:�T�[�r�X��
' �߂�l		:True=�T�[�r�X�J�n����/False=�T�[�r�X�J�n���s
' ***********************************************************
'Function StartService(ServiceName)
'	Dim strSvc, colSvcs, RetVal
'
'	Set colSvcs = GetObject("winmgmts:").ExecQuery("Select * from Win32_Service Where Name='" & ServiceName & "'")
'
'	'�g���[�X���
'	If cueNivelRegistro = LL_TRACE Then
'		Call SysWriter(LL_TRACE,"SQL Server �̃T�[�r�X�J�n SQL Server�T�[�r�X�m�F=Select * from Win32_Service Where Name='" & ServiceName & "'",cueNombreDelRegistro)
'		Call SysWriter(LL_TRACE,"SQL Server �̃T�[�r�X�J�n '" & ServiceName & "'=" & colSvcs.Count,cueNombreDelRegistro)
'	End If
'
'	If colSvcs.Count = 0 Then
'		StartService = False
'	Else
'		StartService = False
'		For Each strSvc in colSvcs
'			RetVal = strSvc.StartService()
'			'�g���[�X���
'			If cueNivelRegistro = LL_TRACE Then
'				Call SysWriter(LL_TRACE,"SQL Server �̃T�[�r�X�J�n ����=" & RetVal & " " & TIEMPO_DE_ESPERA & "�~���b�҂�",cueNombreDelRegistro)
'			End If
'			' �T�[�r�X�J�n����܂ł��΂炭�҂�
'			Call WScript.Sleep(TIEMPO_DE_ESPERA)
'			Select Case RetVal
'				Case 0
'					'Service Started
'					StartService = True
'					'�g���[�X���
'					If cueNivelRegistro = LL_TRACE Then
'						Call SysWriter(LL_TRACE,"SQL Server �̃T�[�r�X�J�n ����=" & RetVal & " Service Started",cueNombreDelRegistro)
'					End If
'				Case 10
'					'Service Running
'					StartService = True
'					'�g���[�X���
'					If cueNivelRegistro = LL_TRACE Then
'						Call SysWriter(LL_TRACE,"SQL Server �̃T�[�r�X�J�n ����=" & RetVal & " Service Running",cueNombreDelRegistro)
'					End If
'				Case Else
'					'Other
'					StartService = False
'					'�g���[�X���
'					If cueNivelRegistro = LL_TRACE Then
'						Call SysWriter(LL_TRACE,"SQL Server �̃T�[�r�X�J�n ����=" & RetVal & " Other",cueNombreDelRegistro)
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
' �T�[�r�X�̒�~
' -----------------------------------------------------------
' ServiceName	:�T�[�r�X��
' �߂�l		:True=�T�[�r�X��~����/False=�T�[�r�X��~���s
' ***********************************************************
'Function StopService(ServiceName)
'	Dim strSvc, colSvcs, RetVal
'
'	Set colSvcs = GetObject("winmgmts:").ExecQuery("Select * from Win32_Service Where Name='" & ServiceName & "'")
'
'	'�g���[�X���
'	If cueNivelRegistro = LL_TRACE Then
'		Call SysWriter(LL_TRACE,"SQL Server �̃T�[�r�X��~ SQL Server�T�[�r�X�m�F=Select * from Win32_Service Where Name='" & ServiceName & "'",cueNombreDelRegistro)
'		Call SysWriter(LL_TRACE,"SQL Server �̃T�[�r�X��~ '" & ServiceName & "'=" & colSvcs.Count,cueNombreDelRegistro)
'	End If
'
'	If colSvcs.Count = 0 Then
'		StopService = False
'	Else
'		StopService = False
'		For Each strSvc in colSvcs
'			RetVal = strSvc.StopService()
'			'�g���[�X���
'			If cueNivelRegistro = LL_TRACE Then
'				Call SysWriter(LL_TRACE,"SQL Server �̃T�[�r�X��~ ����=" & RetVal & " " & TIEMPO_DE_ESPERA & "�~���b�҂�",cueNombreDelRegistro)
'			End If
'			' �T�[�r�X��~����܂ł��΂炭�҂�
'			Call WScript.Sleep(TIEMPO_DE_ESPERA)
'			Select Case RetVal
'				Case 0
'					'Service Stopped
'					StopService = True
'					'�g���[�X���
'					If cueNivelRegistro = LL_TRACE Then
'						Call SysWriter(LL_TRACE,"SQL Server �̃T�[�r�X��~ ����=" & RetVal & " Service Stopped",cueNombreDelRegistro)
'					End If
'				Case 5
'					'Service Already Stopped
'					StopService = True
'					'�g���[�X���
'					If cueNivelRegistro = LL_TRACE Then
'						Call SysWriter(LL_TRACE,"SQL Server �̃T�[�r�X��~ ����=" & RetVal & " Service Already Stopped",cueNombreDelRegistro)
'					End If
'				Case Else
'					'Other
'					StopService = False
'					'�g���[�X���
'					If cueNivelRegistro = LL_TRACE Then
'						Call SysWriter(LL_TRACE,"SQL Server �̃T�[�r�X��~ ����=" & RetVal & " Other",cueNombreDelRegistro)
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
' �T�[�r�X�J�n��~�X�e�[�^�X�擾
' -----------------------------------------------------------
' strService	:�T�[�r�X��
' �߂�l		:Started=�T�[�r�X�J�n��/Stopped=�T�[�r�X��~��
' ***********************************************************
'Function GetServiceState(ByVal strService)
'
'	Set objQfeSet = objService.ExecQuery("Select * From Win32_Service Where Name='" & strService & "'")
'
'	For Each objQfe in objQfeSet
'		GetServiceState = "Start Pending Or Stop Pending"
'		If Trim(UCase(objQfe.State)) = "RUNNING" Or Trim(objQfe.State) = "���s��" Then
'			GetServiceState = "Started"
'		Else
'			If Trim(UCase(objQfe.State)) = "STOPPED" Or Trim(objQfe.State) = "��~" Then
'				GetServiceState = "Stopped"
'			End If
'		End If
'	Next
'
'	Set objQfeSet = Nothing
'
'End Function

' ***********************************************************
' ������̃o�C�g���J�E���g
' -----------------------------------------------------------
' a				:�V�t�gJIS������
' �߂�l		:�o�C�g��
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
' �Ǘ��Ҍ����ɏ��i
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
'	' �t���O�̎擾
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
