--삭제---------------------------------------------------------------
-- 일정
drop sequence CALENDAR_SEQ;
CREATE SEQUENCE CALENDAR_SEQ START WITH 1 INCREMENT BY 1 nocache;
delete from calendar;

--카테고리
DROP sequence CATEGORY_SEQ;
CREATE SEQUENCE CATEGORY_SEQ START WITH 1 INCREMENT BY 1 nocache;
delete from category;

--직책
drop sequence POSITION_SEQ;
CREATE SEQUENCE POSITION_SEQ START WITH 1 INCREMENT BY 1 nocache;
delete position;

--부서
drop sequence DEPARTMENT_SEQ;
CREATE SEQUENCE DEPARTMENT_SEQ START WITH 1 INCREMENT BY 1 nocache;
delete department;

--출퇴근
delete commute;

--개별 결재선
delete erd_appr;

--결재 멤버
delete appr_member;

--신청서 결재
delete appl_appr;

--신청서
drop sequence APPLICATION_SEQ;
CREATE SEQUENCE APPLICATION_SEQ START WITH 1 INCREMENT BY 1 nocache;
delete application;

--신청서 양식
drop sequence FORM_SEQ;
CREATE SEQUENCE FORM_SEQ START WITH 1 INCREMENT BY 1 nocache;
delete form;

--결재선
drop sequence APPROVAL_SEQ;
CREATE SEQUENCE APPROVAL_SEQ START WITH 1 INCREMENT BY 1 nocache;
delete approval;

--댓글
drop sequence COMMENTS_SEQ;
CREATE SEQUENCE COMMENTS_SEQ START WITH 1 INCREMENT BY 1 nocache;
delete comments;

--파일
drop sequence POST_FILE_SEQ;
CREATE SEQUENCE POST_FILE_SEQ START WITH 1 INCREMENT BY 1 nocache;
delete post_file;

--게시글
drop sequence POST_SEQ;
CREATE SEQUENCE POST_SEQ START WITH 1 INCREMENT BY 1 nocache;
delete post;

--게시판
drop sequence BOARD_SEQ;
CREATE SEQUENCE BOARD_SEQ START WITH 1 INCREMENT BY 1 nocache;
delete board;

-- 업무 담당자
delete from pro_task;

-- 업무
drop sequence TASK_SEQ;
CREATE SEQUENCE TASK_SEQ START WITH 1 INCREMENT BY 1 nocache;
delete task;

-- 프로젝트 구성원
delete from pro_position;

--프로젝트
drop sequence PROJECT_SEQ;
CREATE SEQUENCE PROJECT_SEQ START WITH 1 INCREMENT BY 1 nocache;
delete from project;

-- 팝업
drop sequence POPUP_SEQ;
CREATE SEQUENCE POPUP_SEQ START WITH 1 INCREMENT BY 1 nocache;
delete from popup;

-- 사원
DROP SEQUENCE EMPLOYEE_SEQ;
CREATE SEQUENCE EMPLOYEE_SEQ START WITH 1 INCREMENT BY 1 nocache;
delete employee;

--참가자
delete from chat_emp;

--메세지
drop sequence MESSAGE_SEQ;
CREATE SEQUENCE MESSAGE_SEQ START WITH 1 INCREMENT BY 1 nocache;
delete from message;

-- 채팅
drop sequence CHAT_SEQ;
CREATE SEQUENCE CHAT_SEQ START WITH 1 INCREMENT BY 1 nocache;
delete from chat;

--추가-------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--직책
insert into position values('posi' || LPAD(POSITION_SEQ.NEXTVAL,4,0), '사장');
insert into position values('posi' || LPAD(POSITION_SEQ.NEXTVAL,4,0), '이사');
insert into position values('posi' || LPAD(POSITION_SEQ.NEXTVAL,4,0), '팀장');
insert into position values('posi' || LPAD(POSITION_SEQ.NEXTVAL,4,0), '과장');
insert into position values('posi' || LPAD(POSITION_SEQ.NEXTVAL,4,0), '사원');

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--부서
INSERT INTO DEPARTMENT VALUES ('de' || LPAD(DEPARTMENT_SEQ.NEXTVAL,4,0), '임원');
INSERT INTO DEPARTMENT VALUES ('de' || LPAD(DEPARTMENT_SEQ.NEXTVAL,4,0), '개발1팀');
INSERT INTO DEPARTMENT VALUES ('de' || LPAD(DEPARTMENT_SEQ.NEXTVAL,4,0), '개발2팀');
INSERT INTO DEPARTMENT VALUES ('de' || LPAD(DEPARTMENT_SEQ.NEXTVAL,4,0), '개발3팀');
INSERT INTO DEPARTMENT VALUES ('de' || LPAD(DEPARTMENT_SEQ.NEXTVAL,4,0), '홍보팀');
INSERT INTO DEPARTMENT VALUES ('de' || LPAD(DEPARTMENT_SEQ.NEXTVAL,4,0), '인사팀');

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--사원


