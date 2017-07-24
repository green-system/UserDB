/*
 ���[�UDB�i�����n��V�X�e���p�j�Ǘ��e�[�u���쐬T-SQL
 �쐬��:K.Tanaka
 �ύX���t   Rev   �ύX������e----------------------------->
 2017/06/30(0.1.0)�V�K�쐬
 2017/07/07(0.2.0)�f�[�^�x�[�X���ύX
*/

USE [JINJI_MAINTE]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING OFF
GO

/*** REPLY_PERMISSION �e�[�u���폜 ***/
if object_id('[dbo].[REPLY_PERMISSION]') is not null
DROP TABLE [dbo].[REPLY_PERMISSION]
GO
/*** REPLY_PERMISSION �e�[�u���쐬 ***/
create table [dbo].[REPLY_PERMISSION] (
      [SYSTEM_CODE] [tinyint] not null
    , [RETURN_ITEM_CODE] [tinyint] not null
    , [DELETE_FLAG] [bit] not null
    , [DELETE_HOST_NAME] [varchar](30)
    , [DELETE_DATE_TIME] [datetime2](3)
    , CONSTRAINT [PK__REPLY_PERMISSION] primary key CLUSTERED
    (
       [SYSTEM_CODE] asc,
       [RETURN_ITEM_CODE] asc
    ) WITH (
       PAD_INDEX = OFF
     , STATISTICS_NORECOMPUTE = OFF
     , IGNORE_DUP_KEY = OFF
     , ALLOW_ROW_LOCKS = ON
     , ALLOW_PAGE_LOCKS = ON
    ) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

/*** �_���e�[�u�����o�^ *********/
/*** ��������� REPLY_PERMISSION ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'���������'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE',@level1name=N'REPLY_PERMISSION'
GO
/*** �_���J�������o�^ ***/
/*** �V�X�e���R�[�h SYSTEM_CODE ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'�V�X�e���R�[�h'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'REPLY_PERMISSION'
                                ,@level2type=N'COLUMN',@level2name=N'SYSTEM_CODE'
GO
/*** �������ڃR�[�h RETURN_ITEM_CODE ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'�������ڃR�[�h'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'REPLY_PERMISSION'
                                ,@level2type=N'COLUMN',@level2name=N'RETURN_ITEM_CODE'
GO
/*** �폜�t���O DELETE_FLAG ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'�폜�t���O'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'REPLY_PERMISSION'
                                ,@level2type=N'COLUMN',@level2name=N'DELETE_FLAG'
GO
/*** �폜�z�X�g DELETE_HOST_NAME ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'�폜�z�X�g'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'REPLY_PERMISSION'
                                ,@level2type=N'COLUMN',@level2name=N'DELETE_HOST_NAME'
GO
/*** �폜���� DELETE_DATE_TIME ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'�폜����'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'REPLY_PERMISSION'
                                ,@level2type=N'COLUMN',@level2name=N'DELETE_DATE_TIME'
GO

/*** PROGRAM_WORKING_INFO �e�[�u���폜 ***/
if object_id('[dbo].[PROGRAM_WORKING_INFO]') is not null
DROP TABLE [dbo].[PROGRAM_WORKING_INFO]
GO
/*** PROGRAM_WORKING_INFO �e�[�u���쐬 ***/
create table [dbo].[PROGRAM_WORKING_INFO] (
      [SERIAL_NUMBER] [int] not null
    , [WORKING_FLAG] [bit] not null
    , [WORKING_HOST_NAME] [varchar](30)
    , [WORKING_IP_ADDRESS] [varchar](15)
    , [START_DATE_TIME] [datetime2](3)
    , [END_DATE_TIME] [datetime2](3)
    , CONSTRAINT [PK__PROGRAM_WORKING_INFO] primary key CLUSTERED
    (
       [SERIAL_NUMBER] asc
    ) WITH (
       PAD_INDEX = OFF
     , STATISTICS_NORECOMPUTE = OFF
     , IGNORE_DUP_KEY = OFF
     , ALLOW_ROW_LOCKS = ON
     , ALLOW_PAGE_LOCKS = ON
    ) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

/*** �_���e�[�u�����o�^ *********/
/*** �o�f�N����� PROGRAM_WORKING_INFO ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'�o�f�N�����'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE',@level1name=N'PROGRAM_WORKING_INFO'
GO
/*** �_���J�������o�^ ***/
/*** �A�� SERIAL_NUMBER ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'�A��'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'PROGRAM_WORKING_INFO'
                                ,@level2type=N'COLUMN',@level2name=N'SERIAL_NUMBER'
GO
/*** �N�����t���O WORKING_FLAG ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'�N�����t���O'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'PROGRAM_WORKING_INFO'
                                ,@level2type=N'COLUMN',@level2name=N'WORKING_FLAG'
GO
/*** �z�X�g�� WORKING_HOST_NAME ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'�z�X�g��'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'PROGRAM_WORKING_INFO'
                                ,@level2type=N'COLUMN',@level2name=N'WORKING_HOST_NAME'
GO
/*** IP�A�h���X WORKING_IP_ADDRESS ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'IP�A�h���X'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'PROGRAM_WORKING_INFO'
                                ,@level2type=N'COLUMN',@level2name=N'WORKING_IP_ADDRESS'
GO
/*** �N������ START_DATE_TIME ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'�N������'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'PROGRAM_WORKING_INFO'
                                ,@level2type=N'COLUMN',@level2name=N'START_DATE_TIME'
GO
/*** �I������ END_DATE_TIME ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'�I������'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'PROGRAM_WORKING_INFO'
                                ,@level2type=N'COLUMN',@level2name=N'END_DATE_TIME'
GO

/*** SYSTEM_INFORMATION �e�[�u���폜 ***/
if object_id('[dbo].[SYSTEM_INFORMATION]') is not null
DROP TABLE [dbo].[SYSTEM_INFORMATION]
GO
/*** SYSTEM_INFORMATION �e�[�u���쐬 ***/
create table [dbo].[SYSTEM_INFORMATION] (
      [SYSTEM_CODE] [tinyint] not null
    , [SYSTEM_NAME] [varchar](30) not null
    , [DELETE_FLAG] [bit] not null
    , [DELETE_HOST_NAME] [varchar](30)
    , [DELETE_DATE_TIME] [datetime2](3)
    , CONSTRAINT [PK__SYSTEM_INFORMATION] primary key CLUSTERED
    (
       [SYSTEM_CODE] asc
    ) WITH (
       PAD_INDEX = OFF
     , STATISTICS_NORECOMPUTE = OFF
     , IGNORE_DUP_KEY = OFF
     , ALLOW_ROW_LOCKS = ON
     , ALLOW_PAGE_LOCKS = ON
    ) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

/*** �_���e�[�u�����o�^ *********/
/*** �V�X�e���}�X�^��� SYSTEM_INFORMATION ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'�V�X�e���}�X�^���'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE',@level1name=N'SYSTEM_INFORMATION'
GO
/*** �_���J�������o�^ ***/
/*** �V�X�e���R�[�h SYSTEM_CODE ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'�V�X�e���R�[�h'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'SYSTEM_INFORMATION'
                                ,@level2type=N'COLUMN',@level2name=N'SYSTEM_CODE'
GO
/*** �V�X�e������ SYSTEM_NAME ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'�V�X�e������'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'SYSTEM_INFORMATION'
                                ,@level2type=N'COLUMN',@level2name=N'SYSTEM_NAME'
GO
/*** �폜�t���O DELETE_FLAG ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'�폜�t���O'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'SYSTEM_INFORMATION'
                                ,@level2type=N'COLUMN',@level2name=N'DELETE_FLAG'
GO
/*** �폜�z�X�g DELETE_HOST_NAME ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'�폜�z�X�g'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'SYSTEM_INFORMATION'
                                ,@level2type=N'COLUMN',@level2name=N'DELETE_HOST_NAME'
GO
/*** �폜���� DELETE_DATE_TIME ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'�폜����'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'SYSTEM_INFORMATION'
                                ,@level2type=N'COLUMN',@level2name=N'DELETE_DATE_TIME'
GO

/*** RETURN_ITEM �e�[�u���폜 ***/
if object_id('[dbo].[RETURN_ITEM]') is not null
DROP TABLE [dbo].[RETURN_ITEM]
GO
/*** RETURN_ITEM �e�[�u���쐬 ***/
create table [dbo].[RETURN_ITEM] (
      [RETURN_ITEM_CODE] [tinyint] not null
    , [RETURN_ITEM_NAME] [varchar](30) not null
    , [DELETE_FLAG] [bit] not null
    , [DELETE_HOST_NAME] [varchar](30)
    , [DELETE_DATE_TIME] [datetime2](3)
    , CONSTRAINT [PK__RETURN_ITEM] primary key CLUSTERED
    (
       [RETURN_ITEM_CODE] asc
    ) WITH (
       PAD_INDEX = OFF
     , STATISTICS_NORECOMPUTE = OFF
     , IGNORE_DUP_KEY = OFF
     , ALLOW_ROW_LOCKS = ON
     , ALLOW_PAGE_LOCKS = ON
    ) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

/*** �_���e�[�u�����o�^ *********/
/*** �������ڃ}�X�^��� RETURN_ITEM ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'�������ڃ}�X�^���'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE',@level1name=N'RETURN_ITEM'
GO
/*** �_���J�������o�^ ***/
/*** �������ڃR�[�h RETURN_ITEM_CODE ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'�������ڃR�[�h'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'RETURN_ITEM'
                                ,@level2type=N'COLUMN',@level2name=N'RETURN_ITEM_CODE'
GO
/*** �������ږ��� RETURN_ITEM_NAME ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'�������ږ���'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'RETURN_ITEM'
                                ,@level2type=N'COLUMN',@level2name=N'RETURN_ITEM_NAME'
GO
/*** �폜�t���O DELETE_FLAG ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'�폜�t���O'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'RETURN_ITEM'
                                ,@level2type=N'COLUMN',@level2name=N'DELETE_FLAG'
GO
/*** �폜�z�X�g DELETE_HOST_NAME ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'�폜�z�X�g'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'RETURN_ITEM'
                                ,@level2type=N'COLUMN',@level2name=N'DELETE_HOST_NAME'
GO
/*** �폜���� DELETE_DATE_TIME ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'�폜����'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'RETURN_ITEM'
                                ,@level2type=N'COLUMN',@level2name=N'DELETE_DATE_TIME'
GO
