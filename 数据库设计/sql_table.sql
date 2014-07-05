/*==============================================================*/
/* DBMS name:      ORACLE Version 11g                           */
/* Created on:     2014-7-1 16:56:28                            */
/*==============================================================*/
create tablespace OA datafile 'D:\\DATA.DBF' size 500m autoextend on next 100m;


create  user  oa  identified   by   oa  default tablespace  oa ;

grant dba to oa;

connect oa/oa;

create sequence cardid start with 20;
create sequence cid start with 20;
create sequence did start with 20;
create sequence fileid start with 20;
create sequence fid start with 20;
create sequence mid start with 20;
create sequence messid start with 20;
create sequence mrid start with 20;
create sequence postid start with 20;
create sequence roleid start with 20;
create sequence hid start with 20;
create sequence umeetid start with 20;
create sequence userid start with 20;
create sequence uscheid start with 20;
create sequence umessid start with 20;
create sequence uroleid start with 20;
create sequence uroomid start with 20;

alter table CARD
   drop constraint FK_CARD_CARD_FLOD_CARDFLOD;

alter table CARDFLODER
   drop constraint FK_CARDFLOD_USERS_CAR_USERS;

alter table FILES
   drop constraint FK_FILES_FILE_FLOD_FLODER;

alter table FLODER
   drop constraint FK_FLODER_USERS_FLO_USERS;

alter table MEETING
   drop constraint FK_MEETING_METTING_R_MROOM;

alter table USERS
   drop constraint FK_USERS_USERS_DEP_DEPARTME;

alter table USERS
   drop constraint FK_USERS_USERS_POS_POSTION;

alter table USERS_MESSAGE
   drop constraint FK_USERS_ME_REFERENCE_USERS;

alter table USERS_MESSAGE
   drop constraint FK_USERS_ME_USERS_MES_MESSAGE;

alter table USERS_MESSAGE
   drop constraint FK_USERS_ME_USERS_MES_USERS;

alter table USERS_ROLE
   drop constraint FK_USERS_RO_USERS_ROL_USERS;

alter table USERS_ROLE
   drop constraint FK_USERS_RO_USERS_ROL_ROLE;

alter table USERS_ROOM
   drop constraint FK_USERS_RO_USERS_ROO_MROOM;

alter table USERS_ROOM
   drop constraint FK_USERS_RO_USERS_ROO_USERS;

alter table USER_MEETING
   drop constraint FK_USER_MEE_USER_METT_USERS;

alter table USER_MEETING
   drop constraint FK_USER_MEE_USER_METT_MEETING;

alter table USER_SCHEDULE
   drop constraint FK_USER_SCH_REFERENCE_USERS;

alter table USER_SCHEDULE
   drop constraint FK_USER_SCH_USER_SCHE_USERS;

alter table USER_SCHEDULE
   drop constraint FK_USER_SCH_USER_SCHE_SCHEDULE;

drop index CARD_FLODER_FK;

drop table CARD cascade constraints;

drop index USERS_CARDFOLDER_FK;

drop table CARDFLODER cascade constraints;

drop table DEPARTMENT cascade constraints;

drop index FILE_FLODER_FK;

drop table FILES cascade constraints;

drop index USERS_FLODER_FK;

drop table FLODER cascade constraints;

drop index METTING_ROOM_FK;

drop table MEETING cascade constraints;

drop table MESSAGE cascade constraints;

drop table MROOM cascade constraints;

drop table POSTION cascade constraints;

drop table ROLE cascade constraints;

drop table SCHEDULE cascade constraints;

drop index USERS_DEPARTMENT_FK;

drop index USERS_POSTION_FK;

drop table USERS cascade constraints;

drop index USERS_MESSAGE2_FK;

drop index USERS_MESSAGE_FK;

drop table USERS_MESSAGE cascade constraints;

drop index USERS_ROLE2_FK;

drop index USERS_ROLE_FK;

drop table USERS_ROLE cascade constraints;

drop index USERS_ROOM2_FK;

drop index USERS_ROOM_FK;

drop table USERS_ROOM cascade constraints;

drop index USER_METTING2_FK;

drop index USER_METTING_FK;

drop table USER_MEETING cascade constraints;

drop index USER_SCHEDULE2_FK;

drop index USER_SCHEDULE_FK;

