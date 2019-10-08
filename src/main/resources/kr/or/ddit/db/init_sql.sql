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
insert into position values('posi' || LPAD(POSITION_SEQ.NEXTVAL,4,0), '사원');
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--부서
INSERT INTO DEPARTMENT VALUES ('de' || LPAD(DEPARTMENT_SEQ.NEXTVAL,4,0), '사장');
INSERT INTO DEPARTMENT VALUES ('de' || LPAD(DEPARTMENT_SEQ.NEXTVAL,4,0), '개발');
INSERT INTO DEPARTMENT VALUES ('de' || LPAD(DEPARTMENT_SEQ.NEXTVAL,4,0), '홍보');

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--사원


insert into employee values('e' || LPAD(EMPLOYEE_SEQ.NEXTVAL,4,0), 'test1234', 'test1', '사장', 'test@mail.com', '1234567', sysdate, 'de001', 'posi001', null, null, 'Y', null);
insert into employee values('e' || LPAD(EMPLOYEE_SEQ.NEXTVAL,4,0), 'test1234', 'test2', '관리자', 'test@mail.com', '1234567', sysdate, 'de002', 'posi002', null, null, 'Y', null);
insert into employee values('e' || LPAD(EMPLOYEE_SEQ.NEXTVAL,4,0), 'test1234', 'test3', '사원', 'test@mail.com', '1234567', sysdate, 'de002', 'posi002', null, null, 'Y', null);
insert into employee values('e' || LPAD(EMPLOYEE_SEQ.NEXTVAL,4,0), 'test1234', 'test3', '사원', 'test@mail.com', '1234567', sysdate, 'de003', 'posi002', null, null, 'Y', null);
insert into employee values('e' || LPAD(EMPLOYEE_SEQ.NEXTVAL,4,0), 'test1234', 'test3', '사원', 'test@mail.com', '1234567', sysdate, 'de003', 'posi002', null, null, 'Y', null);
insert into employee values('e' || LPAD(EMPLOYEE_SEQ.NEXTVAL,4,0), 'test1234', 'test3', '사원', 'test@mail.com', '1234567', sysdate, 'de003', 'posi002', null, null, 'Y', null);
insert into employee values('e' || LPAD(EMPLOYEE_SEQ.NEXTVAL,4,0), 'test1234', 'test3', '사원', 'testhoon1217@gmail.com', '1234567', sysdate, 'de003', 'posi002', null, null, 'Y', 'ewqdsa556');


-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--출퇴근

insert into commute values('e001', sysdate, to_date('201910020900', 'YYYYMMDDHH24MI'), to_date('201910022000', 'YYYYMMDDHH24MI'), '출석', null); 
insert into commute values('e002', sysdate, to_date('201910020850', 'YYYYMMDDHH24MI'), to_date('201910021900', 'YYYYMMDDHH24MI'), '출석', null); 
insert into commute values('e003', sysdate, to_date('201910021000', 'YYYYMMDDHH24MI'), to_date('201910021800', 'YYYYMMDDHH24MI'), '출석', null); 
insert into commute values('e004', sysdate, to_date('201910021030', 'YYYYMMDDHH24MI'), to_date('201910022100', 'YYYYMMDDHH24MI'), '출석', null); 


---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--결재선

INSERT INTO APPROVAL(APPR_LINE_ID, APPR_LINE_NM) VALUES ('app' || LPAD(APPROVAL_SEQ.NEXTVAL,4,0), 'TEST결제1');
INSERT INTO APPROVAL(APPR_LINE_ID, APPR_LINE_NM) VALUES ('app' || LPAD(APPROVAL_SEQ.NEXTVAL,4,0), 'TEST결제2');


---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--개별 결재선

INSERT INTO ERD_APPR(APPR_LINE_ID, APPR_LINE_OWNER) VALUES ('app001', 'e003');
INSERT INTO ERD_APPR(APPR_LINE_ID, APPR_LINE_OWNER) VALUES ('app002', 'e004');
INSERT INTO ERD_APPR(APPR_LINE_ID, APPR_LINE_OWNER) VALUES ('app002', 'e003');


------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--결재선 멤버

