/*
 [UDBinæVXepj[Ne[uì¬T-SQL
 ì¬Ò:K.Tanaka
 ÏXút   Rev   ÏXðàe----------------------------->
 2017/06/30(0.1.0)VKì¬
 2017/07/11(0.2.0)åL[ÏX

*/

USE [JINJI]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING OFF
GO

/*** WK_PERSON_OF_COMPANY e[uí ***/
if object_id('[dbo].[WK_PERSON_OF_COMPANY]') is not null
DROP TABLE [dbo].[WK_PERSON_OF_COMPANY]
GO

/*** WK_PERSON_OF_COMPANY e[uì¬ ***/
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

/*** _e[u¼o^ *********/
/*** ]Æõîñ WK_PERSON_OF_COMPANY ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N']Æõîñ'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE',@level1name=N'WK_PERSON_OF_COMPANY'
GO
/*** _J¼o^ ***/
/*** ]ÆõR[h STAFF_CODE ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N']ÆõR[h'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_PERSON_OF_COMPANY'
                                ,@level2type=N'COLUMN',@level2name=N'STAFF_CODE'
GO
/*** ¼i¿j KANJI_NAME ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'¼i¿j'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_PERSON_OF_COMPANY'
                                ,@level2type=N'COLUMN',@level2name=N'KANJI_NAME'
GO
/*** ¼i[}j ROMAN_NAME ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'¼i[}j'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_PERSON_OF_COMPANY'
                                ,@level2type=N'COLUMN',@level2name=N'ROMAN_NAME'
GO
/*** ¼iJij KANA_NAME ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'¼iJij'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_PERSON_OF_COMPANY'
                                ,@level2type=N'COLUMN',@level2name=N'KANA_NAME'
GO
/*** ©gpÌL³tO ORIGINAL_NAME_FLAG ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'©gpÌL³tO'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_PERSON_OF_COMPANY'
                                ,@level2type=N'COLUMN',@level2name=N'ORIGINAL_NAME_FLAG'
GO
/*** ©¼i¿j KANJI_ORIGINAL_NAME ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'©¼i¿j'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_PERSON_OF_COMPANY'
                                ,@level2type=N'COLUMN',@level2name=N'KANJI_ORIGINAL_NAME'
GO
/*** ©¼i[}j ROMAN_ORIGINAL_NAME ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'©¼i[}j'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_PERSON_OF_COMPANY'
                                ,@level2type=N'COLUMN',@level2name=N'ROMAN_ORIGINAL_NAME'
GO
/*** ©¼iJij KANA_ORIGINAL_NAME ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'©¼iJij'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_PERSON_OF_COMPANY'
                                ,@level2type=N'COLUMN',@level2name=N'KANA_ORIGINAL_NAME'
GO
/*** «Ê MEN_OR_WOMEN ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'«Ê'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_PERSON_OF_COMPANY'
                                ,@level2type=N'COLUMN',@level2name=N'MEN_OR_WOMEN'
GO
/*** ]ÆõæªR[h STAFF_DIVISION_CODE ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N']ÆõæªR[h'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_PERSON_OF_COMPANY'
                                ,@level2type=N'COLUMN',@level2name=N'STAFF_DIVISION_CODE'
GO
/*** ]Æõæª¼Ì STAFF_DIVISION_NAME ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N']Æõæª¼Ì'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_PERSON_OF_COMPANY'
                                ,@level2type=N'COLUMN',@level2name=N'STAFF_DIVISION_NAME'
GO
/*** ÅV®JnNú BELONGING_LATEST_START_DATE ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'ÅV®JnNú'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_PERSON_OF_COMPANY'
                                ,@level2type=N'COLUMN',@level2name=N'BELONGING_LATEST_START_DATE'
GO
/*** ÅV®R[h BELONGING_LATEST_CODE ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'ÅV®R[h'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_PERSON_OF_COMPANY'
                                ,@level2type=N'COLUMN',@level2name=N'BELONGING_LATEST_CODE'
GO
/*** ÅV®Q³®¼ÌP BELONGING_LATEST_BU_NAME ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'ÅV®Q³®¼ÌP'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_PERSON_OF_COMPANY'
                                ,@level2type=N'COLUMN',@level2name=N'BELONGING_LATEST_BU_NAME'
GO
/*** ÅV®Q³®ºÛ¼Ì BELONGING_LATEST_SHITSU_NAME ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'ÅV®Q³®ºÛ¼Ì'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_PERSON_OF_COMPANY'
                                ,@level2type=N'COLUMN',@level2name=N'BELONGING_LATEST_SHITSU_NAME'
GO
/*** ÅV®Q³®Wf¼Ì BELONGING_LATEST_KAKARI_NAME ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'ÅV®Q³®Wf¼Ì'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_PERSON_OF_COMPANY'
                                ,@level2type=N'COLUMN',@level2name=N'BELONGING_LATEST_KAKARI_NAME'
GO
/*** P[VR[h LOCATION_CODE ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'P[VR[h'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_PERSON_OF_COMPANY'
                                ,@level2type=N'COLUMN',@level2name=N'LOCATION_CODE'
GO
/*** P[V¼Ì LOCATION_NAME ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'P[V¼Ì'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_PERSON_OF_COMPANY'
                                ,@level2type=N'COLUMN',@level2name=N'LOCATION_NAME'
GO
/*** ïÐR[h COMPANY_CODE ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'ïÐR[h'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_PERSON_OF_COMPANY'
                                ,@level2type=N'COLUMN',@level2name=N'COMPANY_CODE'
GO
/*** ª®QïÐ¼Ì INFORMAL_COMPANY_NAME ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'ª®QïÐ¼Ì'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_PERSON_OF_COMPANY'
                                ,@level2type=N'COLUMN',@level2name=N'INFORMAL_COMPANY_NAME'
GO
/*** EíR[h JOB_CATEGORY_CODE ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'EíR[h'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_PERSON_OF_COMPANY'
                                ,@level2type=N'COLUMN',@level2name=N'JOB_CATEGORY_CODE'
GO
/*** Eí¼Ì JOB_CATEGORY_NAME ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'Eí¼Ì'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_PERSON_OF_COMPANY'
                                ,@level2type=N'COLUMN',@level2name=N'JOB_CATEGORY_NAME'
GO
/*** iÌnæªR[h QUALIFICATION_SYSTEM_CODE ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'iÌnæªR[h'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_PERSON_OF_COMPANY'
                                ,@level2type=N'COLUMN',@level2name=N'QUALIFICATION_SYSTEM_CODE'
GO
/*** iR[h QUALIFICATION_CODE ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'iR[h'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_PERSON_OF_COMPANY'
                                ,@level2type=N'COLUMN',@level2name=N'QUALIFICATION_CODE'
GO
/*** {®±tO ORIGINAL_BELONGING_FLAG ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'{®±tO'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_PERSON_OF_COMPANY'
                                ,@level2type=N'COLUMN',@level2name=N'ORIGINAL_BELONGING_FLAG'
GO
/*** {®JnNú ORIGINAL_BELONGING_START_DATE ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'{®JnNú'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_PERSON_OF_COMPANY'
                                ,@level2type=N'COLUMN',@level2name=N'ORIGINAL_BELONGING_START_DATE'
GO
/*** {®R[h ORIGINAL_BELONGING_CODE ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'{®R[h'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_PERSON_OF_COMPANY'
                                ,@level2type=N'COLUMN',@level2name=N'ORIGINAL_BELONGING_CODE'
GO
/*** EÊR[h ABOUT_WORK_CODE ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'EÊR[h'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_PERSON_OF_COMPANY'
                                ,@level2type=N'COLUMN',@level2name=N'ABOUT_WORK_CODE'
GO
/*** EÊ¼Ì ABOUT_WORK_NAME ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'EÊ¼Ì'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_PERSON_OF_COMPANY'
                                ,@level2type=N'COLUMN',@level2name=N'ABOUT_WORK_NAME'
GO
/*** ³FNR[h APPROVAL_RANK_CODE ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'³FNR[h'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_PERSON_OF_COMPANY'
                                ,@level2type=N'COLUMN',@level2name=N'APPROVAL_RANK_CODE'
GO
/*** xEtO LAYOFF_FLAG ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'xEtO'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_PERSON_OF_COMPANY'
                                ,@level2type=N'COLUMN',@level2name=N'LAYOFF_FLAG'
GO
/*** úõp[gæª¼Ì NONREGULAR_DIVISION_NAME ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'úõp[gæª¼Ì'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_PERSON_OF_COMPANY'
                                ,@level2type=N'COLUMN',@level2name=N'NONREGULAR_DIVISION_NAME'
GO

/*** WK_PERSON_OF_OTHER_COMPANY e[uí ***/
if object_id('[dbo].[WK_PERSON_OF_OTHER_COMPANY]') is not null
DROP TABLE [dbo].[WK_PERSON_OF_OTHER_COMPANY]
GO
/*** WK_PERSON_OF_OTHER_COMPANY e[uì¬ ***/
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
    , CONSTRAINT [PK__WK_PERSON_OF_OTHER_COMPANY] primary key CLUSTERED
    (
       [STAFF_CODE] asc
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

/*** _e[u¼o^ *********/
/*** ÐOÒîñ WK_PERSON_OF_OTHER_COMPANY ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'ÐOÒîñ'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE',@level1name=N'WK_PERSON_OF_OTHER_COMPANY'
GO
/*** _J¼o^ ***/
/*** ÐOÒID STAFF_CODE ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'ÐOÒID'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_PERSON_OF_OTHER_COMPANY'
                                ,@level2type=N'COLUMN',@level2name=N'STAFF_CODE'
GO
/*** ¼i¿j KANJI_NAME ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'¼i¿j'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_PERSON_OF_OTHER_COMPANY'
                                ,@level2type=N'COLUMN',@level2name=N'KANJI_NAME'
GO
/*** ¼i[}j ROMAN_NAME ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'¼i[}j'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_PERSON_OF_OTHER_COMPANY'
                                ,@level2type=N'COLUMN',@level2name=N'ROMAN_NAME'
GO
/*** ¼iJij KANA_NAME ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'¼iJij'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_PERSON_OF_OTHER_COMPANY'
                                ,@level2type=N'COLUMN',@level2name=N'KANA_NAME'
GO
/*** ÐOÒæªR[h STAFF_DIVISION_CODE ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'ÐOÒæªR[h'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_PERSON_OF_OTHER_COMPANY'
                                ,@level2type=N'COLUMN',@level2name=N'STAFF_DIVISION_CODE'
GO
/*** óüR[h ACCEPTANCE_BELONGING_CODE ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'óüR[h'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_PERSON_OF_OTHER_COMPANY'
                                ,@level2type=N'COLUMN',@level2name=N'ACCEPTANCE_BELONGING_CODE'
GO
/*** _ñúÔJ START_CONTRACT_TERM ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'_ñúÔJ'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_PERSON_OF_OTHER_COMPANY'
                                ,@level2type=N'COLUMN',@level2name=N'START_CONTRACT_TERM'
GO
/*** _ñúÔ}f END_CONTRACT_TERM ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'_ñúÔ}f'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_PERSON_OF_OTHER_COMPANY'
                                ,@level2type=N'COLUMN',@level2name=N'END_CONTRACT_TERM'
GO
/*** ìÆêR[h WORKING_PLACE_CODE ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'ìÆêR[h'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_PERSON_OF_OTHER_COMPANY'
                                ,@level2type=N'COLUMN',@level2name=N'WORKING_PLACE_CODE'
GO
/*** ÅV®R[h BELONGING_LATEST_CODE ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'ÅV®R[h'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_PERSON_OF_OTHER_COMPANY'
                                ,@level2type=N'COLUMN',@level2name=N'BELONGING_LATEST_CODE'
GO
/*** ³¿ïÐR[h ORIGINAL_CONTRACTOR_CODE ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'³¿ïÐR[h'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_PERSON_OF_OTHER_COMPANY'
                                ,@level2type=N'COLUMN',@level2name=N'ORIGINAL_CONTRACTOR_CODE'
GO
/*** ³¿ïÐ¼ ORIGINAL_CONTRACTOR_NAME ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'³¿ïÐ¼'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_PERSON_OF_OTHER_COMPANY'
                                ,@level2type=N'COLUMN',@level2name=N'ORIGINAL_CONTRACTOR_NAME'
GO
/*** ®ïÐR[h BELONGING_COMPANY_CODE ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'®ïÐR[h'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_PERSON_OF_OTHER_COMPANY'
                                ,@level2type=N'COLUMN',@level2name=N'BELONGING_COMPANY_CODE'
GO
/*** ®ïÐ¼ BELONGING_COMPANY_NAME ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'®ïÐ¼'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_PERSON_OF_OTHER_COMPANY'
                                ,@level2type=N'COLUMN',@level2name=N'BELONGING_COMPANY_NAME'
GO
/*** J[hXe[^X CARD_STATUS ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'J[hXe[^X'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_PERSON_OF_OTHER_COMPANY'
                                ,@level2type=N'COLUMN',@level2name=N'CARD_STATUS'
GO

/*** WK_BU_INFORMATION e[uí ***/
if object_id('[dbo].[WK_BU_INFORMATION]') is not null
DROP TABLE [dbo].[WK_BU_INFORMATION]
GO
/*** WK_BU_INFORMATION e[uì¬ ***/
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
    , CONSTRAINT [PK__WK_BU_INFORMATION] primary key CLUSTERED
    (
       [BU_CODE] asc
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

/*** _e[u¼o^ *********/
/*** }X^îñ WK_BU_INFORMATION ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'}X^îñ'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE',@level1name=N'WK_BU_INFORMATION'
GO
/*** _J¼o^ ***/
/*** R[h BU_CODE ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'R[h'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_BU_INFORMATION'
                                ,@level2type=N'COLUMN',@level2name=N'BU_CODE'
GO
/*** R[hLøJnNú START_VALIDITY_DATE ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'R[hLøJnNú'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_BU_INFORMATION'
                                ,@level2type=N'COLUMN',@level2name=N'START_VALIDITY_DATE'
GO
/*** R[hLøI¹Nú END_VALIDITY_DATE ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'R[hLøI¹Nú'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_BU_INFORMATION'
                                ,@level2type=N'COLUMN',@level2name=N'END_VALIDITY_DATE'
GO
/*** ³®¼ÌP BU_NAME_1 ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'³®¼ÌP'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_BU_INFORMATION'
                                ,@level2type=N'COLUMN',@level2name=N'BU_NAME_1'
GO
/*** ³®¼ÌQ BU_NAME_2 ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'³®¼ÌQ'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_BU_INFORMATION'
                                ,@level2type=N'COLUMN',@level2name=N'BU_NAME_2'
GO
/*** ³®¼ÌR BU_NAME_3 ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'³®¼ÌR'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_BU_INFORMATION'
                                ,@level2type=N'COLUMN',@level2name=N'BU_NAME_3'
GO
/*** ª®¼Ì BU_INFORMAL_NAME ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'ª®¼Ì'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_BU_INFORMATION'
                                ,@level2type=N'COLUMN',@level2name=N'BU_INFORMAL_NAME'
GO
/*** üÏ}[N BU_ALTERATION_MARK ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'üÏ}[N'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_BU_INFORMATION'
                                ,@level2type=N'COLUMN',@level2name=N'BU_ALTERATION_MARK'
GO
/*** åR[h SECTION_CODE ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'åR[h'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_BU_INFORMATION'
                                ,@level2type=N'COLUMN',@level2name=N'SECTION_CODE'
GO
/*** P[VR[h BU_LOCATION_CODE ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'P[VR[h'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_BU_INFORMATION'
                                ,@level2type=N'COLUMN',@level2name=N'BU_LOCATION_CODE'
GO
/*** mn BU_NUMBER ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'mn'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_BU_INFORMATION'
                                ,@level2type=N'COLUMN',@level2name=N'BU_NUMBER'
GO
/*** ðõmn EXECUTIVE_NUMBER ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'ðõmn'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_BU_INFORMATION'
                                ,@level2type=N'COLUMN',@level2name=N'EXECUTIVE_NUMBER'
GO
/*** ºÊlõå SHITSU_PERSON_SECTION ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'ºÊlõå'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_BU_INFORMATION'
                                ,@level2type=N'COLUMN',@level2name=N'SHITSU_PERSON_SECTION'
GO
/*** ²®åmn` ADJUST_SECTION_NUMBER_A ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'²®åmn`'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_BU_INFORMATION'
                                ,@level2type=N'COLUMN',@level2name=N'ADJUST_SECTION_NUMBER_A'
GO
/*** ²®åmna ADJUST_SECTION_NUMBER_B ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'²®åmna'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_BU_INFORMATION'
                                ,@level2type=N'COLUMN',@level2name=N'ADJUST_SECTION_NUMBER_B'
GO
/*** ²®åmnb ADJUST_SECTION_NUMBER_C ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'²®åmnb'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_BU_INFORMATION'
                                ,@level2type=N'COLUMN',@level2name=N'ADJUST_SECTION_NUMBER_C'
GO
/*** ²®åmnc ADJUST_SECTION_NUMBER_D ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'²®åmnc'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_BU_INFORMATION'
                                ,@level2type=N'COLUMN',@level2name=N'ADJUST_SECTION_NUMBER_D'
GO
/*** lgDR[hQlÛ ASSESSMENT_CODE ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'lgDR[hQlÛ'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_BU_INFORMATION'
                                ,@level2type=N'COLUMN',@level2name=N'ASSESSMENT_CODE'
GO
/*** lgDR[hQ¸i RANK_RISE_CODE ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'lgDR[hQ¸i'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_BU_INFORMATION'
                                ,@level2type=N'COLUMN',@level2name=N'RANK_RISE_CODE'
GO
/*** lgDR[hQÙ® CHANGE_CODE ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'lgDR[hQÙ®'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_BU_INFORMATION'
                                ,@level2type=N'COLUMN',@level2name=N'CHANGE_CODE'
GO
/*** lgDR[hQ¤C TRAINING_CODE ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'lgDR[hQ¤C'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_BU_INFORMATION'
                                ,@level2type=N'COLUMN',@level2name=N'TRAINING_CODE'
GO
/*** áQÒÙpÆR[h EMPLOY_OFFICE_CODE ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'áQÒÙpÆR[h'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_BU_INFORMATION'
                                ,@level2type=N'COLUMN',@level2name=N'EMPLOY_OFFICE_CODE'
GO
/*** ÅV®ÀètO NEW_BELONGING_LIMIT_FLAG ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'ÅV®ÀètO'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_BU_INFORMATION'
                                ,@level2type=N'COLUMN',@level2name=N'NEW_BELONGING_LIMIT_FLAG'
GO
/*** _láOÎ PERSONNEL_EXCEPTION ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'_láOÎ'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_BU_INFORMATION'
                                ,@level2type=N'COLUMN',@level2name=N'PERSONNEL_EXCEPTION'
GO
/*** _l­§üÍ PERSONNEL_COMPULSION ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'_l­§üÍ'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_BU_INFORMATION'
                                ,@level2type=N'COLUMN',@level2name=N'PERSONNEL_COMPULSION'
GO
/*** pê¼Ì ENGLISH_NAME ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'pê¼Ì'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_BU_INFORMATION'
                                ,@level2type=N'COLUMN',@level2name=N'ENGLISH_NAME'
GO

/*** WK_SHITSU_INFORMATION e[uí ***/
if object_id('[dbo].[WK_SHITSU_INFORMATION]') is not null
DROP TABLE [dbo].[WK_SHITSU_INFORMATION]
GO
/*** WK_SHITSU_INFORMATION e[uì¬ ***/
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
    , CONSTRAINT [PK__WK_SHITSU_INFORMATION] primary key CLUSTERED
    (
       [SHITSU_CODE] asc
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

/*** _e[u¼o^ *********/
/*** ºÛ}X^îñ WK_SHITSU_INFORMATION ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'ºÛ}X^îñ'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE',@level1name=N'WK_SHITSU_INFORMATION'
GO
/*** _J¼o^ ***/
/*** ºÛR[h SHITSU_CODE ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'ºÛR[h'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_SHITSU_INFORMATION'
                                ,@level2type=N'COLUMN',@level2name=N'SHITSU_CODE'
GO
/*** ºÛR[hLøJnNú START_VALIDITY_DATE ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'ºÛR[hLøJnNú'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_SHITSU_INFORMATION'
                                ,@level2type=N'COLUMN',@level2name=N'START_VALIDITY_DATE'
GO
/*** ºÛR[hLøI¹Nú END_VALIDITY_DATE ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'ºÛR[hLøI¹Nú'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_SHITSU_INFORMATION'
                                ,@level2type=N'COLUMN',@level2name=N'END_VALIDITY_DATE'
GO
/*** R[h BU_CODE ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'R[h'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_SHITSU_INFORMATION'
                                ,@level2type=N'COLUMN',@level2name=N'BU_CODE'
GO
/*** ³®¼ÌP BU_NAME_1 ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'³®¼ÌP'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_SHITSU_INFORMATION'
                                ,@level2type=N'COLUMN',@level2name=N'BU_NAME_1'
GO
/*** ³®¼ÌQ BU_NAME_2 ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'³®¼ÌQ'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_SHITSU_INFORMATION'
                                ,@level2type=N'COLUMN',@level2name=N'BU_NAME_2'
GO
/*** ª®¼Ì BU_INFORMAL_NAME ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'ª®¼Ì'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_SHITSU_INFORMATION'
                                ,@level2type=N'COLUMN',@level2name=N'BU_INFORMAL_NAME'
GO
/*** ³®ºÛ¼Ì SHITSU_NAME ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'³®ºÛ¼Ì'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_SHITSU_INFORMATION'
                                ,@level2type=N'COLUMN',@level2name=N'SHITSU_NAME'
GO
/*** ª®ºÛ¼Ì SHITSU_INFORMAL_NAME ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'ª®ºÛ¼Ì'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_SHITSU_INFORMATION'
                                ,@level2type=N'COLUMN',@level2name=N'SHITSU_INFORMAL_NAME'
GO
/*** ºüÏ}[N SHITSU_CHANGE_MARK ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'ºüÏ}[N'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_SHITSU_INFORMATION'
                                ,@level2type=N'COLUMN',@level2name=N'SHITSU_CHANGE_MARK'
GO
/*** ºÛP[VR[h SHITSU_LOCATION_CODE ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'ºÛP[VR[h'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_SHITSU_INFORMATION'
                                ,@level2type=N'COLUMN',@level2name=N'SHITSU_LOCATION_CODE'
GO
/*** ºÛmn SHITSU_KA_NUMBER ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'ºÛmn'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_SHITSU_INFORMATION'
                                ,@level2type=N'COLUMN',@level2name=N'SHITSU_KA_NUMBER'
GO
/*** ºÛæªR[h SHITSU_KA_DIVISION_CODE ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'ºÛæªR[h'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_SHITSU_INFORMATION'
                                ,@level2type=N'COLUMN',@level2name=N'SHITSU_KA_DIVISION_CODE'
GO
/*** ÅV®ÀètO NEW_BELONGING_LIMIT_FLAG ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'ÅV®ÀètO'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_SHITSU_INFORMATION'
                                ,@level2type=N'COLUMN',@level2name=N'NEW_BELONGING_LIMIT_FLAG'
GO
/*** pê¼Ì ENGLISH_NAME ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'pê¼Ì'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_SHITSU_INFORMATION'
                                ,@level2type=N'COLUMN',@level2name=N'ENGLISH_NAME'
GO

/*** WK_KAKARI_INFORMATION e[uí ***/
if object_id('[dbo].[WK_KAKARI_INFORMATION]') is not null
DROP TABLE [dbo].[WK_KAKARI_INFORMATION]
GO
/*** WK_KAKARI_INFORMATION e[uì¬ ***/
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
    , CONSTRAINT [PK__WK_KAKARI_INFORMATION] primary key CLUSTERED
    (
       [KAKARI_CODE] asc
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

/*** _e[u¼o^ *********/
/*** Wf}X^îñ WK_KAKARI_INFORMATION ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'Wf}X^îñ'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE',@level1name=N'WK_KAKARI_INFORMATION'
GO
/*** _J¼o^ ***/
/*** WfR[h KAKARI_CODE ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'WfR[h'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_KAKARI_INFORMATION'
                                ,@level2type=N'COLUMN',@level2name=N'KAKARI_CODE'
GO
/*** WfR[hLøJnNú START_VALIDITY_DATE ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'WfR[hLøJnNú'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_KAKARI_INFORMATION'
                                ,@level2type=N'COLUMN',@level2name=N'START_VALIDITY_DATE'
GO
/*** WfR[hLøI¹Nú END_VALIDITY_DATE ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'WfR[hLøI¹Nú'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_KAKARI_INFORMATION'
                                ,@level2type=N'COLUMN',@level2name=N'END_VALIDITY_DATE'
GO
/*** R[h BU_CODE ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'R[h'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_KAKARI_INFORMATION'
                                ,@level2type=N'COLUMN',@level2name=N'BU_CODE'
GO
/*** ºÛR[h SHITSU_CODE ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'ºÛR[h'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_KAKARI_INFORMATION'
                                ,@level2type=N'COLUMN',@level2name=N'SHITSU_CODE'
GO
/*** ³®¼ÌP BU_NAME_1 ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'³®¼ÌP'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_KAKARI_INFORMATION'
                                ,@level2type=N'COLUMN',@level2name=N'BU_NAME_1'
GO
/*** ³®¼ÌQ BU_NAME_2 ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'³®¼ÌQ'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_KAKARI_INFORMATION'
                                ,@level2type=N'COLUMN',@level2name=N'BU_NAME_2'
GO
/*** ª®¼Ì BU_INFORMAL_NAME ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'ª®¼Ì'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_KAKARI_INFORMATION'
                                ,@level2type=N'COLUMN',@level2name=N'BU_INFORMAL_NAME'
GO
/*** ³®ºÛ¼Ì SHITSU_NAME ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'³®ºÛ¼Ì'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_KAKARI_INFORMATION'
                                ,@level2type=N'COLUMN',@level2name=N'SHITSU_NAME'
GO
/*** ª®ºÛ¼Ì SHITSU_INFORMAL_NAME ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'ª®ºÛ¼Ì'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_KAKARI_INFORMATION'
                                ,@level2type=N'COLUMN',@level2name=N'SHITSU_INFORMAL_NAME'
GO
/*** ³®Wf¼Ì KAKARI_NAME ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'³®Wf¼Ì'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_KAKARI_INFORMATION'
                                ,@level2type=N'COLUMN',@level2name=N'KAKARI_NAME'
GO
/*** ª®Wf¼Ì KAKARI_INFORMAL_NAME ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'ª®Wf¼Ì'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_KAKARI_INFORMATION'
                                ,@level2type=N'COLUMN',@level2name=N'KAKARI_INFORMAL_NAME'
GO
/*** WfP[VR[h KAKARI_LOCATION_CODE ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'WfP[VR[h'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_KAKARI_INFORMATION'
                                ,@level2type=N'COLUMN',@level2name=N'KAKARI_LOCATION_CODE'
GO
/*** Wfmn KAKARI_NUMBER ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'Wfmn'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_KAKARI_INFORMATION'
                                ,@level2type=N'COLUMN',@level2name=N'KAKARI_NUMBER'
GO
/*** WfæªR[h KAKARI_DIVISION_CODE ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'WfæªR[h'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_KAKARI_INFORMATION'
                                ,@level2type=N'COLUMN',@level2name=N'KAKARI_DIVISION_CODE'
GO
/*** ÅV®ÀètO NEW_BELONGING_LIMIT_FLAG ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'ÅV®ÀètO'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_KAKARI_INFORMATION'
                                ,@level2type=N'COLUMN',@level2name=N'NEW_BELONGING_LIMIT_FLAG'
GO

/*** WK_STAFF_DIVISION e[uí ***/
if object_id('[dbo].[WK_STAFF_DIVISION]') is not null
DROP TABLE [dbo].[WK_STAFF_DIVISION]
GO
/*** WK_STAFF_DIVISION e[uì¬ ***/
create table [dbo].[WK_STAFF_DIVISION] (
      [STAFF_DIVISION_CODE] [varchar](1)
    , [STAFF_DIVISION_NAME] [varchar](40)
    , CONSTRAINT [PK__WK_STAFF_DIVISION] primary key CLUSTERED
    (
       [STAFF_DIVISION_CODE] asc
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

/*** _e[u¼o^ *********/
/*** ]Æõæª}X^îñ WK_STAFF_DIVISION ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N']Æõæª}X^îñ'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE',@level1name=N'WK_STAFF_DIVISION'
GO
/*** _J¼o^ ***/
/*** ]ÆõæªR[h STAFF_DIVISION_CODE ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N']ÆõæªR[h'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_STAFF_DIVISION'
                                ,@level2type=N'COLUMN',@level2name=N'STAFF_DIVISION_CODE'
GO
/*** ]Æõæª¼Ì STAFF_DIVISION_NAME ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N']Æõæª¼Ì'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_STAFF_DIVISION'
                                ,@level2type=N'COLUMN',@level2name=N'STAFF_DIVISION_NAME'
GO

/*** WK_ABOUT_WORK e[uí ***/
if object_id('[dbo].[WK_ABOUT_WORK]') is not null
DROP TABLE [dbo].[WK_ABOUT_WORK]
GO
/*** WK_ABOUT_WORK e[uì¬ ***/
create table [dbo].[WK_ABOUT_WORK] (
      [ABOUT_WORK_CODE] [varchar](3)
    , [ABOUT_WORK_NAME] [varchar](32)
    , [INFORMAL_ABOUT_WORK_NAME] [varchar](12)
    , [MANESUTA_DIVISION_CODE] [varchar](1)
    , [ENGLISH_NAME] [varchar](60)
    , CONSTRAINT [PK__WK_ABOUT_WORK] primary key CLUSTERED
    (
       [ABOUT_WORK_CODE] asc
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

/*** _e[u¼o^ *********/
/*** EÊ}X^îñ WK_ABOUT_WORK ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'EÊ}X^îñ'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE',@level1name=N'WK_ABOUT_WORK'
GO
/*** _J¼o^ ***/
/*** EÊR[h ABOUT_WORK_CODE ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'EÊR[h'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_ABOUT_WORK'
                                ,@level2type=N'COLUMN',@level2name=N'ABOUT_WORK_CODE'
GO
/*** EÊ¼Ì ABOUT_WORK_NAME ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'EÊ¼Ì'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_ABOUT_WORK'
                                ,@level2type=N'COLUMN',@level2name=N'ABOUT_WORK_NAME'
GO
/*** ª®EÊ¼Ì INFORMAL_ABOUT_WORK_NAME ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'ª®EÊ¼Ì'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_ABOUT_WORK'
                                ,@level2type=N'COLUMN',@level2name=N'INFORMAL_ABOUT_WORK_NAME'
GO
/*** }lX^æªR[h MANESUTA_DIVISION_CODE ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'}lX^æªR[h'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_ABOUT_WORK'
                                ,@level2type=N'COLUMN',@level2name=N'MANESUTA_DIVISION_CODE'
GO
/*** pê¼Ì ENGLISH_NAME ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'pê¼Ì'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_ABOUT_WORK'
                                ,@level2type=N'COLUMN',@level2name=N'ENGLISH_NAME'
GO

/*** WK_JOB_CATEGORY e[uí ***/
if object_id('[dbo].[WK_JOB_CATEGORY]') is not null
DROP TABLE [dbo].[WK_JOB_CATEGORY]
GO
/*** WK_JOB_CATEGORY e[uì¬ ***/
create table [dbo].[WK_JOB_CATEGORY] (
      [JOB_CATEGORY_CODE] [varchar](2)
    , [JOB_CATEGORY_NAME] [varchar](20)
    , CONSTRAINT [PK__WK_JOB_CATEGORY] primary key CLUSTERED
    (
       [JOB_CATEGORY_CODE] asc
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

/*** _e[u¼o^ *********/
/*** Eí}X^îñ WK_JOB_CATEGORY ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'Eí}X^îñ'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE',@level1name=N'WK_JOB_CATEGORY'
GO
/*** _J¼o^ ***/
/*** EíR[h JOB_CATEGORY_CODE ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'EíR[h'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_JOB_CATEGORY'
                                ,@level2type=N'COLUMN',@level2name=N'JOB_CATEGORY_CODE'
GO
/*** Eí¼Ì JOB_CATEGORY_NAME ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'Eí¼Ì'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_JOB_CATEGORY'
                                ,@level2type=N'COLUMN',@level2name=N'JOB_CATEGORY_NAME'
GO

/*** WK_QUALIFICATION e[uí ***/
if object_id('[dbo].[WK_QUALIFICATION]') is not null
DROP TABLE [dbo].[WK_QUALIFICATION]
GO

/*** WK_QUALIFICATION e[uì¬ ***/
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

/*** _e[u¼o^ *********/
/*** i}X^îñ WK_QUALIFICATION ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'i}X^îñ'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE',@level1name=N'WK_QUALIFICATION'
GO
/*** _J¼o^ ***/
/*** iR[h QUALIFICATION_CODE ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'iR[h'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_QUALIFICATION'
                                ,@level2type=N'COLUMN',@level2name=N'QUALIFICATION_CODE'
GO
/*** iÌnæªR[h QUALIFICATION_SYSTEM_CODE ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'iÌnæªR[h'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_QUALIFICATION'
                                ,@level2type=N'COLUMN',@level2name=N'QUALIFICATION_SYSTEM_CODE'
GO
/*** i¼Ì QUALIFICATION_NAME ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'i¼Ì'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_QUALIFICATION'
                                ,@level2type=N'COLUMN',@level2name=N'QUALIFICATION_NAME'
GO
/*** ª®i¼Ì INFORMAL_QUALIFICATION_NAME ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'ª®i¼Ì'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_QUALIFICATION'
                                ,@level2type=N'COLUMN',@level2name=N'INFORMAL_QUALIFICATION_NAME'
GO
/*** imn QUALIFICATION_NUMBER ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'imn'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_QUALIFICATION'
                                ,@level2type=N'COLUMN',@level2name=N'QUALIFICATION_NUMBER'
GO