drop table USER_SCHEDULE cascade constraints;

/*==============================================================*/
/* Table: CARD                                                  */
/*==============================================================*/
create table CARD 
(
   CARDID               INTEGER              not null,
   CID                  INTEGER              not null,
   CNAME                VARCHAR2(40)         not null,
   DEPT                 VARCHAR2(40),
   POSITION             VARCHAR2(20),
   TEL                  VARCHAR2(16),
   PHONE                VARCHAR2(20),
   EMAIL                VARCHAR2(40),
   constraint PK_CARD primary key (CARDID)
);

/*==============================================================*/
/* Index: CARD_FLODER_FK                                        */
/*==============================================================*/
create index CARD_FLODER_FK on CARD (
   CID ASC
);

/*==============================================================*/
/* Table: CARDFLODER                                            */
/*==============================================================*/
create table CARDFLODER 
(
   CID                  INTEGER              not null,
   USERID               INTEGER,
   CNAME                VARCHAR2(40)         not null,
   constraint PK_CARDFLODER primary key (CID)
);

/*==============================================================*/
/* Index: USERS_CARDFOLDER_FK                                   */
/*==============================================================*/
create index USERS_CARDFOLDER_FK on CARDFLODER (
   USERID ASC
);

/*==============================================================*/
/* Table: DEPARTMENT                                            */
/*==============================================================*/
create table DEPARTMENT 
(
   DID                  INTEGER              not null,
   DNAME                VARCHAR2(40)         not null,
   PHONE                VARCHAR2(20)         not null,
   FUNCTION             VARCHAR2(1024)       not null,
   constraint PK_DEPARTMENT primary key (DID)
);

/*==============================================================*/
/* Table: FILES                                                 */
/*==============================================================*/
create table FILES 
(
   FILEID               INTEGER              not null,
   FID                  INTEGER,
   FNAME                VARCHAR2(40)         not null,
   FCONTENT             VARCHAR2(1024),
   TYPE                 VARCHAR2(20)         not null,
   FSIZE                FLOAT                not null,
   constraint PK_FILES primary key (FILEID)
);

/*==============================================================*/
/* Index: FILE_FLODER_FK                                        */
/*==============================================================*/
create index FILE_FLODER_FK on FILES (
   FID ASC
);

/*==============================================================*/
/* Table: FLODER                                                */
/*==============================================================*/
create table FLODER 
(
   FID                  INTEGER              not null,
   USERID               INTEGER,
   FNAME                VARCHAR2(40)         not null,
   FATHERFID            INTEGER,
   constraint PK_FLODER primary key (FID)
);

/*==============================================================*/
/* Index: USERS_FLODER_FK                                       */
/*==============================================================*/
create index USERS_FLODER_FK on FLODER (
   USERID ASC
);

/*==============================================================*/
/* Table: MEETING                                               */
/*==============================================================*/
create table MEETING 
(
   MID                  INTEGER              not null,
   MRID                 INTEGER,
   STARTTIME            DATE,
   ENDTIME              DATE,
   constraint PK_MEETING primary key (MID)
);

/*==============================================================*/
/* Index: METTING_ROOM_FK                                       */
/*==============================================================*/
create index METTING_ROOM_FK on MEETING (
   MRID ASC
);

/*==============================================================*/
/* Table: MESSAGE                                               */
/*==============================================================*/
create table MESSAGE 
(
   MESSID               INTEGER              not null,
   TITLE                VARCHAR2(40)         not null,
   CONTENT              VARCHAR2(1024),
   TIME                 DATE                 not null,
   constraint PK_MESSAGE primary key (MESSID)
);

/*==============================================================*/
/* Table: MROOM                                                 */
/*==============================================================*/
create table MROOM 
(
   MRID                 INTEGER              not null,
   MNAME                VARCHAR2(40)         not null,
   MRADDRESS            VARCHAR2(30)         not null,
   MRPEOPLE             INTEGER              not null,
   MRACONDITION         SMALLINT             not null,
   MRPROJECTOR          SMALLINT             not null,
   constraint PK_MROOM primary key (MRID)
);

/*==============================================================*/
/* Table: POSTION                                               */
/*==============================================================*/
create table POSTION 
(
   POSTID               INTEGER              not null,
   POSTNAME             VARCHAR2(40)         not null,
   constraint PK_POSTION primary key (POSTID)
);

