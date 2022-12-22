prompt PL/SQL Developer import file
prompt Created on 2011年7月7日 by Administrator
set feedback off
set define off
prompt Dropping CARS...
drop table CARS cascade constraints;
prompt Dropping ROLES...
drop table ROLES cascade constraints;
prompt Dropping USERS...
drop table USERS cascade constraints;
prompt Dropping CUSTOMERS...
drop table CUSTOMERS cascade constraints;
prompt Dropping RENTTABLE...
drop table RENTTABLE cascade constraints;
prompt Dropping CHECKTABLE...
drop table CHECKTABLE cascade constraints;
prompt Dropping MENUS...
drop table MENUS cascade constraints;
prompt Dropping FUNS...
drop table FUNS cascade constraints;
prompt Dropping ROLES_MENUS...
drop table ROLES_MENUS cascade constraints;
prompt Creating CARS...
create table CARS
(
  CARNUMBER VARCHAR2(20) not null,
  CARTYPE   VARCHAR2(50) not null,
  COLOR     VARCHAR2(10) not null,
  PRICE     NUMBER(10,2) not null,
  RENTPRICE NUMBER(10,2) not null,
  DEPOSIT   NUMBER(10,2) not null,
  ISRENTING VARCHAR2(20) not null,
  CARDESC   VARCHAR2(500)
)
tablespace BLUEDOT
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table CARS
  add constraint CARS_PK primary key (CARNUMBER)
  using index 
  tablespace BLUEDOT
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt Creating ROLES...
create table ROLES
(
  ROLEID   NUMBER not null,
  ROLENAME VARCHAR2(20) not null
)
tablespace BLUEDOT
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table ROLES
  add constraint ROLES_PK primary key (ROLEID)
  using index 
  tablespace BLUEDOT
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt Creating USERS...
create table USERS
(
  USERNAME  VARCHAR2(40) not null,
  IDENTITY  VARCHAR2(20) not null,
  FULLNAME  VARCHAR2(20) not null,
  SEX       VARCHAR2(10) not null,
  ADDRESS   VARCHAR2(40) not null,
  PHONE     VARCHAR2(20) not null,
  POSITION  VARCHAR2(20) not null,
  USERLEVEL NUMBER not null,
  USERPWD   VARCHAR2(40) not null
)
tablespace BLUEDOT
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table USERS
  add constraint USERS_PK primary key (USERNAME)
  using index 
  tablespace BLUEDOT
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table USERS
  add constraint USERS_UK unique (IDENTITY)
  using index 
  tablespace BLUEDOT
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table USERS
  add constraint USERS_FK foreign key (USERLEVEL)
  references ROLES (ROLEID);

prompt Creating CUSTOMERS...
create table CUSTOMERS
(
  IDENTITY VARCHAR2(20) not null,
  CUSTNAME VARCHAR2(40) not null,
  SEX      VARCHAR2(10) not null,
  ADDRESS  VARCHAR2(100) not null,
  PHONE    VARCHAR2(20) not null,
  CAREER   VARCHAR2(20) not null,
  CUSTPWD  VARCHAR2(20) not null
)
tablespace BLUEDOT
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table CUSTOMERS
  add constraint CUSTOMERS_PK primary key (IDENTITY)
  using index 
  tablespace BLUEDOT
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt Creating RENTTABLE...
create table RENTTABLE
(
  TABLEID          NUMBER not null,
  IMPREST          NUMBER(10,2) not null,
  SHOULDPAYPRICE   NUMBER(10,2) not null,
  PRICE            NUMBER(10,2) not null,
  BEGINDATE        DATE not null,
  SHOULDRETURNDATE DATE not null,
  RETURNDATE       DATE,
  RENTFLAG         NUMBER not null,
  CUSTID           VARCHAR2(20) not null,
  CARID            VARCHAR2(20) not null,
  USERID           VARCHAR2(40) not null
)
tablespace BLUEDOT
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table RENTTABLE
  add constraint RENTTABLE_PK primary key (TABLEID)
  using index 
  tablespace BLUEDOT
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table RENTTABLE
  add constraint RENTTABLE_CUSTIONERS_FK3 foreign key (USERID)
  references USERS (USERNAME);