insert into employee values('e' || LPAD(EMPLOYEE_SEQ.NEXTVAL,4,0), 'test1234', '하재관', 'USER', 'worhks@gmail.com', '010-1111-1111',
							TO_DATE(20100101, 'YYYY/MM/DD'), 'de0001', 'posi0001', 'C:\picture\cony.png', null, 'T', null);
							
							
insert into employee values('e' || LPAD(EMPLOYEE_SEQ.NEXTVAL,4,0), 'test1234', '이진우', 'USER', 'wlsdn@gmail.com', '010-2222-1111',
							TO_DATE(20130101, 'YYYY/MM/DD'), 'de0001', 'posi0002', 'C:\picture\cony.png', null, 'T', null);
insert into employee values('e' || LPAD(EMPLOYEE_SEQ.NEXTVAL,4,0), 'test1234', '송찬중', 'USER', 'ckdwns@gmail.com', '010-2222-2222',
							TO_DATE(20130601, 'YYYY/MM/DD'), 'de0001', 'posi0002', 'C:\picture\cony.png', null, 'T', null);
							
--인사팀 ADMIN(POSITION 하나더생김)
insert into employee values('admin', 'test1234', '관리자', 'ADMIN', 'admin@gmail.com', '010-0000-0000',
							TO_DATE(20000101, 'YYYY/MM/DD'), 'de0006', null, 'C:\picture\cony.png', null, 'T', null);
	
	
															
insert into employee values('e' || LPAD(EMPLOYEE_SEQ.NEXTVAL,4,0), 'test1234', '배상현', 'USER', 'bshn1234@gmail.com', '010-7277-7285',
							TO_DATE(20150115, 'YYYY/MM/DD'), 'de0002', 'posi0003', 'C:\picture\cony.png', null, 'T', null);
insert into employee values('e' || LPAD(EMPLOYEE_SEQ.NEXTVAL,4,0), 'test1234', '윤재훈', 'USER', 'wogns@gmail.com', '010-3333-2222',
							TO_DATE(20150518, 'YYYY/MM/DD'), 'de0003', 'posi0003', 'C:\picture\cony.png', null, 'T', null);
insert into employee values('e' || LPAD(EMPLOYEE_SEQ.NEXTVAL,4,0), 'test1234', '박진하', 'USER', 'wlsgk@gmail.com', '010-3333-3333',
							TO_DATE(20150823, 'YYYY/MM/DD'), 'de0004', 'posi0003', 'C:\picture\cony.png', null, 'T', null);
insert into employee values('e' || LPAD(EMPLOYEE_SEQ.NEXTVAL,4,0), 'test1234', '박태순', 'USER', 'xotns@gmail.com', '010-3333-4444',
							TO_DATE(20160303, 'YYYY/MM/DD'), 'de0005', 'posi0003', 'C:\picture\cony.png', null, 'T', null);
							
							
insert into employee values('e' || LPAD(EMPLOYEE_SEQ.NEXTVAL,4,0), 'test1234', '조민수', 'USER', 'mingsoocode@gmail.com', '010-3092-3837',
							TO_DATE(20170703, 'YYYY/MM/DD'), 'de0002', 'posi0004', 'C:\picture\cony.png', null, 'T', null);
insert into employee values('e' || LPAD(EMPLOYEE_SEQ.NEXTVAL,4,0), 'test1234', '김혜인', 'USER', 'gpdls@gmail.com', '010-4444-1111',
							TO_DATE(20170802, 'YYYY/MM/DD'), 'de0003', 'posi0004', 'C:\picture\cony.png', null, 'T', null);
insert into employee values('e' || LPAD(EMPLOYEE_SEQ.NEXTVAL,4,0), 'test1234', '윤경주', 'USER', 'rudwn@gmail.com', '010-4444-2222',
							TO_DATE(20170825, 'YYYY/MM/DD'), 'de0004', 'posi0004', 'C:\picture\cony.png', null, 'T', null);
insert into employee values('e' || LPAD(EMPLOYEE_SEQ.NEXTVAL,4,0), 'test1234', '강승구', 'USER', 'tmdrn@gmail.com', '010-4444-3333',
							TO_DATE(20170920, 'YYYY/MM/DD'), 'de0005', 'posi0004', 'C:\picture\cony.png', null, 'T', null);
							
insert into employee values('e' || LPAD(EMPLOYEE_SEQ.NEXTVAL,4,0), 'test1234', '전민규', 'USER', 'jmk5274@gmail.com', '010-6406-5274',
							TO_DATE(20170404, 'YYYY/MM/DD'), 'de0002', 'posi0005', 'C:\picture\cony.png', null, 'T', null);
insert into employee values('e' || LPAD(EMPLOYEE_SEQ.NEXTVAL,4,0), 'test1234', '김도훈', 'USER', 'testhoon1217@gmail.com', '010-2566-7607',
							TO_DATE(20191010, 'YYYY/MM/DD'), 'de0002', 'posi0005', 'C:\picture\cony.png', null, 'T', 'ewqdsa556');