/*==============================================================*/
/* Table: ROLE                                                  */
/*==============================================================*/
create table ROLE 
(
   ROLEID               INTEGER              not null,
   RNAME                VARCHAR2(10)         not null,
   constraint PK_ROLE primary key (ROLEID)
);

/*==============================================================*/
/* Table: SCHEDULE                                              */
/*==============================================================*/
create table SCHEDULE 
(
   HID                  INTEGER              not null,
   SNAME                VARCHAR(40)          not null,
   STARTTIME            DATE                 not null,
   ENDTIME              DATE                 not null,
   CONTENT              VARCHAR2(1024),
   constraint PK_SCHEDULE primary key (HID)
);

/*==============================================================*/
/* Table: USERS                                                 */
/*==============================================================*/
create table USERS 
(
   USERID               INTEGER              not null,
   POSTID               INTEGER              not null,
   DID                  INTEGER              not null,
   UNAME                VARCHAR2(20)         not null,
   UPASS                VARCHAR2(20)         not null,
   NAME                 VARCHAR2(20)         not null,
   SEX                  VARCHAR2(4)          not null,
   AGE                  NUMBER(2),
   EMAIL                VARCHAR2(40),
   TEL                  VARCHAR2(30),
   PHONE                VARCHAR2(20),
   ADDRESS              VARCHAR2(200),
   INTEREST             VARCHAR2(100),
   INTRODUCE            VARCHAR2(1024),
   constraint PK_USERS primary key (USERID)
);

/*==============================================================*/
/* Index: USERS_POSTION_FK                                      */
/*==============================================================*/
create index USERS_POSTION_FK on USERS (
   POSTID ASC
);

/*==============================================================*/
/* Index: USERS_DEPARTMENT_FK                                   */
/*==============================================================*/
create index USERS_DEPARTMENT_FK on USERS (
   DID ASC
);

/*==============================================================*/
/* Table: USERS_MESSAGE                                         */
/*==============================================================*/
create table USERS_MESSAGE 
(
   UMESSID              INTEGER              not null,
   MESSID               INTEGER              not null,
   SENDID               INTEGER              not null,
   RECEIVEID            INTEGER,
   ISSEND               VARCHAR2(2),
   ISRECEIVE            VARCHAR2(2),
   constraint PK_USERS_MESSAGE primary key (UMESSID)
);

/*==============================================================*/
/* Index: USERS_MESSAGE_FK                                      */
/*==============================================================*/
create index USERS_MESSAGE_FK on USERS_MESSAGE (
   MESSID ASC
);

/*==============================================================*/
/* Index: USERS_MESSAGE2_FK                                     */
/*==============================================================*/
create index USERS_MESSAGE2_FK on USERS_MESSAGE (
   SENDID ASC
);

/*==============================================================*/
/* Table: USERS_ROLE                                            */
/*==============================================================*/
create table USERS_ROLE 
(
   UROLEID              INTEGER              not null,
   USERID               INTEGER              not null,
   ROLEID               INTEGER              not null,
   constraint PK_USERS_ROLE primary key (UROLEID)
);

/*==============================================================*/
/* Index: USERS_ROLE_FK                                         */
/*==============================================================*/
create index USERS_ROLE_FK on USERS_ROLE (
   USERID ASC
);

/*==============================================================*/
/* Index: USERS_ROLE2_FK                                        */
/*==============================================================*/
create index USERS_ROLE2_FK on USERS_ROLE (
   ROLEID ASC
);

/*==============================================================*/
/* Table: USERS_ROOM                                            */
/*==============================================================*/
create table USERS_ROOM 
(
   UROOMID              INTEGER              not null,
   MRID                 INTEGER              not null,
   USERID               INTEGER              not null,
   STARTTIME            DATE,
   ENDTIME              DATE,
   constraint PK_USERS_ROOM primary key (UROOMID)
);

/*==============================================================*/
/* Index: USERS_ROOM_FK                                         */
/*==============================================================*/
create index USERS_ROOM_FK on USERS_ROOM (
   MRID ASC
);

/*==============================================================*/
/* Index: USERS_ROOM2_FK                                        */
/*==============================================================*/
create index USERS_ROOM2_FK on USERS_ROOM (
   USERID ASC
);

