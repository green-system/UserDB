@echo off
:: ***********************************************************
:: SQL Server Integration Services ( SSIS )�p�b�P�[�W�t�@�C��
:: ���s�ɂ��CSV�t�@�C���f�[�^�C���|�[�g
:: ����%1	�FCSV�t�@�C���i�[��p�X
:: �쐬��:K.Tanaka
:: �ύX���t   Rev   �ύX������e----------------------------->
:: 2017/06/30(1.0.0)�V�K�쐬
:: 2017/06/30(1.0.1)�o�b�`���s�p�X��"%~dp0"�Ŏ擾����悤�ɕύX���A�p�b�P�[�W�t�@�C�����J�����g�p�X�ɔz�u
:: ***********************************************************
pushd %0\..

::�����ݒ�
set OUTPUTFILE=%~dp0jinji_db.log
set SSISPKG=%~dp0Package.dtsx

echo %DATE% %TIME% SQL Server Integration Services ( SSIS )�p�b�P�[�W�t�@�C�����s>>%OUTPUTFILE%
echo �C���|�[�g���J�n���܂�>>%OUTPUTFILE%

dtexec /File "%SSISPKG%" /Set \Package.Variables[User::FilePath].Properties[Value];%1 >> %OUTPUTFILE% 2>&1

set ERRLEVEL=%errorlevel%
echo %DATE% %TIME% SQL Server Integration Services ( SSIS )�p�b�P�[�W�t�@�C�����s�I���i�G���[���x��=%ERRLEVEL%�j>>%OUTPUTFILE%

exit %ERRLEVEL%

::pause