insert into employee values('e' || LPAD(EMPLOYEE_SEQ.NEXTVAL,4,0), 'test1234', '홍다은', 'USER', 'testhong@gmail.com', '010-9326-3253',
							TO_DATE(20181005, 'YYYY/MM/DD'), 'de0002', 'posi0005', 'C:\picture\cony.png', null, 'T', null);
insert into employee values('e' || LPAD(EMPLOYEE_SEQ.NEXTVAL,4,0), 'test1234', '김시우', 'USER', 'tldn@gmail.com', '010-5555-1111',
							TO_DATE(20170706, 'YYYY/MM/DD'), 'de0003', 'posi0005', 'C:\picture\cony.png', null, 'T', null);
insert into employee values('e' || LPAD(EMPLOYEE_SEQ.NEXTVAL,4,0), 'test1234', '박은지', 'USER', 'dmswl@gmail.com', '010-5555-2222',
							TO_DATE(20190909, 'YYYY/MM/DD'), 'de0003', 'posi0005', 'C:\picture\cony.png', null, 'T', null);
insert into employee values('e' || LPAD(EMPLOYEE_SEQ.NEXTVAL,4,0), 'test1234', '차주환', 'USER', 'wnghks@gmail.com', '010-5555-3333',
							TO_DATE(20180618, 'YYYY/MM/DD'), 'de0003', 'posi0005', 'C:\picture\cony.png', null, 'T', null);
insert into employee values('e' || LPAD(EMPLOYEE_SEQ.NEXTVAL,4,0), 'test1234', '류우찬', 'USER', 'dncks@gmail.com', '010-5555-4444',
							TO_DATE(20170203, 'YYYY/MM/DD'), 'de0003', 'posi0005', 'C:\picture\cony.png', null, 'T', null);
insert into employee values('e' || LPAD(EMPLOYEE_SEQ.NEXTVAL,4,0), 'test1234', '박채은', 'USER', 'codms@gmail.com', '010-5555-5555',
							TO_DATE(20180901, 'YYYY/MM/DD'), 'de0004', 'posi0005', 'C:\picture\cony.png', null, 'T', null);
insert into employee values('e' || LPAD(EMPLOYEE_SEQ.NEXTVAL,4,0), 'test1234', '조하경', 'USER', 'gkrud@gmail.com', '010-5555-6666',
							TO_DATE(20190806, 'YYYY/MM/DD'), 'de0004', 'posi0005', 'C:\picture\cony.png', null, 'T', null);
insert into employee values('e' || LPAD(EMPLOYEE_SEQ.NEXTVAL,4,0), 'test1234', '강해신', 'USER', 'gotls@gmail.com', '010-5555-7777',
							TO_DATE(20170403, 'YYYY/MM/DD'), 'de0005', 'posi0005', 'C:\picture\cony.png', null, 'T', null);
insert into employee values('e' || LPAD(EMPLOYEE_SEQ.NEXTVAL,4,0), 'test1234', '최재영', 'USER', 'wodud@gmail.com', '010-5555-8888',
							TO_DATE(20170303, 'YYYY/MM/DD'), 'de0005', 'posi0005', 'C:\picture\cony.png', null, 'T', null);
insert into employee values('e' || LPAD(EMPLOYEE_SEQ.NEXTVAL,4,0), 'test1234', '김소리', 'USER', 'thflthfl@gmail.com', '010-5555-9999',
							TO_DATE(20170406, 'YYYY/MM/DD'), 'de0005', 'posi0005', 'C:\picture\cony.png', null, 'F', null);
							

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--출퇴근

insert into commute values('e0001', sysdate, to_date('201910020900', 'YYYYMMDDHH24MI'), to_date('201910022000', 'YYYYMMDDHH24MI'), '출석', null); 
insert into commute values('e0002', sysdate, to_date('201910020850', 'YYYYMMDDHH24MI'), to_date('201910021900', 'YYYYMMDDHH24MI'), '출석', null); 
insert into commute values('e0003', sysdate, to_date('201910021000', 'YYYYMMDDHH24MI'), to_date('201910021800', 'YYYYMMDDHH24MI'), '출석', null); 
insert into commute values('e0004', sysdate, to_date('201910021030', 'YYYYMMDDHH24MI'), to_date('201910022100', 'YYYYMMDDHH24MI'), '출석', null); 


---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--결재선

INSERT INTO APPROVAL(APPR_LINE_ID, APPR_LINE_NM) VALUES ('app' || LPAD(APPROVAL_SEQ.NEXTVAL,4,0), '그룹웨어 결재사항');
INSERT INTO APPROVAL(APPR_LINE_ID, APPR_LINE_NM) VALUES ('app' || LPAD(APPROVAL_SEQ.NEXTVAL,4,0), '스터디프로그래밍 결재사항');
INSERT INTO APPROVAL(APPR_LINE_ID, APPR_LINE_NM) VALUES ('app' || LPAD(APPROVAL_SEQ.NEXTVAL,4,0), '자동보험 프로그램 결재사항');
INSERT INTO APPROVAL(APPR_LINE_ID, APPR_LINE_NM) VALUES ('app' || LPAD(APPROVAL_SEQ.NEXTVAL,4,0), '부동산 프로그램 결재사항');