alter table RENTTABLE
  add constraint RENTTABLE_CUSTOMERS_FK1 foreign key (CUSTID)
  references CUSTOMERS (IDENTITY);
alter table RENTTABLE
  add constraint RENTTABLE_CUSTONERS_FK2 foreign key (CARID)
  references CARS (CARNUMBER);

prompt Creating CHECKTABLE...
create table CHECKTABLE
(
  CHECKID     NUMBER not null,
  CHECKDATE   DATE not null,
  FIELD       VARCHAR2(100),
  PROBLEM     VARCHAR2(100),
  PAYING      NUMBER(10,2),
  CHECKUSERID VARCHAR2(40) not null,
  RENTID      NUMBER not null
)
tablespace BLUEDOT
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table CHECKTABLE
  add constraint CHECKTABLE_PK primary key (CHECKID)
  using index 
  tablespace BLUEDOT
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table CHECKTABLE
  add constraint CHECKTABLE_RENTTABLE_FK2 foreign key (RENTID)
  references RENTTABLE (TABLEID);
alter table CHECKTABLE
  add constraint CHECKTABLE_USERS_FK1 foreign key (CHECKUSERID)
  references USERS (USERNAME);

prompt Creating MENUS...
create table MENUS
(
  MENUID   NUMBER not null,
  MENUNAME VARCHAR2(40) not null,
  CONNURL  VARCHAR2(40),
  FATHERID NUMBER not null
)
tablespace BLUEDOT
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table MENUS
  add constraint MENUS_PK primary key (MENUID)
  using index 
  tablespace BLUEDOT
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt Creating FUNS...
create table FUNS
(
  FUNID   NUMBER not null,
  FUNNAME VARCHAR2(40) not null,
  FUNURL  VARCHAR2(40) not null,
  MENUID  NUMBER not null
)
tablespace BLUEDOT
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table FUNS
  add constraint FUNS_PK primary key (FUNID)
  using index 
  tablespace BLUEDOT
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table FUNS
  add constraint FUNS_FK foreign key (MENUID)
  references MENUS (MENUID);

prompt Creating ROLES_MENUS...
create table ROLES_MENUS
(
  ROLEID NUMBER not null,
  MENUID NUMBER not null
)
tablespace BLUEDOT
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table ROLES_MENUS
  add constraint ROLES_MENUS_PK primary key (ROLEID, MENUID)
  using index 
  tablespace BLUEDOT
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table ROLES_MENUS
  add constraint ROLES_MENUS_FK1 foreign key (ROLEID)
  references ROLES (ROLEID);
alter table ROLES_MENUS
  add constraint ROLES_MENUS_FK2 foreign key (MENUID)
  references MENUS (MENUID);