INSERT INTO APPR_MEMBER(APPR_EMP, APPR_LINE_ID, APPR_LINE_OWNER, AP_ORDER) VALUES('e002', 'app001', 'e003', 1);
INSERT INTO APPR_MEMBER(APPR_EMP, APPR_LINE_ID, APPR_LINE_OWNER, AP_ORDER) VALUES('e002', 'app002', 'e004', 2);


------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--신청서 양식

INSERT INTO FORM(FORM_ID, FORM_NM, FORM_CONT, APPR_LINE_ID) VALUES ('form' || LPAD(FORM_SEQ.NEXTVAL,4,0), '휴가신청서', '휴가TEST', 'app001');
INSERT INTO FORM(FORM_ID, FORM_NM, FORM_CONT, APPR_LINE_ID) VALUES ('form' || LPAD(FORM_SEQ.NEXTVAL,4,0), '반차신청서', '반차TEST', 'app002');

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--신청서 

INSERT INTO APPLICATION VALUES ('appl' || LPAD(APPLICATION_SEQ.NEXTVAL,4,0), '휴가쓰겟다TEST', '휴가휴가TEST', SYSDATE, 'form001', 'e004');
INSERT INTO APPLICATION VALUES ('appl' || LPAD(APPLICATION_SEQ.NEXTVAL,4,0), '반차쓰겟다TEST22', '반차반차TEST22', SYSDATE, 'form002', 'e003');

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--신청서 결재

INSERT INTO APPL_APPR VALUES('appl001', 'e002', 1, 'Y');
INSERT INTO APPL_APPR VALUES('appl002', 'e002', 2, 'F');

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--게시판

INSERT INTO BOARD(BOARD_ID, EMP_ID, BOARD_NM, REG_DT, ABLE) VALUES('board' || LPAD(BOARD_SEQ.NEXTVAL,4,0), 'e002', '관리자',SYSDATE, 'Y');
INSERT INTO BOARD(BOARD_ID, EMP_ID, BOARD_NM, REG_DT, ABLE) VALUES('board' || LPAD(BOARD_SEQ.NEXTVAL,4,0), 'e002', '사내게시판',SYSDATE, 'F');

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--게시글

INSERT INTO POST(POST_ID, BOARD_ID, TITLE, CONT, EMP_ID, REG_DT, ABLE, PA_POST_ID) VALUES ('post' || LPAD(POST_SEQ.NEXTVAL,4,0), 'board001', 'TEST', 'TEST', 'e004', SYSDATE, 'F', NULL);
INSERT INTO POST(POST_ID, BOARD_ID, TITLE, CONT, EMP_ID, REG_DT, ABLE, PA_POST_ID) VALUES ('post' || LPAD(POST_SEQ.NEXTVAL,4,0), 'board002', 'TEST', 'TEST', 'e004', SYSDATE, 'F', NULL);
INSERT INTO POST(POST_ID, BOARD_ID, TITLE, CONT, EMP_ID, REG_DT, ABLE, PA_POST_ID) VALUES ('post' || LPAD(POST_SEQ.NEXTVAL,4,0), 'board002', 'TEST', 'TEST', 'e003', SYSDATE, 'F', 'post002');

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--게시글 파일

INSERT INTO POST_FILE(FILE_ID, POST_ID, FILE_NM, REALFILEPATH) VALUES ('f' || LPAD(POST_FILE_SEQ.NEXTVAL,4,0), 'post002', 'TEST01', 'D:\UPLOAD\RANGERS\BROWN.PNG');
INSERT INTO POST_FILE(FILE_ID, POST_ID, FILE_NM, REALFILEPATH) VALUES ('f' || LPAD(POST_FILE_SEQ.NEXTVAL,4,0), 'post002', 'TEST02', 'D:\UPLOAD\RANGERS\CONY.PNG');


------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--댓글

