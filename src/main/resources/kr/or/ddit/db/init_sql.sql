--삭제---------------------------------------------------------------
-- 일정
drop sequence CALENDAR_SEQ;
CREATE SEQUENCE CALENDAR_SEQ START WITH 1 INCREMENT BY 1 nocache;
delete from calendar;

--카테고리
DROP sequence CATEGORY_SEQ;
CREATE SEQUENCE CATEGORY_SEQ START WITH 1 INCREMENT BY 1 nocache;
delete from category;

-- 업무 기록
drop sequence TASK_HISTORY_SEQ;
CREATE SEQUENCE TASK_HISTORY_SEQ START WITH 1 INCREMENT BY 1 nocache;
delete from task_history;

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
							TO_DATE(20170906, 'YYYY/MM/DD'), 'de0003', 'posi0004', 'C:\picture\cony.png', null, 'T', null);
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

INSERT INTO BOARD(BOARD_ID, EMP_ID, BOARD_NM, REG_DT, ABLE) VALUES('board' || LPAD(BOARD_SEQ.NEXTVAL,4,0), 'admin', '공지사항',SYSDATE, 'T');
INSERT INTO BOARD(BOARD_ID, EMP_ID, BOARD_NM, REG_DT, ABLE) VALUES('board' || LPAD(BOARD_SEQ.NEXTVAL,4,0), 'admin', '사내게시판',SYSDATE, 'T');
INSERT INTO BOARD(BOARD_ID, EMP_ID, BOARD_NM, REG_DT, ABLE) VALUES('board' || LPAD(BOARD_SEQ.NEXTVAL,4,0), 'admin', '자료실',SYSDATE, 'T');

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

INSERT INTO PROJECT VALUES ('pj' || LPAD(PROJECT_SEQ.NEXTVAL,4,0), '영화관 예매 시스템', to_date('20190612', 'YYYYMMDD'), to_date('20190906', 'YYYYMMDD'), NULL);
INSERT INTO PROJECT VALUES ('pj' || LPAD(PROJECT_SEQ.NEXTVAL,4,0), '유기동물 입양 시스템', to_date('20190819', 'YYYYMMDD'), to_date('20190906', 'YYYYMMDD'), NULL);
INSERT INTO PROJECT VALUES ('pj' || LPAD(PROJECT_SEQ.NEXTVAL,4,0), '스마트 웨어', to_date('20190916', 'YYYYMMDD'), to_date('20191129', 'YYYYMMDD'), NULL);
     
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--프로젝트 구성원

INSERT INTO PRO_POSITION VALUES('e0002', 'pj0001', 'job0003');
INSERT INTO PRO_POSITION VALUES('e0005', 'pj0001', 'job0004');
INSERT INTO PRO_POSITION VALUES('e0009', 'pj0001', 'job0004');
INSERT INTO PRO_POSITION VALUES('e0013', 'pj0001', 'job0004');
INSERT INTO PRO_POSITION VALUES('e0015', 'pj0001', 'job0004');

INSERT INTO PRO_POSITION VALUES('e0002', 'pj0002', 'job0003');
INSERT INTO PRO_POSITION VALUES('e0005', 'pj0002', 'job0004');
INSERT INTO PRO_POSITION VALUES('e0009', 'pj0002', 'job0004');
INSERT INTO PRO_POSITION VALUES('e0013', 'pj0002', 'job0004');
INSERT INTO PRO_POSITION VALUES('e0015', 'pj0002', 'job0004');

INSERT INTO PRO_POSITION VALUES('e0005', 'pj0003', 'job0003');
INSERT INTO PRO_POSITION VALUES('e0009', 'pj0003', 'job0004');
INSERT INTO PRO_POSITION VALUES('e0013', 'pj0003', 'job0004');
INSERT INTO PRO_POSITION VALUES('e0014', 'pj0003', 'job0004');
INSERT INTO PRO_POSITION VALUES('e0015', 'pj0003', 'job0004');

------------------------------------------------------------------------------------------------------------------
--업무

-- pj0001
INSERT INTO TASK VALUES ('task' || LPAD(TASK_SEQ.NEXTVAL,4,0), '로그인', to_date('201906120000', 'YYYYMMDDHH24MI'), to_date('201907052359', 'YYYYMMDDHH24MI'), 'pj0001', null, 100);
INSERT INTO TASK VALUES ('task' || LPAD(TASK_SEQ.NEXTVAL,4,0), '로그아웃', to_date('201906120000', 'YYYYMMDDHH24MI'), to_date('201907052359', 'YYYYMMDDHH24MI'), 'pj0001', null, 100);
INSERT INTO TASK VALUES ('task' || LPAD(TASK_SEQ.NEXTVAL,4,0), '게시판 구현', to_date('201906120000', 'YYYYMMDDHH24MI'), to_date('201907052359', 'YYYYMMDDHH24MI'), 'pj0001', null, 100);
INSERT INTO TASK VALUES ('task' || LPAD(TASK_SEQ.NEXTVAL,4,0), '예매 구현', to_date('201906120000', 'YYYYMMDDHH24MI'), to_date('201907052359', 'YYYYMMDDHH24MI'), 'pj0001', null, 100);
INSERT INTO TASK VALUES ('task' || LPAD(TASK_SEQ.NEXTVAL,4,0), '공지사항 구현', to_date('201907080000', 'YYYYMMDDHH24MI'), to_date('201907262359', 'YYYYMMDDHH24MI'), 'pj0001', null, 100);
INSERT INTO TASK VALUES ('task' || LPAD(TASK_SEQ.NEXTVAL,4,0), '영화관 배치 구현', to_date('201907080000', 'YYYYMMDDHH24MI'), to_date('201907262359', 'YYYYMMDDHH24MI'), 'pj0001', null, 100);
INSERT INTO TASK VALUES ('task' || LPAD(TASK_SEQ.NEXTVAL,4,0), '예매 내역 구현', to_date('201907080000', 'YYYYMMDDHH24MI'), to_date('201907262359', 'YYYYMMDDHH24MI'), 'pj0001', null, 100);
INSERT INTO TASK VALUES ('task' || LPAD(TASK_SEQ.NEXTVAL,4,0), '영화관 관리 구현', to_date('201907080000', 'YYYYMMDDHH24MI'), to_date('201907262359', 'YYYYMMDDHH24MI'), 'pj0001', null, 100);
INSERT INTO TASK VALUES ('task' || LPAD(TASK_SEQ.NEXTVAL,4,0), '마이페이지 구현', to_date('201909020000', 'YYYYMMDDHH24MI'), to_date('201909062359', 'YYYYMMDDHH24MI'), 'pj0001', null, 100);
INSERT INTO TASK VALUES ('task' || LPAD(TASK_SEQ.NEXTVAL,4,0), '회원탈퇴 구현', to_date('201909020000', 'YYYYMMDDHH24MI'), to_date('201909062359', 'YYYYMMDDHH24MI'), 'pj0001', null, 100);

