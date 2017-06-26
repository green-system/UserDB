/*
 ユーザDB（東京地区システム用）テーブルリネーム・削除T-SQL
 作成者:K.Tanaka
 変更日付   Rev   変更履歴内容----------------------------->
 2017/06/30(1.0.0)新規作成
*/

-- 予備テーブル削除
if object_id('dbo.BK_PERSON_OF_COMPANY') is not null
DROP TABLE BK_PERSON_OF_COMPANY;
if object_id('dbo.BK_PERSON_OF_OTHER_COMPANY') is not null
DROP TABLE BK_PERSON_OF_OTHER_COMPANY;
if object_id('dbo.BK_BU_INFORMATION') is not null
DROP TABLE BK_BU_INFORMATION;
if object_id('dbo.BK_SHITSU_INFORMATION') is not null
DROP TABLE BK_SHITSU_INFORMATION;
if object_id('dbo.BK_KAKARI_INFORMATION') is not null
DROP TABLE BK_KAKARI_INFORMATION;
if object_id('dbo.BK_STAFF_DIVISION') is not null
DROP TABLE BK_STAFF_DIVISION;
if object_id('dbo.BK_ABOUT_WORK') is not null
DROP TABLE BK_ABOUT_WORK;
if object_id('dbo.BK_JOB_CATEGORY') is not null
DROP TABLE BK_JOB_CATEGORY;
if object_id('dbo.BK_QUALIFICATION') is not null
DROP TABLE BK_QUALIFICATION;

-- 号口テーブルリネーム
if object_id('dbo.PERSON_OF_COMPANY') is not null
EXEC sp_rename 'dbo.PERSON_OF_COMPANY', 'BK_PERSON_OF_COMPANY';
if object_id('dbo.PERSON_OF_OTHER_COMPANY') is not null
EXEC sp_rename 'dbo.PERSON_OF_OTHER_COMPANY', 'BK_PERSON_OF_OTHER_COMPANY';
if object_id('dbo.BU_INFORMATION') is not null
EXEC sp_rename 'dbo.BU_INFORMATION', 'BK_BU_INFORMATION';
if object_id('dbo.SHITSU_INFORMATION') is not null
EXEC sp_rename 'dbo.SHITSU_INFORMATION', 'BK_SHITSU_INFORMATION';
if object_id('dbo.KAKARI_INFORMATION') is not null
EXEC sp_rename 'dbo.KAKARI_INFORMATION', 'BK_KAKARI_INFORMATION';
if object_id('dbo.STAFF_DIVISION') is not null
EXEC sp_rename 'dbo.STAFF_DIVISION', 'BK_STAFF_DIVISION';
if object_id('dbo.ABOUT_WORK') is not null
EXEC sp_rename 'dbo.ABOUT_WORK', 'BK_ABOUT_WORK';
if object_id('dbo.JOB_CATEGORY') is not null
EXEC sp_rename 'dbo.JOB_CATEGORY', 'BK_JOB_CATEGORY';
if object_id('dbo.QUALIFICATION') is not null
EXEC sp_rename 'dbo.QUALIFICATION', 'BK_QUALIFICATION';

-- ワークテーブルリネーム
EXEC sp_rename 'dbo.WK_PERSON_OF_COMPANY', 'PERSON_OF_COMPANY';
EXEC sp_rename 'dbo.WK_PERSON_OF_OTHER_COMPANY', 'PERSON_OF_OTHER_COMPANY';
EXEC sp_rename 'dbo.WK_BU_INFORMATION', 'BU_INFORMATION';
EXEC sp_rename 'dbo.WK_SHITSU_INFORMATION', 'SHITSU_INFORMATION';
EXEC sp_rename 'dbo.WK_KAKARI_INFORMATION', 'KAKARI_INFORMATION';
EXEC sp_rename 'dbo.WK_STAFF_DIVISION', 'STAFF_DIVISION';
EXEC sp_rename 'dbo.WK_ABOUT_WORK', 'ABOUT_WORK';
EXEC sp_rename 'dbo.WK_JOB_CATEGORY', 'JOB_CATEGORY';
EXEC sp_rename 'dbo.WK_QUALIFICATION', 'QUALIFICATION';
