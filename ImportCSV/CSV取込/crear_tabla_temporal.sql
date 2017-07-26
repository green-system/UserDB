/*
 ���[�UDB�i�����n��V�X�e���p�j���[�N�e�[�u���쐬T-SQL
 �쐬��:K.Tanaka
 �ύX���t   Rev   �ύX������e----------------------------->
 2017/06/30(0.1.0)�V�K�쐬
 2017/07/11(0.2.0)��L�[�ύX
 2017/07/25(0.3.0)WK_PERSON_OF_COMPANY,WK_PERSON_OF_OTHER_COMPANY�C���f�b�N�X�ǉ�
 2017/07/25(0.3.1)WK_PERSON_OF_OTHER_COMPANY��L�[�폜
 2017/07/26(0.3.2)��L�[�폜�����ǉ�
*/

USE [JINJI]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING OFF
GO

/*** PK__WK_PERSON_OF_COMPANY ��L�[�폜 ***/
if object_id('dbo.PK__WK_PERSON_OF_COMPANY') is not null
ALTER TABLE WK_PERSON_OF_COMPANY DROP CONSTRAINT PK__WK_PERSON_OF_COMPANY;
GO

/*** WK_PERSON_OF_COMPANY �e�[�u���폜 ***/
if object_id('[dbo].[WK_PERSON_OF_COMPANY]') is not null
DROP TABLE [dbo].[WK_PERSON_OF_COMPANY]
GO

/*** WK_PERSON_OF_COMPANY �e�[�u���쐬 ***/
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