INSERT INTO COMMENTS(COM_ID, POST_ID, EMP_ID, REG_DT, CONT, ABLE, PA_COM_ID) VALUES ('com' || LPAD(COMMENTS_SEQ.NEXTVAL,4,0), 'post002', 'e003', SYSDATE, 'TEST', 'F', NULL);
INSERT INTO COMMENTS(COM_ID, POST_ID, EMP_ID, REG_DT, CONT, ABLE, PA_COM_ID) VALUES ('com' || LPAD(COMMENTS_SEQ.NEXTVAL,4,0), 'post002', 'e003', SYSDATE, 'TEST', 'F', 'com001');

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--업무

INSERT INTO TASK(TASK_ID, TASK_CONT, ST_DT, END_DT, PRO_ID, PA_TASK_ID) VALUES ('task' || LPAD(TASK_SEQ.NEXTVAL,4,0), 'TEST', to_date('20191002', 'YYYYMMDD'), to_date('20191020', 'YYYYMMDD'), 'pj001', NULL);
INSERT INTO TASK(TASK_ID, TASK_CONT, ST_DT, END_DT, PRO_ID, PA_TASK_ID) VALUES ('task' || LPAD(TASK_SEQ.NEXTVAL,4,0), 'TESTTEST', to_date('20191002', 'YYYYMMDD'), to_date('20191020', 'YYYYMMDD'), 'pj001', 'task001');


-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--업무 담당자

INSERT INTO PRO_TASK VALUES('e002', 'task001', 'pj001');
INSERT INTO PRO_TASK VALUES('e003', 'task002', 'pj001');

-------------------------------------------------------------------------------------------------------------------------------------------------
--프로젝트

INSERT INTO PROJECT(PRO_ID, PRO_NM, ST_DT, END_DT, PA_PRO_ID) VALUES ('pj' || LPAD(PROJECT_SEQ.NEXTVAL,4,0), 'TESTPROJECT1', to_date('20191002', 'YYYYMMDD'), to_date('20191020', 'YYYYMMDD'), NULL);
INSERT INTO PROJECT(PRO_ID, PRO_NM, ST_DT, END_DT, PA_PRO_ID) VALUES ('pj' || LPAD(PROJECT_SEQ.NEXTVAL,4,0), 'TESTPROJECT2', to_date('20191002', 'YYYYMMDD'), to_date('20191020', 'YYYYMMDD'), 'pj001');

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--프로젝트 구성원

INSERT INTO PRO_POSITION VALUES('e003', 'pj001', 'posi001');
INSERT INTO PRO_POSITION VALUES('e002', 'pj001', 'posi001');

------------------------------------------------------------------------------------------------------------------
--팝업

INSERT INTO POPUP VALUES('pop' || LPAD(POPUP_SEQ.NEXTVAL,4,0), NULL, NULL, NULL, NULL, NULL, NULL, 'TESTTES', 'TESTESTSETSET', SYSDATE, 'e003');
INSERT INTO POPUP VALUES('pop' || LPAD(POPUP_SEQ.NEXTVAL,4,0), NULL, NULL, NULL, NULL, NULL, NULL, 'TESTTES1', 'TESTESTSETSET1', SYSDATE, 'e003');

--------------------------------------------------------------------------------------------------------------------------------
--채팅방
 
INSERT INTO CHAT VALUES('ch' || LPAD(CHAT_SEQ.NEXTVAL,4,0), 'TESTCHAT1', 'Y');
INSERT INTO CHAT VALUES('ch' || LPAD(CHAT_SEQ.NEXTVAL,4,0), 'TESTCHAT2', 'Y');

------------------------------------------------------------------------------------------------------------
--메세지

INSERT INTO MESSAGE VALUES('msg' || LPAD(MESSAGE_SEQ.NEXTVAL,4,0), 'ch001', 'TESTSET', 'e003', SYSDATE);
INSERT INTO MESSAGE VALUES('msg' || LPAD(MESSAGE_SEQ.NEXTVAL,4,0), 'ch001', 'TESTSET12', 'e003', SYSDATE);
INSERT INTO MESSAGE VALUES('msg' || LPAD(MESSAGE_SEQ.NEXTVAL,4,0), 'ch001', 'TESTSET3232', 'e004', SYSDATE);
INSERT INTO MESSAGE VALUES('msg' || LPAD(MESSAGE_SEQ.NEXTVAL,4,0), 'ch002', 'chat2 TESTSET3232', 'e004', SYSDATE);

