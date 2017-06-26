/*
 ユーザDB（東京地区システム用）ワークテーブル作成T-SQL
 作成者:K.Tanaka
 変更日付   Rev   変更履歴内容----------------------------->
 2017/06/30(1.0.0)新規作成
*/

USE [JINJI]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING OFF
GO

/*** WK_PERSON_OF_COMPANY テーブル削除 ***/
if object_id('[dbo].[WK_PERSON_OF_COMPANY]') is not null
DROP TABLE [dbo].[WK_PERSON_OF_COMPANY]
GO

/*** WK_PERSON_OF_COMPANY テーブル作成 ***/
CREATE TABLE [dbo].[WK_PERSON_OF_COMPANY] (
      [STAFF_CODE] [varchar](7)
    , [KANJI_NAME] [varchar](20)
    , [ROMAN_NAME] [varchar](50)
    , [KANA_NAME] [varchar](20)
    , [ORIGINAL_NAME_FLAG] [varchar](1)
    , [KANJI_ORIGINAL_NAME] [varchar](20)
    , [ROMAN_ORIGINAL_NAME] [varchar](50)
    , [KANA_ORIGINAL_NAME] [varchar](20)
    , [MEN_OR_WOMEN] [varchar](1)
    , [STAFF_DIVISION_CODE] [varchar](1)
    , [STAFF_DIVISION_NAME] [varchar](40)
    , [BELONGING_LATEST_START_DATE] [varchar](8)
    , [BELONGING_LATEST_CODE] [varchar](5)
    , [BELONGING_LATEST_BU_NAME] [varchar](30)
    , [BELONGING_LATEST_SHITSU_NAME] [varchar](30)
    , [BELONGING_LATEST_KAKARI_NAME] [varchar](30)
    , [LOCATION_CODE] [varchar](3)
    , [LOCATION_NAME] [varchar](40)
    , [COMPANY_CODE] [varchar](5)
    , [INFORMAL_COMPANY_NAME] [varchar](6)
    , [JOB_CATEGORY_CODE] [varchar](2)
    , [JOB_CATEGORY_NAME] [varchar](20)
    , [QUALIFICATION_SYSTEM_CODE] [varchar](1)
    , [QUALIFICATION_CODE] [varchar](2)
    , [ORIGINAL_BELONGING_FLAG] [varchar](1)
    , [ORIGINAL_BELONGING_START_DATE] [varchar](8)
    , [ORIGINAL_BELONGING_CODE] [varchar](5)
    , [ABOUT_WORK_CODE] [varchar](3)
    , [ABOUT_WORK_NAME] [varchar](32)
    , [APPROVAL_RANK_CODE] [varchar](1)
    , [LAYOFF_FLAG] [varchar](1)
    , [NONREGULAR_DIVISION_NAME] [varchar](20)
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

/*** 論理テーブル名登録 *********/
/*** 従業員情報 WK_PERSON_OF_COMPANY ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'従業員情報'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE',@level1name=N'WK_PERSON_OF_COMPANY'
GO
/*** 論理カラム名登録 ***/
/*** 従業員コード STAFF_CODE ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'従業員コード'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_PERSON_OF_COMPANY'
                                ,@level2type=N'COLUMN',@level2name=N'STAFF_CODE'
GO
/*** 氏名（漢字） KANJI_NAME ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'氏名（漢字）'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_PERSON_OF_COMPANY'
                                ,@level2type=N'COLUMN',@level2name=N'KANJI_NAME'
GO
/*** 氏名（ローマ字） ROMAN_NAME ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'氏名（ローマ字）'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_PERSON_OF_COMPANY'
                                ,@level2type=N'COLUMN',@level2name=N'ROMAN_NAME'
GO
/*** 氏名（カナ） KANA_NAME ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'氏名（カナ）'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_PERSON_OF_COMPANY'
                                ,@level2type=N'COLUMN',@level2name=N'KANA_NAME'
GO
/*** 旧姓使用の有無フラグ ORIGINAL_NAME_FLAG ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'旧姓使用の有無フラグ'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_PERSON_OF_COMPANY'
                                ,@level2type=N'COLUMN',@level2name=N'ORIGINAL_NAME_FLAG'
GO
/*** 旧姓氏名（漢字） KANJI_ORIGINAL_NAME ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'旧姓氏名（漢字）'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_PERSON_OF_COMPANY'
                                ,@level2type=N'COLUMN',@level2name=N'KANJI_ORIGINAL_NAME'
GO
/*** 旧姓氏名（ローマ字） ROMAN_ORIGINAL_NAME ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'旧姓氏名（ローマ字）'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_PERSON_OF_COMPANY'
                                ,@level2type=N'COLUMN',@level2name=N'ROMAN_ORIGINAL_NAME'
GO
/*** 旧姓氏名（カナ） KANA_ORIGINAL_NAME ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'旧姓氏名（カナ）'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_PERSON_OF_COMPANY'
                                ,@level2type=N'COLUMN',@level2name=N'KANA_ORIGINAL_NAME'
GO
/*** 性別 MEN_OR_WOMEN ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'性別'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_PERSON_OF_COMPANY'
                                ,@level2type=N'COLUMN',@level2name=N'MEN_OR_WOMEN'
GO
/*** 従業員区分コード STAFF_DIVISION_CODE ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'従業員区分コード'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_PERSON_OF_COMPANY'
                                ,@level2type=N'COLUMN',@level2name=N'STAFF_DIVISION_CODE'
GO
/*** 従業員区分名称 STAFF_DIVISION_NAME ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'従業員区分名称'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_PERSON_OF_COMPANY'
                                ,@level2type=N'COLUMN',@level2name=N'STAFF_DIVISION_NAME'
GO
/*** 最新所属開始年月日 BELONGING_LATEST_START_DATE ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'最新所属開始年月日'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_PERSON_OF_COMPANY'
                                ,@level2type=N'COLUMN',@level2name=N'BELONGING_LATEST_START_DATE'
GO
/*** 最新所属コード BELONGING_LATEST_CODE ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'最新所属コード'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_PERSON_OF_COMPANY'
                                ,@level2type=N'COLUMN',@level2name=N'BELONGING_LATEST_CODE'
GO
/*** 最新所属＿正式部署名称１ BELONGING_LATEST_BU_NAME ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'最新所属＿正式部署名称１'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_PERSON_OF_COMPANY'
                                ,@level2type=N'COLUMN',@level2name=N'BELONGING_LATEST_BU_NAME'
GO
/*** 最新所属＿正式室課名称 BELONGING_LATEST_SHITSU_NAME ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'最新所属＿正式室課名称'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_PERSON_OF_COMPANY'
                                ,@level2type=N'COLUMN',@level2name=N'BELONGING_LATEST_SHITSU_NAME'
GO
/*** 最新所属＿正式係Ｇ名称 BELONGING_LATEST_KAKARI_NAME ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'最新所属＿正式係Ｇ名称'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_PERSON_OF_COMPANY'
                                ,@level2type=N'COLUMN',@level2name=N'BELONGING_LATEST_KAKARI_NAME'
GO
/*** ロケーションコード LOCATION_CODE ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'ロケーションコード'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_PERSON_OF_COMPANY'
                                ,@level2type=N'COLUMN',@level2name=N'LOCATION_CODE'
GO
/*** ロケーション名称 LOCATION_NAME ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'ロケーション名称'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_PERSON_OF_COMPANY'
                                ,@level2type=N'COLUMN',@level2name=N'LOCATION_NAME'
GO
/*** 会社コード COMPANY_CODE ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'会社コード'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_PERSON_OF_COMPANY'
                                ,@level2type=N'COLUMN',@level2name=N'COMPANY_CODE'
GO
/*** 略式部＿会社名称 INFORMAL_COMPANY_NAME ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'略式部＿会社名称'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_PERSON_OF_COMPANY'
                                ,@level2type=N'COLUMN',@level2name=N'INFORMAL_COMPANY_NAME'
GO
/*** 職種コード JOB_CATEGORY_CODE ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'職種コード'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_PERSON_OF_COMPANY'
                                ,@level2type=N'COLUMN',@level2name=N'JOB_CATEGORY_CODE'
GO
/*** 職種名称 JOB_CATEGORY_NAME ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'職種名称'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_PERSON_OF_COMPANY'
                                ,@level2type=N'COLUMN',@level2name=N'JOB_CATEGORY_NAME'
GO
/*** 資格体系区分コード QUALIFICATION_SYSTEM_CODE ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'資格体系区分コード'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_PERSON_OF_COMPANY'
                                ,@level2type=N'COLUMN',@level2name=N'QUALIFICATION_SYSTEM_CODE'
GO
/*** 資格コード QUALIFICATION_CODE ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'資格コード'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_PERSON_OF_COMPANY'
                                ,@level2type=N'COLUMN',@level2name=N'QUALIFICATION_CODE'
GO
/*** 本来所属兼務フラグ ORIGINAL_BELONGING_FLAG ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'本来所属兼務フラグ'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_PERSON_OF_COMPANY'
                                ,@level2type=N'COLUMN',@level2name=N'ORIGINAL_BELONGING_FLAG'
GO
/*** 本来所属開始年月日 ORIGINAL_BELONGING_START_DATE ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'本来所属開始年月日'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_PERSON_OF_COMPANY'
                                ,@level2type=N'COLUMN',@level2name=N'ORIGINAL_BELONGING_START_DATE'
GO
/*** 本来所属コード ORIGINAL_BELONGING_CODE ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'本来所属コード'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_PERSON_OF_COMPANY'
                                ,@level2type=N'COLUMN',@level2name=N'ORIGINAL_BELONGING_CODE'
GO
/*** 職位コード ABOUT_WORK_CODE ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'職位コード'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_PERSON_OF_COMPANY'
                                ,@level2type=N'COLUMN',@level2name=N'ABOUT_WORK_CODE'
GO
/*** 職位名称 ABOUT_WORK_NAME ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'職位名称'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_PERSON_OF_COMPANY'
                                ,@level2type=N'COLUMN',@level2name=N'ABOUT_WORK_NAME'
GO
/*** 承認ランクコード APPROVAL_RANK_CODE ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'承認ランクコード'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_PERSON_OF_COMPANY'
                                ,@level2type=N'COLUMN',@level2name=N'APPROVAL_RANK_CODE'
GO
/*** 休職フラグ LAYOFF_FLAG ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'休職フラグ'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_PERSON_OF_COMPANY'
                                ,@level2type=N'COLUMN',@level2name=N'LAYOFF_FLAG'
GO
/*** 嘱託パート区分名称 NONREGULAR_DIVISION_NAME ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'嘱託パート区分名称'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_PERSON_OF_COMPANY'
                                ,@level2type=N'COLUMN',@level2name=N'NONREGULAR_DIVISION_NAME'
GO

/*** WK_PERSON_OF_OTHER_COMPANY テーブル削除 ***/
if object_id('[dbo].[WK_PERSON_OF_OTHER_COMPANY]') is not null
DROP TABLE [dbo].[WK_PERSON_OF_OTHER_COMPANY]
GO

/*** WK_PERSON_OF_OTHER_COMPANY テーブル作成 ***/
create table [dbo].[WK_PERSON_OF_OTHER_COMPANY] (
      [STAFF_CODE] [varchar](7)
    , [KANJI_NAME] [varchar](20)
    , [ROMAN_NAME] [varchar](50)
    , [KANA_NAME] [varchar](20)
    , [STAFF_DIVISION_CODE] [varchar](1)
    , [ACCEPTANCE_BELONGING_CODE] [varchar](5)
    , [START_CONTRACT_TERM] [varchar](8)
    , [END_CONTRACT_TERM] [varchar](8)
    , [WORKING_PLACE_CODE] [varchar](4)
    , [BELONGING_LATEST_CODE] [varchar](5)
    , [ORIGINAL_CONTRACTOR_CODE] [varchar](5)
    , [ORIGINAL_CONTRACTOR_NAME] [varchar](60)
    , [BELONGING_COMPANY_CODE] [varchar](5)
    , [BELONGING_COMPANY_NAME] [varchar](60)
    , [CARD_STATUS] [varchar](1)
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

/*** 論理テーブル名登録 *********/
/*** 社外者情報 WK_PERSON_OF_OTHER_COMPANY ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'社外者情報'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE',@level1name=N'WK_PERSON_OF_OTHER_COMPANY'
GO
/*** 論理カラム名登録 ***/
/*** 社外者ID STAFF_CODE ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'社外者ID'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_PERSON_OF_OTHER_COMPANY'
                                ,@level2type=N'COLUMN',@level2name=N'STAFF_CODE'
GO
/*** 氏名（漢字） KANJI_NAME ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'氏名（漢字）'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_PERSON_OF_OTHER_COMPANY'
                                ,@level2type=N'COLUMN',@level2name=N'KANJI_NAME'
GO
/*** 氏名（ローマ字） ROMAN_NAME ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'氏名（ローマ字）'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_PERSON_OF_OTHER_COMPANY'
                                ,@level2type=N'COLUMN',@level2name=N'ROMAN_NAME'
GO
/*** 氏名（カナ） KANA_NAME ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'氏名（カナ）'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_PERSON_OF_OTHER_COMPANY'
                                ,@level2type=N'COLUMN',@level2name=N'KANA_NAME'
GO
/*** 社外者区分コード STAFF_DIVISION_CODE ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'社外者区分コード'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_PERSON_OF_OTHER_COMPANY'
                                ,@level2type=N'COLUMN',@level2name=N'STAFF_DIVISION_CODE'
GO
/*** 受入部署コード ACCEPTANCE_BELONGING_CODE ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'受入部署コード'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_PERSON_OF_OTHER_COMPANY'
                                ,@level2type=N'COLUMN',@level2name=N'ACCEPTANCE_BELONGING_CODE'
GO
/*** 契約期間カラ START_CONTRACT_TERM ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'契約期間カラ'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_PERSON_OF_OTHER_COMPANY'
                                ,@level2type=N'COLUMN',@level2name=N'START_CONTRACT_TERM'
GO
/*** 契約期間マデ END_CONTRACT_TERM ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'契約期間マデ'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_PERSON_OF_OTHER_COMPANY'
                                ,@level2type=N'COLUMN',@level2name=N'END_CONTRACT_TERM'
GO
/*** 作業場所コード WORKING_PLACE_CODE ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'作業場所コード'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_PERSON_OF_OTHER_COMPANY'
                                ,@level2type=N'COLUMN',@level2name=N'WORKING_PLACE_CODE'
GO
/*** 最新所属コード BELONGING_LATEST_CODE ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'最新所属コード'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_PERSON_OF_OTHER_COMPANY'
                                ,@level2type=N'COLUMN',@level2name=N'BELONGING_LATEST_CODE'
GO
/*** 元請会社コード ORIGINAL_CONTRACTOR_CODE ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'元請会社コード'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_PERSON_OF_OTHER_COMPANY'
                                ,@level2type=N'COLUMN',@level2name=N'ORIGINAL_CONTRACTOR_CODE'
GO
/*** 元請会社名 ORIGINAL_CONTRACTOR_NAME ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'元請会社名'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_PERSON_OF_OTHER_COMPANY'
                                ,@level2type=N'COLUMN',@level2name=N'ORIGINAL_CONTRACTOR_NAME'
GO
/*** 所属会社コード BELONGING_COMPANY_CODE ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'所属会社コード'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_PERSON_OF_OTHER_COMPANY'
                                ,@level2type=N'COLUMN',@level2name=N'BELONGING_COMPANY_CODE'
GO
/*** 所属会社名 BELONGING_COMPANY_NAME ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'所属会社名'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_PERSON_OF_OTHER_COMPANY'
                                ,@level2type=N'COLUMN',@level2name=N'BELONGING_COMPANY_NAME'
GO
/*** カードステータス CARD_STATUS ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'カードステータス'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_PERSON_OF_OTHER_COMPANY'
                                ,@level2type=N'COLUMN',@level2name=N'CARD_STATUS'
GO

/*** WK_BU_INFORMATION テーブル削除 ***/
if object_id('[dbo].[WK_BU_INFORMATION]') is not null
DROP TABLE [dbo].[WK_BU_INFORMATION]
GO

/*** WK_BU_INFORMATION テーブル作成 ***/
create table [dbo].[WK_BU_INFORMATION] (
      [BU_CODE] [varchar](2)
    , [START_VALIDITY_DATE] [varchar](8)
    , [END_VALIDITY_DATE] [varchar](8)
    , [BU_NAME_1] [varchar](30)
    , [BU_NAME_2] [varchar](30)
    , [BU_NAME_3] [varchar](100)
    , [BU_INFORMAL_NAME] [varchar](6)
    , [BU_ALTERATION_MARK] [varchar](2)
    , [SECTION_CODE] [varchar](2)
    , [BU_LOCATION_CODE] [varchar](3)
    , [BU_NUMBER] [varchar](3)
    , [EXECUTIVE_NUMBER] [varchar](2)
    , [SHITSU_PERSON_SECTION] [varchar](2)
    , [ADJUST_SECTION_NUMBER_A] [varchar](2)
    , [ADJUST_SECTION_NUMBER_B] [varchar](2)
    , [ADJUST_SECTION_NUMBER_C] [varchar](2)
    , [ADJUST_SECTION_NUMBER_D] [varchar](2)
    , [ASSESSMENT_CODE] [varchar](2)
    , [RANK_RISE_CODE] [varchar](2)
    , [CHANGE_CODE] [varchar](2)
    , [TRAINING_CODE] [varchar](2)
    , [EMPLOY_OFFICE_CODE] [varchar](3)
    , [NEW_BELONGING_LIMIT_FLAG] [varchar](1)
    , [PERSONNEL_EXCEPTION] [varchar](2)
    , [PERSONNEL_COMPULSION] [varchar](2)
    , [ENGLISH_NAME] [varchar](200)
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

/*** 論理テーブル名登録 *********/
/*** 部マスタ情報 WK_BU_INFORMATION ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'部マスタ情報'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE',@level1name=N'WK_BU_INFORMATION'
GO
/*** 論理カラム名登録 ***/
/*** 部コード BU_CODE ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'部コード'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_BU_INFORMATION'
                                ,@level2type=N'COLUMN',@level2name=N'BU_CODE'
GO
/*** 部コード有効開始年月日 START_VALIDITY_DATE ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'部コード有効開始年月日'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_BU_INFORMATION'
                                ,@level2type=N'COLUMN',@level2name=N'START_VALIDITY_DATE'
GO
/*** 部コード有効終了年月日 END_VALIDITY_DATE ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'部コード有効終了年月日'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_BU_INFORMATION'
                                ,@level2type=N'COLUMN',@level2name=N'END_VALIDITY_DATE'
GO
/*** 正式部名称１ BU_NAME_1 ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'正式部名称１'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_BU_INFORMATION'
                                ,@level2type=N'COLUMN',@level2name=N'BU_NAME_1'
GO
/*** 正式部名称２ BU_NAME_2 ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'正式部名称２'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_BU_INFORMATION'
                                ,@level2type=N'COLUMN',@level2name=N'BU_NAME_2'
GO
/*** 正式部名称３ BU_NAME_3 ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'正式部名称３'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_BU_INFORMATION'
                                ,@level2type=N'COLUMN',@level2name=N'BU_NAME_3'
GO
/*** 略式部名称 BU_INFORMAL_NAME ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'略式部名称'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_BU_INFORMATION'
                                ,@level2type=N'COLUMN',@level2name=N'BU_INFORMAL_NAME'
GO
/*** 部改変マーク BU_ALTERATION_MARK ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'部改変マーク'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_BU_INFORMATION'
                                ,@level2type=N'COLUMN',@level2name=N'BU_ALTERATION_MARK'
GO
/*** 部門コード SECTION_CODE ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'部門コード'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_BU_INFORMATION'
                                ,@level2type=N'COLUMN',@level2name=N'SECTION_CODE'
GO
/*** 部ロケーションコード BU_LOCATION_CODE ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'部ロケーションコード'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_BU_INFORMATION'
                                ,@level2type=N'COLUMN',@level2name=N'BU_LOCATION_CODE'
GO
/*** 部ＮＯ BU_NUMBER ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'部ＮＯ'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_BU_INFORMATION'
                                ,@level2type=N'COLUMN',@level2name=N'BU_NUMBER'
GO
/*** 役員ＮＯ EXECUTIVE_NUMBER ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'役員ＮＯ'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_BU_INFORMATION'
                                ,@level2type=N'COLUMN',@level2name=N'EXECUTIVE_NUMBER'
GO
/*** 室別人員部門 SHITSU_PERSON_SECTION ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'室別人員部門'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_BU_INFORMATION'
                                ,@level2type=N'COLUMN',@level2name=N'SHITSU_PERSON_SECTION'
GO
/*** 調整部門ＮＯＡ ADJUST_SECTION_NUMBER_A ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'調整部門ＮＯＡ'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_BU_INFORMATION'
                                ,@level2type=N'COLUMN',@level2name=N'ADJUST_SECTION_NUMBER_A'
GO
/*** 調整部門ＮＯＢ ADJUST_SECTION_NUMBER_B ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'調整部門ＮＯＢ'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_BU_INFORMATION'
                                ,@level2type=N'COLUMN',@level2name=N'ADJUST_SECTION_NUMBER_B'
GO
/*** 調整部門ＮＯＣ ADJUST_SECTION_NUMBER_C ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'調整部門ＮＯＣ'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_BU_INFORMATION'
                                ,@level2type=N'COLUMN',@level2name=N'ADJUST_SECTION_NUMBER_C'
GO
/*** 調整部門ＮＯＤ ADJUST_SECTION_NUMBER_D ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'調整部門ＮＯＤ'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_BU_INFORMATION'
                                ,@level2type=N'COLUMN',@level2name=N'ADJUST_SECTION_NUMBER_D'
GO
/*** 総括人事組織コード＿考課 ASSESSMENT_CODE ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'総括人事組織コード＿考課'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_BU_INFORMATION'
                                ,@level2type=N'COLUMN',@level2name=N'ASSESSMENT_CODE'
GO
/*** 総括人事組織コード＿昇格 RANK_RISE_CODE ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'総括人事組織コード＿昇格'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_BU_INFORMATION'
                                ,@level2type=N'COLUMN',@level2name=N'RANK_RISE_CODE'
GO
/*** 総括人事組織コード＿異動 CHANGE_CODE ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'総括人事組織コード＿異動'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_BU_INFORMATION'
                                ,@level2type=N'COLUMN',@level2name=N'CHANGE_CODE'
GO
/*** 総括人事組織コード＿研修 TRAINING_CODE ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'総括人事組織コード＿研修'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_BU_INFORMATION'
                                ,@level2type=N'COLUMN',@level2name=N'TRAINING_CODE'
GO
/*** 障害者雇用事業所コード EMPLOY_OFFICE_CODE ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'障害者雇用事業所コード'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_BU_INFORMATION'
                                ,@level2type=N'COLUMN',@level2name=N'EMPLOY_OFFICE_CODE'
GO
/*** 最新所属限定フラグ NEW_BELONGING_LIMIT_FLAG ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'最新所属限定フラグ'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_BU_INFORMATION'
                                ,@level2type=N'COLUMN',@level2name=N'NEW_BELONGING_LIMIT_FLAG'
GO
/*** 拠点人事例外対応 PERSONNEL_EXCEPTION ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'拠点人事例外対応'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_BU_INFORMATION'
                                ,@level2type=N'COLUMN',@level2name=N'PERSONNEL_EXCEPTION'
GO
/*** 拠点人事強制入力 PERSONNEL_COMPULSION ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'拠点人事強制入力'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_BU_INFORMATION'
                                ,@level2type=N'COLUMN',@level2name=N'PERSONNEL_COMPULSION'
GO
/*** 英語名称 ENGLISH_NAME ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'英語名称'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_BU_INFORMATION'
                                ,@level2type=N'COLUMN',@level2name=N'ENGLISH_NAME'
GO

/*** WK_SHITSU_INFORMATION テーブル削除 ***/
if object_id('[dbo].[WK_SHITSU_INFORMATION]') is not null
DROP TABLE [dbo].[WK_SHITSU_INFORMATION]
GO

/*** WK_SHITSU_INFORMATION テーブル作成 ***/
create table [dbo].[WK_SHITSU_INFORMATION] (
      [SHITSU_CODE] [varchar](3)
    , [START_VALIDITY_DATE] [varchar](8)
    , [END_VALIDITY_DATE] [varchar](8)
    , [BU_CODE] [varchar](2)
    , [BU_NAME_1] [varchar](30)
    , [BU_NAME_2] [varchar](30)
    , [BU_INFORMAL_NAME] [varchar](6)
    , [SHITSU_NAME] [varchar](30)
    , [SHITSU_INFORMAL_NAME] [varchar](6)
    , [SHITSU_CHANGE_MARK] [varchar](2)
    , [SHITSU_LOCATION_CODE] [varchar](3)
    , [SHITSU_KA_NUMBER] [varchar](2)
    , [SHITSU_KA_DIVISION_CODE] [varchar](1)
    , [NEW_BELONGING_LIMIT_FLAG] [varchar](1)
    , [ENGLISH_NAME] [varchar](200)
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

/*** 論理テーブル名登録 *********/
/*** 室課マスタ情報 WK_SHITSU_INFORMATION ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'室課マスタ情報'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE',@level1name=N'WK_SHITSU_INFORMATION'
GO
/*** 論理カラム名登録 ***/
/*** 室課コード SHITSU_CODE ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'室課コード'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_SHITSU_INFORMATION'
                                ,@level2type=N'COLUMN',@level2name=N'SHITSU_CODE'
GO
/*** 室課コード有効開始年月日 START_VALIDITY_DATE ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'室課コード有効開始年月日'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_SHITSU_INFORMATION'
                                ,@level2type=N'COLUMN',@level2name=N'START_VALIDITY_DATE'
GO
/*** 室課コード有効終了年月日 END_VALIDITY_DATE ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'室課コード有効終了年月日'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_SHITSU_INFORMATION'
                                ,@level2type=N'COLUMN',@level2name=N'END_VALIDITY_DATE'
GO
/*** 部コード BU_CODE ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'部コード'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_SHITSU_INFORMATION'
                                ,@level2type=N'COLUMN',@level2name=N'BU_CODE'
GO
/*** 正式部名称１ BU_NAME_1 ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'正式部名称１'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_SHITSU_INFORMATION'
                                ,@level2type=N'COLUMN',@level2name=N'BU_NAME_1'
GO
/*** 正式部名称２ BU_NAME_2 ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'正式部名称２'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_SHITSU_INFORMATION'
                                ,@level2type=N'COLUMN',@level2name=N'BU_NAME_2'
GO
/*** 略式部名称 BU_INFORMAL_NAME ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'略式部名称'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_SHITSU_INFORMATION'
                                ,@level2type=N'COLUMN',@level2name=N'BU_INFORMAL_NAME'
GO
/*** 正式室課名称 SHITSU_NAME ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'正式室課名称'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_SHITSU_INFORMATION'
                                ,@level2type=N'COLUMN',@level2name=N'SHITSU_NAME'
GO
/*** 略式室課名称 SHITSU_INFORMAL_NAME ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'略式室課名称'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_SHITSU_INFORMATION'
                                ,@level2type=N'COLUMN',@level2name=N'SHITSU_INFORMAL_NAME'
GO
/*** 室改変マーク SHITSU_CHANGE_MARK ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'室改変マーク'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_SHITSU_INFORMATION'
                                ,@level2type=N'COLUMN',@level2name=N'SHITSU_CHANGE_MARK'
GO
/*** 室課ロケーションコード SHITSU_LOCATION_CODE ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'室課ロケーションコード'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_SHITSU_INFORMATION'
                                ,@level2type=N'COLUMN',@level2name=N'SHITSU_LOCATION_CODE'
GO
/*** 室課ＮＯ SHITSU_KA_NUMBER ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'室課ＮＯ'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_SHITSU_INFORMATION'
                                ,@level2type=N'COLUMN',@level2name=N'SHITSU_KA_NUMBER'
GO
/*** 室課区分コード SHITSU_KA_DIVISION_CODE ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'室課区分コード'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_SHITSU_INFORMATION'
                                ,@level2type=N'COLUMN',@level2name=N'SHITSU_KA_DIVISION_CODE'
GO
/*** 最新所属限定フラグ NEW_BELONGING_LIMIT_FLAG ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'最新所属限定フラグ'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_SHITSU_INFORMATION'
                                ,@level2type=N'COLUMN',@level2name=N'NEW_BELONGING_LIMIT_FLAG'
GO
/*** 英語名称 ENGLISH_NAME ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'英語名称'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_SHITSU_INFORMATION'
                                ,@level2type=N'COLUMN',@level2name=N'ENGLISH_NAME'
GO

/*** WK_KAKARI_INFORMATION テーブル削除 ***/
if object_id('[dbo].[WK_KAKARI_INFORMATION]') is not null
DROP TABLE [dbo].[WK_KAKARI_INFORMATION]
GO

/*** WK_KAKARI_INFORMATION テーブル作成 ***/
create table [dbo].[WK_KAKARI_INFORMATION] (
      [KAKARI_CODE] [varchar](4)
    , [START_VALIDITY_DATE] [varchar](8)
    , [END_VALIDITY_DATE] [varchar](8)
    , [BU_CODE] [varchar](2)
    , [SHITSU_CODE] [varchar](3)
    , [BU_NAME_1] [varchar](30)
    , [BU_NAME_2] [varchar](30)
    , [BU_INFORMAL_NAME] [varchar](6)
    , [SHITSU_NAME] [varchar](30)
    , [SHITSU_INFORMAL_NAME] [varchar](6)
    , [KAKARI_NAME] [varchar](30)
    , [KAKARI_INFORMAL_NAME] [varchar](6)
    , [KAKARI_LOCATION_CODE] [varchar](3)
    , [KAKARI_NUMBER] [varchar](2)
    , [KAKARI_DIVISION_CODE] [varchar](1)
    , [NEW_BELONGING_LIMIT_FLAG] [varchar](1)
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

/*** 論理テーブル名登録 *********/
/*** 係Ｇマスタ情報 WK_KAKARI_INFORMATION ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'係Ｇマスタ情報'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE',@level1name=N'WK_KAKARI_INFORMATION'
GO
/*** 論理カラム名登録 ***/
/*** 係Ｇコード KAKARI_CODE ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'係Ｇコード'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_KAKARI_INFORMATION'
                                ,@level2type=N'COLUMN',@level2name=N'KAKARI_CODE'
GO
/*** 係Ｇコード有効開始年月日 START_VALIDITY_DATE ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'係Ｇコード有効開始年月日'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_KAKARI_INFORMATION'
                                ,@level2type=N'COLUMN',@level2name=N'START_VALIDITY_DATE'
GO
/*** 係Ｇコード有効終了年月日 END_VALIDITY_DATE ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'係Ｇコード有効終了年月日'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_KAKARI_INFORMATION'
                                ,@level2type=N'COLUMN',@level2name=N'END_VALIDITY_DATE'
GO
/*** 部コード BU_CODE ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'部コード'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_KAKARI_INFORMATION'
                                ,@level2type=N'COLUMN',@level2name=N'BU_CODE'
GO
/*** 室課コード SHITSU_CODE ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'室課コード'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_KAKARI_INFORMATION'
                                ,@level2type=N'COLUMN',@level2name=N'SHITSU_CODE'
GO
/*** 正式部名称１ BU_NAME_1 ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'正式部名称１'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_KAKARI_INFORMATION'
                                ,@level2type=N'COLUMN',@level2name=N'BU_NAME_1'
GO
/*** 正式部名称２ BU_NAME_2 ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'正式部名称２'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_KAKARI_INFORMATION'
                                ,@level2type=N'COLUMN',@level2name=N'BU_NAME_2'
GO
/*** 略式部名称 BU_INFORMAL_NAME ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'略式部名称'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_KAKARI_INFORMATION'
                                ,@level2type=N'COLUMN',@level2name=N'BU_INFORMAL_NAME'
GO
/*** 正式室課名称 SHITSU_NAME ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'正式室課名称'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_KAKARI_INFORMATION'
                                ,@level2type=N'COLUMN',@level2name=N'SHITSU_NAME'
GO
/*** 略式室課名称 SHITSU_INFORMAL_NAME ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'略式室課名称'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_KAKARI_INFORMATION'
                                ,@level2type=N'COLUMN',@level2name=N'SHITSU_INFORMAL_NAME'
GO
/*** 正式係Ｇ名称 KAKARI_NAME ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'正式係Ｇ名称'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_KAKARI_INFORMATION'
                                ,@level2type=N'COLUMN',@level2name=N'KAKARI_NAME'
GO
/*** 略式係Ｇ名称 KAKARI_INFORMAL_NAME ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'略式係Ｇ名称'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_KAKARI_INFORMATION'
                                ,@level2type=N'COLUMN',@level2name=N'KAKARI_INFORMAL_NAME'
GO
/*** 係Ｇロケーションコード KAKARI_LOCATION_CODE ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'係Ｇロケーションコード'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_KAKARI_INFORMATION'
                                ,@level2type=N'COLUMN',@level2name=N'KAKARI_LOCATION_CODE'
GO
/*** 係ＧＮＯ KAKARI_NUMBER ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'係ＧＮＯ'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_KAKARI_INFORMATION'
                                ,@level2type=N'COLUMN',@level2name=N'KAKARI_NUMBER'
GO
/*** 係Ｇ区分コード KAKARI_DIVISION_CODE ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'係Ｇ区分コード'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_KAKARI_INFORMATION'
                                ,@level2type=N'COLUMN',@level2name=N'KAKARI_DIVISION_CODE'
GO
/*** 最新所属限定フラグ NEW_BELONGING_LIMIT_FLAG ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'最新所属限定フラグ'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_KAKARI_INFORMATION'
                                ,@level2type=N'COLUMN',@level2name=N'NEW_BELONGING_LIMIT_FLAG'
GO

/*** WK_STAFF_DIVISION テーブル削除 ***/
if object_id('[dbo].[WK_STAFF_DIVISION]') is not null
DROP TABLE [dbo].[WK_STAFF_DIVISION]
GO

/*** WK_STAFF_DIVISION テーブル作成 ***/
create table [dbo].[WK_STAFF_DIVISION] (
      [STAFF_DIVISION_CODE] [varchar](1)
    , [STAFF_DIVISION_NAME] [varchar](40)
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

/*** 論理テーブル名登録 *********/
/*** 従業員区分マスタ情報 WK_STAFF_DIVISION ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'従業員区分マスタ情報'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE',@level1name=N'WK_STAFF_DIVISION'
GO
/*** 論理カラム名登録 ***/
/*** 従業員区分コード STAFF_DIVISION_CODE ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'従業員区分コード'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_STAFF_DIVISION'
                                ,@level2type=N'COLUMN',@level2name=N'STAFF_DIVISION_CODE'
GO
/*** 従業員区分名称 STAFF_DIVISION_NAME ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'従業員区分名称'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_STAFF_DIVISION'
                                ,@level2type=N'COLUMN',@level2name=N'STAFF_DIVISION_NAME'
GO

/*** WK_ABOUT_WORK テーブル削除 ***/
if object_id('[dbo].[WK_ABOUT_WORK]') is not null
DROP TABLE [dbo].[WK_ABOUT_WORK]
GO

/*** WK_ABOUT_WORK テーブル作成 ***/
create table [dbo].[WK_ABOUT_WORK] (
      [ABOUT_WORK_CODE] [varchar](3)
    , [ABOUT_WORK_NAME] [varchar](32)
    , [INFORMAL_ABOUT_WORK_NAME] [varchar](12)
    , [MANESUTA_DIVISION_CODE] [varchar](1)
    , [ENGLISH_NAME] [varchar](60)
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

/*** 論理テーブル名登録 *********/
/*** 職位マスタ情報 WK_ABOUT_WORK ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'職位マスタ情報'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE',@level1name=N'WK_ABOUT_WORK'
GO
/*** 論理カラム名登録 ***/
/*** 職位コード ABOUT_WORK_CODE ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'職位コード'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_ABOUT_WORK'
                                ,@level2type=N'COLUMN',@level2name=N'ABOUT_WORK_CODE'
GO
/*** 職位名称 ABOUT_WORK_NAME ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'職位名称'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_ABOUT_WORK'
                                ,@level2type=N'COLUMN',@level2name=N'ABOUT_WORK_NAME'
GO
/*** 略式職位名称 INFORMAL_ABOUT_WORK_NAME ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'略式職位名称'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_ABOUT_WORK'
                                ,@level2type=N'COLUMN',@level2name=N'INFORMAL_ABOUT_WORK_NAME'
GO
/*** マネスタ区分コード MANESUTA_DIVISION_CODE ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'マネスタ区分コード'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_ABOUT_WORK'
                                ,@level2type=N'COLUMN',@level2name=N'MANESUTA_DIVISION_CODE'
GO
/*** 英語名称 ENGLISH_NAME ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'英語名称'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_ABOUT_WORK'
                                ,@level2type=N'COLUMN',@level2name=N'ENGLISH_NAME'
GO

/*** WK_JOB_CATEGORY テーブル削除 ***/
if object_id('[dbo].[WK_JOB_CATEGORY]') is not null
DROP TABLE [dbo].[WK_JOB_CATEGORY]
GO

/*** WK_JOB_CATEGORY テーブル作成 ***/
create table [dbo].[WK_JOB_CATEGORY] (
      [JOB_CATEGORY_CODE] [varchar](2)
    , [JOB_CATEGORY_NAME] [varchar](20)
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

/*** 論理テーブル名登録 *********/
/*** 職種マスタ情報 WK_JOB_CATEGORY ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'職種マスタ情報'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE',@level1name=N'WK_JOB_CATEGORY'
GO
/*** 論理カラム名登録 ***/
/*** 職種コード JOB_CATEGORY_CODE ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'職種コード'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_JOB_CATEGORY'
                                ,@level2type=N'COLUMN',@level2name=N'JOB_CATEGORY_CODE'
GO
/*** 職種名称 JOB_CATEGORY_NAME ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'職種名称'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_JOB_CATEGORY'
                                ,@level2type=N'COLUMN',@level2name=N'JOB_CATEGORY_NAME'
GO

/*** WK_QUALIFICATION テーブル削除 ***/
if object_id('[dbo].[WK_QUALIFICATION]') is not null
DROP TABLE [dbo].[WK_QUALIFICATION]
GO

/*** WK_QUALIFICATION テーブル作成 ***/
create table [dbo].[WK_QUALIFICATION] (
      [QUALIFICATION_CODE] [varchar](2)
    , [QUALIFICATION_SYSTEM_CODE] [varchar](1)
    , [QUALIFICATION_NAME] [varchar](16)
    , [INFORMAL_QUALIFICATION_NAME] [varchar](8)
    , [QUALIFICATION_NUMBER] [varchar](2)
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

/*** 論理テーブル名登録 *********/
/*** 資格マスタ情報 WK_QUALIFICATION ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'資格マスタ情報'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE',@level1name=N'WK_QUALIFICATION'
GO
/*** 論理カラム名登録 ***/
/*** 資格コード QUALIFICATION_CODE ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'資格コード'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_QUALIFICATION'
                                ,@level2type=N'COLUMN',@level2name=N'QUALIFICATION_CODE'
GO
/*** 資格体系区分コード QUALIFICATION_SYSTEM_CODE ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'資格体系区分コード'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_QUALIFICATION'
                                ,@level2type=N'COLUMN',@level2name=N'QUALIFICATION_SYSTEM_CODE'
GO
/*** 資格名称 QUALIFICATION_NAME ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'資格名称'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_QUALIFICATION'
                                ,@level2type=N'COLUMN',@level2name=N'QUALIFICATION_NAME'
GO
/*** 略式資格名称 INFORMAL_QUALIFICATION_NAME ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'略式資格名称'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_QUALIFICATION'
                                ,@level2type=N'COLUMN',@level2name=N'INFORMAL_QUALIFICATION_NAME'
GO
/*** 資格ＮＯ QUALIFICATION_NUMBER ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'資格ＮＯ'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_QUALIFICATION'
                                ,@level2type=N'COLUMN',@level2name=N'QUALIFICATION_NUMBER'
GO
