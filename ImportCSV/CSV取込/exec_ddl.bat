@echo off
:: ***********************************************************
:: DDL�i�e�[�u���N���G�C�g�E���l�[���E�폜�p�j���s�o�b�`
:: ����%1	�F�C���v�b�gSQL�t�@�C����
:: �쐬��:K.Tanaka
:: �ύX���t   Rev   �ύX������e----------------------------->
:: 2017/06/30(1.0.0)�V�K�쐬
:: 2017/06/30(1.0.1)�o�b�`���s�p�X��"%~dp0"�Ŏ擾����悤�ɕύX
:: ***********************************************************
pushd %0\..

::�����ݒ�
set SERVERNAME=DNX31150\sid1
set USERID=sa
set PASSWORD=chib@pc2016
set PROCORDER=crear_tabla_temporal.sql
set INPUTFILE=%1
set OUTPUTFILE=%~dp0jinji_db.log

if "%INPUTFILE%" == "%PROCORDER%" (
	echo %DATE% %TIME% DDL�i�e�[�u���N���G�C�g�E���l�[���E�폜�p�j���s�o�b�`���s�i����=%1�j> %OUTPUTFILE%
) ELSE (
	echo %DATE% %TIME% DDL�i�e�[�u���N���G�C�g�E���l�[���E�폜�p�j���s�o�b�`���s�i����=%1�j>> %OUTPUTFILE%
)

::SQLCMD -S %SERVERNAME% -U %USERID% -P %PASSWORD% -d JINJI -i "%INPUTFILE%" -o "%SQLCMDOUTPUT%"
SQLCMD -S %SERVERNAME% -U %USERID% -P %PASSWORD% -d JINJI -i "%INPUTFILE%">> "%OUTPUTFILE%"

set ERRLEVEL=%errorlevel%
echo %DATE% %TIME% DDL�i�e�[�u���N���G�C�g�E���l�[���E�폜�p�j���s�o�b�`���s�I���i�G���[���x��=%ERRLEVEL%�j>>%OUTPUTFILE%

exit %ERRLEVEL%

::pause