-- pj0002
-- task0011 ~ task0031
INSERT INTO TASK VALUES ('task' || LPAD(TASK_SEQ.NEXTVAL,4,0), '산출물', to_date('201908190000', 'YYYYMMDDHH24MI'), to_date('201909062359', 'YYYYMMDDHH24MI'), 'pj0002', null, 100);
INSERT INTO TASK VALUES ('task' || LPAD(TASK_SEQ.NEXTVAL,4,0), '수행계획서', to_date('201908190000', 'YYYYMMDDHH24MI'), to_date('201908232359', 'YYYYMMDDHH24MI'), 'pj0002', 'task0011', 100);
INSERT INTO TASK VALUES ('task' || LPAD(TASK_SEQ.NEXTVAL,4,0), '요구사항정의서', to_date('201908190000', 'YYYYMMDDHH24MI'), to_date('201908232359', 'YYYYMMDDHH24MI'), 'pj0002', 'task0011', 100);
INSERT INTO TASK VALUES ('task' || LPAD(TASK_SEQ.NEXTVAL,4,0), '유스케이스 정의서', to_date('201908190000', 'YYYYMMDDHH24MI'), to_date('201908232359', 'YYYYMMDDHH24MI'), 'pj0002', 'task0011', 100);
INSERT INTO TASK VALUES ('task' || LPAD(TASK_SEQ.NEXTVAL,4,0), '유스케이스 다이어그램', to_date('201908190000', 'YYYYMMDDHH24MI'), to_date('201908232359', 'YYYYMMDDHH24MI'), 'pj0002', 'task0011', 100);
INSERT INTO TASK VALUES ('task' || LPAD(TASK_SEQ.NEXTVAL,4,0), '단위업무정의서', to_date('201908190000', 'YYYYMMDDHH24MI'), to_date('201908232359', 'YYYYMMDDHH24MI'), 'pj0002', 'task0011', 100);
INSERT INTO TASK VALUES ('task' || LPAD(TASK_SEQ.NEXTVAL,4,0), '화면정의서', to_date('201908190000', 'YYYYMMDDHH24MI'), to_date('201908232359', 'YYYYMMDDHH24MI'), 'pj0002', 'task0011', 100);
INSERT INTO TASK VALUES ('task' || LPAD(TASK_SEQ.NEXTVAL,4,0), '프로세스 정의서', to_date('201908190000', 'YYYYMMDDHH24MI'), to_date('201908232359', 'YYYYMMDDHH24MI'), 'pj0002', 'task0011', 100);
INSERT INTO TASK VALUES ('task' || LPAD(TASK_SEQ.NEXTVAL,4,0), '프로세스 흐름도', to_date('201908190000', 'YYYYMMDDHH24MI'), to_date('201908232359', 'YYYYMMDDHH24MI'), 'pj0002', 'task0011', 100);
INSERT INTO TASK VALUES ('task' || LPAD(TASK_SEQ.NEXTVAL,4,0), '메뉴구조도', to_date('201908190000', 'YYYYMMDDHH24MI'), to_date('201908232359', 'YYYYMMDDHH24MI'), 'pj0002', 'task0011', 100);
INSERT INTO TASK VALUES ('task' || LPAD(TASK_SEQ.NEXTVAL,4,0), '개념 ERD', to_date('201908190000', 'YYYYMMDDHH24MI'), to_date('201908232359', 'YYYYMMDDHH24MI'), 'pj0002', 'task0011', 100);
INSERT INTO TASK VALUES ('task' || LPAD(TASK_SEQ.NEXTVAL,4,0), '논리ERD', to_date('201908190000', 'YYYYMMDDHH24MI'), to_date('201908232359', 'YYYYMMDDHH24MI'), 'pj0002', 'task0011', 100);
INSERT INTO TASK VALUES ('task' || LPAD(TASK_SEQ.NEXTVAL,4,0), '물리ERD', to_date('201908190000', 'YYYYMMDDHH24MI'), to_date('201908232359', 'YYYYMMDDHH24MI'), 'pj0002', 'task0011', 100);
INSERT INTO TASK VALUES ('task' || LPAD(TASK_SEQ.NEXTVAL,4,0), '테이블 정의서', to_date('201908190000', 'YYYYMMDDHH24MI'), to_date('201908232359', 'YYYYMMDDHH24MI'), 'pj0002', 'task0011', 100);
INSERT INTO TASK VALUES ('task' || LPAD(TASK_SEQ.NEXTVAL,4,0), '명명규칙', to_date('201908190000', 'YYYYMMDDHH24MI'), to_date('201908232359', 'YYYYMMDDHH24MI'), 'pj0002', 'task0011', 100);
INSERT INTO TASK VALUES ('task' || LPAD(TASK_SEQ.NEXTVAL,4,0), '개발환경구축완료보고서', to_date('201908190000', 'YYYYMMDDHH24MI'), to_date('201908232359', 'YYYYMMDDHH24MI'), 'pj0002', 'task0011', 100);
INSERT INTO TASK VALUES ('task' || LPAD(TASK_SEQ.NEXTVAL,4,0), '단위테스트시나리오', to_date('201909020000', 'YYYYMMDDHH24MI'), to_date('201909062359', 'YYYYMMDDHH24MI'), 'pj0002', 'task0011', 100);
INSERT INTO TASK VALUES ('task' || LPAD(TASK_SEQ.NEXTVAL,4,0), '통합테스트시나리오', to_date('201909020000', 'YYYYMMDDHH24MI'), to_date('201909062359', 'YYYYMMDDHH24MI'), 'pj0002', 'task0011', 100);
INSERT INTO TASK VALUES ('task' || LPAD(TASK_SEQ.NEXTVAL,4,0), '사용자 메뉴얼', to_date('201909020000', 'YYYYMMDDHH24MI'), to_date('201909062359', 'YYYYMMDDHH24MI'), 'pj0002', 'task0011', 100);
INSERT INTO TASK VALUES ('task' || LPAD(TASK_SEQ.NEXTVAL,4,0), '운영자 메뉴얼', to_date('201909020000', 'YYYYMMDDHH24MI'), to_date('201909062359', 'YYYYMMDDHH24MI'), 'pj0002', 'task0011', 100);
INSERT INTO TASK VALUES ('task' || LPAD(TASK_SEQ.NEXTVAL,4,0), '결함관리대장', to_date('201909020000', 'YYYYMMDDHH24MI'), to_date('201909062359', 'YYYYMMDDHH24MI'), 'pj0002', 'task0011', 100);
-- task0032
INSERT INTO TASK VALUES ('task' || LPAD(TASK_SEQ.NEXTVAL,4,0), '기능구현', to_date('201908260000', 'YYYYMMDDHH24MI'), to_date('201909062359', 'YYYYMMDDHH24MI'), 'pj0002', null, 100);
-- task0033 ~ task0044
INSERT INTO TASK VALUES ('task' || LPAD(TASK_SEQ.NEXTVAL,4,0), '메인화면', to_date('201908260000', 'YYYYMMDDHH24MI'), to_date('201908302359', 'YYYYMMDDHH24MI'), 'pj0002', 'task0032', 100);
INSERT INTO TASK VALUES ('task' || LPAD(TASK_SEQ.NEXTVAL,4,0), '메뉴', to_date('201908260000', 'YYYYMMDDHH24MI'), to_date('201908302359', 'YYYYMMDDHH24MI'), 'pj0002', 'task0033', 100);
INSERT INTO TASK VALUES ('task' || LPAD(TASK_SEQ.NEXTVAL,4,0), '로그인', to_date('201908260000', 'YYYYMMDDHH24MI'), to_date('201908302359', 'YYYYMMDDHH24MI'), 'pj0002', 'task0033', 100);
INSERT INTO TASK VALUES ('task' || LPAD(TASK_SEQ.NEXTVAL,4,0), '로그아웃', to_date('201908260000', 'YYYYMMDDHH24MI'), to_date('201908302359', 'YYYYMMDDHH24MI'), 'pj0002', 'task0033', 100);
INSERT INTO TASK VALUES ('task' || LPAD(TASK_SEQ.NEXTVAL,4,0), '회원가입', to_date('201908260000', 'YYYYMMDDHH24MI'), to_date('201908302359', 'YYYYMMDDHH24MI'), 'pj0002', 'task0033', 100);
INSERT INTO TASK VALUES ('task' || LPAD(TASK_SEQ.NEXTVAL,4,0), 'ID찾기', to_date('201908260000', 'YYYYMMDDHH24MI'), to_date('201908302359', 'YYYYMMDDHH24MI'), 'pj0002', 'task0033', 100);
INSERT INTO TASK VALUES ('task' || LPAD(TASK_SEQ.NEXTVAL,4,0), 'PW찾기', to_date('201908260000', 'YYYYMMDDHH24MI'), to_date('201908302359', 'YYYYMMDDHH24MI'), 'pj0002', 'task0033', 100);
INSERT INTO TASK VALUES ('task' || LPAD(TASK_SEQ.NEXTVAL,4,0), '날씨 출력', to_date('201908260000', 'YYYYMMDDHH24MI'), to_date('201908302359', 'YYYYMMDDHH24MI'), 'pj0002', 'task0033', 100);
INSERT INTO TASK VALUES ('task' || LPAD(TASK_SEQ.NEXTVAL,4,0), '통계 출력', to_date('201908260000', 'YYYYMMDDHH24MI'), to_date('201908302359', 'YYYYMMDDHH24MI'), 'pj0002', 'task0033', 100);
INSERT INTO TASK VALUES ('task' || LPAD(TASK_SEQ.NEXTVAL,4,0), '유기동물 출력', to_date('201908260000', 'YYYYMMDDHH24MI'), to_date('201908302359', 'YYYYMMDDHH24MI'), 'pj0002', 'task0033', 100);
INSERT INTO TASK VALUES ('task' || LPAD(TASK_SEQ.NEXTVAL,4,0), '공지사항 출력', to_date('201908260000', 'YYYYMMDDHH24MI'), to_date('201908302359', 'YYYYMMDDHH24MI'), 'pj0002', 'task0033', 100);
INSERT INTO TASK VALUES ('task' || LPAD(TASK_SEQ.NEXTVAL,4,0), '입양후기 출력', to_date('201908260000', 'YYYYMMDDHH24MI'), to_date('201908302359', 'YYYYMMDDHH24MI'), 'pj0002', 'task0033', 100);
-- task0045 ~ task0050
INSERT INTO TASK VALUES ('task' || LPAD(TASK_SEQ.NEXTVAL,4,0), '소개', to_date('201908260000', 'YYYYMMDDHH24MI'), to_date('201908302359', 'YYYYMMDDHH24MI'), 'pj0002', 'task0032', 100);
INSERT INTO TASK VALUES ('task' || LPAD(TASK_SEQ.NEXTVAL,4,0), '공지사항 출력', to_date('201908260000', 'YYYYMMDDHH24MI'), to_date('201908302359', 'YYYYMMDDHH24MI'), 'pj0002', 'task0045', 100);
INSERT INTO TASK VALUES ('task' || LPAD(TASK_SEQ.NEXTVAL,4,0), '공지사항 작성', to_date('201908260000', 'YYYYMMDDHH24MI'), to_date('201908302359', 'YYYYMMDDHH24MI'), 'pj0002', 'task0045', 100);
INSERT INTO TASK VALUES ('task' || LPAD(TASK_SEQ.NEXTVAL,4,0), '공지사항 수정', to_date('201908260000', 'YYYYMMDDHH24MI'), to_date('201908302359', 'YYYYMMDDHH24MI'), 'pj0002', 'task0045', 100);
INSERT INTO TASK VALUES ('task' || LPAD(TASK_SEQ.NEXTVAL,4,0), '공지사항 삭제', to_date('201908260000', 'YYYYMMDDHH24MI'), to_date('201908302359', 'YYYYMMDDHH24MI'), 'pj0002', 'task0045', 100);
INSERT INTO TASK VALUES ('task' || LPAD(TASK_SEQ.NEXTVAL,4,0), '센터 소개', to_date('201908260000', 'YYYYMMDDHH24MI'), to_date('201908302359', 'YYYYMMDDHH24MI'), 'pj0002', 'task0045', 100);
-- task0051 ~ task0053
INSERT INTO TASK VALUES ('task' || LPAD(TASK_SEQ.NEXTVAL,4,0), '동물보호정보', to_date('201908260000', 'YYYYMMDDHH24MI'), to_date('201908302359', 'YYYYMMDDHH24MI'), 'pj0002', 'task0032', 100);
INSERT INTO TASK VALUES ('task' || LPAD(TASK_SEQ.NEXTVAL,4,0), '동물병원 리스트 출력', to_date('201908260000', 'YYYYMMDDHH24MI'), to_date('201908302359', 'YYYYMMDDHH24MI'), 'pj0002', 'task0051', 100);
INSERT INTO TASK VALUES ('task' || LPAD(TASK_SEQ.NEXTVAL,4,0), 'YOUTUBE 꿀팁', to_date('201908260000', 'YYYYMMDDHH24MI'), to_date('201908302359', 'YYYYMMDDHH24MI'), 'pj0002', 'task0051', 100);
-- task0054 ~ task0060
INSERT INTO TASK VALUES ('task' || LPAD(TASK_SEQ.NEXTVAL,4,0), '입양공고', to_date('201908260000', 'YYYYMMDDHH24MI'), to_date('201908302359', 'YYYYMMDDHH24MI'), 'pj0002', 'task0032', 100);
INSERT INTO TASK VALUES ('task' || LPAD(TASK_SEQ.NEXTVAL,4,0), '유기동물 출력', to_date('201908260000', 'YYYYMMDDHH24MI'), to_date('201908302359', 'YYYYMMDDHH24MI'), 'pj0002', 'task0054', 100);
INSERT INTO TASK VALUES ('task' || LPAD(TASK_SEQ.NEXTVAL,4,0), '유기동물 추가', to_date('201908260000', 'YYYYMMDDHH24MI'), to_date('201908302359', 'YYYYMMDDHH24MI'), 'pj0002', 'task0054', 100);
INSERT INTO TASK VALUES ('task' || LPAD(TASK_SEQ.NEXTVAL,4,0), '유기동물 변경', to_date('201908260000', 'YYYYMMDDHH24MI'), to_date('201908302359', 'YYYYMMDDHH24MI'), 'pj0002', 'task0054', 100);
INSERT INTO TASK VALUES ('task' || LPAD(TASK_SEQ.NEXTVAL,4,0), '유기동물 삭제', to_date('201908260000', 'YYYYMMDDHH24MI'), to_date('201908302359', 'YYYYMMDDHH24MI'), 'pj0002', 'task0054', 100);
INSERT INTO TASK VALUES ('task' || LPAD(TASK_SEQ.NEXTVAL,4,0), '찜하기', to_date('201908260000', 'YYYYMMDDHH24MI'), to_date('201908302359', 'YYYYMMDDHH24MI'), 'pj0002', 'task0054', 100);
INSERT INTO TASK VALUES ('task' || LPAD(TASK_SEQ.NEXTVAL,4,0), '입양신청', to_date('201908260000', 'YYYYMMDDHH24MI'), to_date('201908302359', 'YYYYMMDDHH24MI'), 'pj0002', 'task0054', 100);
-- task0061 ~ task0065
INSERT INTO TASK VALUES ('task' || LPAD(TASK_SEQ.NEXTVAL,4,0), '입양후기', to_date('201908260000', 'YYYYMMDDHH24MI'), to_date('201908302359', 'YYYYMMDDHH24MI'), 'pj0002', 'task0032', 100);
INSERT INTO TASK VALUES ('task' || LPAD(TASK_SEQ.NEXTVAL,4,0), '입양후기 출력', to_date('201908260000', 'YYYYMMDDHH24MI'), to_date('201908302359', 'YYYYMMDDHH24MI'), 'pj0002', 'task0061', 100);
INSERT INTO TASK VALUES ('task' || LPAD(TASK_SEQ.NEXTVAL,4,0), '입양후기 작성', to_date('201908260000', 'YYYYMMDDHH24MI'), to_date('201908302359', 'YYYYMMDDHH24MI'), 'pj0002', 'task0061', 100);
INSERT INTO TASK VALUES ('task' || LPAD(TASK_SEQ.NEXTVAL,4,0), '입양후기 수정', to_date('201908260000', 'YYYYMMDDHH24MI'), to_date('201908302359', 'YYYYMMDDHH24MI'), 'pj0002', 'task0061', 100);
INSERT INTO TASK VALUES ('task' || LPAD(TASK_SEQ.NEXTVAL,4,0), '입양후기 삭제', to_date('201908260000', 'YYYYMMDDHH24MI'), to_date('201908302359', 'YYYYMMDDHH24MI'), 'pj0002', 'task0061', 100);
-- task0066 ~ task0072
INSERT INTO TASK VALUES ('task' || LPAD(TASK_SEQ.NEXTVAL,4,0), '참여마당', to_date('201908260000', 'YYYYMMDDHH24MI'), to_date('201908302359', 'YYYYMMDDHH24MI'), 'pj0002', 'task0032', 100);
INSERT INTO TASK VALUES ('task' || LPAD(TASK_SEQ.NEXTVAL,4,0), '찾아요 출력', to_date('201908260000', 'YYYYMMDDHH24MI'), to_date('201908302359', 'YYYYMMDDHH24MI'), 'pj0002', 'task0066', 100);
INSERT INTO TASK VALUES ('task' || LPAD(TASK_SEQ.NEXTVAL,4,0), '찾아요 작성', to_date('201908260000', 'YYYYMMDDHH24MI'), to_date('201908302359', 'YYYYMMDDHH24MI'), 'pj0002', 'task0066', 100);
INSERT INTO TASK VALUES ('task' || LPAD(TASK_SEQ.NEXTVAL,4,0), '찾아요 수정', to_date('201908260000', 'YYYYMMDDHH24MI'), to_date('201908302359', 'YYYYMMDDHH24MI'), 'pj0002', 'task0066', 100);
INSERT INTO TASK VALUES ('task' || LPAD(TASK_SEQ.NEXTVAL,4,0), '찾아요 삭제', to_date('201908260000', 'YYYYMMDDHH24MI'), to_date('201908302359', 'YYYYMMDDHH24MI'), 'pj0002', 'task0066', 100);
INSERT INTO TASK VALUES ('task' || LPAD(TASK_SEQ.NEXTVAL,4,0), '동물 이상형 월드컵', to_date('201908260000', 'YYYYMMDDHH24MI'), to_date('201908302359', 'YYYYMMDDHH24MI'), 'pj0002', 'task0066', 100);
INSERT INTO TASK VALUES ('task' || LPAD(TASK_SEQ.NEXTVAL,4,0), '찰떡 궁합 찾기', to_date('201908260000', 'YYYYMMDDHH24MI'), to_date('201908302359', 'YYYYMMDDHH24MI'), 'pj0002', 'task0066', 100);
-- task0073 ~ task0076
INSERT INTO TASK VALUES ('task' || LPAD(TASK_SEQ.NEXTVAL,4,0), '자원봉사', to_date('201908260000', 'YYYYMMDDHH24MI'), to_date('201908302359', 'YYYYMMDDHH24MI'), 'pj0002', 'task0032', 100);
INSERT INTO TASK VALUES ('task' || LPAD(TASK_SEQ.NEXTVAL,4,0), '자원봉사 출력', to_date('201908260000', 'YYYYMMDDHH24MI'), to_date('201908302359', 'YYYYMMDDHH24MI'), 'pj0002', 'task0073', 100);
INSERT INTO TASK VALUES ('task' || LPAD(TASK_SEQ.NEXTVAL,4,0), '자원봉사 신청', to_date('201908260000', 'YYYYMMDDHH24MI'), to_date('201908302359', 'YYYYMMDDHH24MI'), 'pj0002', 'task0073', 100);
INSERT INTO TASK VALUES ('task' || LPAD(TASK_SEQ.NEXTVAL,4,0), '자원봉사 내역 조회', to_date('201908260000', 'YYYYMMDDHH24MI'), to_date('201908302359', 'YYYYMMDDHH24MI'), 'pj0002', 'task0073', 100);
-- task0077 ~ task0087
INSERT INTO TASK VALUES ('task' || LPAD(TASK_SEQ.NEXTVAL,4,0), '쇼핑몰', to_date('201908260000', 'YYYYMMDDHH24MI'), to_date('201908302359', 'YYYYMMDDHH24MI'), 'pj0002', 'task0032', 100);
INSERT INTO TASK VALUES ('task' || LPAD(TASK_SEQ.NEXTVAL,4,0), '쇼핑몰 메인 출력', to_date('201908260000', 'YYYYMMDDHH24MI'), to_date('201908302359', 'YYYYMMDDHH24MI'), 'pj0002', 'task0077', 100);
INSERT INTO TASK VALUES ('task' || LPAD(TASK_SEQ.NEXTVAL,4,0), '물건 상세 출력', to_date('201908260000', 'YYYYMMDDHH24MI'), to_date('201908302359', 'YYYYMMDDHH24MI'), 'pj0002', 'task0077', 100);
INSERT INTO TASK VALUES ('task' || LPAD(TASK_SEQ.NEXTVAL,4,0), '장바구니 등록', to_date('201908260000', 'YYYYMMDDHH24MI'), to_date('201908302359', 'YYYYMMDDHH24MI'), 'pj0002', 'task0077', 100);
INSERT INTO TASK VALUES ('task' || LPAD(TASK_SEQ.NEXTVAL,4,0), '리뷰 확인', to_date('201908260000', 'YYYYMMDDHH24MI'), to_date('201908302359', 'YYYYMMDDHH24MI'), 'pj0002', 'task0077', 100);
INSERT INTO TASK VALUES ('task' || LPAD(TASK_SEQ.NEXTVAL,4,0), '질문 확인', to_date('201908260000', 'YYYYMMDDHH24MI'), to_date('201908302359', 'YYYYMMDDHH24MI'), 'pj0002', 'task0077', 100);
INSERT INTO TASK VALUES ('task' || LPAD(TASK_SEQ.NEXTVAL,4,0), '질문 작성', to_date('201908260000', 'YYYYMMDDHH24MI'), to_date('201908302359', 'YYYYMMDDHH24MI'), 'pj0002', 'task0077', 100);
INSERT INTO TASK VALUES ('task' || LPAD(TASK_SEQ.NEXTVAL,4,0), '질문 수정', to_date('201908260000', 'YYYYMMDDHH24MI'), to_date('201908302359', 'YYYYMMDDHH24MI'), 'pj0002', 'task0077', 100);
INSERT INTO TASK VALUES ('task' || LPAD(TASK_SEQ.NEXTVAL,4,0), '질문 삭제', to_date('201908260000', 'YYYYMMDDHH24MI'), to_date('201908302359', 'YYYYMMDDHH24MI'), 'pj0002', 'task0077', 100);
INSERT INTO TASK VALUES ('task' || LPAD(TASK_SEQ.NEXTVAL,4,0), '답변 작성', to_date('201908260000', 'YYYYMMDDHH24MI'), to_date('201908302359', 'YYYYMMDDHH24MI'), 'pj0002', 'task0077', 100);
INSERT INTO TASK VALUES ('task' || LPAD(TASK_SEQ.NEXTVAL,4,0), '답변 수정', to_date('201908260000', 'YYYYMMDDHH24MI'), to_date('201908302359', 'YYYYMMDDHH24MI'), 'pj0002', 'task0077', 100);
-- task0088 ~ task0092
INSERT INTO TASK VALUES ('task' || LPAD(TASK_SEQ.NEXTVAL,4,0), '장바구니', to_date('201909020000', 'YYYYMMDDHH24MI'), to_date('201909062359', 'YYYYMMDDHH24MI'), 'pj0002', 'task0032', 100);
INSERT INTO TASK VALUES ('task' || LPAD(TASK_SEQ.NEXTVAL,4,0), '장바구니 출력', to_date('201909020000', 'YYYYMMDDHH24MI'), to_date('201909062359', 'YYYYMMDDHH24MI'), 'pj0002', 'task0088', 100);
INSERT INTO TASK VALUES ('task' || LPAD(TASK_SEQ.NEXTVAL,4,0), '수량 변경', to_date('201909020000', 'YYYYMMDDHH24MI'), to_date('201909062359', 'YYYYMMDDHH24MI'), 'pj0002', 'task0088', 100);
INSERT INTO TASK VALUES ('task' || LPAD(TASK_SEQ.NEXTVAL,4,0), '물건 제거', to_date('201909020000', 'YYYYMMDDHH24MI'), to_date('201909062359', 'YYYYMMDDHH24MI'), 'pj0002', 'task0088', 100);
INSERT INTO TASK VALUES ('task' || LPAD(TASK_SEQ.NEXTVAL,4,0), '구매', to_date('201909020000', 'YYYYMMDDHH24MI'), to_date('201909062359', 'YYYYMMDDHH24MI'), 'pj0002', 'task0088', 100);
-- task0093 ~ task0099
INSERT INTO TASK VALUES ('task' || LPAD(TASK_SEQ.NEXTVAL,4,0), '마이페이지', to_date('201909020000', 'YYYYMMDDHH24MI'), to_date('201909062359', 'YYYYMMDDHH24MI'), 'pj0002', 'task0032', 100);
INSERT INTO TASK VALUES ('task' || LPAD(TASK_SEQ.NEXTVAL,4,0), '개인정보조회 및 수정', to_date('201909020000', 'YYYYMMDDHH24MI'), to_date('201909062359', 'YYYYMMDDHH24MI'), 'pj0002', 'task0093', 100);
INSERT INTO TASK VALUES ('task' || LPAD(TASK_SEQ.NEXTVAL,4,0), '입양이력', to_date('201909020000', 'YYYYMMDDHH24MI'), to_date('201909062359', 'YYYYMMDDHH24MI'), 'pj0002', 'task0093', 100);
INSERT INTO TASK VALUES ('task' || LPAD(TASK_SEQ.NEXTVAL,4,0), '자원봉사 내역', to_date('201909020000', 'YYYYMMDDHH24MI'), to_date('201909062359', 'YYYYMMDDHH24MI'), 'pj0002', 'task0093', 100);
INSERT INTO TASK VALUES ('task' || LPAD(TASK_SEQ.NEXTVAL,4,0), '관심 동물 조회', to_date('201909020000', 'YYYYMMDDHH24MI'), to_date('201909062359', 'YYYYMMDDHH24MI'), 'pj0002', 'task0093', 100);
INSERT INTO TASK VALUES ('task' || LPAD(TASK_SEQ.NEXTVAL,4,0), '구매 내역', to_date('201909020000', 'YYYYMMDDHH24MI'), to_date('201909062359', 'YYYYMMDDHH24MI'), 'pj0002', 'task0093', 100);
INSERT INTO TASK VALUES ('task' || LPAD(TASK_SEQ.NEXTVAL,4,0), '회원 탈퇴', to_date('201909020000', 'YYYYMMDDHH24MI'), to_date('201909062359', 'YYYYMMDDHH24MI'), 'pj0002', 'task0093', 100);
-- task0100 ~ task0105
INSERT INTO TASK VALUES ('task' || LPAD(TASK_SEQ.NEXTVAL,4,0), '관리자페이지', to_date('201909020000', 'YYYYMMDDHH24MI'), to_date('201909062359', 'YYYYMMDDHH24MI'), 'pj0002', 'task0032', 100);
INSERT INTO TASK VALUES ('task' || LPAD(TASK_SEQ.NEXTVAL,4,0), '회원 조회', to_date('201909020000', 'YYYYMMDDHH24MI'), to_date('201909062359', 'YYYYMMDDHH24MI'), 'pj0002', 'task0100', 100);
INSERT INTO TASK VALUES ('task' || LPAD(TASK_SEQ.NEXTVAL,4,0), '회원 수정', to_date('201909020000', 'YYYYMMDDHH24MI'), to_date('201909062359', 'YYYYMMDDHH24MI'), 'pj0002', 'task0100', 100);
INSERT INTO TASK VALUES ('task' || LPAD(TASK_SEQ.NEXTVAL,4,0), '회원 삭제', to_date('201909020000', 'YYYYMMDDHH24MI'), to_date('201909062359', 'YYYYMMDDHH24MI'), 'pj0002', 'task0100', 100);
INSERT INTO TASK VALUES ('task' || LPAD(TASK_SEQ.NEXTVAL,4,0), '쇼핑몰 상품관리', to_date('201909020000', 'YYYYMMDDHH24MI'), to_date('201909062359', 'YYYYMMDDHH24MI'), 'pj0002', 'task0100', 100);
INSERT INTO TASK VALUES ('task' || LPAD(TASK_SEQ.NEXTVAL,4,0), '자원봉사 관리', to_date('201909020000', 'YYYYMMDDHH24MI'), to_date('201909062359', 'YYYYMMDDHH24MI'), 'pj0002', 'task0100', 100);
-- pj0003
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--업무 담당자