/*** �_���e�[�u�����o�^ *********/
/*** �]�ƈ���� WK_PERSON_OF_COMPANY ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'�]�ƈ����'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE',@level1name=N'WK_PERSON_OF_COMPANY'
GO
/*** �_���J�������o�^ ***/
/*** �]�ƈ��R�[�h STAFF_CODE ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'�]�ƈ��R�[�h'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_PERSON_OF_COMPANY'
                                ,@level2type=N'COLUMN',@level2name=N'STAFF_CODE'
GO
/*** �����i�����j KANJI_NAME ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'�����i�����j'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_PERSON_OF_COMPANY'
                                ,@level2type=N'COLUMN',@level2name=N'KANJI_NAME'
GO
/*** �����i���[�}���j ROMAN_NAME ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'�����i���[�}���j'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_PERSON_OF_COMPANY'
                                ,@level2type=N'COLUMN',@level2name=N'ROMAN_NAME'
GO
/*** �����i�J�i�j KANA_NAME ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'�����i�J�i�j'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_PERSON_OF_COMPANY'
                                ,@level2type=N'COLUMN',@level2name=N'KANA_NAME'
GO
/*** �����g�p�̗L���t���O ORIGINAL_NAME_FLAG ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'�����g�p�̗L���t���O'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_PERSON_OF_COMPANY'
                                ,@level2type=N'COLUMN',@level2name=N'ORIGINAL_NAME_FLAG'
GO
/*** ���������i�����j KANJI_ORIGINAL_NAME ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'���������i�����j'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_PERSON_OF_COMPANY'
                                ,@level2type=N'COLUMN',@level2name=N'KANJI_ORIGINAL_NAME'
GO
/*** ���������i���[�}���j ROMAN_ORIGINAL_NAME ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'���������i���[�}���j'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_PERSON_OF_COMPANY'
                                ,@level2type=N'COLUMN',@level2name=N'ROMAN_ORIGINAL_NAME'
GO
/*** ���������i�J�i�j KANA_ORIGINAL_NAME ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'���������i�J�i�j'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_PERSON_OF_COMPANY'
                                ,@level2type=N'COLUMN',@level2name=N'KANA_ORIGINAL_NAME'
GO
/*** ���� MEN_OR_WOMEN ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'����'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_PERSON_OF_COMPANY'
                                ,@level2type=N'COLUMN',@level2name=N'MEN_OR_WOMEN'
GO
/*** �]�ƈ��敪�R�[�h STAFF_DIVISION_CODE ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'�]�ƈ��敪�R�[�h'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_PERSON_OF_COMPANY'
                                ,@level2type=N'COLUMN',@level2name=N'STAFF_DIVISION_CODE'
GO
/*** �]�ƈ��敪���� STAFF_DIVISION_NAME ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'�]�ƈ��敪����'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_PERSON_OF_COMPANY'
                                ,@level2type=N'COLUMN',@level2name=N'STAFF_DIVISION_NAME'
GO
/*** �ŐV�����J�n�N���� BELONGING_LATEST_START_DATE ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'�ŐV�����J�n�N����'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_PERSON_OF_COMPANY'
                                ,@level2type=N'COLUMN',@level2name=N'BELONGING_LATEST_START_DATE'
GO
/*** �ŐV�����R�[�h BELONGING_LATEST_CODE ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'�ŐV�����R�[�h'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_PERSON_OF_COMPANY'
                                ,@level2type=N'COLUMN',@level2name=N'BELONGING_LATEST_CODE'
GO
/*** �ŐV�����Q�����������̂P BELONGING_LATEST_BU_NAME ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'�ŐV�����Q�����������̂P'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_PERSON_OF_COMPANY'
                                ,@level2type=N'COLUMN',@level2name=N'BELONGING_LATEST_BU_NAME'
GO
/*** �ŐV�����Q�������ۖ��� BELONGING_LATEST_SHITSU_NAME ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'�ŐV�����Q�������ۖ���'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_PERSON_OF_COMPANY'
                                ,@level2type=N'COLUMN',@level2name=N'BELONGING_LATEST_SHITSU_NAME'
GO
/*** �ŐV�����Q�����W�f���� BELONGING_LATEST_KAKARI_NAME ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'�ŐV�����Q�����W�f����'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_PERSON_OF_COMPANY'
                                ,@level2type=N'COLUMN',@level2name=N'BELONGING_LATEST_KAKARI_NAME'
GO
/*** ���P�[�V�����R�[�h LOCATION_CODE ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'���P�[�V�����R�[�h'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_PERSON_OF_COMPANY'
                                ,@level2type=N'COLUMN',@level2name=N'LOCATION_CODE'
GO
/*** ���P�[�V�������� LOCATION_NAME ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'���P�[�V��������'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_PERSON_OF_COMPANY'
                                ,@level2type=N'COLUMN',@level2name=N'LOCATION_NAME'
GO
/*** ��ЃR�[�h COMPANY_CODE ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'��ЃR�[�h'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_PERSON_OF_COMPANY'
                                ,@level2type=N'COLUMN',@level2name=N'COMPANY_CODE'
GO
/*** �������Q��Ж��� INFORMAL_COMPANY_NAME ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'�������Q��Ж���'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_PERSON_OF_COMPANY'
                                ,@level2type=N'COLUMN',@level2name=N'INFORMAL_COMPANY_NAME'
GO
/*** �E��R�[�h JOB_CATEGORY_CODE ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'�E��R�[�h'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_PERSON_OF_COMPANY'
                                ,@level2type=N'COLUMN',@level2name=N'JOB_CATEGORY_CODE'
GO
/*** �E�햼�� JOB_CATEGORY_NAME ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'�E�햼��'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_PERSON_OF_COMPANY'
                                ,@level2type=N'COLUMN',@level2name=N'JOB_CATEGORY_NAME'
GO
/*** ���i�̌n�敪�R�[�h QUALIFICATION_SYSTEM_CODE ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'���i�̌n�敪�R�[�h'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_PERSON_OF_COMPANY'
                                ,@level2type=N'COLUMN',@level2name=N'QUALIFICATION_SYSTEM_CODE'
GO
/*** ���i�R�[�h QUALIFICATION_CODE ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'���i�R�[�h'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_PERSON_OF_COMPANY'
                                ,@level2type=N'COLUMN',@level2name=N'QUALIFICATION_CODE'
GO
/*** �{�����������t���O ORIGINAL_BELONGING_FLAG ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'�{�����������t���O'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_PERSON_OF_COMPANY'
                                ,@level2type=N'COLUMN',@level2name=N'ORIGINAL_BELONGING_FLAG'
GO
/*** �{�������J�n�N���� ORIGINAL_BELONGING_START_DATE ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'�{�������J�n�N����'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_PERSON_OF_COMPANY'
                                ,@level2type=N'COLUMN',@level2name=N'ORIGINAL_BELONGING_START_DATE'
GO
/*** �{�������R�[�h ORIGINAL_BELONGING_CODE ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'�{�������R�[�h'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_PERSON_OF_COMPANY'
                                ,@level2type=N'COLUMN',@level2name=N'ORIGINAL_BELONGING_CODE'
GO
/*** �E�ʃR�[�h ABOUT_WORK_CODE ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'�E�ʃR�[�h'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_PERSON_OF_COMPANY'
                                ,@level2type=N'COLUMN',@level2name=N'ABOUT_WORK_CODE'
GO
/*** �E�ʖ��� ABOUT_WORK_NAME ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'�E�ʖ���'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_PERSON_OF_COMPANY'
                                ,@level2type=N'COLUMN',@level2name=N'ABOUT_WORK_NAME'
GO
/*** ���F�����N�R�[�h APPROVAL_RANK_CODE ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'���F�����N�R�[�h'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_PERSON_OF_COMPANY'
                                ,@level2type=N'COLUMN',@level2name=N'APPROVAL_RANK_CODE'
GO
/*** �x�E�t���O LAYOFF_FLAG ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'�x�E�t���O'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_PERSON_OF_COMPANY'
                                ,@level2type=N'COLUMN',@level2name=N'LAYOFF_FLAG'
GO
/*** �����p�[�g�敪���� NONREGULAR_DIVISION_NAME ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'�����p�[�g�敪����'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_PERSON_OF_COMPANY'
                                ,@level2type=N'COLUMN',@level2name=N'NONREGULAR_DIVISION_NAME'
GO

/*** WK_PERSON_OF_COMPANY �C���f�b�N�X�폜 ***/
IF EXISTS(SELECT * FROM sys.indexes WHERE object_id = object_id('dbo.WK_PERSON_OF_COMPANY') AND NAME ='IDX_WK_PERSON_OF_COMPANY')
DROP INDEX IDX_WK_PERSON_OF_COMPANY ON dbo.WK_PERSON_OF_COMPANY;
GO
/*** WK_PERSON_OF_COMPANY �C���f�b�N�X�쐬 ***/
CREATE INDEX IDX_WK_PERSON_OF_COMPANY ON WK_PERSON_OF_COMPANY(STAFF_CODE, ORIGINAL_BELONGING_START_DATE, ORIGINAL_BELONGING_CODE)
GO

