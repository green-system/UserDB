@echo off
:: ***********************************************************
:: ���[�N�e�[�u�����f�[�^���J�E���g�o�b�`
:: ����%1	�F�e�[�u����
:: �߂�l	�F�f�[�^����
:: �쐬��:K.Tanaka
:: �ύX���t   Rev   �ύX������e----------------------------->
:: 2017/06/30(1.0.0)�V�K�쐬
:: ***********************************************************
pushd %0\..

::�����ݒ�
set SERVERNAME=APLQDMA2065XB06
set USERID=sa
set PASSWORD=***

SQLCMD -S %SERVERNAME% -U %USERID% -P %PASSWORD% -d JINJI -h -1 -Q "EXIT(set nocount on;select count(*) from %1)"
exit %errorlevel%

::pause
