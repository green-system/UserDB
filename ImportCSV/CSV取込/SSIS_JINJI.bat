@echo off
:: ***********************************************************
:: SQL Server Integration Services ( SSIS )パッケージファイル
:: 実行によるCSVファイルデータインポート
:: 引数%1	：CSVファイル格納先パス
:: 作成者:K.Tanaka
:: 変更日付   Rev   変更履歴内容----------------------------->
:: 2017/06/30(1.0.0)新規作成
:: 2017/06/30(1.0.1)バッチ実行パスを"%~dp0"で取得するように変更し、パッケージファイルもカレントパスに配置
:: ***********************************************************
pushd %0\..

::初期設定
set OUTPUTFILE=%~dp0jinji_db.log
set SSISPKG=%~dp0Package.dtsx

echo %DATE% %TIME% SQL Server Integration Services ( SSIS )パッケージファイル実行>>%OUTPUTFILE%
echo インポートを開始します>>%OUTPUTFILE%

dtexec /File "%SSISPKG%" /Set \Package.Variables[User::FilePath].Properties[Value];%1 >> %OUTPUTFILE% 2>&1

set ERRLEVEL=%errorlevel%
echo %DATE% %TIME% SQL Server Integration Services ( SSIS )パッケージファイル実行終了（エラーレベル=%ERRLEVEL%）>>%OUTPUTFILE%

exit %ERRLEVEL%

::pause