---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--개별 결재선

INSERT INTO ERD_APPR(APPR_LINE_ID, APPR_LINE_OWNER) VALUES ('app0001', 'e0009');
INSERT INTO ERD_APPR(APPR_LINE_ID, APPR_LINE_OWNER) VALUES ('app0002', 'e0010');
INSERT INTO ERD_APPR(APPR_LINE_ID, APPR_LINE_OWNER) VALUES ('app0003', 'e0011');
INSERT INTO ERD_APPR(APPR_LINE_ID, APPR_LINE_OWNER) VALUES ('app0004', 'e0012');



------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--결재선 멤버

INSERT INTO APPR_MEMBER(APPR_EMP, APPR_LINE_ID, APPR_LINE_OWNER, AP_ORDER) VALUES('e0005', 'app0001', 'e0009', 4);
INSERT INTO APPR_MEMBER(APPR_EMP, APPR_LINE_ID, APPR_LINE_OWNER, AP_ORDER) VALUES('e0006', 'app0002', 'e0010', 3);
INSERT INTO APPR_MEMBER(APPR_EMP, APPR_LINE_ID, APPR_LINE_OWNER, AP_ORDER) VALUES('e0007', 'app0003', 'e0011', 2);
INSERT INTO APPR_MEMBER(APPR_EMP, APPR_LINE_ID, APPR_LINE_OWNER, AP_ORDER) VALUES('e0008', 'app0004', 'e0012', 1);


------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--신청서 양식

INSERT INTO FORM(FORM_ID, FORM_NM, FORM_CONT, APPR_LINE_ID) VALUES ('form' || LPAD(FORM_SEQ.NEXTVAL,4,0), '휴가신청서', '휴가TEST', 'app0001');
INSERT INTO FORM(FORM_ID, FORM_NM, FORM_CONT, APPR_LINE_ID) VALUES ('form' || LPAD(FORM_SEQ.NEXTVAL,4,0), '지원신청서', '지원요청', 'app0002');

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--신청서 

INSERT INTO APPLICATION VALUES ('appl' || LPAD(APPLICATION_SEQ.NEXTVAL,4,0), '휴가쓰겟다TEST', '휴가휴가TEST', SYSDATE, 'form0001', 'e0009');
INSERT INTO APPLICATION VALUES ('appl' || LPAD(APPLICATION_SEQ.NEXTVAL,4,0), '반차쓰겟다TEST22', '반차반차TEST22', SYSDATE, 'form0002', 'e0010');

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--신청서 결재

INSERT INTO APPL_APPR VALUES('appl0001', 'e0005', 1, 'T');
INSERT INTO APPL_APPR VALUES('appl0002', 'e0006', 2, 'F');

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--게시판

INSERT INTO BOARD(BOARD_ID, EMP_ID, BOARD_NM, REG_DT, ABLE) VALUES('board' || LPAD(BOARD_SEQ.NEXTVAL,4,0), 'e0015', '관리자',SYSDATE, 'T');
INSERT INTO BOARD(BOARD_ID, EMP_ID, BOARD_NM, REG_DT, ABLE) VALUES('board' || LPAD(BOARD_SEQ.NEXTVAL,4,0), 'e0015', '사내게시판',SYSDATE, 'F');

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--게시글

INSERT INTO POST(POST_ID, BOARD_ID, TITLE, CONT, EMP_ID, REG_DT, ABLE, PA_POST_ID) VALUES ('post' || LPAD(POST_SEQ.NEXTVAL,4,0), 'board0001', 'TEST', 'TEST', 'e0004', SYSDATE, 'F', NULL);
INSERT INTO POST(POST_ID, BOARD_ID, TITLE, CONT, EMP_ID, REG_DT, ABLE, PA_POST_ID) VALUES ('post' || LPAD(POST_SEQ.NEXTVAL,4,0), 'board0002', 'TEST', 'TEST', 'e0004', SYSDATE, 'T', NULL);
INSERT INTO POST(POST_ID, BOARD_ID, TITLE, CONT, EMP_ID, REG_DT, ABLE, PA_POST_ID) VALUES ('post' || LPAD(POST_SEQ.NEXTVAL,4,0), 'board0002', 'TEST', 'TEST', 'e0015', SYSDATE, 'T', 'post0002');

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--게시글 파일

INSERT INTO POST_FILE(FILE_ID, POST_ID, FILE_NM, REALFILEPATH) VALUES ('f' || LPAD(POST_FILE_SEQ.NEXTVAL,4,0), 'post0002', 'TEST01', 'D:\UPLOAD\RANGERS\BROWN.PNG');
INSERT INTO POST_FILE(FILE_ID, POST_ID, FILE_NM, REALFILEPATH) VALUES ('f' || LPAD(POST_FILE_SEQ.NEXTVAL,4,0), 'post0003', 'TEST02', 'D:\UPLOAD\RANGERS\CONY.PNG');


