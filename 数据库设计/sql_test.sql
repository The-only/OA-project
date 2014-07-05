prompt PL/SQL Developer import file
prompt Created on 2014年7月1日 by 康健
set feedback off
set define off
prompt Disabling triggers for DEPARTMENT...
alter table DEPARTMENT disable all triggers;
prompt Disabling triggers for POSTION...
alter table POSTION disable all triggers;
prompt Disabling triggers for USERS...
alter table USERS disable all triggers;
prompt Disabling triggers for CARDFLODER...
alter table CARDFLODER disable all triggers;
prompt Disabling triggers for CARD...
alter table CARD disable all triggers;
prompt Disabling triggers for FLODER...
alter table FLODER disable all triggers;
prompt Disabling triggers for FILES...
alter table FILES disable all triggers;
prompt Disabling triggers for MROOM...
alter table MROOM disable all triggers;
prompt Disabling triggers for MEETING...
alter table MEETING disable all triggers;
prompt Disabling triggers for MESSAGE...
alter table MESSAGE disable all triggers;
prompt Disabling triggers for ROLE...
alter table ROLE disable all triggers;
prompt Disabling triggers for SCHEDULE...
alter table SCHEDULE disable all triggers;
prompt Disabling triggers for USERS_MESSAGE...
alter table USERS_MESSAGE disable all triggers;
prompt Disabling triggers for USERS_ROLE...
alter table USERS_ROLE disable all triggers;
prompt Disabling triggers for USERS_ROOM...
alter table USERS_ROOM disable all triggers;
prompt Disabling triggers for USER_MEETING...
alter table USER_MEETING disable all triggers;
prompt Disabling triggers for USER_SCHEDULE...
alter table USER_SCHEDULE disable all triggers;
prompt Disabling foreign key constraints for USERS...
alter table USERS disable constraint FK4D495E8812CF49;
alter table USERS disable constraint FK4D495E8A8EEA4AB;
prompt Disabling foreign key constraints for CARDFLODER...
alter table CARDFLODER disable constraint FK63A80E187F5EDB6;
prompt Disabling foreign key constraints for CARD...
alter table CARD disable constraint FK1F73101C42AA4E;
prompt Disabling foreign key constraints for FLODER...
alter table FLODER disable constraint FK7BC727087F5EDB6;
prompt Disabling foreign key constraints for FILES...
alter table FILES disable constraint FK3FCC257E5974281;
prompt Disabling foreign key constraints for MEETING...
alter table MEETING disable constraint FK62F1D61B398CF5D0;
prompt Disabling foreign key constraints for USERS_MESSAGE...
alter table USERS_MESSAGE disable constraint FK13BA60903CAD633;
alter table USERS_MESSAGE disable constraint FK13BA6090637C0ECE;
alter table USERS_MESSAGE disable constraint FK13BA6090F37F70A2;
prompt Disabling foreign key constraints for USERS_ROLE...
alter table USERS_ROLE disable constraint FKB3060C6D7F5EDB6;
alter table USERS_ROLE disable constraint FKB3060C6DA168C9FF;
prompt Disabling foreign key constraints for USERS_ROOM...
alter table USERS_ROOM disable constraint FKB3060CD2398CF5D0;
alter table USERS_ROOM disable constraint FKB3060CD27F5EDB6;
prompt Disabling foreign key constraints for USER_MEETING...
alter table USER_MEETING disable constraint FK195A65A732F6DC0B;
alter table USER_MEETING disable constraint FK195A65A77F5EDB6;
prompt Disabling foreign key constraints for USER_SCHEDULE...
alter table USER_SCHEDULE disable constraint FK1BB5E48B3576AB92;
alter table USER_SCHEDULE disable constraint FK1BB5E48BF48DC960;
alter table USER_SCHEDULE disable constraint FK1BB5E48BFF092D94;
prompt Loading DEPARTMENT...
insert into DEPARTMENT (DID, DNAME, PHONE, FUNCTION)
values (1001, '人事部', '1111111', '负责人事');
insert into DEPARTMENT (DID, DNAME, PHONE, FUNCTION)
values (1002, '企划部', '2222222', '负责企划');
insert into DEPARTMENT (DID, DNAME, PHONE, FUNCTION)
values (1003, '研发部', '3333333', '负责研发');
insert into DEPARTMENT (DID, DNAME, PHONE, FUNCTION)
values (1004, '财务部', '4444444', '负责财务');
insert into DEPARTMENT (DID, DNAME, PHONE, FUNCTION)
values (1005, '后勤部', '5555555', '负责后勤');
commit;
prompt 5 records loaded
prompt Loading POSTION...
insert into POSTION (POSTID, POSTNAME)
values (1001, '经理');
insert into POSTION (POSTID, POSTNAME)
values (1002, '主任');
insert into POSTION (POSTID, POSTNAME)
values (1003, '秘书');
insert into POSTION (POSTID, POSTNAME)
values (1004, '普通员工');
commit;
prompt 4 records loaded
prompt Loading USERS...
insert into USERS (USERID, DID, POSTID, UNAME, UPASS, NAME, SEX, AGE, EMAIL, TEL, PHONE, ADDRESS, INTEREST, INTRODUCE)
values (1001, 1001, 1001, 'dxh', '123', '邓小红', '女', 21, 'dxh@qq.com', '2011081203', '201108120333', '民族学院', '逗b', '你个逗b');
insert into USERS (USERID, DID, POSTID, UNAME, UPASS, NAME, SEX, AGE, EMAIL, TEL, PHONE, ADDRESS, INTEREST, INTRODUCE)
values (1002, 1002, 1002, 'jeakon', '123', '康健', '男', 21, 'jeakon@qq.com', '2011081205', '201108120555', '民族学院', '足球', '音乐');
insert into USERS (USERID, DID, POSTID, UNAME, UPASS, NAME, SEX, AGE, EMAIL, TEL, PHONE, ADDRESS, INTEREST, INTRODUCE)
values (1003, 1003, 1003, 'lw', '123', '林雯', '女', 21, 'lw@qq.com', '2011081207', '201108120777', '民族学院', '吃饭', '吃饭饭');
insert into USERS (USERID, DID, POSTID, UNAME, UPASS, NAME, SEX, AGE, EMAIL, TEL, PHONE, ADDRESS, INTEREST, INTRODUCE)
values (1004, 1004, 1004, 'lzc', '123', '林志抄', '男', 21, 'lzc@qq.com', '2011081208', '201108120888', '民族学院', '吃饭呵呵', '呵呵去洗澡');
insert into USERS (USERID, DID, POSTID, UNAME, UPASS, NAME, SEX, AGE, EMAIL, TEL, PHONE, ADDRESS, INTEREST, INTRODUCE)
values (1005, 1005, 1003, 'lxh', '123', '柳星海', '男', 21, 'lxh@qq.com', '2011081209', '201108120999', '民族学院', '吃饭', '吃饭饭');
insert into USERS (USERID, DID, POSTID, UNAME, UPASS, NAME, SEX, AGE, EMAIL, TEL, PHONE, ADDRESS, INTEREST, INTRODUCE)
values (1006, 1004, 1002, 'lxj', '123', '罗雪婧', '女', 21, 'lxj@qq.com', '2011081210', '201108121000', '民族学院', '好难过', '好忧伤');
insert into USERS (USERID, DID, POSTID, UNAME, UPASS, NAME, SEX, AGE, EMAIL, TEL, PHONE, ADDRESS, INTEREST, INTRODUCE)
values (1007, 1003, 1001, 'wk', '123', '吴凯', '男', 21, 'wk@qq.com', '2011081221', '201108122111', '民族学院', '吃饭', '吃饭饭');
insert into USERS (USERID, DID, POSTID, UNAME, UPASS, NAME, SEX, AGE, EMAIL, TEL, PHONE, ADDRESS, INTEREST, INTRODUCE)
values (1008, 1002, 1002, 'tom', '123', '托姆', '男', 21, 'tom@qq.com', '2011081255', '201108125555', '美国', 'hello', 'hello world');
insert into USERS (USERID, DID, POSTID, UNAME, UPASS, NAME, SEX, AGE, EMAIL, TEL, PHONE, ADDRESS, INTEREST, INTRODUCE)
values (1009, 1001, 1003, 'mac', '123', '迈克', '男', 21, 'mac@qq.com', '2011081288', '201108128888', '加拿大', 'hello', 'hello world');
insert into USERS (USERID, DID, POSTID, UNAME, UPASS, NAME, SEX, AGE, EMAIL, TEL, PHONE, ADDRESS, INTEREST, INTRODUCE)
values (1010, 1002, 1004, 'stefan', '123', '斯特凡', '男', 28, 'stefan@qq.com', '2011081266', '201108126666', '英国', 'hello', 'hello world');
commit;
prompt 10 records loaded
prompt Loading CARDFLODER...
insert into CARDFLODER (CID, USERID, CNAME)
values (1001, 1001, '小红的名片夹');
insert into CARDFLODER (CID, USERID, CNAME)
values (1002, 1002, '康健的名片夹1');
insert into CARDFLODER (CID, USERID, CNAME)
values (1003, 1003, '林雯的名片夹');
insert into CARDFLODER (CID, USERID, CNAME)
values (1004, 1004, '小抄的名片夹');
insert into CARDFLODER (CID, USERID, CNAME)
values (1005, 1005, '小海的名片夹');
insert into CARDFLODER (CID, USERID, CNAME)
values (1006, 1006, '雪景的名片夹');
insert into CARDFLODER (CID, USERID, CNAME)
values (1007, 1007, '吴凯的名片夹');
insert into CARDFLODER (CID, USERID, CNAME)
values (1008, 1008, '托姆的名片夹');
insert into CARDFLODER (CID, USERID, CNAME)
values (1009, 1009, '迈克的名片夹');
insert into CARDFLODER (CID, USERID, CNAME)
values (1010, 1010, '斯特凡名片夹');
insert into CARDFLODER (CID, USERID, CNAME)
values (1011, 1002, '康健的名片夹2');
insert into CARDFLODER (CID, USERID, CNAME)
values (1012, 1002, '康健的名片夹3');
insert into CARDFLODER (CID, USERID, CNAME)
values (1013, 1002, '康健的名片夹4');
insert into CARDFLODER (CID, USERID, CNAME)
values (1014, 1002, '康健的名片夹5');
insert into CARDFLODER (CID, USERID, CNAME)
values (1015, 1002, '康健的名片夹6');
insert into CARDFLODER (CID, USERID, CNAME)
values (1016, 1002, '康健的名片夹7');
insert into CARDFLODER (CID, USERID, CNAME)
values (1017, 1002, '康健的名片夹8');
insert into CARDFLODER (CID, USERID, CNAME)
values (1018, 1002, '康健的名片夹9');
insert into CARDFLODER (CID, USERID, CNAME)
values (1019, 1002, '康健的名片夹10');
insert into CARDFLODER (CID, USERID, CNAME)
values (1020, 1002, '康健的名片夹11');
commit;
prompt 20 records loaded
prompt Loading CARD...
insert into CARD (CARDID, CID, CNAME, DEPT, POSITION, TEL, PHONE, EMAIL)
values (1001, 1001, 'lily', '民族学院', '学生', '1111111', '11111111111', 'lily@qq.com');
insert into CARD (CARDID, CID, CNAME, DEPT, POSITION, TEL, PHONE, EMAIL)
values (1002, 1002, 'lucy', '民族学院', '学生', '2222222', '22222222222', 'lucy@qq.com');
insert into CARD (CARDID, CID, CNAME, DEPT, POSITION, TEL, PHONE, EMAIL)
values (1003, 1003, 'cindy', '民族学院', '学生', '3333333', '33333333333', 'cindy@qq.com');
insert into CARD (CARDID, CID, CNAME, DEPT, POSITION, TEL, PHONE, EMAIL)
values (1004, 1004, 'kimi', '民族学院', '学生', '4444444', '44444444444', 'kimi@qq.com');
insert into CARD (CARDID, CID, CNAME, DEPT, POSITION, TEL, PHONE, EMAIL)
values (1005, 1005, 'damon', '民族学院', '学生', '5555555', '55555555555', 'damon@qq.com');
insert into CARD (CARDID, CID, CNAME, DEPT, POSITION, TEL, PHONE, EMAIL)
values (1006, 1006, 'klaus', '民族学院', '学生', '6666666', '66666666666', 'klaus@qq.com');
insert into CARD (CARDID, CID, CNAME, DEPT, POSITION, TEL, PHONE, EMAIL)
values (1007, 1007, 'kole', '民族学院', '学生', '7777777', '77777777777', 'kole@qq.com');
insert into CARD (CARDID, CID, CNAME, DEPT, POSITION, TEL, PHONE, EMAIL)
values (1008, 1008, 'boone', '民族学院', '学生', '8888888', '88888888888', 'boone@qq.com');
insert into CARD (CARDID, CID, CNAME, DEPT, POSITION, TEL, PHONE, EMAIL)
values (1009, 1009, 'jer', '民族学院', '学生', '9999999', '99999999999', 'jer@qq.com');
insert into CARD (CARDID, CID, CNAME, DEPT, POSITION, TEL, PHONE, EMAIL)
values (1010, 1010, 'ibrathmovic', '民族学院', '学生', '1000000', '10000000000', 'ibrathmovic@qq.com');
insert into CARD (CARDID, CID, CNAME, DEPT, POSITION, TEL, PHONE, EMAIL)
values (1011, 1002, 'messi', '民族学院', '学生', '111', '111', '111@qq.com');
insert into CARD (CARDID, CID, CNAME, DEPT, POSITION, TEL, PHONE, EMAIL)
values (1012, 1002, 'iniesta', '民族学院', '学生', '111', '111', '111@qq.com');
insert into CARD (CARDID, CID, CNAME, DEPT, POSITION, TEL, PHONE, EMAIL)
values (1013, 1002, 'xavi', '民族学院', '学生', '111', '111', '111@qq.com');
insert into CARD (CARDID, CID, CNAME, DEPT, POSITION, TEL, PHONE, EMAIL)
values (1014, 1002, 'villa', '民族学院', '学生', '111', '111', '111@qq.com');
insert into CARD (CARDID, CID, CNAME, DEPT, POSITION, TEL, PHONE, EMAIL)
values (1015, 1002, 'sanches', '民族学院', '学生', '111', '111', '111@qq.com');
insert into CARD (CARDID, CID, CNAME, DEPT, POSITION, TEL, PHONE, EMAIL)
values (1016, 1002, 'pique', '民族学院', '学生', '111', '111', '111@qq.com');
insert into CARD (CARDID, CID, CNAME, DEPT, POSITION, TEL, PHONE, EMAIL)
values (1017, 1002, 'torres', '民族学院', '学生', '111', '111', '111@qq.com');
insert into CARD (CARDID, CID, CNAME, DEPT, POSITION, TEL, PHONE, EMAIL)
values (1018, 1002, 'alves', '民族学院', '学生', '111', '111', '111@qq.com');
insert into CARD (CARDID, CID, CNAME, DEPT, POSITION, TEL, PHONE, EMAIL)
values (1019, 1002, 'alba', '民族学院', '学生', '111', '111', '111@qq.com');
insert into CARD (CARDID, CID, CNAME, DEPT, POSITION, TEL, PHONE, EMAIL)
values (1020, 1002, 'puyol', '民族学院', '学生', '111', '111', '111@qq.com');
insert into CARD (CARDID, CID, CNAME, DEPT, POSITION, TEL, PHONE, EMAIL)
values (1021, 1002, 'klose', '民族学院', '学生', '111', '111', '111@qq.com');
insert into CARD (CARDID, CID, CNAME, DEPT, POSITION, TEL, PHONE, EMAIL)
values (62, 1004, '康健', '企划部', '主任', '2011081205', '201108120555', 'jeakon@qq.com');
commit;
prompt 22 records loaded
prompt Loading FLODER...
insert into FLODER (FID, USERID, FNAME, FATHERFID)
values (1011, 1004, '小抄文件夹2', null);
insert into FLODER (FID, USERID, FNAME, FATHERFID)
values (1012, 1004, '小抄文件夹3', 1011);
insert into FLODER (FID, USERID, FNAME, FATHERFID)
values (1013, 1004, '小抄文件夹4', 1012);
insert into FLODER (FID, USERID, FNAME, FATHERFID)
values (1014, 1004, '小抄文件夹5', 1013);
insert into FLODER (FID, USERID, FNAME, FATHERFID)
values (1015, 1004, '小抄文件夹6', 1014);
insert into FLODER (FID, USERID, FNAME, FATHERFID)
values (1016, 1004, '小抄文件夹7', 1015);
insert into FLODER (FID, USERID, FNAME, FATHERFID)
values (1017, 1004, '小抄文件夹8', null);
insert into FLODER (FID, USERID, FNAME, FATHERFID)
values (1018, 1004, '小抄文件夹9', 1017);
insert into FLODER (FID, USERID, FNAME, FATHERFID)
values (1019, 1004, '小抄文件夹10', 1018);
insert into FLODER (FID, USERID, FNAME, FATHERFID)
values (1020, 1004, '小抄文件夹11', 1019);
insert into FLODER (FID, USERID, FNAME, FATHERFID)
values (1001, 1001, '小红文件夹', null);
insert into FLODER (FID, USERID, FNAME, FATHERFID)
values (1002, 1002, '康健文件夹', null);
insert into FLODER (FID, USERID, FNAME, FATHERFID)
values (1003, 1003, '林雯文件夹', null);
insert into FLODER (FID, USERID, FNAME, FATHERFID)
values (1004, 1004, '小抄文件夹1', null);
insert into FLODER (FID, USERID, FNAME, FATHERFID)
values (1005, 1005, '小海文件夹', null);
insert into FLODER (FID, USERID, FNAME, FATHERFID)
values (1006, 1006, '雪景文件夹', null);
insert into FLODER (FID, USERID, FNAME, FATHERFID)
values (1007, 1007, '吴凯文件夹', null);
insert into FLODER (FID, USERID, FNAME, FATHERFID)
values (1008, 1008, '托姆文件夹', null);
insert into FLODER (FID, USERID, FNAME, FATHERFID)
values (1009, 1009, '迈克文件夹', null);
insert into FLODER (FID, USERID, FNAME, FATHERFID)
values (1010, 1004, '斯特凡文件夹', null);
commit;
prompt 20 records loaded
prompt Loading FILES...
insert into FILES (FILEID, FID, FNAME, FCONTENT, TYPE, FSIZE)
values (1001, 1001, 'dxh', 'dxh', 'txt', 16);
insert into FILES (FILEID, FID, FNAME, FCONTENT, TYPE, FSIZE)
values (1002, 1002, 'jeakon', 'lionel messi!!!', 'txt', 16);
insert into FILES (FILEID, FID, FNAME, FCONTENT, TYPE, FSIZE)
values (1003, 1003, 'lw', 'lw', 'txt', 16);
insert into FILES (FILEID, FID, FNAME, FCONTENT, TYPE, FSIZE)
values (1004, 1004, 'lzc', 'lzc', 'txt', 16);
insert into FILES (FILEID, FID, FNAME, FCONTENT, TYPE, FSIZE)
values (1005, 1005, 'lxh', 'lxh', 'txt', 16);
insert into FILES (FILEID, FID, FNAME, FCONTENT, TYPE, FSIZE)
values (1006, 1006, 'lxj', 'lxj', 'txt', 16);
insert into FILES (FILEID, FID, FNAME, FCONTENT, TYPE, FSIZE)
values (1007, 1007, 'wk', 'wk', 'txt', 16);
insert into FILES (FILEID, FID, FNAME, FCONTENT, TYPE, FSIZE)
values (1008, 1008, 'tom', 'tom', 'txt', 16);
insert into FILES (FILEID, FID, FNAME, FCONTENT, TYPE, FSIZE)
values (1009, 1009, 'mac', 'mac', 'txt', 16);
insert into FILES (FILEID, FID, FNAME, FCONTENT, TYPE, FSIZE)
values (1010, 1010, 'stefan', 'stefan', 'txt', 16);
commit;
prompt 10 records loaded
prompt Loading MROOM...
insert into MROOM (MRID, MNAME, MRADDRESS, MRPEOPLE, MRACONDITION, MRPROJECTOR)
values (1001, '会议室1', 'F210', 100, 1, 1);
insert into MROOM (MRID, MNAME, MRADDRESS, MRPEOPLE, MRACONDITION, MRPROJECTOR)
values (1002, '会议室2', 'F211', 150, 1, 1);
insert into MROOM (MRID, MNAME, MRADDRESS, MRPEOPLE, MRACONDITION, MRPROJECTOR)
values (1003, '会议室3', 'F212', 50, 0, 0);
insert into MROOM (MRID, MNAME, MRADDRESS, MRPEOPLE, MRACONDITION, MRPROJECTOR)
values (1004, '会议室4', 'F213', 160, 1, 0);
insert into MROOM (MRID, MNAME, MRADDRESS, MRPEOPLE, MRACONDITION, MRPROJECTOR)
values (1005, '会议室5', 'F214', 180, 0, 1);
insert into MROOM (MRID, MNAME, MRADDRESS, MRPEOPLE, MRACONDITION, MRPROJECTOR)
values (1006, '会议室6', 'F215', 200, 1, 1);
insert into MROOM (MRID, MNAME, MRADDRESS, MRPEOPLE, MRACONDITION, MRPROJECTOR)
values (1007, '会议室7', 'F216', 250, 1, 1);
insert into MROOM (MRID, MNAME, MRADDRESS, MRPEOPLE, MRACONDITION, MRPROJECTOR)
values (1008, '会议室8', 'F217', 25, 1, 1);
insert into MROOM (MRID, MNAME, MRADDRESS, MRPEOPLE, MRACONDITION, MRPROJECTOR)
values (1009, '会议室9', 'F218', 75, 0, 1);
insert into MROOM (MRID, MNAME, MRADDRESS, MRPEOPLE, MRACONDITION, MRPROJECTOR)
values (1010, '会议室10', 'F219', 175, 1, 1);
insert into MROOM (MRID, MNAME, MRADDRESS, MRPEOPLE, MRACONDITION, MRPROJECTOR)
values (1011, '会议室11', 'F220', 225, 1, 1);
insert into MROOM (MRID, MNAME, MRADDRESS, MRPEOPLE, MRACONDITION, MRPROJECTOR)
values (1012, '会议室12', 'F221', 250, 0, 0);
insert into MROOM (MRID, MNAME, MRADDRESS, MRPEOPLE, MRACONDITION, MRPROJECTOR)
values (1013, '会议室13', 'F222', 15, 1, 1);
insert into MROOM (MRID, MNAME, MRADDRESS, MRPEOPLE, MRACONDITION, MRPROJECTOR)
values (1014, '会议室14', 'F223', 30, 0, 1);
insert into MROOM (MRID, MNAME, MRADDRESS, MRPEOPLE, MRACONDITION, MRPROJECTOR)
values (1015, '会议室15', 'F224', 50, 1, 0);
insert into MROOM (MRID, MNAME, MRADDRESS, MRPEOPLE, MRACONDITION, MRPROJECTOR)
values (1016, '会议室16', 'F225', 80, 1, 1);
insert into MROOM (MRID, MNAME, MRADDRESS, MRPEOPLE, MRACONDITION, MRPROJECTOR)
values (1017, '会议室17', 'F226', 90, 1, 0);
insert into MROOM (MRID, MNAME, MRADDRESS, MRPEOPLE, MRACONDITION, MRPROJECTOR)
values (1018, '会议室18', 'F227', 100, 0, 1);
insert into MROOM (MRID, MNAME, MRADDRESS, MRPEOPLE, MRACONDITION, MRPROJECTOR)
values (1019, '会议室19', 'F228', 120, 1, 1);
insert into MROOM (MRID, MNAME, MRADDRESS, MRPEOPLE, MRACONDITION, MRPROJECTOR)
values (1020, '会议室', 'F229', 500, 1, 1);
commit;
prompt 20 records loaded
prompt Loading MEETING...
insert into MEETING (MID, MNAME, MRID, STARTTIME, ENDTIME)
values (1001, '会议1', 1015, to_date('26-06-2014 09:00:00', 'dd-mm-yyyy hh24:mi:ss'), to_date('26-06-2014 10:00:00', 'dd-mm-yyyy hh24:mi:ss'));
insert into MEETING (MID, MNAME, MRID, STARTTIME, ENDTIME)
values (1002, '会议2', 1006, to_date('25-06-2014 10:00:00', 'dd-mm-yyyy hh24:mi:ss'), to_date('25-06-2014 13:00:00', 'dd-mm-yyyy hh24:mi:ss'));
insert into MEETING (MID, MNAME, MRID, STARTTIME, ENDTIME)
values (1003, '会议3', 1003, to_date('27-06-2014 09:00:00', 'dd-mm-yyyy hh24:mi:ss'), to_date('27-06-2014 10:00:00', 'dd-mm-yyyy hh24:mi:ss'));
insert into MEETING (MID, MNAME, MRID, STARTTIME, ENDTIME)
values (1004, '会议4', 1004, to_date('28-06-2014 10:00:00', 'dd-mm-yyyy hh24:mi:ss'), to_date('28-06-2014 11:00:00', 'dd-mm-yyyy hh24:mi:ss'));
insert into MEETING (MID, MNAME, MRID, STARTTIME, ENDTIME)
values (1005, '会议5', 1005, to_date('29-06-2014 09:00:00', 'dd-mm-yyyy hh24:mi:ss'), to_date('29-06-2014 11:00:00', 'dd-mm-yyyy hh24:mi:ss'));
insert into MEETING (MID, MNAME, MRID, STARTTIME, ENDTIME)
values (1006, '会议6', 1018, to_date('27-06-2014 18:00:00', 'dd-mm-yyyy hh24:mi:ss'), to_date('27-06-2014 20:00:00', 'dd-mm-yyyy hh24:mi:ss'));
insert into MEETING (MID, MNAME, MRID, STARTTIME, ENDTIME)
values (1007, '会议7', 1003, to_date('26-06-2014 10:00:00', 'dd-mm-yyyy hh24:mi:ss'), to_date('26-06-2014 11:00:00', 'dd-mm-yyyy hh24:mi:ss'));
insert into MEETING (MID, MNAME, MRID, STARTTIME, ENDTIME)
values (1008, '会议8', 1009, to_date('29-06-2014 05:00:00', 'dd-mm-yyyy hh24:mi:ss'), to_date('29-06-2014 07:00:00', 'dd-mm-yyyy hh24:mi:ss'));
insert into MEETING (MID, MNAME, MRID, STARTTIME, ENDTIME)
values (1009, '会议9', 1016, to_date('30-06-2014 15:00:00', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-06-2014 18:00:00', 'dd-mm-yyyy hh24:mi:ss'));
insert into MEETING (MID, MNAME, MRID, STARTTIME, ENDTIME)
values (1010, '会议10', 1020, to_date('30-06-2014 20:00:00', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-06-2014 21:00:00', 'dd-mm-yyyy hh24:mi:ss'));
insert into MEETING (MID, MNAME, MRID, STARTTIME, ENDTIME)
values (1011, '会议11', 1017, to_date('30-06-2014 20:00:01', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-06-2014 21:00:01', 'dd-mm-yyyy hh24:mi:ss'));
commit;
prompt 11 records loaded
prompt Loading MESSAGE...
insert into MESSAGE (MESSID, TITLE, CONTENT, TIME)
values (1001, '邮件1', 'dxh---jeakon', to_timestamp('26-06-2014 00:01:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into MESSAGE (MESSID, TITLE, CONTENT, TIME)
values (1002, '邮件2', 'lw---lzc', to_timestamp('26-06-2014 01:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into MESSAGE (MESSID, TITLE, CONTENT, TIME)
values (1003, '邮件3', 'lxh---lxj', to_timestamp('26-06-2014 00:04:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into MESSAGE (MESSID, TITLE, CONTENT, TIME)
values (1004, '邮件4', 'wk---tom', to_timestamp('26-06-2014 00:00:02.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into MESSAGE (MESSID, TITLE, CONTENT, TIME)
values (1005, '邮件5', 'mac---stefan', to_timestamp('28-06-2014 01:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into MESSAGE (MESSID, TITLE, CONTENT, TIME)
values (1006, '邮件6', 'jeakon', to_timestamp('28-06-2014 02:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into MESSAGE (MESSID, TITLE, CONTENT, TIME)
values (1007, '邮件7', 'messi', to_timestamp('28-06-2014 03:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into MESSAGE (MESSID, TITLE, CONTENT, TIME)
values (1008, '邮件8', 'arguero', to_timestamp('28-06-2014 04:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into MESSAGE (MESSID, TITLE, CONTENT, TIME)
values (1009, '邮件9', 'villa', to_timestamp('28-06-2014 05:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into MESSAGE (MESSID, TITLE, CONTENT, TIME)
values (1010, '邮件10', 'torres', to_timestamp('28-06-2014 06:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into MESSAGE (MESSID, TITLE, CONTENT, TIME)
values (1011, '邮件11', 'iniesta', to_timestamp('28-06-2014 07:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into MESSAGE (MESSID, TITLE, CONTENT, TIME)
values (1012, '邮件12', 'ibrathmovic', to_timestamp('28-06-2014 08:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into MESSAGE (MESSID, TITLE, CONTENT, TIME)
values (1013, '邮件13', 'ronaldo', to_timestamp('28-06-2014 09:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into MESSAGE (MESSID, TITLE, CONTENT, TIME)
values (1014, '邮件14', 'ronaldinho', to_timestamp('28-06-2014 10:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into MESSAGE (MESSID, TITLE, CONTENT, TIME)
values (1015, '邮件15', 'sanches', to_timestamp('28-06-2014 11:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into MESSAGE (MESSID, TITLE, CONTENT, TIME)
values (1016, '邮件16', 'pique', to_timestamp('28-06-2014 00:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into MESSAGE (MESSID, TITLE, CONTENT, TIME)
values (1017, '邮件17', 'puyol', to_timestamp('28-06-2014 00:10:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into MESSAGE (MESSID, TITLE, CONTENT, TIME)
values (1018, '邮件18', 'xavi', to_timestamp('28-06-2014 00:20:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into MESSAGE (MESSID, TITLE, CONTENT, TIME)
values (1019, '邮件19', 'alves', to_timestamp('28-06-2014 00:30:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into MESSAGE (MESSID, TITLE, CONTENT, TIME)
values (1020, '邮件20', 'alba', to_timestamp('28-06-2014 00:40:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into MESSAGE (MESSID, TITLE, CONTENT, TIME)
values (1021, '邮件21', 'ozil', to_timestamp('28-06-2014 00:40:01.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into MESSAGE (MESSID, TITLE, CONTENT, TIME)
values (1022, '邮件22', 'muller', to_timestamp('28-06-2014 00:40:02.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into MESSAGE (MESSID, TITLE, CONTENT, TIME)
values (1023, '邮件23', 'robben', to_timestamp('28-06-2014 00:40:03.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into MESSAGE (MESSID, TITLE, CONTENT, TIME)
values (1024, '邮件24', 'higuain', to_timestamp('28-06-2014 00:40:04.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into MESSAGE (MESSID, TITLE, CONTENT, TIME)
values (1025, '邮件25', 'riquelme', to_timestamp('28-06-2014 00:40:05.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into MESSAGE (MESSID, TITLE, CONTENT, TIME)
values (1026, '邮件26', 'crespo', to_timestamp('28-06-2014 00:40:06.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into MESSAGE (MESSID, TITLE, CONTENT, TIME)
values (1027, '邮件27', 'saviola', to_timestamp('28-06-2014 00:40:07.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into MESSAGE (MESSID, TITLE, CONTENT, TIME)
values (1028, '邮件28', 'sorin', to_timestamp('28-06-2014 00:40:08.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into MESSAGE (MESSID, TITLE, CONTENT, TIME)
values (1029, '邮件29', 'ayala', to_timestamp('28-06-2014 00:40:09.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into MESSAGE (MESSID, TITLE, CONTENT, TIME)
values (1030, '邮件30', 'ronney', to_timestamp('28-06-2014 00:40:10.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
commit;
prompt 30 records loaded
prompt Loading ROLE...
insert into ROLE (ROLEID, RNAME)
values (1001, '职员');
insert into ROLE (ROLEID, RNAME)
values (1002, '领导');
insert into ROLE (ROLEID, RNAME)
values (1003, '系统管理员');
commit;
prompt 3 records loaded
prompt Loading SCHEDULE...
insert into SCHEDULE (HID, SNAME, STARTTIME, ENDTIME, CONTENT)
values (1001, '集体聚餐', to_date('27-06-2014 11:00:00', 'dd-mm-yyyy hh24:mi:ss'), to_date('27-06-2014 13:00:00', 'dd-mm-yyyy hh24:mi:ss'), '不见不散');
insert into SCHEDULE (HID, SNAME, STARTTIME, ENDTIME, CONTENT)
values (1002, 'KTV', to_date('28-06-2014 18:00:00', 'dd-mm-yyyy hh24:mi:ss'), to_date('28-06-2014 22:00:00', 'dd-mm-yyyy hh24:mi:ss'), '不见不散');
commit;
prompt 2 records loaded
prompt Loading USERS_MESSAGE...
insert into USERS_MESSAGE (UMESSID, MESSID, RECEIVEID, SENDID, ISSEND, ISRECEIVE, ISDELETE)
values (1001, 1001, 1001, 1002, '1', '1', '0');
insert into USERS_MESSAGE (UMESSID, MESSID, RECEIVEID, SENDID, ISSEND, ISRECEIVE, ISDELETE)
values (1002, 1002, 1002, 1001, '1', '1', '0');
insert into USERS_MESSAGE (UMESSID, MESSID, RECEIVEID, SENDID, ISSEND, ISRECEIVE, ISDELETE)
values (1003, 1003, 1003, 1004, '1', '1', '0');
insert into USERS_MESSAGE (UMESSID, MESSID, RECEIVEID, SENDID, ISSEND, ISRECEIVE, ISDELETE)
values (1004, 1004, 1004, 1003, '1', '1', '0');
insert into USERS_MESSAGE (UMESSID, MESSID, RECEIVEID, SENDID, ISSEND, ISRECEIVE, ISDELETE)
values (1005, 1005, 1005, 1006, '1', '1', '0');
insert into USERS_MESSAGE (UMESSID, MESSID, RECEIVEID, SENDID, ISSEND, ISRECEIVE, ISDELETE)
values (1006, 1006, 1006, 1005, '1', '1', '0');
insert into USERS_MESSAGE (UMESSID, MESSID, RECEIVEID, SENDID, ISSEND, ISRECEIVE, ISDELETE)
values (1007, 1007, 1007, 1008, '1', '1', '0');
insert into USERS_MESSAGE (UMESSID, MESSID, RECEIVEID, SENDID, ISSEND, ISRECEIVE, ISDELETE)
values (1008, 1008, 1008, 1007, '1', '1', '0');
insert into USERS_MESSAGE (UMESSID, MESSID, RECEIVEID, SENDID, ISSEND, ISRECEIVE, ISDELETE)
values (1009, 1009, 1009, 1010, '1', '1', '0');
insert into USERS_MESSAGE (UMESSID, MESSID, RECEIVEID, SENDID, ISSEND, ISRECEIVE, ISDELETE)
values (1010, 1010, 1010, 1009, '1', '1', '0');
insert into USERS_MESSAGE (UMESSID, MESSID, RECEIVEID, SENDID, ISSEND, ISRECEIVE, ISDELETE)
values (1011, 1011, 1002, 1001, '0', '1', '0');
insert into USERS_MESSAGE (UMESSID, MESSID, RECEIVEID, SENDID, ISSEND, ISRECEIVE, ISDELETE)
values (1012, 1012, 1002, 1001, '0', '1', '0');
insert into USERS_MESSAGE (UMESSID, MESSID, RECEIVEID, SENDID, ISSEND, ISRECEIVE, ISDELETE)
values (1013, 1013, 1002, 1003, '0', '1', '0');
insert into USERS_MESSAGE (UMESSID, MESSID, RECEIVEID, SENDID, ISSEND, ISRECEIVE, ISDELETE)
values (1014, 1014, 1002, 1004, '0', '1', '0');
insert into USERS_MESSAGE (UMESSID, MESSID, RECEIVEID, SENDID, ISSEND, ISRECEIVE, ISDELETE)
values (1015, 1015, 1002, 1005, '0', '1', '0');
insert into USERS_MESSAGE (UMESSID, MESSID, RECEIVEID, SENDID, ISSEND, ISRECEIVE, ISDELETE)
values (1016, 1016, 1002, 1006, '1', '0', '0');
insert into USERS_MESSAGE (UMESSID, MESSID, RECEIVEID, SENDID, ISSEND, ISRECEIVE, ISDELETE)
values (1017, 1017, 1002, 1007, '1', '0', '0');
insert into USERS_MESSAGE (UMESSID, MESSID, RECEIVEID, SENDID, ISSEND, ISRECEIVE, ISDELETE)
values (1018, 1018, 1002, 1008, '1', '0', '0');
insert into USERS_MESSAGE (UMESSID, MESSID, RECEIVEID, SENDID, ISSEND, ISRECEIVE, ISDELETE)
values (1019, 1019, 1002, 1009, '1', '0', '0');
insert into USERS_MESSAGE (UMESSID, MESSID, RECEIVEID, SENDID, ISSEND, ISRECEIVE, ISDELETE)
values (1020, 1020, 1002, 1010, '1', '0', '0');
insert into USERS_MESSAGE (UMESSID, MESSID, RECEIVEID, SENDID, ISSEND, ISRECEIVE, ISDELETE)
values (1021, 1021, 1001, 1002, '1', '0', '0');
insert into USERS_MESSAGE (UMESSID, MESSID, RECEIVEID, SENDID, ISSEND, ISRECEIVE, ISDELETE)
values (1022, 1022, 1001, 1002, '1', '0', '0');
insert into USERS_MESSAGE (UMESSID, MESSID, RECEIVEID, SENDID, ISSEND, ISRECEIVE, ISDELETE)
values (1023, 1023, 1003, 1002, '1', '0', '0');
insert into USERS_MESSAGE (UMESSID, MESSID, RECEIVEID, SENDID, ISSEND, ISRECEIVE, ISDELETE)
values (1024, 1024, 1004, 1002, '1', '0', '0');
insert into USERS_MESSAGE (UMESSID, MESSID, RECEIVEID, SENDID, ISSEND, ISRECEIVE, ISDELETE)
values (1025, 1025, 1005, 1002, '1', '0', '0');
insert into USERS_MESSAGE (UMESSID, MESSID, RECEIVEID, SENDID, ISSEND, ISRECEIVE, ISDELETE)
values (1026, 1026, 1006, 1002, '0', '1', '0');
insert into USERS_MESSAGE (UMESSID, MESSID, RECEIVEID, SENDID, ISSEND, ISRECEIVE, ISDELETE)
values (1027, 1027, 1007, 1002, '0', '1', '0');
insert into USERS_MESSAGE (UMESSID, MESSID, RECEIVEID, SENDID, ISSEND, ISRECEIVE, ISDELETE)
values (1028, 1028, 1008, 1002, '0', '1', '0');
insert into USERS_MESSAGE (UMESSID, MESSID, RECEIVEID, SENDID, ISSEND, ISRECEIVE, ISDELETE)
values (1029, 1029, 1009, 1002, '0', '1', '0');
insert into USERS_MESSAGE (UMESSID, MESSID, RECEIVEID, SENDID, ISSEND, ISRECEIVE, ISDELETE)
values (1030, 1030, 1010, 1002, '0', '1', '0');
commit;
prompt 30 records loaded
prompt Loading USERS_ROLE...
insert into USERS_ROLE (UROLEID, USERID, ROLEID)
values (1001, 1001, 1001);
insert into USERS_ROLE (UROLEID, USERID, ROLEID)
values (1002, 1001, 1003);
insert into USERS_ROLE (UROLEID, USERID, ROLEID)
values (1003, 1002, 1001);
insert into USERS_ROLE (UROLEID, USERID, ROLEID)
values (1004, 1002, 1002);
insert into USERS_ROLE (UROLEID, USERID, ROLEID)
values (1005, 1002, 1003);
insert into USERS_ROLE (UROLEID, USERID, ROLEID)
values (1006, 1003, 1002);
insert into USERS_ROLE (UROLEID, USERID, ROLEID)
values (1007, 1003, 1003);
insert into USERS_ROLE (UROLEID, USERID, ROLEID)
values (1008, 1004, 1001);
insert into USERS_ROLE (UROLEID, USERID, ROLEID)
values (1009, 1004, 1003);
insert into USERS_ROLE (UROLEID, USERID, ROLEID)
values (1010, 1005, 1002);
insert into USERS_ROLE (UROLEID, USERID, ROLEID)
values (1011, 1005, 1001);
insert into USERS_ROLE (UROLEID, USERID, ROLEID)
values (1012, 1006, 1003);
insert into USERS_ROLE (UROLEID, USERID, ROLEID)
values (1013, 1006, 1001);
insert into USERS_ROLE (UROLEID, USERID, ROLEID)
values (1014, 1007, 1001);
insert into USERS_ROLE (UROLEID, USERID, ROLEID)
values (1015, 1007, 1003);
insert into USERS_ROLE (UROLEID, USERID, ROLEID)
values (1016, 1008, 1002);
insert into USERS_ROLE (UROLEID, USERID, ROLEID)
values (1017, 1008, 1001);
insert into USERS_ROLE (UROLEID, USERID, ROLEID)
values (1018, 1009, 1001);
insert into USERS_ROLE (UROLEID, USERID, ROLEID)
values (1019, 1009, 1003);
insert into USERS_ROLE (UROLEID, USERID, ROLEID)
values (1020, 1010, 1003);
insert into USERS_ROLE (UROLEID, USERID, ROLEID)
values (1021, 1010, 1002);
commit;
prompt 21 records loaded
prompt Loading USERS_ROOM...
insert into USERS_ROOM (UROOMID, USERID, MRID, STARTTIME, ENDTIME)
values (1001, 1001, 1015, to_date('28-06-2014 17:00:00', 'dd-mm-yyyy hh24:mi:ss'), to_date('28-06-2014 20:00:00', 'dd-mm-yyyy hh24:mi:ss'));
insert into USERS_ROOM (UROOMID, USERID, MRID, STARTTIME, ENDTIME)
values (1002, 1002, 1018, to_date('26-06-2014 01:00:00', 'dd-mm-yyyy hh24:mi:ss'), to_date('26-06-2014 02:00:00', 'dd-mm-yyyy hh24:mi:ss'));
insert into USERS_ROOM (UROOMID, USERID, MRID, STARTTIME, ENDTIME)
values (1003, 1003, 1020, to_date('18-06-2014 11:00:00', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-06-2014 00:59:00', 'dd-mm-yyyy hh24:mi:ss'));
insert into USERS_ROOM (UROOMID, USERID, MRID, STARTTIME, ENDTIME)
values (1004, 1004, 1001, to_date('25-06-2014 16:00:00', 'dd-mm-yyyy hh24:mi:ss'), to_date('25-06-2014 19:00:00', 'dd-mm-yyyy hh24:mi:ss'));
insert into USERS_ROOM (UROOMID, USERID, MRID, STARTTIME, ENDTIME)
values (1005, 1005, 1002, to_date('26-06-2014 04:00:00', 'dd-mm-yyyy hh24:mi:ss'), to_date('26-06-2014 06:00:00', 'dd-mm-yyyy hh24:mi:ss'));
insert into USERS_ROOM (UROOMID, USERID, MRID, STARTTIME, ENDTIME)
values (1006, 1006, 1006, to_date('30-06-2014 08:00:00', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-06-2014 10:00:00', 'dd-mm-yyyy hh24:mi:ss'));
insert into USERS_ROOM (UROOMID, USERID, MRID, STARTTIME, ENDTIME)
values (1007, 1007, 1017, to_date('29-06-2014 08:00:00', 'dd-mm-yyyy hh24:mi:ss'), to_date('29-06-2014 09:00:00', 'dd-mm-yyyy hh24:mi:ss'));
insert into USERS_ROOM (UROOMID, USERID, MRID, STARTTIME, ENDTIME)
values (1008, 1008, 1019, to_date('01-07-2014 08:00:00', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-07-2014 10:00:00', 'dd-mm-yyyy hh24:mi:ss'));
insert into USERS_ROOM (UROOMID, USERID, MRID, STARTTIME, ENDTIME)
values (1009, 1009, 1014, to_date('30-06-2014 00:04:00', 'dd-mm-yyyy hh24:mi:ss'), to_date('26-06-2014 00:34:00', 'dd-mm-yyyy hh24:mi:ss'));
insert into USERS_ROOM (UROOMID, USERID, MRID, STARTTIME, ENDTIME)
values (1010, 1010, 1012, to_date('27-06-2014 14:00:00', 'dd-mm-yyyy hh24:mi:ss'), to_date('27-06-2014 15:00:00', 'dd-mm-yyyy hh24:mi:ss'));
commit;
prompt 10 records loaded
prompt Loading USER_MEETING...
insert into USER_MEETING (UMEETID, USERID, MID)
values (1001, 1001, 1001);
insert into USER_MEETING (UMEETID, USERID, MID)
values (1002, 1001, 1003);
insert into USER_MEETING (UMEETID, USERID, MID)
values (1003, 1002, 1010);
insert into USER_MEETING (UMEETID, USERID, MID)
values (1004, 1002, 1009);
insert into USER_MEETING (UMEETID, USERID, MID)
values (1005, 1003, 1008);
insert into USER_MEETING (UMEETID, USERID, MID)
values (1006, 1003, 1007);
insert into USER_MEETING (UMEETID, USERID, MID)
values (1007, 1004, 1001);
insert into USER_MEETING (UMEETID, USERID, MID)
values (1008, 1004, 1003);
insert into USER_MEETING (UMEETID, USERID, MID)
values (1009, 1005, 1005);
insert into USER_MEETING (UMEETID, USERID, MID)
values (1010, 1005, 1009);
insert into USER_MEETING (UMEETID, USERID, MID)
values (1011, 1006, 1005);
insert into USER_MEETING (UMEETID, USERID, MID)
values (1012, 1006, 1008);
insert into USER_MEETING (UMEETID, USERID, MID)
values (1013, 1007, 1003);
insert into USER_MEETING (UMEETID, USERID, MID)
values (1014, 1007, 1007);
insert into USER_MEETING (UMEETID, USERID, MID)
values (1015, 1008, 1001);
insert into USER_MEETING (UMEETID, USERID, MID)
values (1016, 1008, 1010);
insert into USER_MEETING (UMEETID, USERID, MID)
values (1017, 1009, 1008);
insert into USER_MEETING (UMEETID, USERID, MID)
values (1018, 1009, 1009);
insert into USER_MEETING (UMEETID, USERID, MID)
values (1019, 1010, 1003);
insert into USER_MEETING (UMEETID, USERID, MID)
values (1020, 1010, 1005);
commit;
prompt 20 records loaded
prompt Loading USER_SCHEDULE...
insert into USER_SCHEDULE (USCHEID, ACTORID, PLANID, HID)
values (1001, 1002, 1001, 1002);
insert into USER_SCHEDULE (USCHEID, ACTORID, PLANID, HID)
values (1002, 1002, 1003, 1002);
insert into USER_SCHEDULE (USCHEID, ACTORID, PLANID, HID)
values (1003, 1002, 1004, 1002);
insert into USER_SCHEDULE (USCHEID, ACTORID, PLANID, HID)
values (1004, 1002, 1005, 1002);
insert into USER_SCHEDULE (USCHEID, ACTORID, PLANID, HID)
values (1005, 1002, 1006, 1002);
insert into USER_SCHEDULE (USCHEID, ACTORID, PLANID, HID)
values (1006, 1002, 1007, 1002);
insert into USER_SCHEDULE (USCHEID, ACTORID, PLANID, HID)
values (1007, 1002, 1008, 1002);
insert into USER_SCHEDULE (USCHEID, ACTORID, PLANID, HID)
values (1008, 1002, 1009, 1002);
insert into USER_SCHEDULE (USCHEID, ACTORID, PLANID, HID)
values (1009, 1002, 1010, 1002);
insert into USER_SCHEDULE (USCHEID, ACTORID, PLANID, HID)
values (1010, 1003, 1001, 1001);
insert into USER_SCHEDULE (USCHEID, ACTORID, PLANID, HID)
values (1011, 1003, 1002, 1001);
insert into USER_SCHEDULE (USCHEID, ACTORID, PLANID, HID)
values (1012, 1003, 1004, 1001);
insert into USER_SCHEDULE (USCHEID, ACTORID, PLANID, HID)
values (1013, 1003, 1005, 1001);
insert into USER_SCHEDULE (USCHEID, ACTORID, PLANID, HID)
values (1014, 1003, 1006, 1001);
insert into USER_SCHEDULE (USCHEID, ACTORID, PLANID, HID)
values (1015, 1003, 1007, 1001);
insert into USER_SCHEDULE (USCHEID, ACTORID, PLANID, HID)
values (1016, 1003, 1008, 1001);
insert into USER_SCHEDULE (USCHEID, ACTORID, PLANID, HID)
values (1017, 1003, 1009, 1001);
insert into USER_SCHEDULE (USCHEID, ACTORID, PLANID, HID)
values (1018, 1003, 1010, 1001);
commit;
prompt 18 records loaded
prompt Enabling foreign key constraints for USERS...
alter table USERS enable constraint FK4D495E8812CF49;
alter table USERS enable constraint FK4D495E8A8EEA4AB;
prompt Enabling foreign key constraints for CARDFLODER...
alter table CARDFLODER enable constraint FK63A80E187F5EDB6;
prompt Enabling foreign key constraints for CARD...
alter table CARD enable constraint FK1F73101C42AA4E;
prompt Enabling foreign key constraints for FLODER...
alter table FLODER enable constraint FK7BC727087F5EDB6;
prompt Enabling foreign key constraints for FILES...
alter table FILES enable constraint FK3FCC257E5974281;
prompt Enabling foreign key constraints for MEETING...
alter table MEETING enable constraint FK62F1D61B398CF5D0;
prompt Enabling foreign key constraints for USERS_MESSAGE...
alter table USERS_MESSAGE enable constraint FK13BA60903CAD633;
alter table USERS_MESSAGE enable constraint FK13BA6090637C0ECE;
alter table USERS_MESSAGE enable constraint FK13BA6090F37F70A2;
prompt Enabling foreign key constraints for USERS_ROLE...
alter table USERS_ROLE enable constraint FKB3060C6D7F5EDB6;
alter table USERS_ROLE enable constraint FKB3060C6DA168C9FF;
prompt Enabling foreign key constraints for USERS_ROOM...
alter table USERS_ROOM enable constraint FKB3060CD2398CF5D0;
alter table USERS_ROOM enable constraint FKB3060CD27F5EDB6;
prompt Enabling foreign key constraints for USER_MEETING...
alter table USER_MEETING enable constraint FK195A65A732F6DC0B;
alter table USER_MEETING enable constraint FK195A65A77F5EDB6;
prompt Enabling foreign key constraints for USER_SCHEDULE...
alter table USER_SCHEDULE enable constraint FK1BB5E48B3576AB92;
alter table USER_SCHEDULE enable constraint FK1BB5E48BF48DC960;
alter table USER_SCHEDULE enable constraint FK1BB5E48BFF092D94;
prompt Enabling triggers for DEPARTMENT...
alter table DEPARTMENT enable all triggers;
prompt Enabling triggers for POSTION...
alter table POSTION enable all triggers;
prompt Enabling triggers for USERS...
alter table USERS enable all triggers;
prompt Enabling triggers for CARDFLODER...
alter table CARDFLODER enable all triggers;
prompt Enabling triggers for CARD...
alter table CARD enable all triggers;
prompt Enabling triggers for FLODER...
alter table FLODER enable all triggers;
prompt Enabling triggers for FILES...
alter table FILES enable all triggers;
prompt Enabling triggers for MROOM...
alter table MROOM enable all triggers;
prompt Enabling triggers for MEETING...
alter table MEETING enable all triggers;
prompt Enabling triggers for MESSAGE...
alter table MESSAGE enable all triggers;
prompt Enabling triggers for ROLE...
alter table ROLE enable all triggers;
prompt Enabling triggers for SCHEDULE...
alter table SCHEDULE enable all triggers;
prompt Enabling triggers for USERS_MESSAGE...
alter table USERS_MESSAGE enable all triggers;
prompt Enabling triggers for USERS_ROLE...
alter table USERS_ROLE enable all triggers;
prompt Enabling triggers for USERS_ROOM...
alter table USERS_ROOM enable all triggers;
prompt Enabling triggers for USER_MEETING...
alter table USER_MEETING enable all triggers;
prompt Enabling triggers for USER_SCHEDULE...
alter table USER_SCHEDULE enable all triggers;
set feedback on
set define on
prompt Done.
