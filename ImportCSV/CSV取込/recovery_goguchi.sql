/*
 ���[�UDB�i�����n��V�X�e���p�j�����e�[�u������T-SQL
 �쐬��:K.Tanaka
 �ύX���t   Rev   �ύX������e----------------------------->
 2017/06/30(1.0.0)�V�K�쐬
*/

USE [JINJI]
GO

-- �����e�[�u���폜
if object_id('dbo.PERSON_OF_COMPANY') is not null
DROP TABLE PERSON_OF_COMPANY;
if object_id('dbo.PERSON_OF_OTHER_COMPANY') is not null
DROP TABLE PERSON_OF_OTHER_COMPANY;
if object_id('dbo.BU_INFORMATION') is not null
DROP TABLE BU_INFORMATION;
if object_id('dbo.SHITSU_INFORMATION') is not null
DROP TABLE SHITSU_INFORMATION;
if object_id('dbo.KAKARI_INFORMATION') is not null
DROP TABLE KAKARI_INFORMATION;
if object_id('dbo.STAFF_DIVISION') is not null
DROP TABLE STAFF_DIVISION;
if object_id('dbo.ABOUT_WORK') is not null
DROP TABLE ABOUT_WORK;
if object_id('dbo.JOB_CATEGORY') is not null
DROP TABLE JOB_CATEGORY;
if object_id('dbo.QUALIFICATION') is not null
DROP TABLE QUALIFICATION;

-- �\���e�[�u�����l�[��
EXEC sp_rename 'dbo.BK_PERSON_OF_COMPANY', 'PERSON_OF_COMPANY';
EXEC sp_rename 'dbo.BK_PERSON_OF_OTHER_COMPANY', 'PERSON_OF_OTHER_COMPANY';
EXEC sp_rename 'dbo.BK_BU_INFORMATION', 'BU_INFORMATION';
EXEC sp_rename 'dbo.BK_SHITSU_INFORMATION', 'SHITSU_INFORMATION';
EXEC sp_rename 'dbo.BK_KAKARI_INFORMATION', 'KAKARI_INFORMATION';
EXEC sp_rename 'dbo.BK_STAFF_DIVISION', 'STAFF_DIVISION';
EXEC sp_rename 'dbo.BK_ABOUT_WORK', 'ABOUT_WORK';
EXEC sp_rename 'dbo.BK_JOB_CATEGORY', 'JOB_CATEGORY';
EXEC sp_rename 'dbo.BK_QUALIFICATION', 'QUALIFICATION';