------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--댓글

INSERT INTO COMMENTS(COM_ID, POST_ID, EMP_ID, REG_DT, CONT, ABLE, PA_COM_ID) VALUES ('com' || LPAD(COMMENTS_SEQ.NEXTVAL,4,0), 'post0002', 'e0017', SYSDATE, 'TEST', 'F', NULL);
INSERT INTO COMMENTS(COM_ID, POST_ID, EMP_ID, REG_DT, CONT, ABLE, PA_COM_ID) VALUES ('com' || LPAD(COMMENTS_SEQ.NEXTVAL,4,0), 'post0002', 'e0018', SYSDATE, 'TEST', 'F', 'com0001');

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--프로젝트

INSERT INTO PROJECT(PRO_ID, PRO_NM, ST_DT, END_DT, PA_PRO_ID) VALUES ('pj' || LPAD(PROJECT_SEQ.NEXTVAL,4,0), '그룹웨어 개발팀', to_date('20191002', 'YYYYMMDD'), to_date('20191020', 'YYYYMMDD'), NULL);
INSERT INTO PROJECT(PRO_ID, PRO_NM, ST_DT, END_DT, PA_PRO_ID) VALUES ('pj' || LPAD(PROJECT_SEQ.NEXTVAL,4,0), '프로그래밍 스터디 개발팀', to_date('20191004', 'YYYYMMDD'), to_date('20191025', 'YYYYMMDD'), NULL);
INSERT INTO PROJECT(PRO_ID, PRO_NM, ST_DT, END_DT, PA_PRO_ID) VALUES ('pj' || LPAD(PROJECT_SEQ.NEXTVAL,4,0), '자동보험 프로그래밍 개발팀', to_date('20191006', 'YYYYMMDD'), to_date('20191030', 'YYYYMMDD'), NULL);
INSERT INTO PROJECT(PRO_ID, PRO_NM, ST_DT, END_DT, PA_PRO_ID) VALUES ('pj' || LPAD(PROJECT_SEQ.NEXTVAL,4,0), '부동산 개발팀', to_date('20191008', 'YYYYMMDD'), to_date('20191102', 'YYYYMMDD'), NULL);

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--프로젝트 구성원

INSERT INTO PRO_POSITION VALUES('e0005', 'pj0001', 'posi0003');
INSERT INTO PRO_POSITION VALUES('e0009', 'pj0001', 'posi0004');
INSERT INTO PRO_POSITION VALUES('e0013', 'pj0001', 'posi0005');
INSERT INTO PRO_POSITION VALUES('e0014', 'pj0001', 'posi0005');
INSERT INTO PRO_POSITION VALUES('e0015', 'pj0001', 'posi0005');

INSERT INTO PRO_POSITION VALUES('e0006', 'pj0002', 'posi0003');
INSERT INTO PRO_POSITION VALUES('e0010', 'pj0002', 'posi0004');
INSERT INTO PRO_POSITION VALUES('e0016', 'pj0002', 'posi0005');
INSERT INTO PRO_POSITION VALUES('e0017', 'pj0002', 'posi0005');
INSERT INTO PRO_POSITION VALUES('e0018', 'pj0002', 'posi0005');
INSERT INTO PRO_POSITION VALUES('e0019', 'pj0002', 'posi0005');

INSERT INTO PRO_POSITION VALUES('e0007', 'pj0003', 'posi0003');
INSERT INTO PRO_POSITION VALUES('e0011', 'pj0003', 'posi0004');
INSERT INTO PRO_POSITION VALUES('e0020', 'pj0003', 'posi0005');
INSERT INTO PRO_POSITION VALUES('e0021', 'pj0003', 'posi0005');

INSERT INTO PRO_POSITION VALUES('e0008', 'pj0003', 'posi0003');
INSERT INTO PRO_POSITION VALUES('e0012', 'pj0003', 'posi0004');
INSERT INTO PRO_POSITION VALUES('e0022', 'pj0003', 'posi0005');
INSERT INTO PRO_POSITION VALUES('e0023', 'pj0003', 'posi0005');
INSERT INTO PRO_POSITION VALUES('e0024', 'pj0003', 'posi0005');

------------------------------------------------------------------------------------------------------------------
--업무