/*** PK__WK_PERSON_OF_OTHER_COMPANY ��L�[�폜 ***/
if object_id('dbo.PK__WK_PERSON_OF_OTHER_COMPANY') is not null
ALTER TABLE WK_PERSON_OF_OTHER_COMPANY DROP CONSTRAINT PK__WK_PERSON_OF_OTHER_COMPANY;
GO

/*** WK_PERSON_OF_OTHER_COMPANY �e�[�u���폜 ***/
if object_id('[dbo].[WK_PERSON_OF_OTHER_COMPANY]') is not null
DROP TABLE [dbo].[WK_PERSON_OF_OTHER_COMPANY]
GO

/*** WK_PERSON_OF_OTHER_COMPANY �e�[�u���쐬 ***/
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

/*** �_���e�[�u�����o�^ *********/
/*** �ЊO�ҏ�� WK_PERSON_OF_OTHER_COMPANY ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'�ЊO�ҏ��'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE',@level1name=N'WK_PERSON_OF_OTHER_COMPANY'
GO
/*** �_���J�������o�^ ***/
/*** �ЊO��ID STAFF_CODE ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'�ЊO��ID'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_PERSON_OF_OTHER_COMPANY'
                                ,@level2type=N'COLUMN',@level2name=N'STAFF_CODE'
GO
/*** �����i�����j KANJI_NAME ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'�����i�����j'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_PERSON_OF_OTHER_COMPANY'
                                ,@level2type=N'COLUMN',@level2name=N'KANJI_NAME'
GO
/*** �����i���[�}���j ROMAN_NAME ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'�����i���[�}���j'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_PERSON_OF_OTHER_COMPANY'
                                ,@level2type=N'COLUMN',@level2name=N'ROMAN_NAME'
GO
/*** �����i�J�i�j KANA_NAME ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'�����i�J�i�j'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_PERSON_OF_OTHER_COMPANY'
                                ,@level2type=N'COLUMN',@level2name=N'KANA_NAME'
GO
/*** �ЊO�ҋ敪�R�[�h STAFF_DIVISION_CODE ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'�ЊO�ҋ敪�R�[�h'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_PERSON_OF_OTHER_COMPANY'
                                ,@level2type=N'COLUMN',@level2name=N'STAFF_DIVISION_CODE'
GO
/*** ��������R�[�h ACCEPTANCE_BELONGING_CODE ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'��������R�[�h'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_PERSON_OF_OTHER_COMPANY'
                                ,@level2type=N'COLUMN',@level2name=N'ACCEPTANCE_BELONGING_CODE'
GO
/*** �_����ԃJ�� START_CONTRACT_TERM ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'�_����ԃJ��'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_PERSON_OF_OTHER_COMPANY'
                                ,@level2type=N'COLUMN',@level2name=N'START_CONTRACT_TERM'
GO
/*** �_����ԃ}�f END_CONTRACT_TERM ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'�_����ԃ}�f'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_PERSON_OF_OTHER_COMPANY'
                                ,@level2type=N'COLUMN',@level2name=N'END_CONTRACT_TERM'
GO
/*** ��Əꏊ�R�[�h WORKING_PLACE_CODE ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'��Əꏊ�R�[�h'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_PERSON_OF_OTHER_COMPANY'
                                ,@level2type=N'COLUMN',@level2name=N'WORKING_PLACE_CODE'
GO
/*** �ŐV�����R�[�h BELONGING_LATEST_CODE ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'�ŐV�����R�[�h'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_PERSON_OF_OTHER_COMPANY'
                                ,@level2type=N'COLUMN',@level2name=N'BELONGING_LATEST_CODE'
GO
/*** ������ЃR�[�h ORIGINAL_CONTRACTOR_CODE ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'������ЃR�[�h'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_PERSON_OF_OTHER_COMPANY'
                                ,@level2type=N'COLUMN',@level2name=N'ORIGINAL_CONTRACTOR_CODE'
GO
/*** ������Ж� ORIGINAL_CONTRACTOR_NAME ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'������Ж�'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_PERSON_OF_OTHER_COMPANY'
                                ,@level2type=N'COLUMN',@level2name=N'ORIGINAL_CONTRACTOR_NAME'
GO
/*** ������ЃR�[�h BELONGING_COMPANY_CODE ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'������ЃR�[�h'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_PERSON_OF_OTHER_COMPANY'
                                ,@level2type=N'COLUMN',@level2name=N'BELONGING_COMPANY_CODE'
GO
/*** ������Ж� BELONGING_COMPANY_NAME ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'������Ж�'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_PERSON_OF_OTHER_COMPANY'
                                ,@level2type=N'COLUMN',@level2name=N'BELONGING_COMPANY_NAME'
GO
/*** �J�[�h�X�e�[�^�X CARD_STATUS ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'�J�[�h�X�e�[�^�X'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_PERSON_OF_OTHER_COMPANY'
                                ,@level2type=N'COLUMN',@level2name=N'CARD_STATUS'
GO

/*** WK_PERSON_OF_OTHER_COMPANY �C���f�b�N�X�폜 ***/
IF EXISTS(SELECT * FROM sys.indexes WHERE object_id = object_id('dbo.WK_PERSON_OF_OTHER_COMPANY') AND NAME ='IDX_WK_PERSON_OF_OTHER_COMPANY')
DROP INDEX IDX_WK_PERSON_OF_OTHER_COMPANY ON dbo.WK_PERSON_OF_OTHER_COMPANY;
GO
/*** WK_PERSON_OF_OTHER_COMPANY �C���f�b�N�X�쐬 ***/
CREATE INDEX IDX_WK_PERSON_OF_OTHER_COMPANY ON WK_PERSON_OF_OTHER_COMPANY(STAFF_CODE)
GO