/*==============================================================*/
/* Table: USER_MEETING                                          */
/*==============================================================*/
create table USER_MEETING 
(
   USERID               NUMBER               not null,
   MID                  NUMBER               not null,
   UMEETID              NUMBER               not null,
   constraint PK_USER_MEETING primary key (UMEETID)
);

/*==============================================================*/
/* Index: USER_METTING_FK                                       */
/*==============================================================*/
create index USER_METTING_FK on USER_MEETING (
   USERID ASC
);

/*==============================================================*/
/* Index: USER_METTING2_FK                                      */
/*==============================================================*/
create index USER_METTING2_FK on USER_MEETING (
   MID ASC
);

/*==============================================================*/
/* Table: USER_SCHEDULE                                         */
/*==============================================================*/
create table USER_SCHEDULE 
(
   USCHEID              INTEGER              not null,
   HID                  INTEGER              not null,
   PLANID               INTEGER              not null,
   ACTORID              INTEGER              not null,
   constraint PK_USER_SCHEDULE primary key (USCHEID)
);

/*==============================================================*/
/* Index: USER_SCHEDULE_FK                                      */
/*==============================================================*/
create index USER_SCHEDULE_FK on USER_SCHEDULE (
   PLANID ASC
);

/*==============================================================*/
/* Index: USER_SCHEDULE2_FK                                     */
/*==============================================================*/
create index USER_SCHEDULE2_FK on USER_SCHEDULE (
   HID ASC
);

alter table CARD
   add constraint FK_CARD_CARD_FLOD_CARDFLOD foreign key (CID)
      references CARDFLODER (CID);

alter table CARDFLODER
   add constraint FK_CARDFLOD_USERS_CAR_USERS foreign key (USERID)
      references USERS (USERID);

alter table FILES
   add constraint FK_FILES_FILE_FLOD_FLODER foreign key (FID)
      references FLODER (FID);

alter table FLODER
   add constraint FK_FLODER_USERS_FLO_USERS foreign key (USERID)
      references USERS (USERID);

alter table MEETING
   add constraint FK_MEETING_METTING_R_MROOM foreign key (MRID)
      references MROOM (MRID);

alter table USERS
   add constraint FK_USERS_USERS_DEP_DEPARTME foreign key (DID)
      references DEPARTMENT (DID);

alter table USERS
   add constraint FK_USERS_USERS_POS_POSTION foreign key (POSTID)
      references POSTION (POSTID);

alter table USERS_MESSAGE
   add constraint FK_USERS_ME_REFERENCE_USERS foreign key (RECEIVEID)
      references USERS (USERID);

alter table USERS_MESSAGE
   add constraint FK_USERS_ME_USERS_MES_MESSAGE foreign key (MESSID)
      references MESSAGE (MESSID);

alter table USERS_MESSAGE
   add constraint FK_USERS_ME_USERS_MES_USERS foreign key (SENDID)
      references USERS (USERID);

alter table USERS_ROLE
   add constraint FK_USERS_RO_USERS_ROL_USERS foreign key (USERID)
      references USERS (USERID);

alter table USERS_ROLE
   add constraint FK_USERS_RO_USERS_ROL_ROLE foreign key (ROLEID)
      references ROLE (ROLEID);

alter table USERS_ROOM
   add constraint FK_USERS_RO_USERS_ROO_MROOM foreign key (MRID)
      references MROOM (MRID);

alter table USERS_ROOM
   add constraint FK_USERS_RO_USERS_ROO_USERS foreign key (USERID)
      references USERS (USERID);

alter table USER_MEETING
   add constraint FK_USER_MEE_USER_METT_USERS foreign key (USERID)
      references USERS (USERID);

alter table USER_MEETING
   add constraint FK_USER_MEE_USER_METT_MEETING foreign key (MID)
      references MEETING (MID);

alter table USER_SCHEDULE
   add constraint FK_USER_SCH_REFERENCE_USERS foreign key (ACTORID)
      references USERS (USERID);

alter table USER_SCHEDULE
   add constraint FK_USER_SCH_USER_SCHE_USERS foreign key (PLANID)
      references USERS (USERID);

alter table USER_SCHEDULE
   add constraint FK_USER_SCH_USER_SCHE_SCHEDULE foreign key (HID)
      references SCHEDULE (HID);