INSERT INTO TASK(TASK_ID, TASK_CONT, ST_DT, END_DT, PRO_ID, PA_TASK_ID) VALUES ('task' || LPAD(TASK_SEQ.NEXTVAL,4,0), '부서업무지시', to_date('20191002', 'YYYYMMDD'), to_date('20191020', 'YYYYMMDD'), 'pj0001', NULL);
INSERT INTO TASK(TASK_ID, TASK_CONT, ST_DT, END_DT, PRO_ID, PA_TASK_ID) VALUES ('task' || LPAD(TASK_SEQ.NEXTVAL,4,0), '부서업무지시', to_date('20191002', 'YYYYMMDD'), to_date('20191020', 'YYYYMMDD'), 'pj0002', NULL);
INSERT INTO TASK(TASK_ID, TASK_CONT, ST_DT, END_DT, PRO_ID, PA_TASK_ID) VALUES ('task' || LPAD(TASK_SEQ.NEXTVAL,4,0), '부서업무지시', to_date('20191005', 'YYYYMMDD'), to_date('20191024', 'YYYYMMDD'), 'pj0003', NULL);
INSERT INTO TASK(TASK_ID, TASK_CONT, ST_DT, END_DT, PRO_ID, PA_TASK_ID) VALUES ('task' || LPAD(TASK_SEQ.NEXTVAL,4,0), '부서업무지시', to_date('20191002', 'YYYYMMDD'), to_date('20191020', 'YYYYMMDD'), 'pj0004', NULL);
INSERT INTO TASK(TASK_ID, TASK_CONT, ST_DT, END_DT, PRO_ID, PA_TASK_ID) VALUES ('task' || LPAD(TASK_SEQ.NEXTVAL,4,0), '개인업무지시', to_date('20191002', 'YYYYMMDD'), to_date('20191020', 'YYYYMMDD'), 'pj0001', 'task0001');
INSERT INTO TASK(TASK_ID, TASK_CONT, ST_DT, END_DT, PRO_ID, PA_TASK_ID) VALUES ('task' || LPAD(TASK_SEQ.NEXTVAL,4,0), '개인업무지시', to_date('20191005', 'YYYYMMDD'), to_date('20191024', 'YYYYMMDD'), 'pj0002', 'task0002');
INSERT INTO TASK(TASK_ID, TASK_CONT, ST_DT, END_DT, PRO_ID, PA_TASK_ID) VALUES ('task' || LPAD(TASK_SEQ.NEXTVAL,4,0), '개인업무지시', to_date('20191002', 'YYYYMMDD'), to_date('20191020', 'YYYYMMDD'), 'pj0003', 'task0003');
INSERT INTO TASK(TASK_ID, TASK_CONT, ST_DT, END_DT, PRO_ID, PA_TASK_ID) VALUES ('task' || LPAD(TASK_SEQ.NEXTVAL,4,0), '개인업무지시', to_date('20191002', 'YYYYMMDD'), to_date('20191020', 'YYYYMMDD'), 'pj0004', 'task0004');

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--업무 담당자

INSERT INTO PRO_TASK VALUES('e0005', 'task0001', 'pj0001');
INSERT INTO PRO_TASK VALUES('e0006', 'task0002', 'pj0002');

-------------------------------------------------------------------------------------------------------------------------------------------------

--팝업

INSERT INTO POPUP VALUES('pop' || LPAD(POPUP_SEQ.NEXTVAL,4,0), NULL, NULL, NULL, NULL, NULL, NULL, 'TESTTES', 'TESTESTSETSET', SYSDATE, 'e0015');
INSERT INTO POPUP VALUES('pop' || LPAD(POPUP_SEQ.NEXTVAL,4,0), NULL, NULL, NULL, NULL, NULL, NULL, 'TESTTES1', 'TESTESTSETSET1', SYSDATE, 'e0015');

--------------------------------------------------------------------------------------------------------------------------------
--채팅방
 
INSERT INTO CHAT VALUES('ch' || LPAD(CHAT_SEQ.NEXTVAL,4,0), 'TESTCHAT1', 'T');
INSERT INTO CHAT VALUES('ch' || LPAD(CHAT_SEQ.NEXTVAL,4,0), 'TESTCHAT2', 'T');

------------------------------------------------------------------------------------------------------------
--메세지

INSERT INTO MESSAGE VALUES('msg' || LPAD(MESSAGE_SEQ.NEXTVAL,4,0), 'ch0001', 'TESTSET', 'e0013', SYSDATE);
INSERT INTO MESSAGE VALUES('msg' || LPAD(MESSAGE_SEQ.NEXTVAL,4,0), 'ch0001', 'TESTSET12', 'e0016', SYSDATE);
INSERT INTO MESSAGE VALUES('msg' || LPAD(MESSAGE_SEQ.NEXTVAL,4,0), 'ch0001', 'TESTSET3232', 'e0020', SYSDATE);
INSERT INTO MESSAGE VALUES('msg' || LPAD(MESSAGE_SEQ.NEXTVAL,4,0), 'ch0002', 'chat2 TESTSET3232', 'e0021', SYSDATE);

---------------------------------------------------------------------------------------------------------
--참가자