/*** PK__WK_BU_INFORMATION ��L�[�폜 ***/
if object_id('dbo.PK__WK_BU_INFORMATION') is not null
ALTER TABLE WK_BU_INFORMATION DROP CONSTRAINT PK__WK_BU_INFORMATION;
GO

/*** WK_BU_INFORMATION �e�[�u���폜 ***/
if object_id('[dbo].[WK_BU_INFORMATION]') is not null
DROP TABLE [dbo].[WK_BU_INFORMATION]
GO

/*** WK_BU_INFORMATION �e�[�u���쐬 ***/
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

/*** �_���e�[�u�����o�^ *********/
/*** ���}�X�^��� WK_BU_INFORMATION ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'���}�X�^���'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE',@level1name=N'WK_BU_INFORMATION'
GO
/*** �_���J�������o�^ ***/
/*** ���R�[�h BU_CODE ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'���R�[�h'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_BU_INFORMATION'
                                ,@level2type=N'COLUMN',@level2name=N'BU_CODE'
GO
/*** ���R�[�h�L���J�n�N���� START_VALIDITY_DATE ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'���R�[�h�L���J�n�N����'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_BU_INFORMATION'
                                ,@level2type=N'COLUMN',@level2name=N'START_VALIDITY_DATE'
GO
/*** ���R�[�h�L���I���N���� END_VALIDITY_DATE ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'���R�[�h�L���I���N����'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_BU_INFORMATION'
                                ,@level2type=N'COLUMN',@level2name=N'END_VALIDITY_DATE'
GO
/*** ���������̂P BU_NAME_1 ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'���������̂P'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_BU_INFORMATION'
                                ,@level2type=N'COLUMN',@level2name=N'BU_NAME_1'
GO
/*** ���������̂Q BU_NAME_2 ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'���������̂Q'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_BU_INFORMATION'
                                ,@level2type=N'COLUMN',@level2name=N'BU_NAME_2'
GO
/*** ���������̂R BU_NAME_3 ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'���������̂R'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_BU_INFORMATION'
                                ,@level2type=N'COLUMN',@level2name=N'BU_NAME_3'
GO
/*** ���������� BU_INFORMAL_NAME ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'����������'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_BU_INFORMATION'
                                ,@level2type=N'COLUMN',@level2name=N'BU_INFORMAL_NAME'
GO
/*** �����σ}�[�N BU_ALTERATION_MARK ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'�����σ}�[�N'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_BU_INFORMATION'
                                ,@level2type=N'COLUMN',@level2name=N'BU_ALTERATION_MARK'
GO
/*** ����R�[�h SECTION_CODE ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'����R�[�h'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_BU_INFORMATION'
                                ,@level2type=N'COLUMN',@level2name=N'SECTION_CODE'
GO
/*** �����P�[�V�����R�[�h BU_LOCATION_CODE ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'�����P�[�V�����R�[�h'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_BU_INFORMATION'
                                ,@level2type=N'COLUMN',@level2name=N'BU_LOCATION_CODE'
GO
/*** ���m�n BU_NUMBER ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'���m�n'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_BU_INFORMATION'
                                ,@level2type=N'COLUMN',@level2name=N'BU_NUMBER'
GO
/*** �����m�n EXECUTIVE_NUMBER ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'�����m�n'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_BU_INFORMATION'
                                ,@level2type=N'COLUMN',@level2name=N'EXECUTIVE_NUMBER'
GO
/*** ���ʐl������ SHITSU_PERSON_SECTION ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'���ʐl������'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_BU_INFORMATION'
                                ,@level2type=N'COLUMN',@level2name=N'SHITSU_PERSON_SECTION'
GO
/*** ��������m�n�` ADJUST_SECTION_NUMBER_A ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'��������m�n�`'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_BU_INFORMATION'
                                ,@level2type=N'COLUMN',@level2name=N'ADJUST_SECTION_NUMBER_A'
GO
/*** ��������m�n�a ADJUST_SECTION_NUMBER_B ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'��������m�n�a'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_BU_INFORMATION'
                                ,@level2type=N'COLUMN',@level2name=N'ADJUST_SECTION_NUMBER_B'
GO
/*** ��������m�n�b ADJUST_SECTION_NUMBER_C ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'��������m�n�b'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_BU_INFORMATION'
                                ,@level2type=N'COLUMN',@level2name=N'ADJUST_SECTION_NUMBER_C'
GO
/*** ��������m�n�c ADJUST_SECTION_NUMBER_D ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'��������m�n�c'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_BU_INFORMATION'
                                ,@level2type=N'COLUMN',@level2name=N'ADJUST_SECTION_NUMBER_D'
GO
/*** �����l���g�D�R�[�h�Q�l�� ASSESSMENT_CODE ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'�����l���g�D�R�[�h�Q�l��'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_BU_INFORMATION'
                                ,@level2type=N'COLUMN',@level2name=N'ASSESSMENT_CODE'
GO
/*** �����l���g�D�R�[�h�Q���i RANK_RISE_CODE ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'�����l���g�D�R�[�h�Q���i'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_BU_INFORMATION'
                                ,@level2type=N'COLUMN',@level2name=N'RANK_RISE_CODE'
GO
/*** �����l���g�D�R�[�h�Q�ٓ� CHANGE_CODE ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'�����l���g�D�R�[�h�Q�ٓ�'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_BU_INFORMATION'
                                ,@level2type=N'COLUMN',@level2name=N'CHANGE_CODE'
GO
/*** �����l���g�D�R�[�h�Q���C TRAINING_CODE ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'�����l���g�D�R�[�h�Q���C'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_BU_INFORMATION'
                                ,@level2type=N'COLUMN',@level2name=N'TRAINING_CODE'
GO
/*** ��Q�Ҍٗp���Ə��R�[�h EMPLOY_OFFICE_CODE ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'��Q�Ҍٗp���Ə��R�[�h'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_BU_INFORMATION'
                                ,@level2type=N'COLUMN',@level2name=N'EMPLOY_OFFICE_CODE'
GO
/*** �ŐV��������t���O NEW_BELONGING_LIMIT_FLAG ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'�ŐV��������t���O'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_BU_INFORMATION'
                                ,@level2type=N'COLUMN',@level2name=N'NEW_BELONGING_LIMIT_FLAG'
GO
/*** ���_�l����O�Ή� PERSONNEL_EXCEPTION ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'���_�l����O�Ή�'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_BU_INFORMATION'
                                ,@level2type=N'COLUMN',@level2name=N'PERSONNEL_EXCEPTION'
GO
/*** ���_�l���������� PERSONNEL_COMPULSION ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'���_�l����������'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_BU_INFORMATION'
                                ,@level2type=N'COLUMN',@level2name=N'PERSONNEL_COMPULSION'
GO
/*** �p�ꖼ�� ENGLISH_NAME ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'�p�ꖼ��'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_BU_INFORMATION'
                                ,@level2type=N'COLUMN',@level2name=N'ENGLISH_NAME'
GO

/*** PK__WK_SHITSU_INFORMATION ��L�[�폜 ***/
if object_id('dbo.PK__WK_SHITSU_INFORMATION') is not null
ALTER TABLE WK_SHITSU_INFORMATION DROP CONSTRAINT PK__WK_SHITSU_INFORMATION;
GO