-- pj0001
INSERT INTO PRO_TASK VALUES('e0005', 'task0001', 'pj0001');
INSERT INTO PRO_TASK VALUES('e0009', 'task0002', 'pj0001');
INSERT INTO PRO_TASK VALUES('e0013', 'task0003', 'pj0001');
INSERT INTO PRO_TASK VALUES('e0015', 'task0004', 'pj0001');
INSERT INTO PRO_TASK VALUES('e0005', 'task0005', 'pj0001');
INSERT INTO PRO_TASK VALUES('e0009', 'task0006', 'pj0001');
INSERT INTO PRO_TASK VALUES('e0013', 'task0007', 'pj0001');
INSERT INTO PRO_TASK VALUES('e0015', 'task0008', 'pj0001');
INSERT INTO PRO_TASK VALUES('e0005', 'task0009', 'pj0001');
INSERT INTO PRO_TASK VALUES('e0013', 'task0009', 'pj0001');
INSERT INTO PRO_TASK VALUES('e0009', 'task0010', 'pj0001');
INSERT INTO PRO_TASK VALUES('e0015', 'task0010', 'pj0001');

-- pj0002
INSERT INTO PRO_TASK VALUES('e0002', 'task0011', 'pj0002');
INSERT INTO PRO_TASK VALUES('e0002', 'task0012', 'pj0002');
INSERT INTO PRO_TASK VALUES('e0002', 'task0013', 'pj0002');
INSERT INTO PRO_TASK VALUES('e0002', 'task0014', 'pj0002');
INSERT INTO PRO_TASK VALUES('e0002', 'task0015', 'pj0002');
INSERT INTO PRO_TASK VALUES('e0002', 'task0016', 'pj0002');
INSERT INTO PRO_TASK VALUES('e0002', 'task0017', 'pj0002');
INSERT INTO PRO_TASK VALUES('e0002', 'task0018', 'pj0002');
INSERT INTO PRO_TASK VALUES('e0002', 'task0019', 'pj0002');
INSERT INTO PRO_TASK VALUES('e0002', 'task0020', 'pj0002');
INSERT INTO PRO_TASK VALUES('e0002', 'task0021', 'pj0002');
INSERT INTO PRO_TASK VALUES('e0002', 'task0022', 'pj0002');
INSERT INTO PRO_TASK VALUES('e0002', 'task0023', 'pj0002');
INSERT INTO PRO_TASK VALUES('e0002', 'task0024', 'pj0002');
INSERT INTO PRO_TASK VALUES('e0002', 'task0025', 'pj0002');
INSERT INTO PRO_TASK VALUES('e0002', 'task0026', 'pj0002');
INSERT INTO PRO_TASK VALUES('e0005', 'task0027', 'pj0002');
INSERT INTO PRO_TASK VALUES('e0005', 'task0028', 'pj0002');
INSERT INTO PRO_TASK VALUES('e0005', 'task0029', 'pj0002');
INSERT INTO PRO_TASK VALUES('e0005', 'task0030', 'pj0002');
INSERT INTO PRO_TASK VALUES('e0005', 'task0031', 'pj0002');
INSERT INTO PRO_TASK VALUES('e0005', 'task0033', 'pj0002');
INSERT INTO PRO_TASK VALUES('e0005', 'task0034', 'pj0002');
INSERT INTO PRO_TASK VALUES('e0005', 'task0035', 'pj0002');
INSERT INTO PRO_TASK VALUES('e0005', 'task0036', 'pj0002');
INSERT INTO PRO_TASK VALUES('e0005', 'task0037', 'pj0002');
INSERT INTO PRO_TASK VALUES('e0005', 'task0038', 'pj0002');
INSERT INTO PRO_TASK VALUES('e0005', 'task0039', 'pj0002');
INSERT INTO PRO_TASK VALUES('e0005', 'task0040', 'pj0002');
INSERT INTO PRO_TASK VALUES('e0005', 'task0041', 'pj0002');
INSERT INTO PRO_TASK VALUES('e0005', 'task0042', 'pj0002');
INSERT INTO PRO_TASK VALUES('e0005', 'task0043', 'pj0002');
INSERT INTO PRO_TASK VALUES('e0005', 'task0044', 'pj0002');
INSERT INTO PRO_TASK VALUES('e0009', 'task0045', 'pj0002');
INSERT INTO PRO_TASK VALUES('e0009', 'task0046', 'pj0002');
INSERT INTO PRO_TASK VALUES('e0009', 'task0047', 'pj0002');
INSERT INTO PRO_TASK VALUES('e0009', 'task0048', 'pj0002');
INSERT INTO PRO_TASK VALUES('e0009', 'task0049', 'pj0002');
INSERT INTO PRO_TASK VALUES('e0009', 'task0050', 'pj0002');
INSERT INTO PRO_TASK VALUES('e0009', 'task0051', 'pj0002');
INSERT INTO PRO_TASK VALUES('e0009', 'task0052', 'pj0002');
INSERT INTO PRO_TASK VALUES('e0009', 'task0053', 'pj0002');
INSERT INTO PRO_TASK VALUES('e0009', 'task0054', 'pj0002');
INSERT INTO PRO_TASK VALUES('e0009', 'task0055', 'pj0002');
INSERT INTO PRO_TASK VALUES('e0009', 'task0056', 'pj0002');
INSERT INTO PRO_TASK VALUES('e0009', 'task0057', 'pj0002');
INSERT INTO PRO_TASK VALUES('e0009', 'task0058', 'pj0002');
INSERT INTO PRO_TASK VALUES('e0009', 'task0059', 'pj0002');
INSERT INTO PRO_TASK VALUES('e0009', 'task0060', 'pj0002');
INSERT INTO PRO_TASK VALUES('e0013', 'task0061', 'pj0002');
INSERT INTO PRO_TASK VALUES('e0013', 'task0062', 'pj0002');
INSERT INTO PRO_TASK VALUES('e0013', 'task0063', 'pj0002');
INSERT INTO PRO_TASK VALUES('e0013', 'task0064', 'pj0002');
INSERT INTO PRO_TASK VALUES('e0013', 'task0065', 'pj0002');
INSERT INTO PRO_TASK VALUES('e0013', 'task0066', 'pj0002');
INSERT INTO PRO_TASK VALUES('e0013', 'task0067', 'pj0002');
INSERT INTO PRO_TASK VALUES('e0013', 'task0068', 'pj0002');
INSERT INTO PRO_TASK VALUES('e0013', 'task0069', 'pj0002');
INSERT INTO PRO_TASK VALUES('e0013', 'task0070', 'pj0002');
INSERT INTO PRO_TASK VALUES('e0013', 'task0071', 'pj0002');
INSERT INTO PRO_TASK VALUES('e0013', 'task0072', 'pj0002');
INSERT INTO PRO_TASK VALUES('e0015', 'task0073', 'pj0002');
INSERT INTO PRO_TASK VALUES('e0015', 'task0074', 'pj0002');
INSERT INTO PRO_TASK VALUES('e0015', 'task0075', 'pj0002');
INSERT INTO PRO_TASK VALUES('e0015', 'task0076', 'pj0002');
INSERT INTO PRO_TASK VALUES('e0015', 'task0077', 'pj0002');
INSERT INTO PRO_TASK VALUES('e0015', 'task0078', 'pj0002');
INSERT INTO PRO_TASK VALUES('e0015', 'task0079', 'pj0002');
INSERT INTO PRO_TASK VALUES('e0015', 'task0080', 'pj0002');
INSERT INTO PRO_TASK VALUES('e0015', 'task0081', 'pj0002');
INSERT INTO PRO_TASK VALUES('e0015', 'task0082', 'pj0002');
INSERT INTO PRO_TASK VALUES('e0015', 'task0083', 'pj0002');
INSERT INTO PRO_TASK VALUES('e0015', 'task0084', 'pj0002');
INSERT INTO PRO_TASK VALUES('e0015', 'task0085', 'pj0002');
INSERT INTO PRO_TASK VALUES('e0015', 'task0086', 'pj0002');
INSERT INTO PRO_TASK VALUES('e0015', 'task0087', 'pj0002');
INSERT INTO PRO_TASK VALUES('e0009', 'task0088', 'pj0002');
INSERT INTO PRO_TASK VALUES('e0009', 'task0089', 'pj0002');
INSERT INTO PRO_TASK VALUES('e0009', 'task0090', 'pj0002');
INSERT INTO PRO_TASK VALUES('e0009', 'task0091', 'pj0002');
INSERT INTO PRO_TASK VALUES('e0009', 'task0092', 'pj0002');
INSERT INTO PRO_TASK VALUES('e0013', 'task0093', 'pj0002');
INSERT INTO PRO_TASK VALUES('e0013', 'task0094', 'pj0002');
INSERT INTO PRO_TASK VALUES('e0013', 'task0095', 'pj0002');
INSERT INTO PRO_TASK VALUES('e0013', 'task0096', 'pj0002');
INSERT INTO PRO_TASK VALUES('e0013', 'task0097', 'pj0002');
INSERT INTO PRO_TASK VALUES('e0013', 'task0098', 'pj0002');
INSERT INTO PRO_TASK VALUES('e0013', 'task0099', 'pj0002');
INSERT INTO PRO_TASK VALUES('e0015', 'task0100', 'pj0002');
INSERT INTO PRO_TASK VALUES('e0015', 'task0101', 'pj0002');
INSERT INTO PRO_TASK VALUES('e0015', 'task0102', 'pj0002');
INSERT INTO PRO_TASK VALUES('e0015', 'task0103', 'pj0002');
INSERT INTO PRO_TASK VALUES('e0015', 'task0104', 'pj0002');
INSERT INTO PRO_TASK VALUES('e0015', 'task0105', 'pj0002');