INSERT INTO CHAT_EMP VALUES ('e0003', 'ch0001', null, null);
INSERT INTO CHAT_EMP VALUES ('e0004', 'ch0001', null, null);
INSERT INTO CHAT_EMP VALUES ('e0003', 'ch0002', null, null);

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--카테고리
INSERT INTO CATEGORY VALUES ('cate' || LPAD(CATEGORY_SEQ .NEXTVAL,4,0), '내 일정', '#372A50', null, 'e0009');
INSERT INTO CATEGORY VALUES ('cate' || LPAD(CATEGORY_SEQ .NEXTVAL,4,0), '내 일정_중요', '#C80141', null, 'e0009');
INSERT INTO CATEGORY VALUES ('cate' || LPAD(CATEGORY_SEQ .NEXTVAL,4,0), '개발1팀', '#FFBF00', 'de0002', 'e0005');
INSERT INTO CATEGORY VALUES ('cate' || LPAD(CATEGORY_SEQ .NEXTVAL,4,0), '개발1팀_중요', '#CDA85C', 'de0002', 'e0005');
INSERT INTO CATEGORY VALUES ('cate' || LPAD(CATEGORY_SEQ .NEXTVAL,4,0), '개발1팀_생일', '#0D9A00', 'de0002', 'e0005');
INSERT INTO CATEGORY VALUES ('cate' || LPAD(CATEGORY_SEQ .NEXTVAL,4,0), '개발1팀_이벤트', '#00C0EF', 'de0002', 'e0005');
INSERT INTO CATEGORY VALUES ('cate' || LPAD(CATEGORY_SEQ .NEXTVAL,4,0), '개발2팀', '#FFBF00', 'de0003', 'e0006');
INSERT INTO CATEGORY VALUES ('cate' || LPAD(CATEGORY_SEQ .NEXTVAL,4,0), '개발2팀_중요', '#CDA85C', 'de0003', 'e0006');
INSERT INTO CATEGORY VALUES ('cate' || LPAD(CATEGORY_SEQ .NEXTVAL,4,0), '개발2팀_생일', '#0D9A00', 'de0003', 'e0006');
INSERT INTO CATEGORY VALUES ('cate' || LPAD(CATEGORY_SEQ .NEXTVAL,4,0), '개발2팀_이벤트', '#00C0EF', 'de0003', 'e0006');
INSERT INTO CATEGORY VALUES ('cate' || LPAD(CATEGORY_SEQ .NEXTVAL,4,0), '임원 휴가', '#22FF94', 'de0001', 'e0002');
INSERT INTO CATEGORY VALUES ('cate' || LPAD(CATEGORY_SEQ .NEXTVAL,4,0), '개발1팀 휴가', '#FF7F50', 'de0002', 'e0005');

---------------------------------------------------------------------------------------------------------------
--일정
  -- 개인
INSERT INTO CALENDAR VALUES 
     ('cal' || LPAD(CALENDAR_SEQ .NEXTVAL,4,0), '치과 예약', '서울치과병원', TO_DATE('201910101800', 'YYYYMMDDHH24MI'),
      TO_DATE('201910101800', 'YYYYMMDDHH24MI'), 'F', null, 'e0009', 'cate0002');
INSERT INTO CALENDAR VALUES
     ('cal' || LPAD(CALENDAR_SEQ .NEXTVAL,4,0), '멜론 만기', null, TO_DATE('201910150000', 'YYYYMMDDHH24MI'), 
      TO_DATE('201910152359', 'YYYYMMDDHH24MI'), 'T', null, 'e0009', 'cate0001');
INSERT INTO CALENDAR VALUES 
     ('cal' || LPAD(CALENDAR_SEQ .NEXTVAL,4,0), '정보처리기사 접수기간', null, TO_DATE('201910140000', 'YYYYMMDDHH24MI'),
      TO_DATE('201910182359', 'YYYYMMDDHH24MI'), 'T', null, 'e0009', 'cate0002');
INSERT INTO CALENDAR VALUES 
     ('cal' || LPAD(CALENDAR_SEQ .NEXTVAL,4,0), '세스코 예약', null, TO_DATE('201910201830', 'YYYYMMDDHH24MI'),
      TO_DATE('201910201830', 'YYYYMMDDHH24MI'), 'F', null, 'e0009', 'cate0001');
INSERT INTO CALENDAR VALUES 
     ('cal' || LPAD(CALENDAR_SEQ .NEXTVAL,4,0), '900일 데이트', null, TO_DATE('201911120000', 'YYYYMMDDHH24MI'),
      TO_DATE('201911122359', 'YYYYMMDDHH24MI'), 'F', null, 'e0009', 'cate0002');
INSERT INTO CALENDAR VALUES 
     ('cal' || LPAD(CALENDAR_SEQ .NEXTVAL,4,0), '치과 예약', '서울치과병원', TO_DATE('201910171800', 'YYYYMMDDHH24MI'),
      TO_DATE('201910171800', 'YYYYMMDDHH24MI'), 'F', null, 'e0009', 'cate0002');  
INSERT INTO CALENDAR VALUES 
     ('cal' || LPAD(CALENDAR_SEQ .NEXTVAL,4,0), '세차 예약', null, TO_DATE('201910201500', 'YYYYMMDDHH24MI'),
      TO_DATE('201910201600', 'YYYYMMDDHH24MI'), 'F', null, 'e0009', 'cate0001');        