---------------------------------------------------------------------------------------------------------
--참가자

INSERT INTO CHAT_EMP VALUES ('e003', 'ch001');
INSERT INTO CHAT_EMP VALUES ('e004', 'ch001');
INSERT INTO CHAT_EMP VALUES ('e004', 'ch002');

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--카테고리

INSERT INTO CATEGORY VALUES ('cate' || LPAD(CATEGORY_SEQ .NEXTVAL,4,0), '내 일정', '616264', null, 'e0003');
INSERT INTO CATEGORY VALUES ('cate' || LPAD(CATEGORY_SEQ .NEXTVAL,4,0), '내 일정_중요', 'C23352', null, 'e0003');
INSERT INTO CATEGORY VALUES ('cate' || LPAD(CATEGORY_SEQ .NEXTVAL,4,0), '부서1', 'F7B938', 'de0001', 'e0001');
INSERT INTO CATEGORY VALUES ('cate' || LPAD(CATEGORY_SEQ .NEXTVAL,4,0), '부서2', 'F7B938', 'de0002', 'e0002');
INSERT INTO CATEGORY VALUES ('cate' || LPAD(CATEGORY_SEQ .NEXTVAL,4,0), '부서3', 'F7B938', 'de0003', 'e0001');
INSERT INTO CATEGORY VALUES ('cate' || LPAD(CATEGORY_SEQ .NEXTVAL,4,0), '부서1_중요', 'F9D537', 'de0001', 'e0001');
INSERT INTO CATEGORY VALUES ('cate' || LPAD(CATEGORY_SEQ .NEXTVAL,4,0), '부서1_이벤트', '00A6A9', 'de0001', 'e0001');
INSERT INTO CATEGORY VALUES ('cate' || LPAD(CATEGORY_SEQ .NEXTVAL,4,0), '부서2_중요', 'F9D537', 'de0002', 'e0002');
INSERT INTO CATEGORY VALUES ('cate' || LPAD(CATEGORY_SEQ .NEXTVAL,4,0), '부서2_이벤트', '00A6A9', 'de0002', 'e0002');
INSERT INTO CATEGORY VALUES ('cate' || LPAD(CATEGORY_SEQ .NEXTVAL,4,0), '부서2_생일', '009770', 'de0002', 'e0002');
INSERT INTO CATEGORY VALUES ('cate' || LPAD(CATEGORY_SEQ .NEXTVAL,4,0), '부서1_생일', '009770', 'de0001', 'e0001');
INSERT INTO CATEGORY VALUES ('cate' || LPAD(CATEGORY_SEQ .NEXTVAL,4,0), '부서3_생일', '009770', 'de0003', 'e0001');

---------------------------------------------------------------------------------------------------------------
--일정
  -- 개인
INSERT INTO CALENDAR VALUES 
     ('cal' || LPAD(CALENDAR_SEQ .NEXTVAL,4,0), '치과 예약', '서울치과병원', TO_DATE('201910101800', 'YYYYMMDDHH24MI'),
      TO_DATE('201910101800', 'YYYYMMDDHH24MI'), 'F', null, 'e0003', 'cate0002');
INSERT INTO CALENDAR VALUES
     ('cal' || LPAD(CALENDAR_SEQ .NEXTVAL,4,0), '멜론 만기', null, TO_DATE('20191015', 'YYYYMMDD'), 
      TO_DATE('20191015', 'YYYYMMDD'), 'T', null, 'e0003', 'cate0001');
INSERT INTO CALENDAR VALUES 
     ('cal' || LPAD(CALENDAR_SEQ .NEXTVAL,4,0), '정보처리기사 접수기간', null, TO_DATE('20191014', 'YYYYMMDD'),
      TO_DATE('20191018', 'YYYYMMDD'), 'T', null, 'e0003', 'cate0002');
INSERT INTO CALENDAR VALUES 
     ('cal' || LPAD(CALENDAR_SEQ .NEXTVAL,4,0), '세스코 예약', null, TO_DATE('201910201830', 'YYYYMMDDHH24MI'),
      TO_DATE('201910201830', 'YYYYMMDDHH24MI'), 'F', null, 'e0003', 'cate0001');
