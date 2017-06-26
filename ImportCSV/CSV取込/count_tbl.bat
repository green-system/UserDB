@echo off
:: ***********************************************************
:: ワークテーブル内データ数カウントバッチ
:: 引数%1	：テーブル名
:: 戻り値	：データ件数
:: 作成者:K.Tanaka
:: 変更日付   Rev   変更履歴内容----------------------------->
:: 2017/06/30(1.0.0)新規作成
:: ***********************************************************
pushd %0\..

::初期設定
set SERVERNAME=DNX31150\sid1
set USERID=sa
set PASSWORD=chib@pc2016

SQLCMD -S %SERVERNAME% -U %USERID% -P %PASSWORD% -d JINJI -h -1 -Q "EXIT(set nocount on;select count(*) from %1)"
exit %errorlevel%

::pause