prompt Disabling triggers for CARS...
alter table CARS disable all triggers;
prompt Disabling triggers for ROLES...
alter table ROLES disable all triggers;
prompt Disabling triggers for USERS...
alter table USERS disable all triggers;
prompt Disabling triggers for CUSTOMERS...
alter table CUSTOMERS disable all triggers;
prompt Disabling triggers for RENTTABLE...
alter table RENTTABLE disable all triggers;
prompt Disabling triggers for CHECKTABLE...
alter table CHECKTABLE disable all triggers;
prompt Disabling triggers for MENUS...
alter table MENUS disable all triggers;
prompt Disabling triggers for FUNS...
alter table FUNS disable all triggers;
prompt Disabling triggers for ROLES_MENUS...
alter table ROLES_MENUS disable all triggers;
prompt Disabling foreign key constraints for USERS...
alter table USERS disable constraint USERS_FK;
prompt Disabling foreign key constraints for RENTTABLE...
alter table RENTTABLE disable constraint RENTTABLE_CUSTIONERS_FK3;
alter table RENTTABLE disable constraint RENTTABLE_CUSTOMERS_FK1;
alter table RENTTABLE disable constraint RENTTABLE_CUSTONERS_FK2;
prompt Disabling foreign key constraints for CHECKTABLE...
alter table CHECKTABLE disable constraint CHECKTABLE_RENTTABLE_FK2;
alter table CHECKTABLE disable constraint CHECKTABLE_USERS_FK1;
prompt Disabling foreign key constraints for FUNS...
alter table FUNS disable constraint FUNS_FK;
prompt Disabling foreign key constraints for ROLES_MENUS...
alter table ROLES_MENUS disable constraint ROLES_MENUS_FK1;
alter table ROLES_MENUS disable constraint ROLES_MENUS_FK2;
prompt Loading CARS...
insert into CARS (CARNUMBER, CARTYPE, COLOR, PRICE, RENTPRICE, DEPOSIT, ISRENTING, CARDESC)
values ('湘A-09890', '宝马7系 2009款 730Li领先型', '黑色', 928000, 1000, 4000, '0', '宝马7系 2009款 730Li领先型');
insert into CARS (CARNUMBER, CARTYPE, COLOR, PRICE, RENTPRICE, DEPOSIT, ISRENTING, CARDESC)
values ('湘A-88888', '奥迪A8', '黑色', 1362000, 1000, 10000, '0', '奥迪A8 2011款 3.0TFSI quattro豪华型');
insert into CARS (CARNUMBER, CARTYPE, COLOR, PRICE, RENTPRICE, DEPOSIT, ISRENTING, CARDESC)
values ('湘A-88899', '奥迪A8', '黑色', 928000, 900, 5000, '0', '奥迪A8 2011款 3.0TFSI quattro舒适型');
insert into CARS (CARNUMBER, CARTYPE, COLOR, PRICE, RENTPRICE, DEPOSIT, ISRENTING, CARDESC)
values ('湘A-09809', '宝马7系 2009款 730Li豪华型', '黑色', 1018000, 1000, 4500, '0', '宝马7系 2009款 730Li豪华型');
insert into CARS (CARNUMBER, CARTYPE, COLOR, PRICE, RENTPRICE, DEPOSIT, ISRENTING, CARDESC)
values ('湘B-76483', '宝马7系 2009款 740Li领先型', '红色', 1188000, 1000, 5000, '0', '宝马7系 2009款 740Li领先型');
insert into CARS (CARNUMBER, CARTYPE, COLOR, PRICE, RENTPRICE, DEPOSIT, ISRENTING, CARDESC)
values ('湘B-78666', '宝马7系 2009款 740Li豪华型', '红色', 1378000, 1200, 6000, '0', '宝马7系 2009款 740Li豪华型');
insert into CARS (CARNUMBER, CARTYPE, COLOR, PRICE, RENTPRICE, DEPOSIT, ISRENTING, CARDESC)
values ('湘A-00888', '奔驰S级 2011款 S 350L CGI', '黑色', 1398000, 1500, 5000, '0', '奔驰S级 2011款 S 350L CGI');
commit;
prompt 7 records loaded
prompt Loading ROLES...
insert into ROLES (ROLEID, ROLENAME)
values (1, '管理员');
insert into ROLES (ROLEID, ROLENAME)
values (2, '服务人员');
insert into ROLES (ROLEID, ROLENAME)
values (3, '普通客户');
commit;
prompt 3 records loaded
prompt Loading USERS...
insert into USERS (USERNAME, IDENTITY, FULLNAME, SEX, ADDRESS, PHONE, POSITION, USERLEVEL, USERPWD)
values ('admin', '222222222222222222', '张三', '男', '北京市海淀区', '13888888888', '总经理', 1, '1231');
commit;
prompt 1 records loaded
prompt Loading CUSTOMERS...
insert into CUSTOMERS (IDENTITY, CUSTNAME, SEX, ADDRESS, PHONE, CAREER, CUSTPWD)
values ('222222222222222222', '王小刚', '男', '北京市海淀区', '13555555555', '工程师', '1231');
commit;
prompt 1 records loaded
prompt Loading RENTTABLE...
prompt Table is empty
prompt Loading CHECKTABLE...
prompt Table is empty
prompt Loading MENUS...
insert into MENUS (MENUID, MENUNAME, CONNURL, FATHERID)
values (1, '汽车租赁管理系统', null, -1);
insert into MENUS (MENUID, MENUNAME, CONNURL, FATHERID)
values (2, '用户管理', null, 1);
insert into MENUS (MENUID, MENUNAME, CONNURL, FATHERID)
values (3, '添加用户', 'PreAddUser.do', 2);
insert into MENUS (MENUID, MENUNAME, CONNURL, FATHERID)
values (4, '查询用户', 'PreFindUser.do', 2);
insert into MENUS (MENUID, MENUNAME, CONNURL, FATHERID)
values (5, '客户管理', null, 1);
insert into MENUS (MENUID, MENUNAME, CONNURL, FATHERID)
values (6, '添加客户信息', 'custManager/addCustomers.jsp', 5);
insert into MENUS (MENUID, MENUNAME, CONNURL, FATHERID)
values (7, '查询客户信息', 'custManager/findCustomers.jsp', 5);
insert into MENUS (MENUID, MENUNAME, CONNURL, FATHERID)
values (8, '汽车管理', null, 1);
insert into MENUS (MENUID, MENUNAME, CONNURL, FATHERID)
values (9, '添加汽车信息', 'carManager/addCar.jsp', 8);
insert into MENUS (MENUID, MENUNAME, CONNURL, FATHERID)
values (10, '查询汽车信息', 'carManager/findCar.jsp', 8);
insert into MENUS (MENUID, MENUNAME, CONNURL, FATHERID)
values (11, '业务管理', null, 1);
insert into MENUS (MENUID, MENUNAME, CONNURL, FATHERID)
values (12, '汽车出租', 'operatorManager/rentCar.jsp', 11);
insert into MENUS (MENUID, MENUNAME, CONNURL, FATHERID)
values (13, '汽车入库', 'operatorManager/returnCar.jsp', 11);
insert into MENUS (MENUID, MENUNAME, CONNURL, FATHERID)
values (14, '出租单管理', 'operatorManager/rentManager.jsp', 11);
insert into MENUS (MENUID, MENUNAME, CONNURL, FATHERID)
values (15, '检查单管理', 'operatorManager/checkManager.jsp', 11);
insert into MENUS (MENUID, MENUNAME, CONNURL, FATHERID)
values (16, '业务统计', null, 1);
insert into MENUS (MENUID, MENUNAME, CONNURL, FATHERID)
values (17, '当月应还汽车', 'MonthReturnCar.do', 16);
commit;
prompt 17 records loaded
prompt Loading FUNS...
insert into FUNS (FUNID, FUNNAME, FUNURL, MENUID)
values (50, '添加用户角色查询动作', 'PreAddUser.do', 3);
insert into FUNS (FUNID, FUNNAME, FUNURL, MENUID)
values (11, '操作失败提示页面', 'error.jsp', 1);
insert into FUNS (FUNID, FUNNAME, FUNURL, MENUID)
values (12, '系统崩溃提示页面', 'appError.jsp', 1);
insert into FUNS (FUNID, FUNNAME, FUNURL, MENUID)
values (51, '添加用户页面', 'addUser.jsp', 3);
insert into FUNS (FUNID, FUNNAME, FUNURL, MENUID)
values (52, '添加用户动作', 'AddUser.do', 3);
insert into FUNS (FUNID, FUNNAME, FUNURL, MENUID)
values (13, '成功页面', 'ok.jsp', 1);
insert into FUNS (FUNID, FUNNAME, FUNURL, MENUID)
values (53, '查询用户角色查询动作', 'PreFindUser.do', 4);
insert into FUNS (FUNID, FUNNAME, FUNURL, MENUID)
values (54, '查询用户页面', 'findUser.jsp', 4);
insert into FUNS (FUNID, FUNNAME, FUNURL, MENUID)
values (201, '添加汽车动作', 'AddCar.do', 9);
insert into FUNS (FUNID, FUNNAME, FUNURL, MENUID)
values (202, '查询汽车页面', 'findCar.jsp', 10);
insert into FUNS (FUNID, FUNNAME, FUNURL, MENUID)
values (203, '显示查询汽车结果页面', 'viewCars.jsp', 10);
insert into FUNS (FUNID, FUNNAME, FUNURL, MENUID)
values (204, '查询汽车信息动作', 'FindCar.do', 10);
insert into FUNS (FUNID, FUNNAME, FUNURL, MENUID)
values (205, '预更新查询汽车动作', 'PreUpdateCar.do', 10);
insert into FUNS (FUNID, FUNNAME, FUNURL, MENUID)
values (206, '显示更新汽车结果页面', 'updateCar.jsp', 10);
insert into FUNS (FUNID, FUNNAME, FUNURL, MENUID)
values (207, '更新汽车动作', 'UpdateCar.do', 10);
insert into FUNS (FUNID, FUNNAME, FUNURL, MENUID)
values (209, '删除汽车动作', 'DeleteCar.do', 10);
insert into FUNS (FUNID, FUNNAME, FUNURL, MENUID)
values (108, '删除客户动作', 'DeleteCustomers.do', 7);
insert into FUNS (FUNID, FUNNAME, FUNURL, MENUID)
values (61, '预修改用户密码', 'PreChangeUserPwd.do', 4);
insert into FUNS (FUNID, FUNNAME, FUNURL, MENUID)
values (62, '修改用户密码页面', 'chengeUserPwd.jsp', 4);
insert into FUNS (FUNID, FUNNAME, FUNURL, MENUID)
values (63, '修改用户密码动作', 'ChangeUserPwd.do', 4);
insert into FUNS (FUNID, FUNNAME, FUNURL, MENUID)
values (109, '预修改客户密码', 'PreChangeCustomerPwd.do', 7);
insert into FUNS (FUNID, FUNNAME, FUNURL, MENUID)
values (110, '修改客户密码页面', 'chengeCustomersPwd.jsp', 7);
insert into FUNS (FUNID, FUNNAME, FUNURL, MENUID)
values (111, '修改用户密码动作', 'ChangeCustomersPwd.do', 7);
insert into FUNS (FUNID, FUNNAME, FUNURL, MENUID)
values (300, '租车页面', 'rentCar.jsp', 12);
insert into FUNS (FUNID, FUNNAME, FUNURL, MENUID)
values (301, '预生成出租单动作', 'PreCreateRentCarTable.do', 12);
insert into FUNS (FUNID, FUNNAME, FUNURL, MENUID)
values (302, '预生成出租单页面', 'preCreateRenting.jsp', 12);
insert into FUNS (FUNID, FUNNAME, FUNURL, MENUID)
values (303, '生成出租单动作', 'CreateRentCarTable.do', 12);
insert into FUNS (FUNID, FUNNAME, FUNURL, MENUID)
values (304, '汽车出租单查询页面', 'returnCar.jsp', 13);
insert into FUNS (FUNID, FUNNAME, FUNURL, MENUID)
values (305, '预还车查询动作', 'PreReturnCarSearch.do', 13);
insert into FUNS (FUNID, FUNNAME, FUNURL, MENUID)
values (307, '创建检查单动作', 'CreateCheckTable.do', 13);
insert into FUNS (FUNID, FUNNAME, FUNURL, MENUID)
values (309, '出租单管理查询动作', 'RentManagerSearch.do', 14);
insert into FUNS (FUNID, FUNNAME, FUNURL, MENUID)
values (321, '删除检查单动作', 'DeleteCheckTables.do', 15);
insert into FUNS (FUNID, FUNNAME, FUNURL, MENUID)
values (322, '查询当月应还汽车动作', 'MonthReturnCar.do', 17);
insert into FUNS (FUNID, FUNNAME, FUNURL, MENUID)
values (55, '显示查询用户结果页面', 'viewUser.jsp', 4);
insert into FUNS (FUNID, FUNNAME, FUNURL, MENUID)
values (56, '查询用户动作', 'FindUser.do', 4);
insert into FUNS (FUNID, FUNNAME, FUNURL, MENUID)
values (57, '预更新查询用户动作', 'PreUpdateUser.do', 4);
insert into FUNS (FUNID, FUNNAME, FUNURL, MENUID)
values (58, '显示更新用户页面', 'updateUser.jsp', 4);
insert into FUNS (FUNID, FUNNAME, FUNURL, MENUID)
values (1, '主页面', 'index.jsp', 1);
insert into FUNS (FUNID, FUNNAME, FUNURL, MENUID)
values (2, '头页面', 'head.jsp', 1);
insert into FUNS (FUNID, FUNNAME, FUNURL, MENUID)
values (3, '菜单页面', 'menu.jsp', 1);
insert into FUNS (FUNID, FUNNAME, FUNURL, MENUID)
values (4, '脚页面', 'foot.jsp', 1);
insert into FUNS (FUNID, FUNNAME, FUNURL, MENUID)
values (5, '操作页面', 'welcome.jsp', 1);
insert into FUNS (FUNID, FUNNAME, FUNURL, MENUID)
values (6, '权限提示页面', 'norole.jsp', 1);
insert into FUNS (FUNID, FUNNAME, FUNURL, MENUID)
values (8, '退出系统动作', 'ExitSystem.do', 1);
insert into FUNS (FUNID, FUNNAME, FUNURL, MENUID)
values (9, '菜单导航', 'modNavTop.jsp', 1);
insert into FUNS (FUNID, FUNNAME, FUNURL, MENUID)
values (10, '菜单条', 'splitor.jsp', 1);
insert into FUNS (FUNID, FUNNAME, FUNURL, MENUID)
values (101, '添加客户动作', 'AddCustomers.do', 6);
insert into FUNS (FUNID, FUNNAME, FUNURL, MENUID)
values (102, '查询客户页面', 'findCustomers.jsp', 7);
insert into FUNS (FUNID, FUNNAME, FUNURL, MENUID)
values (103, '查询客户信息动作', 'FindCustomers.do', 7);
insert into FUNS (FUNID, FUNNAME, FUNURL, MENUID)
values (104, '显示查询客户结果页面', 'viewCustomers.jsp', 7);
insert into FUNS (FUNID, FUNNAME, FUNURL, MENUID)
values (105, '预更新客户查询动作', 'PreCustomers.do', 7);
insert into FUNS (FUNID, FUNNAME, FUNURL, MENUID)
values (106, '显示更新客户页面', 'updateCustomers.jsp', 7);
insert into FUNS (FUNID, FUNNAME, FUNURL, MENUID)
values (107, '更新客户动作', 'UpdateCustomers.do', 7);
insert into FUNS (FUNID, FUNNAME, FUNURL, MENUID)
values (200, '添加汽车页面', 'addCar.jsp', 9);
insert into FUNS (FUNID, FUNNAME, FUNURL, MENUID)
values (306, '创建检查单页面', 'createCheckTable.jsp', 13);
insert into FUNS (FUNID, FUNNAME, FUNURL, MENUID)
values (308, '出租单管理页面', 'rentManager.jsp', 14);
insert into FUNS (FUNID, FUNNAME, FUNURL, MENUID)
values (310, '显示查询出租单结果页面', 'viewRenttables.jsp', 14);
insert into FUNS (FUNID, FUNNAME, FUNURL, MENUID)
values (317, '显示查询检查单结果页面', 'viewCheckTables.jsp', 15);
insert into FUNS (FUNID, FUNNAME, FUNURL, MENUID)
values (318, '预更新检查单查询动作', 'PreUdateCheckTable.do', 15);
insert into FUNS (FUNID, FUNNAME, FUNURL, MENUID)
values (319, '更新检查单页面', 'updateCheckTable.jsp', 15);
insert into FUNS (FUNID, FUNNAME, FUNURL, MENUID)
values (320, '更新检查单动作', 'UpdateCheckTable.do', 15);
insert into FUNS (FUNID, FUNNAME, FUNURL, MENUID)
values (400, '显示当月应还车结果页面', 'viewMonthReturnCarResult.jsp', 17);
insert into FUNS (FUNID, FUNNAME, FUNURL, MENUID)
values (401, '查询当月应归还汽车相信信息', 'FindMonthReturnCarByInfo.do', 17);
insert into FUNS (FUNID, FUNNAME, FUNURL, MENUID)
values (402, '显示当月应还汽车详细信息', 'findMonthReturnCarByInfo.jsp', 17);
insert into FUNS (FUNID, FUNNAME, FUNURL, MENUID)
values (59, '更新用户动作', 'UpdateUser.do', 4);
insert into FUNS (FUNID, FUNNAME, FUNURL, MENUID)
values (311, '预更新出租单查询动作', 'PreUpdateRenttable.do', 14);
insert into FUNS (FUNID, FUNNAME, FUNURL, MENUID)
values (312, '更新出租单页面', 'updateRenttable.jsp', 14);
insert into FUNS (FUNID, FUNNAME, FUNURL, MENUID)
values (313, '更新出租单动作', 'UpdateRenttable.do', 14);
insert into FUNS (FUNID, FUNNAME, FUNURL, MENUID)
values (314, '删除出租单动作', 'DeleteRenttable.do', 14);
insert into FUNS (FUNID, FUNNAME, FUNURL, MENUID)
values (315, '检查单管理页面', 'checkManager.jsp', 15);
insert into FUNS (FUNID, FUNNAME, FUNURL, MENUID)
values (316, '查询检查单动作', 'FindCheckTable.do', 15);
insert into FUNS (FUNID, FUNNAME, FUNURL, MENUID)
values (60, '删除用户动作', 'DeleteUser.do', 4);
insert into FUNS (FUNID, FUNNAME, FUNURL, MENUID)
values (100, '添加客户页面', 'addCustomers.jsp', 6);
commit;
prompt 73 records loaded
prompt Loading ROLES_MENUS...
insert into ROLES_MENUS (ROLEID, MENUID)
values (1, 1);
insert into ROLES_MENUS (ROLEID, MENUID)
values (1, 2);
insert into ROLES_MENUS (ROLEID, MENUID)
values (1, 3);
insert into ROLES_MENUS (ROLEID, MENUID)
values (1, 4);
insert into ROLES_MENUS (ROLEID, MENUID)
values (1, 5);
insert into ROLES_MENUS (ROLEID, MENUID)
values (1, 6);
insert into ROLES_MENUS (ROLEID, MENUID)
values (1, 7);
insert into ROLES_MENUS (ROLEID, MENUID)
values (1, 8);
insert into ROLES_MENUS (ROLEID, MENUID)
values (1, 9);
insert into ROLES_MENUS (ROLEID, MENUID)
values (1, 10);
insert into ROLES_MENUS (ROLEID, MENUID)
values (1, 11);
insert into ROLES_MENUS (ROLEID, MENUID)
values (1, 12);
insert into ROLES_MENUS (ROLEID, MENUID)
values (1, 13);
insert into ROLES_MENUS (ROLEID, MENUID)
values (1, 14);
insert into ROLES_MENUS (ROLEID, MENUID)
values (1, 15);
insert into ROLES_MENUS (ROLEID, MENUID)
values (1, 16);
insert into ROLES_MENUS (ROLEID, MENUID)
values (1, 17);
commit;
prompt 17 records loaded
prompt Enabling foreign key constraints for USERS...
alter table USERS enable constraint USERS_FK;
prompt Enabling foreign key constraints for RENTTABLE...
alter table RENTTABLE enable constraint RENTTABLE_CUSTIONERS_FK3;
alter table RENTTABLE enable constraint RENTTABLE_CUSTOMERS_FK1;
alter table RENTTABLE enable constraint RENTTABLE_CUSTONERS_FK2;
prompt Enabling foreign key constraints for CHECKTABLE...
alter table CHECKTABLE enable constraint CHECKTABLE_RENTTABLE_FK2;
alter table CHECKTABLE enable constraint CHECKTABLE_USERS_FK1;
prompt Enabling foreign key constraints for FUNS...
alter table FUNS enable constraint FUNS_FK;
prompt Enabling foreign key constraints for ROLES_MENUS...
alter table ROLES_MENUS enable constraint ROLES_MENUS_FK1;
alter table ROLES_MENUS enable constraint ROLES_MENUS_FK2;
prompt Enabling triggers for CARS...
alter table CARS enable all triggers;
prompt Enabling triggers for ROLES...
alter table ROLES enable all triggers;
prompt Enabling triggers for USERS...
alter table USERS enable all triggers;
prompt Enabling triggers for CUSTOMERS...
alter table CUSTOMERS enable all triggers;
prompt Enabling triggers for RENTTABLE...
alter table RENTTABLE enable all triggers;
prompt Enabling triggers for CHECKTABLE...
alter table CHECKTABLE enable all triggers;
prompt Enabling triggers for MENUS...
alter table MENUS enable all triggers;
prompt Enabling triggers for FUNS...
alter table FUNS enable all triggers;
prompt Enabling triggers for ROLES_MENUS...
alter table ROLES_MENUS enable all triggers;
set feedback on
set define on
prompt Done.