INSERT INTO CALENDAR VALUES 
     ('cal' || LPAD(CALENDAR_SEQ .NEXTVAL,4,0), '출장', null, TO_DATE('201910281300', 'YYYYMMDDHH24MI'),
      TO_DATE('201911011800', 'YYYYMMDDHH24MI'), 'F', null, 'e0009', 'cate0002');   

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--일정
  -- 부서
INSERT INTO CALENDAR VALUES
     ('cal' || LPAD(CALENDAR_SEQ .NEXTVAL,4,0), '웹프로젝트 산출물 기간', null, TO_DATE('201909300000', 'YYYYMMDDHH24MI'), 
      TO_DATE('201910042359', 'YYYYMMDDHH24MI'), 'T', 'de0002', 'e0009', 'cate0003');
INSERT INTO CALENDAR VALUES
     ('cal' || LPAD(CALENDAR_SEQ .NEXTVAL,4,0), '웹프로젝트 코딩 기간', null, TO_DATE('201910070000', 'YYYYMMDDHH24MI'), 
      TO_DATE('201910182359', 'YYYYMMDDHH24MI'), 'T', 'de0002', 'e0009', 'cate0003');
INSERT INTO CALENDAR VALUES
     ('cal' || LPAD(CALENDAR_SEQ .NEXTVAL,4,0), '웹프로젝트 마무리 기간', null, TO_DATE('201910210000', 'YYYYMMDDHH24MI'), 
      TO_DATE('201910252359', 'YYYYMMDDHH24MI'), 'T', 'de0002', 'e0009', 'cate0003');
INSERT INTO CALENDAR VALUES
     ('cal' || LPAD(CALENDAR_SEQ .NEXTVAL,4,0), '웹프로젝트 발표', null, TO_DATE('201910281000', 'YYYYMMDDHH24MI'), 
      TO_DATE('201910281200', 'YYYYMMDDHH24MI'), 'F', 'de0002', 'e0009', 'cate0004');
INSERT INTO CALENDAR VALUES
     ('cal' || LPAD(CALENDAR_SEQ .NEXTVAL,4,0), '1팀 회식', '하남돼지', TO_DATE('201910301900', 'YYYYMMDDHH24MI'), 
      TO_DATE('201910301900', 'YYYYMMDDHH24MI'), 'F', 'de0002', 'e0009', 'cate0006');
INSERT INTO CALENDAR VALUES
     ('cal' || LPAD(CALENDAR_SEQ .NEXTVAL,4,0), '배상현 생일', null, TO_DATE('201910010000', 'YYYYMMDDHH24MI'), 
      TO_DATE('201910012359', 'YYYYMMDDHH24MI'), 'T', 'de0002', 'e0005', 'cate0005');
INSERT INTO CALENDAR VALUES
     ('cal' || LPAD(CALENDAR_SEQ .NEXTVAL,4,0), '조민수 생일', null, TO_DATE('201909030000', 'YYYYMMDDHH24MI'), 
      TO_DATE('201909032359', 'YYYYMMDDHH24MI'), 'T', 'de0002', 'e0009', 'cate0005');
INSERT INTO CALENDAR VALUES
     ('cal' || LPAD(CALENDAR_SEQ .NEXTVAL,4,0), '전민규 생일', null, TO_DATE('201909150000', 'YYYYMMDDHH24MI'), 
      TO_DATE('201909152359', 'YYYYMMDDHH24MI'), 'T', 'de0002', 'e0013', 'cate0005');
INSERT INTO CALENDAR VALUES
     ('cal' || LPAD(CALENDAR_SEQ .NEXTVAL,4,0), '김도훈 생일', null, TO_DATE('201910150000', 'YYYYMMDDHH24MI'), 
      TO_DATE('201910152359', 'YYYYMMDDHH24MI'), 'T', 'de0002', 'e0014', 'cate0005');
INSERT INTO CALENDAR VALUES
     ('cal' || LPAD(CALENDAR_SEQ .NEXTVAL,4,0), '홍다은 생일', null, TO_DATE('201910250000', 'YYYYMMDDHH24MI'), 
      TO_DATE('201910252359', 'YYYYMMDDHH24MI'), 'T', 'de0002', 'e0015', 'cate0005');
INSERT INTO CALENDAR VALUES
     ('cal' || LPAD(CALENDAR_SEQ .NEXTVAL,4,0), '송찬중 휴가', null, TO_DATE('201910100000', 'YYYYMMDDHH24MI'),
      TO_DATE('201910242359', 'YYYYMMDDHH24MI'), 'T', 'de0001', 'e0003', 'cate0011');
INSERT INTO CALENDAR VALUES
     ('cal' || LPAD(CALENDAR_SEQ .NEXTVAL,4,0), '배상현 휴가', null, TO_DATE('201910150000', 'YYYYMMDDHH24MI'),
      TO_DATE('201910162359', 'YYYYMMDDHH24MI'), 'T', 'de0002', 'e0005', 'cate0012');
commit;