/*** WK_SHITSU_INFORMATION �e�[�u���폜 ***/
if object_id('[dbo].[WK_SHITSU_INFORMATION]') is not null
DROP TABLE [dbo].[WK_SHITSU_INFORMATION]
GO
/*** WK_SHITSU_INFORMATION �e�[�u���쐬 ***/
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

/*** �_���e�[�u�����o�^ *********/
/*** ���ۃ}�X�^��� WK_SHITSU_INFORMATION ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'���ۃ}�X�^���'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE',@level1name=N'WK_SHITSU_INFORMATION'
GO
/*** �_���J�������o�^ ***/
/*** ���ۃR�[�h SHITSU_CODE ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'���ۃR�[�h'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_SHITSU_INFORMATION'
                                ,@level2type=N'COLUMN',@level2name=N'SHITSU_CODE'
GO
/*** ���ۃR�[�h�L���J�n�N���� START_VALIDITY_DATE ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'���ۃR�[�h�L���J�n�N����'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_SHITSU_INFORMATION'
                                ,@level2type=N'COLUMN',@level2name=N'START_VALIDITY_DATE'
GO
/*** ���ۃR�[�h�L���I���N���� END_VALIDITY_DATE ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'���ۃR�[�h�L���I���N����'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_SHITSU_INFORMATION'
                                ,@level2type=N'COLUMN',@level2name=N'END_VALIDITY_DATE'
GO
/*** ���R�[�h BU_CODE ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'���R�[�h'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_SHITSU_INFORMATION'
                                ,@level2type=N'COLUMN',@level2name=N'BU_CODE'
GO
/*** ���������̂P BU_NAME_1 ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'���������̂P'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_SHITSU_INFORMATION'
                                ,@level2type=N'COLUMN',@level2name=N'BU_NAME_1'
GO
/*** ���������̂Q BU_NAME_2 ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'���������̂Q'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_SHITSU_INFORMATION'
                                ,@level2type=N'COLUMN',@level2name=N'BU_NAME_2'
GO
/*** ���������� BU_INFORMAL_NAME ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'����������'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_SHITSU_INFORMATION'
                                ,@level2type=N'COLUMN',@level2name=N'BU_INFORMAL_NAME'
GO
/*** �������ۖ��� SHITSU_NAME ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'�������ۖ���'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_SHITSU_INFORMATION'
                                ,@level2type=N'COLUMN',@level2name=N'SHITSU_NAME'
GO
/*** �������ۖ��� SHITSU_INFORMAL_NAME ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'�������ۖ���'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_SHITSU_INFORMATION'
                                ,@level2type=N'COLUMN',@level2name=N'SHITSU_INFORMAL_NAME'
GO
/*** �����σ}�[�N SHITSU_CHANGE_MARK ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'�����σ}�[�N'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_SHITSU_INFORMATION'
                                ,@level2type=N'COLUMN',@level2name=N'SHITSU_CHANGE_MARK'
GO
/*** ���ۃ��P�[�V�����R�[�h SHITSU_LOCATION_CODE ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'���ۃ��P�[�V�����R�[�h'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_SHITSU_INFORMATION'
                                ,@level2type=N'COLUMN',@level2name=N'SHITSU_LOCATION_CODE'
GO
/*** ���ۂm�n SHITSU_KA_NUMBER ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'���ۂm�n'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_SHITSU_INFORMATION'
                                ,@level2type=N'COLUMN',@level2name=N'SHITSU_KA_NUMBER'
GO
/*** ���ۋ敪�R�[�h SHITSU_KA_DIVISION_CODE ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'���ۋ敪�R�[�h'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_SHITSU_INFORMATION'
                                ,@level2type=N'COLUMN',@level2name=N'SHITSU_KA_DIVISION_CODE'
GO
/*** �ŐV��������t���O NEW_BELONGING_LIMIT_FLAG ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'�ŐV��������t���O'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_SHITSU_INFORMATION'
                                ,@level2type=N'COLUMN',@level2name=N'NEW_BELONGING_LIMIT_FLAG'
GO
/*** �p�ꖼ�� ENGLISH_NAME ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'�p�ꖼ��'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_SHITSU_INFORMATION'
                                ,@level2type=N'COLUMN',@level2name=N'ENGLISH_NAME'
GO

/*** PK__WK_KAKARI_INFORMATION ��L�[�폜 ***/
if object_id('dbo.PK__WK_KAKARI_INFORMATION') is not null
ALTER TABLE WK_KAKARI_INFORMATION DROP CONSTRAINT PK__WK_KAKARI_INFORMATION;
GO

