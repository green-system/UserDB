@echo off
:: ***********************************************************
:: DDL（テーブルクリエイト・リネーム・削除用）発行バッチ
:: 引数%1	：インプットSQLファイル名
:: 作成者:K.Tanaka
:: 変更日付   Rev   変更履歴内容----------------------------->
:: 2017/06/30(1.0.0)新規作成
:: 2017/06/30(1.0.1)バッチ実行パスを"%~dp0"で取得するように変更
:: 2017/06/30(1.0.2)ログファイルの場所を相対パス指定に変更
:: ***********************************************************
pushd %0\..

::初期設定
set SERVERNAME=APLQDMA2065XB06
set USERID=sa
set PASSWORD=***
set PROCORDER=crear_tabla_temporal.sql
set INPUTFILE=%1
:set OUTPUTFILE=%~dp0jinji_db.log
set OUTPUTFILE=..\log\jinji_db.log

if "%INPUTFILE%" == "%PROCORDER%" (
	echo %DATE% %TIME% DDL（テーブルクリエイト・リネーム・削除用）発行バッチ実行（引数=%1）> %OUTPUTFILE%
) ELSE (
	echo %DATE% %TIME% DDL（テーブルクリエイト・リネーム・削除用）発行バッチ実行（引数=%1）>> %OUTPUTFILE%
)

::SQLCMD -S %SERVERNAME% -U %USERID% -P %PASSWORD% -d JINJI -i "%INPUTFILE%" -o "%SQLCMDOUTPUT%"
SQLCMD -S %SERVERNAME% -U %USERID% -P %PASSWORD% -d JINJI -i "%INPUTFILE%">> "%OUTPUTFILE%"

set ERRLEVEL=%errorlevel%
echo %DATE% %TIME% DDL（テーブルクリエイト・リネーム・削除用）発行バッチ実行終了（エラーレベル=%ERRLEVEL%）>>%OUTPUTFILE%

exit %ERRLEVEL%

::pause
