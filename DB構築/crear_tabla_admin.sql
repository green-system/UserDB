/*
 ユーザDB（東京地区システム用）管理テーブル作成T-SQL
 作成者:K.Tanaka
 変更日付   Rev   変更履歴内容----------------------------->
 2017/06/30(0.1.0)新規作成
 2017/07/07(0.2.0)データベース名変更
*/

USE [JINJI_MAINTE]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING OFF
GO

/*** REPLY_PERMISSION テーブル削除 ***/
if object_id('[dbo].[REPLY_PERMISSION]') is not null
DROP TABLE [dbo].[REPLY_PERMISSION]
GO
/*** REPLY_PERMISSION テーブル作成 ***/
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

/*** 論理テーブル名登録 *********/
/*** 応答許可情報 REPLY_PERMISSION ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'応答許可情報'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE',@level1name=N'REPLY_PERMISSION'
GO
/*** 論理カラム名登録 ***/
/*** システムコード SYSTEM_CODE ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'システムコード'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'REPLY_PERMISSION'
                                ,@level2type=N'COLUMN',@level2name=N'SYSTEM_CODE'
GO
/*** 応答項目コード RETURN_ITEM_CODE ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'応答項目コード'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'REPLY_PERMISSION'
                                ,@level2type=N'COLUMN',@level2name=N'RETURN_ITEM_CODE'
GO
/*** 削除フラグ DELETE_FLAG ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'削除フラグ'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'REPLY_PERMISSION'
                                ,@level2type=N'COLUMN',@level2name=N'DELETE_FLAG'
GO
/*** 削除ホスト DELETE_HOST_NAME ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'削除ホスト'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'REPLY_PERMISSION'
                                ,@level2type=N'COLUMN',@level2name=N'DELETE_HOST_NAME'
GO
/*** 削除日時 DELETE_DATE_TIME ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'削除日時'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'REPLY_PERMISSION'
                                ,@level2type=N'COLUMN',@level2name=N'DELETE_DATE_TIME'
GO

/*** PROGRAM_WORKING_INFO テーブル削除 ***/
if object_id('[dbo].[PROGRAM_WORKING_INFO]') is not null
DROP TABLE [dbo].[PROGRAM_WORKING_INFO]
GO
/*** PROGRAM_WORKING_INFO テーブル作成 ***/
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

/*** 論理テーブル名登録 *********/
/*** ＰＧ起動情報 PROGRAM_WORKING_INFO ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'ＰＧ起動情報'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE',@level1name=N'PROGRAM_WORKING_INFO'
GO
/*** 論理カラム名登録 ***/
/*** 連番 SERIAL_NUMBER ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'連番'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'PROGRAM_WORKING_INFO'
                                ,@level2type=N'COLUMN',@level2name=N'SERIAL_NUMBER'
GO
/*** 起動中フラグ WORKING_FLAG ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'起動中フラグ'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'PROGRAM_WORKING_INFO'
                                ,@level2type=N'COLUMN',@level2name=N'WORKING_FLAG'
GO
/*** ホスト名 WORKING_HOST_NAME ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'ホスト名'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'PROGRAM_WORKING_INFO'
                                ,@level2type=N'COLUMN',@level2name=N'WORKING_HOST_NAME'
GO
/*** IPアドレス WORKING_IP_ADDRESS ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'IPアドレス'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'PROGRAM_WORKING_INFO'
                                ,@level2type=N'COLUMN',@level2name=N'WORKING_IP_ADDRESS'
GO
/*** 起動日時 START_DATE_TIME ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'起動日時'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'PROGRAM_WORKING_INFO'
                                ,@level2type=N'COLUMN',@level2name=N'START_DATE_TIME'
GO
/*** 終了日時 END_DATE_TIME ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'終了日時'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'PROGRAM_WORKING_INFO'
                                ,@level2type=N'COLUMN',@level2name=N'END_DATE_TIME'
GO

/*** SYSTEM_INFORMATION テーブル削除 ***/
if object_id('[dbo].[SYSTEM_INFORMATION]') is not null
DROP TABLE [dbo].[SYSTEM_INFORMATION]
GO
/*** SYSTEM_INFORMATION テーブル作成 ***/
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

/*** 論理テーブル名登録 *********/
/*** システムマスタ情報 SYSTEM_INFORMATION ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'システムマスタ情報'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE',@level1name=N'SYSTEM_INFORMATION'
GO
/*** 論理カラム名登録 ***/
/*** システムコード SYSTEM_CODE ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'システムコード'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'SYSTEM_INFORMATION'
                                ,@level2type=N'COLUMN',@level2name=N'SYSTEM_CODE'
GO
/*** システム名称 SYSTEM_NAME ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'システム名称'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'SYSTEM_INFORMATION'
                                ,@level2type=N'COLUMN',@level2name=N'SYSTEM_NAME'
GO
/*** 削除フラグ DELETE_FLAG ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'削除フラグ'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'SYSTEM_INFORMATION'
                                ,@level2type=N'COLUMN',@level2name=N'DELETE_FLAG'
GO
/*** 削除ホスト DELETE_HOST_NAME ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'削除ホスト'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'SYSTEM_INFORMATION'
                                ,@level2type=N'COLUMN',@level2name=N'DELETE_HOST_NAME'
GO
/*** 削除日時 DELETE_DATE_TIME ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'削除日時'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'SYSTEM_INFORMATION'
                                ,@level2type=N'COLUMN',@level2name=N'DELETE_DATE_TIME'
GO

/*** RETURN_ITEM テーブル削除 ***/
if object_id('[dbo].[RETURN_ITEM]') is not null
DROP TABLE [dbo].[RETURN_ITEM]
GO
/*** RETURN_ITEM テーブル作成 ***/
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

/*** 論理テーブル名登録 *********/
/*** 応答項目マスタ情報 RETURN_ITEM ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'応答項目マスタ情報'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE',@level1name=N'RETURN_ITEM'
GO
/*** 論理カラム名登録 ***/
/*** 応答項目コード RETURN_ITEM_CODE ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'応答項目コード'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'RETURN_ITEM'
                                ,@level2type=N'COLUMN',@level2name=N'RETURN_ITEM_CODE'
GO
/*** 応答項目名称 RETURN_ITEM_NAME ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'応答項目名称'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'RETURN_ITEM'
                                ,@level2type=N'COLUMN',@level2name=N'RETURN_ITEM_NAME'
GO
/*** 削除フラグ DELETE_FLAG ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'削除フラグ'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'RETURN_ITEM'
                                ,@level2type=N'COLUMN',@level2name=N'DELETE_FLAG'
GO
/*** 削除ホスト DELETE_HOST_NAME ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'削除ホスト'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'RETURN_ITEM'
                                ,@level2type=N'COLUMN',@level2name=N'DELETE_HOST_NAME'
GO
/*** 削除日時 DELETE_DATE_TIME ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'削除日時'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'RETURN_ITEM'
                                ,@level2type=N'COLUMN',@level2name=N'DELETE_DATE_TIME'
GO