/*** WK_KAKARI_INFORMATION �e�[�u���폜 ***/
if object_id('[dbo].[WK_KAKARI_INFORMATION]') is not null
DROP TABLE [dbo].[WK_KAKARI_INFORMATION]
GO
/*** WK_KAKARI_INFORMATION �e�[�u���쐬 ***/
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

/*** �_���e�[�u�����o�^ *********/
/*** �W�f�}�X�^��� WK_KAKARI_INFORMATION ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'�W�f�}�X�^���'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE',@level1name=N'WK_KAKARI_INFORMATION'
GO
/*** �_���J�������o�^ ***/
/*** �W�f�R�[�h KAKARI_CODE ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'�W�f�R�[�h'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_KAKARI_INFORMATION'
                                ,@level2type=N'COLUMN',@level2name=N'KAKARI_CODE'
GO
/*** �W�f�R�[�h�L���J�n�N���� START_VALIDITY_DATE ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'�W�f�R�[�h�L���J�n�N����'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_KAKARI_INFORMATION'
                                ,@level2type=N'COLUMN',@level2name=N'START_VALIDITY_DATE'
GO
/*** �W�f�R�[�h�L���I���N���� END_VALIDITY_DATE ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'�W�f�R�[�h�L���I���N����'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_KAKARI_INFORMATION'
                                ,@level2type=N'COLUMN',@level2name=N'END_VALIDITY_DATE'
GO
/*** ���R�[�h BU_CODE ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'���R�[�h'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_KAKARI_INFORMATION'
                                ,@level2type=N'COLUMN',@level2name=N'BU_CODE'
GO
/*** ���ۃR�[�h SHITSU_CODE ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'���ۃR�[�h'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_KAKARI_INFORMATION'
                                ,@level2type=N'COLUMN',@level2name=N'SHITSU_CODE'
GO
/*** ���������̂P BU_NAME_1 ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'���������̂P'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_KAKARI_INFORMATION'
                                ,@level2type=N'COLUMN',@level2name=N'BU_NAME_1'
GO
/*** ���������̂Q BU_NAME_2 ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'���������̂Q'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_KAKARI_INFORMATION'
                                ,@level2type=N'COLUMN',@level2name=N'BU_NAME_2'
GO
/*** ���������� BU_INFORMAL_NAME ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'����������'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_KAKARI_INFORMATION'
                                ,@level2type=N'COLUMN',@level2name=N'BU_INFORMAL_NAME'
GO
/*** �������ۖ��� SHITSU_NAME ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'�������ۖ���'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_KAKARI_INFORMATION'
                                ,@level2type=N'COLUMN',@level2name=N'SHITSU_NAME'
GO
/*** �������ۖ��� SHITSU_INFORMAL_NAME ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'�������ۖ���'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_KAKARI_INFORMATION'
                                ,@level2type=N'COLUMN',@level2name=N'SHITSU_INFORMAL_NAME'
GO
/*** �����W�f���� KAKARI_NAME ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'�����W�f����'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_KAKARI_INFORMATION'
                                ,@level2type=N'COLUMN',@level2name=N'KAKARI_NAME'
GO
/*** �����W�f���� KAKARI_INFORMAL_NAME ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'�����W�f����'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_KAKARI_INFORMATION'
                                ,@level2type=N'COLUMN',@level2name=N'KAKARI_INFORMAL_NAME'
GO
/*** �W�f���P�[�V�����R�[�h KAKARI_LOCATION_CODE ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'�W�f���P�[�V�����R�[�h'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_KAKARI_INFORMATION'
                                ,@level2type=N'COLUMN',@level2name=N'KAKARI_LOCATION_CODE'
GO
/*** �W�f�m�n KAKARI_NUMBER ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'�W�f�m�n'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_KAKARI_INFORMATION'
                                ,@level2type=N'COLUMN',@level2name=N'KAKARI_NUMBER'
GO
/*** �W�f�敪�R�[�h KAKARI_DIVISION_CODE ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'�W�f�敪�R�[�h'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_KAKARI_INFORMATION'
                                ,@level2type=N'COLUMN',@level2name=N'KAKARI_DIVISION_CODE'
GO
/*** �ŐV��������t���O NEW_BELONGING_LIMIT_FLAG ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'�ŐV��������t���O'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_KAKARI_INFORMATION'
                                ,@level2type=N'COLUMN',@level2name=N'NEW_BELONGING_LIMIT_FLAG'
GO

/*** PK__WK_STAFF_DIVISION ��L�[�폜 ***/
if object_id('dbo.PK__WK_STAFF_DIVISION') is not null
ALTER TABLE WK_STAFF_DIVISION DROP CONSTRAINT PK__WK_STAFF_DIVISION;
GO