-- pj0003

-------------------------------------------------------------------------------------------------------------------------------------------------

--업무 기록

-- pj0001
INSERT INTO TASK_HISTORY VALUES('task0001', 'e0005', '진척도를 0에서 100으로 변경하였습니다.', to_date('201907041300', 'YYYYMMDDHH24MI'));
INSERT INTO TASK_HISTORY VALUES('task0002', 'e0009', '진척도를 0에서 100으로 변경하였습니다.', to_date('201907041300', 'YYYYMMDDHH24MI'));
INSERT INTO TASK_HISTORY VALUES('task0003', 'e0013', '진척도를 0에서 100으로 변경하였습니다.', to_date('201907041300', 'YYYYMMDDHH24MI'));
INSERT INTO TASK_HISTORY VALUES('task0004', 'e0015', '진척도를 0에서 100으로 변경하였습니다.', to_date('201907041300', 'YYYYMMDDHH24MI'));
INSERT INTO TASK_HISTORY VALUES('task0005', 'e0005', '진척도를 0에서 100으로 변경하였습니다.', to_date('201907251300', 'YYYYMMDDHH24MI'));
INSERT INTO TASK_HISTORY VALUES('task0006', 'e0009', '진척도를 0에서 100으로 변경하였습니다.', to_date('201907251300', 'YYYYMMDDHH24MI'));
INSERT INTO TASK_HISTORY VALUES('task0007', 'e0013', '진척도를 0에서 100으로 변경하였습니다.', to_date('201907251300', 'YYYYMMDDHH24MI'));
INSERT INTO TASK_HISTORY VALUES('task0008', 'e0015', '진척도를 0에서 100으로 변경하였습니다.', to_date('201907251300', 'YYYYMMDDHH24MI'));
INSERT INTO TASK_HISTORY VALUES('task0009', 'e0005', '진척도를 0에서 100으로 변경하였습니다.', to_date('201908011300', 'YYYYMMDDHH24MI'));
INSERT INTO TASK_HISTORY VALUES('task0010', 'e0009', '진척도를 0에서 100으로 변경하였습니다.', to_date('201908011300', 'YYYYMMDDHH24MI'));
                                                                                                               