INSERT INTO CALENDAR VALUES 
     ('cal' || LPAD(CALENDAR_SEQ .NEXTVAL,4,0), '900일 데이트', null, TO_DATE('20191112', 'YYYYMMDD'),
      TO_DATE('20191112', 'YYYYMMDD'), 'F', null, 'e0003', 'cate0002');
INSERT INTO CALENDAR VALUES 
     ('cal' || LPAD(CALENDAR_SEQ .NEXTVAL,4,0), '치과 예약', '서울치과병원', TO_DATE('201910171800', 'YYYYMMDDHH24MI'),
      TO_DATE('201910171800', 'YYYYMMDDHH24MI'), 'F', null, 'e0003', 'cate0002');  
INSERT INTO CALENDAR VALUES 
     ('cal' || LPAD(CALENDAR_SEQ .NEXTVAL,4,0), '세차 예약', null, TO_DATE('201910201500', 'YYYYMMDDHH24MI'),
      TO_DATE('201910201500', 'YYYYMMDDHH24MI'), 'F', null, 'e0003', 'cate0001');        
INSERT INTO CALENDAR VALUES 
     ('cal' || LPAD(CALENDAR_SEQ .NEXTVAL,4,0), '출장', null, TO_DATE('201910281300', 'YYYYMMDDHH24MI'),
      TO_DATE('201911011800', 'YYYYMMDDHH24MI'), 'F', null, 'e0003', 'cate0002');   

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--일정
  -- 부서
INSERT INTO CALENDAR VALUES
     ('cal' || LPAD(CALENDAR_SEQ .NEXTVAL,4,0), '웹프로젝트 산출물 기간', null, TO_DATE('20190930', 'YYYYMMDD'), 
      TO_DATE('20191004', 'YYYYMMDD'), 'T', 'de0002', 'e0002', 'cate0008');
INSERT INTO CALENDAR VALUES
     ('cal' || LPAD(CALENDAR_SEQ .NEXTVAL,4,0), '웹프로젝트 코딩 기간', null, TO_DATE('20191007', 'YYYYMMDD'), 
      TO_DATE('20191018', 'YYYYMMDD'), 'T', 'de0002', 'e0002', 'cate0008');
INSERT INTO CALENDAR VALUES
     ('cal' || LPAD(CALENDAR_SEQ .NEXTVAL,4,0), '웹프로젝트 마무리 기간', null, TO_DATE('20191021', 'YYYYMMDD'), 
      TO_DATE('20191025', 'YYYYMMDD'), 'T', 'de0002', 'e0002', 'cate0008');
INSERT INTO CALENDAR VALUES
     ('cal' || LPAD(CALENDAR_SEQ .NEXTVAL,4,0), '웹프로젝트 발표', null, TO_DATE('201910281000', 'YYYYMMDDHH24MI'), 
      TO_DATE('201910281200', 'YYYYMMDDHH24MI'), 'T', 'de0002', 'e0002', 'cate0008');
INSERT INTO CALENDAR VALUES
     ('cal' || LPAD(CALENDAR_SEQ .NEXTVAL,4,0), '2팀 회식', '하남돼지', TO_DATE('201910301900', 'YYYYMMDDHH24MI'), 
      TO_DATE('201910301900', 'YYYYMMDDHH24MI'), 'F', 'de0002', 'e0002', 'cate0004');
INSERT INTO CALENDAR VALUES
     ('cal' || LPAD(CALENDAR_SEQ .NEXTVAL,4,0), '전민규 생일', null, TO_DATE('20191001', 'YYYYMMDD'), 
      TO_DATE('20191001', 'YYYYMMDD'), 'T', 'de0002', null, 'cate0010');
INSERT INTO CALENDAR VALUES
     ('cal' || LPAD(CALENDAR_SEQ .NEXTVAL,4,0), '김도훈 생일', null, TO_DATE('20191020', 'YYYYMMDD'), 
      TO_DATE('20191020', 'YYYYMMDD'), 'T', 'de0002', null, 'cate0010');

COMMIT;