/*** WK_STAFF_DIVISION �e�[�u���폜 ***/
if object_id('[dbo].[WK_STAFF_DIVISION]') is not null
DROP TABLE [dbo].[WK_STAFF_DIVISION]
GO
/*** WK_STAFF_DIVISION �e�[�u���쐬 ***/
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

/*** �_���e�[�u�����o�^ *********/
/*** �]�ƈ��敪�}�X�^��� WK_STAFF_DIVISION ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'�]�ƈ��敪�}�X�^���'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE',@level1name=N'WK_STAFF_DIVISION'
GO
/*** �_���J�������o�^ ***/
/*** �]�ƈ��敪�R�[�h STAFF_DIVISION_CODE ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'�]�ƈ��敪�R�[�h'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_STAFF_DIVISION'
                                ,@level2type=N'COLUMN',@level2name=N'STAFF_DIVISION_CODE'
GO
/*** �]�ƈ��敪���� STAFF_DIVISION_NAME ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'�]�ƈ��敪����'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_STAFF_DIVISION'
                                ,@level2type=N'COLUMN',@level2name=N'STAFF_DIVISION_NAME'
GO

/*** PK__WK_ABOUT_WORK ��L�[�폜 ***/
if object_id('dbo.PK__WK_ABOUT_WORK') is not null
ALTER TABLE WK_ABOUT_WORK DROP CONSTRAINT PK__WK_ABOUT_WORK;
GO

/*** WK_ABOUT_WORK �e�[�u���폜 ***/
if object_id('[dbo].[WK_ABOUT_WORK]') is not null
DROP TABLE [dbo].[WK_ABOUT_WORK]
GO
/*** WK_ABOUT_WORK �e�[�u���쐬 ***/
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