-- pj0002                                                                                                       
INSERT INTO TASK_HISTORY VALUES('task0011', 'e0002', '진척도를 0에서 100으로 변경하였습니다.', to_date('201908231300', 'YYYYMMDDHH24MI'));
INSERT INTO TASK_HISTORY VALUES('task0012', 'e0002', '진척도를 0에서 100으로 변경하였습니다.', to_date('201908231300', 'YYYYMMDDHH24MI'));
INSERT INTO TASK_HISTORY VALUES('task0013', 'e0002', '진척도를 0에서 100으로 변경하였습니다.', to_date('201908231300', 'YYYYMMDDHH24MI'));
INSERT INTO TASK_HISTORY VALUES('task0014', 'e0002', '진척도를 0에서 100으로 변경하였습니다.', to_date('201908231300', 'YYYYMMDDHH24MI'));
INSERT INTO TASK_HISTORY VALUES('task0015', 'e0002', '진척도를 0에서 100으로 변경하였습니다.', to_date('201908231300', 'YYYYMMDDHH24MI'));
INSERT INTO TASK_HISTORY VALUES('task0016', 'e0002', '진척도를 0에서 100으로 변경하였습니다.', to_date('201908231300', 'YYYYMMDDHH24MI'));
INSERT INTO TASK_HISTORY VALUES('task0017', 'e0002', '진척도를 0에서 100으로 변경하였습니다.', to_date('201908231300', 'YYYYMMDDHH24MI'));
INSERT INTO TASK_HISTORY VALUES('task0018', 'e0002', '진척도를 0에서 100으로 변경하였습니다.', to_date('201908231300', 'YYYYMMDDHH24MI'));
INSERT INTO TASK_HISTORY VALUES('task0019', 'e0002', '진척도를 0에서 100으로 변경하였습니다.', to_date('201908231300', 'YYYYMMDDHH24MI'));
INSERT INTO TASK_HISTORY VALUES('task0020', 'e0002', '진척도를 0에서 100으로 변경하였습니다.', to_date('201908231300', 'YYYYMMDDHH24MI'));
INSERT INTO TASK_HISTORY VALUES('task0021', 'e0002', '진척도를 0에서 100으로 변경하였습니다.', to_date('201908231300', 'YYYYMMDDHH24MI'));
INSERT INTO TASK_HISTORY VALUES('task0022', 'e0002', '진척도를 0에서 100으로 변경하였습니다.', to_date('201908231300', 'YYYYMMDDHH24MI'));
INSERT INTO TASK_HISTORY VALUES('task0023', 'e0002', '진척도를 0에서 100으로 변경하였습니다.', to_date('201908231300', 'YYYYMMDDHH24MI'));
INSERT INTO TASK_HISTORY VALUES('task0024', 'e0002', '진척도를 0에서 100으로 변경하였습니다.', to_date('201908231300', 'YYYYMMDDHH24MI'));
INSERT INTO TASK_HISTORY VALUES('task0025', 'e0002', '진척도를 0에서 100으로 변경하였습니다.', to_date('201908231300', 'YYYYMMDDHH24MI'));
INSERT INTO TASK_HISTORY VALUES('task0026', 'e0002', '진척도를 0에서 100으로 변경하였습니다.', to_date('201908231300', 'YYYYMMDDHH24MI'));
INSERT INTO TASK_HISTORY VALUES('task0027', 'e0005', '진척도를 0에서 100으로 변경하였습니다.', to_date('201909061300', 'YYYYMMDDHH24MI'));
INSERT INTO TASK_HISTORY VALUES('task0028', 'e0005', '진척도를 0에서 100으로 변경하였습니다.', to_date('201909061300', 'YYYYMMDDHH24MI'));
INSERT INTO TASK_HISTORY VALUES('task0029', 'e0005', '진척도를 0에서 100으로 변경하였습니다.', to_date('201909061300', 'YYYYMMDDHH24MI'));
INSERT INTO TASK_HISTORY VALUES('task0030', 'e0005', '진척도를 0에서 100으로 변경하였습니다.', to_date('201909061300', 'YYYYMMDDHH24MI'));
INSERT INTO TASK_HISTORY VALUES('task0031', 'e0005', '진척도를 0에서 100으로 변경하였습니다.', to_date('201909061300', 'YYYYMMDDHH24MI'));
INSERT INTO TASK_HISTORY VALUES('task0033', 'e0005', '진척도를 0에서 100으로 변경하였습니다.', to_date('201908301300', 'YYYYMMDDHH24MI'));
INSERT INTO TASK_HISTORY VALUES('task0034', 'e0005', '진척도를 0에서 100으로 변경하였습니다.', to_date('201908301300', 'YYYYMMDDHH24MI'));
INSERT INTO TASK_HISTORY VALUES('task0035', 'e0005', '진척도를 0에서 100으로 변경하였습니다.', to_date('201908301300', 'YYYYMMDDHH24MI'));
INSERT INTO TASK_HISTORY VALUES('task0036', 'e0005', '진척도를 0에서 100으로 변경하였습니다.', to_date('201908301300', 'YYYYMMDDHH24MI'));
INSERT INTO TASK_HISTORY VALUES('task0037', 'e0005', '진척도를 0에서 100으로 변경하였습니다.', to_date('201908301300', 'YYYYMMDDHH24MI'));
INSERT INTO TASK_HISTORY VALUES('task0038', 'e0005', '진척도를 0에서 100으로 변경하였습니다.', to_date('201908301300', 'YYYYMMDDHH24MI'));
INSERT INTO TASK_HISTORY VALUES('task0039', 'e0005', '진척도를 0에서 100으로 변경하였습니다.', to_date('201908301300', 'YYYYMMDDHH24MI'));
INSERT INTO TASK_HISTORY VALUES('task0040', 'e0005', '진척도를 0에서 100으로 변경하였습니다.', to_date('201908301300', 'YYYYMMDDHH24MI'));
INSERT INTO TASK_HISTORY VALUES('task0041', 'e0005', '진척도를 0에서 100으로 변경하였습니다.', to_date('201908301300', 'YYYYMMDDHH24MI'));
INSERT INTO TASK_HISTORY VALUES('task0042', 'e0005', '진척도를 0에서 100으로 변경하였습니다.', to_date('201908301300', 'YYYYMMDDHH24MI'));
INSERT INTO TASK_HISTORY VALUES('task0043', 'e0005', '진척도를 0에서 100으로 변경하였습니다.', to_date('201908301300', 'YYYYMMDDHH24MI'));
INSERT INTO TASK_HISTORY VALUES('task0044', 'e0005', '진척도를 0에서 100으로 변경하였습니다.', to_date('201908301300', 'YYYYMMDDHH24MI'));
INSERT INTO TASK_HISTORY VALUES('task0045', 'e0009', '진척도를 0에서 100으로 변경하였습니다.', to_date('201908301300', 'YYYYMMDDHH24MI'));
INSERT INTO TASK_HISTORY VALUES('task0046', 'e0009', '진척도를 0에서 100으로 변경하였습니다.', to_date('201908301300', 'YYYYMMDDHH24MI'));
INSERT INTO TASK_HISTORY VALUES('task0047', 'e0009', '진척도를 0에서 100으로 변경하였습니다.', to_date('201908301300', 'YYYYMMDDHH24MI'));
INSERT INTO TASK_HISTORY VALUES('task0048', 'e0009', '진척도를 0에서 100으로 변경하였습니다.', to_date('201908301300', 'YYYYMMDDHH24MI'));
INSERT INTO TASK_HISTORY VALUES('task0049', 'e0009', '진척도를 0에서 100으로 변경하였습니다.', to_date('201908301300', 'YYYYMMDDHH24MI'));
INSERT INTO TASK_HISTORY VALUES('task0050', 'e0009', '진척도를 0에서 100으로 변경하였습니다.', to_date('201908301300', 'YYYYMMDDHH24MI'));
INSERT INTO TASK_HISTORY VALUES('task0051', 'e0009', '진척도를 0에서 100으로 변경하였습니다.', to_date('201908301300', 'YYYYMMDDHH24MI'));
INSERT INTO TASK_HISTORY VALUES('task0052', 'e0009', '진척도를 0에서 100으로 변경하였습니다.', to_date('201908301300', 'YYYYMMDDHH24MI'));
INSERT INTO TASK_HISTORY VALUES('task0053', 'e0009', '진척도를 0에서 100으로 변경하였습니다.', to_date('201908301300', 'YYYYMMDDHH24MI'));
INSERT INTO TASK_HISTORY VALUES('task0054', 'e0009', '진척도를 0에서 100으로 변경하였습니다.', to_date('201908301300', 'YYYYMMDDHH24MI'));
INSERT INTO TASK_HISTORY VALUES('task0055', 'e0009', '진척도를 0에서 100으로 변경하였습니다.', to_date('201908301300', 'YYYYMMDDHH24MI'));
INSERT INTO TASK_HISTORY VALUES('task0056', 'e0009', '진척도를 0에서 100으로 변경하였습니다.', to_date('201908301300', 'YYYYMMDDHH24MI'));
INSERT INTO TASK_HISTORY VALUES('task0057', 'e0009', '진척도를 0에서 100으로 변경하였습니다.', to_date('201908301300', 'YYYYMMDDHH24MI'));
INSERT INTO TASK_HISTORY VALUES('task0058', 'e0009', '진척도를 0에서 100으로 변경하였습니다.', to_date('201908301300', 'YYYYMMDDHH24MI'));
INSERT INTO TASK_HISTORY VALUES('task0059', 'e0009', '진척도를 0에서 100으로 변경하였습니다.', to_date('201908301300', 'YYYYMMDDHH24MI'));
INSERT INTO TASK_HISTORY VALUES('task0060', 'e0009', '진척도를 0에서 100으로 변경하였습니다.', to_date('201908301300', 'YYYYMMDDHH24MI'));
INSERT INTO TASK_HISTORY VALUES('task0061', 'e0013', '진척도를 0에서 100으로 변경하였습니다.', to_date('201908301300', 'YYYYMMDDHH24MI'));
INSERT INTO TASK_HISTORY VALUES('task0062', 'e0013', '진척도를 0에서 100으로 변경하였습니다.', to_date('201908301300', 'YYYYMMDDHH24MI'));
INSERT INTO TASK_HISTORY VALUES('task0063', 'e0013', '진척도를 0에서 100으로 변경하였습니다.', to_date('201908301300', 'YYYYMMDDHH24MI'));
INSERT INTO TASK_HISTORY VALUES('task0064', 'e0013', '진척도를 0에서 100으로 변경하였습니다.', to_date('201908301300', 'YYYYMMDDHH24MI'));
INSERT INTO TASK_HISTORY VALUES('task0065', 'e0013', '진척도를 0에서 100으로 변경하였습니다.', to_date('201908301300', 'YYYYMMDDHH24MI'));
INSERT INTO TASK_HISTORY VALUES('task0066', 'e0013', '진척도를 0에서 100으로 변경하였습니다.', to_date('201908301300', 'YYYYMMDDHH24MI'));
INSERT INTO TASK_HISTORY VALUES('task0067', 'e0013', '진척도를 0에서 100으로 변경하였습니다.', to_date('201908301300', 'YYYYMMDDHH24MI'));
INSERT INTO TASK_HISTORY VALUES('task0068', 'e0013', '진척도를 0에서 100으로 변경하였습니다.', to_date('201908301300', 'YYYYMMDDHH24MI'));
INSERT INTO TASK_HISTORY VALUES('task0069', 'e0013', '진척도를 0에서 100으로 변경하였습니다.', to_date('201908301300', 'YYYYMMDDHH24MI'));
INSERT INTO TASK_HISTORY VALUES('task0070', 'e0013', '진척도를 0에서 100으로 변경하였습니다.', to_date('201908301300', 'YYYYMMDDHH24MI'));
INSERT INTO TASK_HISTORY VALUES('task0071', 'e0013', '진척도를 0에서 100으로 변경하였습니다.', to_date('201908301300', 'YYYYMMDDHH24MI'));
INSERT INTO TASK_HISTORY VALUES('task0072', 'e0013', '진척도를 0에서 100으로 변경하였습니다.', to_date('201908301300', 'YYYYMMDDHH24MI'));
INSERT INTO TASK_HISTORY VALUES('task0073', 'e0015', '진척도를 0에서 100으로 변경하였습니다.', to_date('201908301300', 'YYYYMMDDHH24MI'));
INSERT INTO TASK_HISTORY VALUES('task0074', 'e0015', '진척도를 0에서 100으로 변경하였습니다.', to_date('201908301300', 'YYYYMMDDHH24MI'));
INSERT INTO TASK_HISTORY VALUES('task0075', 'e0015', '진척도를 0에서 100으로 변경하였습니다.', to_date('201908301300', 'YYYYMMDDHH24MI'));
INSERT INTO TASK_HISTORY VALUES('task0076', 'e0015', '진척도를 0에서 100으로 변경하였습니다.', to_date('201908301300', 'YYYYMMDDHH24MI'));
INSERT INTO TASK_HISTORY VALUES('task0077', 'e0015', '진척도를 0에서 100으로 변경하였습니다.', to_date('201908301300', 'YYYYMMDDHH24MI'));
INSERT INTO TASK_HISTORY VALUES('task0078', 'e0015', '진척도를 0에서 100으로 변경하였습니다.', to_date('201908301300', 'YYYYMMDDHH24MI'));
INSERT INTO TASK_HISTORY VALUES('task0079', 'e0015', '진척도를 0에서 100으로 변경하였습니다.', to_date('201908301300', 'YYYYMMDDHH24MI'));
INSERT INTO TASK_HISTORY VALUES('task0080', 'e0015', '진척도를 0에서 100으로 변경하였습니다.', to_date('201908301300', 'YYYYMMDDHH24MI'));
INSERT INTO TASK_HISTORY VALUES('task0081', 'e0015', '진척도를 0에서 100으로 변경하였습니다.', to_date('201908301300', 'YYYYMMDDHH24MI'));
INSERT INTO TASK_HISTORY VALUES('task0082', 'e0015', '진척도를 0에서 100으로 변경하였습니다.', to_date('201908301300', 'YYYYMMDDHH24MI'));
INSERT INTO TASK_HISTORY VALUES('task0083', 'e0015', '진척도를 0에서 100으로 변경하였습니다.', to_date('201908301300', 'YYYYMMDDHH24MI'));
INSERT INTO TASK_HISTORY VALUES('task0084', 'e0015', '진척도를 0에서 100으로 변경하였습니다.', to_date('201908301300', 'YYYYMMDDHH24MI'));
INSERT INTO TASK_HISTORY VALUES('task0085', 'e0015', '진척도를 0에서 100으로 변경하였습니다.', to_date('201908301300', 'YYYYMMDDHH24MI'));
INSERT INTO TASK_HISTORY VALUES('task0086', 'e0015', '진척도를 0에서 100으로 변경하였습니다.', to_date('201908301300', 'YYYYMMDDHH24MI'));
INSERT INTO TASK_HISTORY VALUES('task0087', 'e0015', '진척도를 0에서 100으로 변경하였습니다.', to_date('201908301300', 'YYYYMMDDHH24MI'));
INSERT INTO TASK_HISTORY VALUES('task0088', 'e0009', '진척도를 0에서 100으로 변경하였습니다.', to_date('201908301300', 'YYYYMMDDHH24MI'));
INSERT INTO TASK_HISTORY VALUES('task0089', 'e0009', '진척도를 0에서 100으로 변경하였습니다.', to_date('201909061300', 'YYYYMMDDHH24MI'));
INSERT INTO TASK_HISTORY VALUES('task0090', 'e0009', '진척도를 0에서 100으로 변경하였습니다.', to_date('201909061300', 'YYYYMMDDHH24MI'));
INSERT INTO TASK_HISTORY VALUES('task0091', 'e0009', '진척도를 0에서 100으로 변경하였습니다.', to_date('201909061300', 'YYYYMMDDHH24MI'));
INSERT INTO TASK_HISTORY VALUES('task0092', 'e0009', '진척도를 0에서 100으로 변경하였습니다.', to_date('201909061300', 'YYYYMMDDHH24MI'));
INSERT INTO TASK_HISTORY VALUES('task0093', 'e0013', '진척도를 0에서 100으로 변경하였습니다.', to_date('201909061300', 'YYYYMMDDHH24MI'));
INSERT INTO TASK_HISTORY VALUES('task0094', 'e0013', '진척도를 0에서 100으로 변경하였습니다.', to_date('201909061300', 'YYYYMMDDHH24MI'));
INSERT INTO TASK_HISTORY VALUES('task0095', 'e0013', '진척도를 0에서 100으로 변경하였습니다.', to_date('201909061300', 'YYYYMMDDHH24MI'));
INSERT INTO TASK_HISTORY VALUES('task0096', 'e0013', '진척도를 0에서 100으로 변경하였습니다.', to_date('201909061300', 'YYYYMMDDHH24MI'));
INSERT INTO TASK_HISTORY VALUES('task0097', 'e0013', '진척도를 0에서 100으로 변경하였습니다.', to_date('201909061300', 'YYYYMMDDHH24MI'));
INSERT INTO TASK_HISTORY VALUES('task0098', 'e0013', '진척도를 0에서 100으로 변경하였습니다.', to_date('201909061300', 'YYYYMMDDHH24MI'));
INSERT INTO TASK_HISTORY VALUES('task0099', 'e0013', '진척도를 0에서 100으로 변경하였습니다.', to_date('201909061300', 'YYYYMMDDHH24MI'));
INSERT INTO TASK_HISTORY VALUES('task0100', 'e0015', '진척도를 0에서 100으로 변경하였습니다.', to_date('201909061300', 'YYYYMMDDHH24MI'));
INSERT INTO TASK_HISTORY VALUES('task0101', 'e0015', '진척도를 0에서 100으로 변경하였습니다.', to_date('201909061300', 'YYYYMMDDHH24MI'));
INSERT INTO TASK_HISTORY VALUES('task0102', 'e0015', '진척도를 0에서 100으로 변경하였습니다.', to_date('201909061300', 'YYYYMMDDHH24MI'));
INSERT INTO TASK_HISTORY VALUES('task0103', 'e0015', '진척도를 0에서 100으로 변경하였습니다.', to_date('201909061300', 'YYYYMMDDHH24MI'));
INSERT INTO TASK_HISTORY VALUES('task0104', 'e0015', '진척도를 0에서 100으로 변경하였습니다.', to_date('201909061300', 'YYYYMMDDHH24MI'));
INSERT INTO TASK_HISTORY VALUES('task0105', 'e0015', '진척도를 0에서 100으로 변경하였습니다.', to_date('201909061300', 'YYYYMMDDHH24MI'));

-- pj0003

-------------------------------------------------------------------------------------------------------------------------------------------------

--팝업

INSERT INTO POPUP VALUES('pop' || LPAD(POPUP_SEQ.NEXTVAL,4,0), NULL, NULL, NULL, NULL, NULL, 'TESTTES', 'TESTESTSETSET', SYSDATE, 'e0015', '');
INSERT INTO POPUP VALUES('pop' || LPAD(POPUP_SEQ.NEXTVAL,4,0), NULL, NULL, NULL, NULL, NULL, 'TESTTES1', 'TESTESTSETSET1', SYSDATE, 'e0015', '');

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
INSERT INTO CATEGORY VALUES ('cate' || LPAD(CATEGORY_SEQ .NEXTVAL,4,0), '임원_휴가', '#22FF94', 'de0001', 'e0002');
INSERT INTO CATEGORY VALUES ('cate' || LPAD(CATEGORY_SEQ .NEXTVAL,4,0), '개발1팀_휴가', '#FF7F50', 'de0002', 'e0005');

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