/*** �_���e�[�u�����o�^ *********/
/*** �E�ʃ}�X�^��� WK_ABOUT_WORK ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'�E�ʃ}�X�^���'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE',@level1name=N'WK_ABOUT_WORK'
GO
/*** �_���J�������o�^ ***/
/*** �E�ʃR�[�h ABOUT_WORK_CODE ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'�E�ʃR�[�h'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_ABOUT_WORK'
                                ,@level2type=N'COLUMN',@level2name=N'ABOUT_WORK_CODE'
GO
/*** �E�ʖ��� ABOUT_WORK_NAME ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'�E�ʖ���'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_ABOUT_WORK'
                                ,@level2type=N'COLUMN',@level2name=N'ABOUT_WORK_NAME'
GO
/*** �����E�ʖ��� INFORMAL_ABOUT_WORK_NAME ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'�����E�ʖ���'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_ABOUT_WORK'
                                ,@level2type=N'COLUMN',@level2name=N'INFORMAL_ABOUT_WORK_NAME'
GO
/*** �}�l�X�^�敪�R�[�h MANESUTA_DIVISION_CODE ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'�}�l�X�^�敪�R�[�h'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_ABOUT_WORK'
                                ,@level2type=N'COLUMN',@level2name=N'MANESUTA_DIVISION_CODE'
GO
/*** �p�ꖼ�� ENGLISH_NAME ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'�p�ꖼ��'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_ABOUT_WORK'
                                ,@level2type=N'COLUMN',@level2name=N'ENGLISH_NAME'
GO

/*** PK__WK_JOB_CATEGORY ��L�[�폜 ***/
if object_id('dbo.PK__WK_JOB_CATEGORY') is not null
ALTER TABLE WK_JOB_CATEGORY DROP CONSTRAINT PK__WK_JOB_CATEGORY;
GO

/*** WK_JOB_CATEGORY �e�[�u���폜 ***/
if object_id('[dbo].[WK_JOB_CATEGORY]') is not null
DROP TABLE [dbo].[WK_JOB_CATEGORY]
GO

/*** WK_JOB_CATEGORY �e�[�u���쐬 ***/
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

/*** �_���e�[�u�����o�^ *********/
/*** �E��}�X�^��� WK_JOB_CATEGORY ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'�E��}�X�^���'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE',@level1name=N'WK_JOB_CATEGORY'
GO
/*** �_���J�������o�^ ***/
/*** �E��R�[�h JOB_CATEGORY_CODE ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'�E��R�[�h'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_JOB_CATEGORY'
                                ,@level2type=N'COLUMN',@level2name=N'JOB_CATEGORY_CODE'
GO
/*** �E�햼�� JOB_CATEGORY_NAME ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'�E�햼��'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_JOB_CATEGORY'
                                ,@level2type=N'COLUMN',@level2name=N'JOB_CATEGORY_NAME'
GO

/*** PK__WK_QUALIFICATION ��L�[�폜 ***/
if object_id('dbo.PK__WK_QUALIFICATION') is not null
ALTER TABLE WK_QUALIFICATION DROP CONSTRAINT PK__WK_QUALIFICATION;
GO

/*** WK_QUALIFICATION �e�[�u���폜 ***/
if object_id('[dbo].[WK_QUALIFICATION]') is not null
DROP TABLE [dbo].[WK_QUALIFICATION]
GO

/*** WK_QUALIFICATION �e�[�u���쐬 ***/
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

/*** �_���e�[�u�����o�^ *********/
/*** ���i�}�X�^��� WK_QUALIFICATION ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'���i�}�X�^���'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE',@level1name=N'WK_QUALIFICATION'
GO
/*** �_���J�������o�^ ***/
/*** ���i�R�[�h QUALIFICATION_CODE ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'���i�R�[�h'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_QUALIFICATION'
                                ,@level2type=N'COLUMN',@level2name=N'QUALIFICATION_CODE'
GO
/*** ���i�̌n�敪�R�[�h QUALIFICATION_SYSTEM_CODE ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'���i�̌n�敪�R�[�h'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_QUALIFICATION'
                                ,@level2type=N'COLUMN',@level2name=N'QUALIFICATION_SYSTEM_CODE'
GO
/*** ���i���� QUALIFICATION_NAME ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'���i����'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_QUALIFICATION'
                                ,@level2type=N'COLUMN',@level2name=N'QUALIFICATION_NAME'
GO
/*** �������i���� INFORMAL_QUALIFICATION_NAME ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'�������i����'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_QUALIFICATION'
                                ,@level2type=N'COLUMN',@level2name=N'INFORMAL_QUALIFICATION_NAME'
GO
/*** ���i�m�n QUALIFICATION_NUMBER ***/
EXEC sys.sp_addextendedproperty  @name=N'MS_Description',@value=N'���i�m�n'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE' ,@level1name=N'WK_QUALIFICATION'
                                ,@level2type=N'COLUMN',@level2name=N'QUALIFICATION_NUMBER'
GO
