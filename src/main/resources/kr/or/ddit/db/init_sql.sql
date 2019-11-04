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

--팝업노룩
delete from popup_nolook;

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
							TO_DATE(20100101, 'YYYY/MM/DD'), 'de0001', 'posi0001', 'e0001.png', null, 'T', null);
							
							
insert into employee values('e' || LPAD(EMPLOYEE_SEQ.NEXTVAL,4,0), 'test1234', '이진우', 'USER', 'wlsdn@gmail.com', '010-2222-1111',
							TO_DATE(20130101, 'YYYY/MM/DD'), 'de0001', 'posi0002', 'e0002.png', null, 'T', null);
insert into employee values('e' || LPAD(EMPLOYEE_SEQ.NEXTVAL,4,0), 'test1234', '송찬중', 'USER', 'ckdwns@gmail.com', '010-2222-2222',
							TO_DATE(20130601, 'YYYY/MM/DD'), 'de0001', 'posi0002', 'e0003.png', null, 'T', null);
insert into employee values('e' || LPAD(EMPLOYEE_SEQ.NEXTVAL,4,0), 'test1234', '이영만', 'USER', 'dudaks@gmail.com', '010-2222-3333',
							TO_DATE(20130601, 'YYYY/MM/DD'), 'de0001', 'posi0002', 'e0004.png', null, 'T', null);
														
--인사팀 ADMIN(POSITION 하나더생김)
insert into employee values('admin', 'test1234', '관리자', 'ADMIN', 'admin@gmail.com', '010-0000-0000',
							TO_DATE(20000101, 'YYYY/MM/DD'), 'de0006', null, 'admin.png', null, 'T', null);
	
	
															
insert into employee values('e' || LPAD(EMPLOYEE_SEQ.NEXTVAL,4,0), 'test1234', '배상현', 'USER', 'bshn1234@gmail.com', '010-7277-7285',
							TO_DATE(20150115, 'YYYY/MM/DD'), 'de0002', 'posi0003', 'e0005.png', null, 'T', null);
insert into employee values('e' || LPAD(EMPLOYEE_SEQ.NEXTVAL,4,0), 'test1234', '윤재훈', 'USER', 'wogns@gmail.com', '010-3333-2222',
							TO_DATE(20150518, 'YYYY/MM/DD'), 'de0003', 'posi0003', 'e0006.png', null, 'T', null);
insert into employee values('e' || LPAD(EMPLOYEE_SEQ.NEXTVAL,4,0), 'test1234', '박진하', 'USER', 'wlsgk@gmail.com', '010-3333-3333',
							TO_DATE(20150823, 'YYYY/MM/DD'), 'de0004', 'posi0003', 'e0007.png', null, 'T', null);
insert into employee values('e' || LPAD(EMPLOYEE_SEQ.NEXTVAL,4,0), 'test1234', '박태순', 'USER', 'xotns@gmail.com', '010-3333-4444',
							TO_DATE(20160303, 'YYYY/MM/DD'), 'de0005', 'posi0003', 'e0008.png', null, 'T', null);
							
							
insert into employee values('e' || LPAD(EMPLOYEE_SEQ.NEXTVAL,4,0), 'test1234', '조민수', 'USER', 'mingsoocode@gmail.com', '010-3092-3837',
							TO_DATE(20170703, 'YYYY/MM/DD'), 'de0002', 'posi0004', 'e0009.png', null, 'T', null);
insert into employee values('e' || LPAD(EMPLOYEE_SEQ.NEXTVAL,4,0), 'test1234', '김혜인', 'USER', 'gpdls@gmail.com', '010-4444-1111',
							TO_DATE(20170906, 'YYYY/MM/DD'), 'de0003', 'posi0004', 'e0010.png', null, 'T', null);
insert into employee values('e' || LPAD(EMPLOYEE_SEQ.NEXTVAL,4,0), 'test1234', '윤경주', 'USER', 'rudwn@gmail.com', '010-4444-2222',
							TO_DATE(20170825, 'YYYY/MM/DD'), 'de0004', 'posi0004', 'e0011.png', null, 'T', null);
insert into employee values('e' || LPAD(EMPLOYEE_SEQ.NEXTVAL,4,0), 'test1234', '강승구', 'USER', 'tmdrn@gmail.com', '010-4444-3333',
							TO_DATE(20170920, 'YYYY/MM/DD'), 'de0005', 'posi0004', 'e0012.png', null, 'T', null);
							
insert into employee values('e' || LPAD(EMPLOYEE_SEQ.NEXTVAL,4,0), 'test1234', '전민규', 'USER', 'jmk5274@gmail.com', '010-6406-5274',
							TO_DATE(20170404, 'YYYY/MM/DD'), 'de0002', 'posi0005', 'e0013.png', null, 'T', null);
insert into employee values('e' || LPAD(EMPLOYEE_SEQ.NEXTVAL,4,0), 'test1234', '김도훈', 'USER', 'testhoon1217@gmail.com', '010-2566-7607',
							TO_DATE(20191010, 'YYYY/MM/DD'), 'de0002', 'posi0005', 'e0014.png', null, 'T', 'ewqdsa556');
insert into employee values('e' || LPAD(EMPLOYEE_SEQ.NEXTVAL,4,0), 'test1234', '홍다은', 'USER', 'testhong@gmail.com', '010-9326-3253',
							TO_DATE(20181005, 'YYYY/MM/DD'), 'de0002', 'posi0005', 'e0015.png', null, 'T', null);
insert into employee values('e' || LPAD(EMPLOYEE_SEQ.NEXTVAL,4,0), 'test1234', '김시우', 'USER', 'tldn@gmail.com', '010-5555-1111',
							TO_DATE(20170706, 'YYYY/MM/DD'), 'de0003', 'posi0005', 'e0016.png', null, 'T', null);
insert into employee values('e' || LPAD(EMPLOYEE_SEQ.NEXTVAL,4,0), 'test1234', '박은지', 'USER', 'dmswl@gmail.com', '010-5555-2222',
							TO_DATE(20190909, 'YYYY/MM/DD'), 'de0003', 'posi0005', 'e0017.png', null, 'T', null);
insert into employee values('e' || LPAD(EMPLOYEE_SEQ.NEXTVAL,4,0), 'test1234', '차주환', 'USER', 'wnghks@gmail.com', '010-5555-3333',
							TO_DATE(20180618, 'YYYY/MM/DD'), 'de0003', 'posi0005', 'e0018.png', null, 'T', null);
insert into employee values('e' || LPAD(EMPLOYEE_SEQ.NEXTVAL,4,0), 'test1234', '류우찬', 'USER', 'dncks@gmail.com', '010-5555-4444',
							TO_DATE(20170203, 'YYYY/MM/DD'), 'de0003', 'posi0005', 'e0019.png', null, 'T', null);
insert into employee values('e' || LPAD(EMPLOYEE_SEQ.NEXTVAL,4,0), 'test1234', '박채은', 'USER', 'codms@gmail.com', '010-5555-5555',
							TO_DATE(20180901, 'YYYY/MM/DD'), 'de0004', 'posi0005', 'e0020.png', null, 'T', null);
insert into employee values('e' || LPAD(EMPLOYEE_SEQ.NEXTVAL,4,0), 'test1234', '조하경', 'USER', 'gkrud@gmail.com', '010-5555-6666',
							TO_DATE(20190806, 'YYYY/MM/DD'), 'de0004', 'posi0005', 'e0021.png', null, 'T', null);
insert into employee values('e' || LPAD(EMPLOYEE_SEQ.NEXTVAL,4,0), 'test1234', '강해신', 'USER', 'gotls@gmail.com', '010-5555-7777',
							TO_DATE(20170403, 'YYYY/MM/DD'), 'de0005', 'posi0005', 'e0022.png', null, 'T', null);
insert into employee values('e' || LPAD(EMPLOYEE_SEQ.NEXTVAL,4,0), 'test1234', '최재영', 'USER', 'wodud@gmail.com', '010-5555-8888',
							TO_DATE(20170303, 'YYYY/MM/DD'), 'de0005', 'posi0005', 'e0023.png', null, 'T', null);
insert into employee values('e' || LPAD(EMPLOYEE_SEQ.NEXTVAL,4,0), 'test1234', '김소리', 'USER', 'thflthfl@gmail.com', '010-5555-9999',
							TO_DATE(20170406, 'YYYY/MM/DD'), 'de0005', 'posi0005', 'e0024.png', null, 'F', null);
							

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
-- 게시글(공지사항)
INSERT INTO POST(POST_ID, BOARD_ID, TITLE, CONT, EMP_ID, REG_DT, ABLE, PA_POST_ID) VALUES ('post' || LPAD(POST_SEQ.NEXTVAL,4,0), 'board0001', '스마트웨어 홈페이지 신규 Open', '안녕하세요. 스마트웨어 홈페이지가 새롭게 리뉴얼 되었습니다. 앞으로도 관계자분들과 함께 소통 할 수 있는 스마트웨어가 되겠습니다. 감사합니다.', 'admin', SYSDATE, 'F', NULL);
INSERT INTO POST(POST_ID, BOARD_ID, TITLE, CONT, EMP_ID, REG_DT, ABLE, PA_POST_ID) VALUES ('post' || LPAD(POST_SEQ.NEXTVAL,4,0), 'board0001', '사원들과 함께하는 이벤트', '점점 쌀쌀해지는 계절 전 사원들의 건강을 위해 다같이 운동을 할 수 있는 방법을 찾다가 생각해낸 이벤트입니다. 날짜는 개별 문자로 안내해드렸으니 확인바랍니다.', 'admin', SYSDATE, 'F', NULL);
INSERT INTO POST(POST_ID, BOARD_ID, TITLE, CONT, EMP_ID, REG_DT, ABLE, PA_POST_ID) VALUES ('post' || LPAD(POST_SEQ.NEXTVAL,4,0), 'board0001', '[필독]2019년 직원 인플루엔자 예방접종 사전예진표', '전 직원 인플루엔자 예방접종 사전예진표를 올립니다.', 'admin', SYSDATE, 'F', NULL);
INSERT INTO POST(POST_ID, BOARD_ID, TITLE, CONT, EMP_ID, REG_DT, ABLE, PA_POST_ID) VALUES ('post' || LPAD(POST_SEQ.NEXTVAL,4,0), 'board0001', '2월 29일부로 회사이전 하였습니다.', '장소는 전 사원 개별 연락을 통해 공지하였으니 확인바랍니다. 감사합니다.', 'admin', SYSDATE, 'F', NULL);
INSERT INTO POST(POST_ID, BOARD_ID, TITLE, CONT, EMP_ID, REG_DT, ABLE, PA_POST_ID) VALUES ('post' || LPAD(POST_SEQ.NEXTVAL,4,0), 'board0001', '협력회사 일반업체 오픈 안내', '협력회사 ', 'admin', SYSDATE, 'F', NULL);
INSERT INTO POST(POST_ID, BOARD_ID, TITLE, CONT, EMP_ID, REG_DT, ABLE, PA_POST_ID) VALUES ('post' || LPAD(POST_SEQ.NEXTVAL,4,0), 'board0001', '사원 특별 휴가 안내', '휴가 기간에는 전화, 홈페이지를 통한 문의에 대한 답변 등 서비스가 제공되지 않는 점 양해 부탁드립니다. * 휴무일 : 2019년 10월 30일 ~ 2019년 11월 7일 즐겁고 편안한 귀성길이 되시기 바라며, 행복한 휴가 보내시길 바랍니다.', 'admin', SYSDATE, 'F', NULL);
INSERT INTO POST(POST_ID, BOARD_ID, TITLE, CONT, EMP_ID, REG_DT, ABLE, PA_POST_ID) VALUES ('post' || LPAD(POST_SEQ.NEXTVAL,4,0), 'board0001', '[신간]직장인, 100만 원으로 주식투자 하기', '이대로 월급만 믿을 순 없잖아! 3년 만에 30억은 벌지 못해도 월급만 믿기엔 불안한 너와 나를 위한 왕초보 주식투자 따라 하기!', 'admin', SYSDATE, 'F', NULL);
INSERT INTO POST(POST_ID, BOARD_ID, TITLE, CONT, EMP_ID, REG_DT, ABLE, PA_POST_ID) VALUES ('post' || LPAD(POST_SEQ.NEXTVAL,4,0), 'board0001', '설 연휴 휴무 안내', '휴무기간에는 전화, 홈페이지를 통한 문의에 대한 답변 등 서비스가 제공되지 않습니다. 이점 양해 바랍니다. * 휴무일 : 2020. 2. 2 (토) ~ 2020. 2. 6 (수)', 'admin', SYSDATE, 'F', NULL);
INSERT INTO POST(POST_ID, BOARD_ID, TITLE, CONT, EMP_ID, REG_DT, ABLE, PA_POST_ID) VALUES ('post' || LPAD(POST_SEQ.NEXTVAL,4,0), 'board0001', 'Downloads 게시판 이용 안내', 'Downloads 게시판을 이용하시려면 회원가입을 하셔야지 게시판 이용이 가능하게 되어있습니다. 이점 양해 부탁드리며, 항상 최선을 다하도록 하겠습니다.', 'admin', SYSDATE, 'F', NULL);
INSERT INTO POST(POST_ID, BOARD_ID, TITLE, CONT, EMP_ID, REG_DT, ABLE, PA_POST_ID) VALUES ('post' || LPAD(POST_SEQ.NEXTVAL,4,0), 'board0001', '창의적인 인재를 모집합니다.', '창의적인 인재를 모집하기 위해 모집공고를 따로 올렸으니 확인바랍니다. 감사합니다.', 'admin', SYSDATE, 'F', NULL);
INSERT INTO POST(POST_ID, BOARD_ID, TITLE, CONT, EMP_ID, REG_DT, ABLE, PA_POST_ID) VALUES ('post' || LPAD(POST_SEQ.NEXTVAL,4,0), 'board0001', '사원 주주 대응 관련 공지사항', '사원 주주 여러분, 안녕하십니까! 회사는 최근 예정된 시간안에 외부감사인을 적시에 선임하지 못하여 특정시간 전에 감사보고서를 발행하지 못하였습니다. 거래소는 투자자보호를 위하여 당사 주식의 거래를 정지하였습니다. 모든 사원 주주분들의 이익을 수호하기 위하여 당사는 거래소와의 소통에 노력하고 있으며 빠른 시일내로 상황을 회복하여 정상화시키도록 노력할 것입니다. 수많은 사원 주주분들이 회사로 연락할 것으로 예상되는 가운데 당사 임원은 모두 외국인이고 언어 및 소통에서 원활하지 못하고 특히 전화 상의 직접소통은 오해가 발생할 소지가 있으며 효율이 낮습니다. 따라서 주주 여러분들께서는 우선 아래 메일주소를 통해 당사에 연락을 취해주시기 바랍니다. 회사는 문제에 대해 정리 후 관련 법률을 준수하는 범위 내에서 최대한 빠르고 많은 정보를 주주들에게 제공할 것입니다. 여러분들께서 이점 양해 주시기 바랍니다.', 'admin', SYSDATE, 'F', NULL);
INSERT INTO POST(POST_ID, BOARD_ID, TITLE, CONT, EMP_ID, REG_DT, ABLE, PA_POST_ID) VALUES ('post' || LPAD(POST_SEQ.NEXTVAL,4,0), 'board0001', '개선기간 부여 및 회사의 업무전개 현황', '사원 주주 여러분, 안녕하십니까! 회사의 임원, 변호사, 공시대리인은 2019년 6월 5일 한국거래소의 기업심사위원회의 심의 회의에 참석하였으며 2020년 5월 11일까지 1년간의 개선기간을 부여받게 되었습니다. 또한 회사는 회계법인과 빠른 시일내로 업무를 수행하기 위하여 다음 단계의 업무에 대해 조율을 진행해오고 있습니다. 추후 주식의 거래재개 관련 진전 사항에 대해서는 지속적으로 홈페이지를 통해 공지드릴 예정입니다. 회사에 대한 사원 주주 여러분들의 관심과 이해에 대해 감사드립니다. 감사합니다.', 'admin', SYSDATE, 'F', NULL);
INSERT INTO POST(POST_ID, BOARD_ID, TITLE, CONT, EMP_ID, REG_DT, ABLE, PA_POST_ID) VALUES ('post' || LPAD(POST_SEQ.NEXTVAL,4,0), 'board0001', '개발1팀 전체 팀원 회식 날짜 안내', '안녕하세요. 개발1팀 전 직원 여러분 회식 장소와 날짜는 개별 연락으로 공지드렸으니 확인 바랍니다. 감사합니다. 자세한 문의사항은 메일로 보내주시길 바랍니다.', 'admin', SYSDATE, 'F', NULL);
INSERT INTO POST(POST_ID, BOARD_ID, TITLE, CONT, EMP_ID, REG_DT, ABLE, PA_POST_ID) VALUES ('post' || LPAD(POST_SEQ.NEXTVAL,4,0), 'board0001', '개발2팀 전체 팀원 회식 날짜 안내', '안녕하세요. 개발2팀 전 직원 여러분 회식 장소와 날짜는 개별 연락으로 공지드렸으니 확인 바랍니다. 감사합니다. 자세한 문의사항은 메일로 보내주시길 바랍니다.', 'admin', SYSDATE, 'F', NULL);
INSERT INTO POST(POST_ID, BOARD_ID, TITLE, CONT, EMP_ID, REG_DT, ABLE, PA_POST_ID) VALUES ('post' || LPAD(POST_SEQ.NEXTVAL,4,0), 'board0001', '개발3팀 전체 팀원 회식 날짜 안내', '안녕하세요. 개발3팀 전 직원 여러분 회식 장소와 날짜는 개별 연락으로 공지드렸으니 확인 바랍니다. 감사합니다. 자세한 문의사항은 메일로 보내주시길 바랍니다.', 'admin', SYSDATE, 'F', NULL);
INSERT INTO POST(POST_ID, BOARD_ID, TITLE, CONT, EMP_ID, REG_DT, ABLE, PA_POST_ID) VALUES ('post' || LPAD(POST_SEQ.NEXTVAL,4,0), 'board0001', '홍보팀 전체 팀원 회식 날짜 안내', '안녕하세요. 홍보팀 전 직원 여러분 회식 장소와 날짜는 개별 연락으로 공지드렸으니 확인 바랍니다. 감사합니다. 자세한 문의사항은 메일로 보내주시길 바랍니다.', 'admin', SYSDATE, 'F', NULL);
INSERT INTO POST(POST_ID, BOARD_ID, TITLE, CONT, EMP_ID, REG_DT, ABLE, PA_POST_ID) VALUES ('post' || LPAD(POST_SEQ.NEXTVAL,4,0), 'board0001', '임원 전체 팀원 회식 날짜 안내', '안녕하세요. 임원직 여러분 회식 장소와 날짜는 개별 연락으로 공지드렸으니 확인 바랍니다. 감사합니다. 자세한 문의사항은 메일로 보내주시길 바랍니다.', 'admin', SYSDATE, 'F', NULL);
INSERT INTO POST(POST_ID, BOARD_ID, TITLE, CONT, EMP_ID, REG_DT, ABLE, PA_POST_ID) VALUES ('post' || LPAD(POST_SEQ.NEXTVAL,4,0), 'board0001', '부서 이동 주의사항 안내', '안녕하세요, 사원 여러분. 부서 이동 주의사항에 관한 안내 메일을 보냈으니 메일 확인 부탁드리고 숙지바랍니다.', 'admin', SYSDATE, 'F', NULL);
INSERT INTO POST(POST_ID, BOARD_ID, TITLE, CONT, EMP_ID, REG_DT, ABLE, PA_POST_ID) VALUES ('post' || LPAD(POST_SEQ.NEXTVAL,4,0), 'board0001', '[이벤트]스마트웨어 개발원 한마당 대축제', '안녕하세요, 전 사원 여러분. 곧 있으면 눈이 오는 계절이 옵니다. 바로 겨울이죠. 겨울을 맞아 스마트웨어 개발원 한마당 대축제 이벤트를 진행하려고 하오니 많은 참석 바랍니다. 자세한 날짜와 장소는 추후 게시하겠습니다. 모두 숙지해주시면 감사합니다.', 'admin', SYSDATE, 'F', NULL);
INSERT INTO POST(POST_ID, BOARD_ID, TITLE, CONT, EMP_ID, REG_DT, ABLE, PA_POST_ID) VALUES ('post' || LPAD(POST_SEQ.NEXTVAL,4,0), 'board0001', '[필독]신 개발 언어 공지', '안녕하세요, 개발직 여러분. 신 개발 언어 "simba"에 대한 사항을 개별 메일로 드렸으니 확인바랍니다. 감사합니다.', 'admin', SYSDATE, 'F', NULL);
INSERT INTO POST(POST_ID, BOARD_ID, TITLE, CONT, EMP_ID, REG_DT, ABLE, PA_POST_ID) VALUES ('post' || LPAD(POST_SEQ.NEXTVAL,4,0), 'board0001', '사원 규칙사항', '모든 사원들은 첨부된 파일의 규칙사항을 확인하여 꼭 숙지해주시길 바랍니다. 감사합니다.', 'admin', SYSDATE, 'F', NULL);

-- 사내 게시판
INSERT INTO POST(POST_ID, BOARD_ID, TITLE, CONT, EMP_ID, REG_DT, ABLE, PA_POST_ID) VALUES ('post' || LPAD(POST_SEQ.NEXTVAL,4,0), 'board0002', '홍보의 중요성', '홍보팀들 다 모입시다!! 장소는 추후 공지하겠습니다!', 'e0004', SYSDATE, 'F', NULL);
INSERT INTO POST(POST_ID, BOARD_ID, TITLE, CONT, EMP_ID, REG_DT, ABLE, PA_POST_ID) VALUES ('post' || LPAD(POST_SEQ.NEXTVAL,4,0), 'board0002', '개발의 중요성이 더..', '홍보팀의 중요성도 좋지만 개발이 더 중요하지 않을까요?', 'e0002', SYSDATE, 'F', 'post0022');
INSERT INTO POST(POST_ID, BOARD_ID, TITLE, CONT, EMP_ID, REG_DT, ABLE, PA_POST_ID) VALUES ('post' || LPAD(POST_SEQ.NEXTVAL,4,0), 'board0002', '저희 인원 모집은 언제 하나요?', '개발팀들 이러다 죽겠어요.. 개발팀 인원 모집 시급합니다.', 'e0002', SYSDATE, 'F', NULL);
INSERT INTO POST(POST_ID, BOARD_ID, TITLE, CONT, EMP_ID, REG_DT, ABLE, PA_POST_ID) VALUES ('post' || LPAD(POST_SEQ.NEXTVAL,4,0), 'board0002', '인원 모집은 공지 올렸으니 확인해보세요', 'TEST', 'e0004', SYSDATE, 'F', 'post0024');
INSERT INTO POST(POST_ID, BOARD_ID, TITLE, CONT, EMP_ID, REG_DT, ABLE, PA_POST_ID) VALUES ('post' || LPAD(POST_SEQ.NEXTVAL,4,0), 'board0002', '홍보팀 여러분 그거 아시나요?', '저희 좀 있으면 휴가입니다~ 야호 푹 쉬다 옵시다^^', 'e0018', SYSDATE, 'F', NULL);
INSERT INTO POST(POST_ID, BOARD_ID, TITLE, CONT, EMP_ID, REG_DT, ABLE, PA_POST_ID) VALUES ('post' || LPAD(POST_SEQ.NEXTVAL,4,0), 'board0002', '않이.. 통통버스때문에 죽겠어요..', '지금 통통버스 개발하는 중인데 같이 개발하실 개발원 분들 도와주시면 감사합니다.', 'e0005', SYSDATE, 'F', NULL);
INSERT INTO POST(POST_ID, BOARD_ID, TITLE, CONT, EMP_ID, REG_DT, ABLE, PA_POST_ID) VALUES ('post' || LPAD(POST_SEQ.NEXTVAL,4,0), 'board0002', '이거 결재선 되는 거 맞아요?', '수정 필요할 거 같은데..', 'e0015', SYSDATE, 'F', NULL);
INSERT INTO POST(POST_ID, BOARD_ID, TITLE, CONT, EMP_ID, REG_DT, ABLE, PA_POST_ID) VALUES ('post' || LPAD(POST_SEQ.NEXTVAL,4,0), 'board0002', '개발1팀 회식', '공지 올라왔어요 확인해보시고 연락주세요.', 'e0009', SYSDATE, 'F', NULL);
INSERT INTO POST(POST_ID, BOARD_ID, TITLE, CONT, EMP_ID, REG_DT, ABLE, PA_POST_ID) VALUES ('post' || LPAD(POST_SEQ.NEXTVAL,4,0), 'board0002', '홍보팀 회식 공지는 언제..', '홍보팀 회식 공지 언제 올라오나요?', 'e0018', SYSDATE, 'F', NULL);
INSERT INTO POST(POST_ID, BOARD_ID, TITLE, CONT, EMP_ID, REG_DT, ABLE, PA_POST_ID) VALUES ('post' || LPAD(POST_SEQ.NEXTVAL,4,0), 'board0002', '배로로의 역습 영화 어떤가요?', '혹시 보신 분 있으신가요? 사장님이랑 개발팀 직원들이랑 다 같이 보러 가기로 했는데 어떤지 몰라서..', 'e0015', SYSDATE, 'F', NULL);
INSERT INTO POST(POST_ID, BOARD_ID, TITLE, CONT, EMP_ID, REG_DT, ABLE, PA_POST_ID) VALUES ('post' || LPAD(POST_SEQ.NEXTVAL,4,0), 'board0002', '별로..', '그 영화 별로예요. 그냥 그 날은 년차내시는 게..', 'e0005', SYSDATE, 'F', 'post0031');
INSERT INTO POST(POST_ID, BOARD_ID, TITLE, CONT, EMP_ID, REG_DT, ABLE, PA_POST_ID) VALUES ('post' || LPAD(POST_SEQ.NEXTVAL,4,0), 'board0002', '않이 버스가 자꾸 통통 거려요..', '후.. 진짜.. 미치겠네.. 이거 어떻게 하죠?', 'e0005', SYSDATE, 'F', NULL);
INSERT INTO POST(POST_ID, BOARD_ID, TITLE, CONT, EMP_ID, REG_DT, ABLE, PA_POST_ID) VALUES ('post' || LPAD(POST_SEQ.NEXTVAL,4,0), 'board0002', '곧 있으면 점심시간인데..', '개발1팀 점심메뉴 정했어요?', 'e0015', SYSDATE, 'F', NULL);
INSERT INTO POST(POST_ID, BOARD_ID, TITLE, CONT, EMP_ID, REG_DT, ABLE, PA_POST_ID) VALUES ('post' || LPAD(POST_SEQ.NEXTVAL,4,0), 'board0002', '요우란', '요우란 거기 튀김집인데 진짜 맛있더라구요. 회사에서 그리 멀지 않으니까 거기로 가서 점심식사 하세요^^', 'e0005', SYSDATE, 'F', 'post0034');

-- 자료실
INSERT INTO POST(POST_ID, BOARD_ID, TITLE, CONT, EMP_ID, REG_DT, ABLE, PA_POST_ID) VALUES ('post' || LPAD(POST_SEQ.NEXTVAL,4,0), 'board0003', '임원 자료', '첨부파일 확인바랍니다.', 'e0002', SYSDATE, 'F', NULL);
INSERT INTO POST(POST_ID, BOARD_ID, TITLE, CONT, EMP_ID, REG_DT, ABLE, PA_POST_ID) VALUES ('post' || LPAD(POST_SEQ.NEXTVAL,4,0), 'board0003', '개발1팀 자료', '첨부파일 확인바랍니다.', 'e0002', SYSDATE, 'F', NULL);
INSERT INTO POST(POST_ID, BOARD_ID, TITLE, CONT, EMP_ID, REG_DT, ABLE, PA_POST_ID) VALUES ('post' || LPAD(POST_SEQ.NEXTVAL,4,0), 'board0003', '개발2팀 자료', '첨부파일 확인바랍니다.', 'e0002', SYSDATE, 'F', NULL);
INSERT INTO POST(POST_ID, BOARD_ID, TITLE, CONT, EMP_ID, REG_DT, ABLE, PA_POST_ID) VALUES ('post' || LPAD(POST_SEQ.NEXTVAL,4,0), 'board0003', '개발3팀 자료', '첨부파일 확인바랍니다.', 'e0002', SYSDATE, 'F', NULL);
INSERT INTO POST(POST_ID, BOARD_ID, TITLE, CONT, EMP_ID, REG_DT, ABLE, PA_POST_ID) VALUES ('post' || LPAD(POST_SEQ.NEXTVAL,4,0), 'board0003', '홍보팀 자료', '첨부파일 확인바랍니다.', 'e0002', SYSDATE, 'T', NULL);

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--게시글 파일
INSERT INTO POST_FILE(FILE_ID, POST_ID, FILE_NM, REALFILEPATH) VALUES ('f' || LPAD(POST_FILE_SEQ.NEXTVAL,4,0), 'post0021', 'TEST01', 'D:\UPLOAD\RANGERS\BROWN.PNG');
INSERT INTO POST_FILE(FILE_ID, POST_ID, FILE_NM, REALFILEPATH) VALUES ('f' || LPAD(POST_FILE_SEQ.NEXTVAL,4,0), 'post0021', 'TEST01', 'D:\UPLOAD\RANGERS\BROWN.PNG');
INSERT INTO POST_FILE(FILE_ID, POST_ID, FILE_NM, REALFILEPATH) VALUES ('f' || LPAD(POST_FILE_SEQ.NEXTVAL,4,0), 'post0021', 'TEST01', 'D:\UPLOAD\RANGERS\BROWN.PNG');
INSERT INTO POST_FILE(FILE_ID, POST_ID, FILE_NM, REALFILEPATH) VALUES ('f' || LPAD(POST_FILE_SEQ.NEXTVAL,4,0), 'post0021', 'TEST01', 'D:\UPLOAD\RANGERS\BROWN.PNG');
INSERT INTO POST_FILE(FILE_ID, POST_ID, FILE_NM, REALFILEPATH) VALUES ('f' || LPAD(POST_FILE_SEQ.NEXTVAL,4,0), 'post0036', 'TEST01', 'D:\UPLOAD\RANGERS\BROWN.PNG');
INSERT INTO POST_FILE(FILE_ID, POST_ID, FILE_NM, REALFILEPATH) VALUES ('f' || LPAD(POST_FILE_SEQ.NEXTVAL,4,0), 'post0036', 'TEST01', 'D:\UPLOAD\RANGERS\BROWN.PNG');
INSERT INTO POST_FILE(FILE_ID, POST_ID, FILE_NM, REALFILEPATH) VALUES ('f' || LPAD(POST_FILE_SEQ.NEXTVAL,4,0), 'post0036', 'TEST01', 'D:\UPLOAD\RANGERS\BROWN.PNG');
INSERT INTO POST_FILE(FILE_ID, POST_ID, FILE_NM, REALFILEPATH) VALUES ('f' || LPAD(POST_FILE_SEQ.NEXTVAL,4,0), 'post0036', 'TEST01', 'D:\UPLOAD\RANGERS\BROWN.PNG');
INSERT INTO POST_FILE(FILE_ID, POST_ID, FILE_NM, REALFILEPATH) VALUES ('f' || LPAD(POST_FILE_SEQ.NEXTVAL,4,0), 'post0037', 'TEST01', 'D:\UPLOAD\RANGERS\BROWN.PNG');
INSERT INTO POST_FILE(FILE_ID, POST_ID, FILE_NM, REALFILEPATH) VALUES ('f' || LPAD(POST_FILE_SEQ.NEXTVAL,4,0), 'post0037', 'TEST01', 'D:\UPLOAD\RANGERS\BROWN.PNG');
INSERT INTO POST_FILE(FILE_ID, POST_ID, FILE_NM, REALFILEPATH) VALUES ('f' || LPAD(POST_FILE_SEQ.NEXTVAL,4,0), 'post0037', 'TEST01', 'D:\UPLOAD\RANGERS\BROWN.PNG');
INSERT INTO POST_FILE(FILE_ID, POST_ID, FILE_NM, REALFILEPATH) VALUES ('f' || LPAD(POST_FILE_SEQ.NEXTVAL,4,0), 'post0037', 'TEST01', 'D:\UPLOAD\RANGERS\BROWN.PNG');
INSERT INTO POST_FILE(FILE_ID, POST_ID, FILE_NM, REALFILEPATH) VALUES ('f' || LPAD(POST_FILE_SEQ.NEXTVAL,4,0), 'post0038', 'TEST01', 'D:\UPLOAD\RANGERS\BROWN.PNG');
INSERT INTO POST_FILE(FILE_ID, POST_ID, FILE_NM, REALFILEPATH) VALUES ('f' || LPAD(POST_FILE_SEQ.NEXTVAL,4,0), 'post0038', 'TEST01', 'D:\UPLOAD\RANGERS\BROWN.PNG');
INSERT INTO POST_FILE(FILE_ID, POST_ID, FILE_NM, REALFILEPATH) VALUES ('f' || LPAD(POST_FILE_SEQ.NEXTVAL,4,0), 'post0038', 'TEST01', 'D:\UPLOAD\RANGERS\BROWN.PNG');
INSERT INTO POST_FILE(FILE_ID, POST_ID, FILE_NM, REALFILEPATH) VALUES ('f' || LPAD(POST_FILE_SEQ.NEXTVAL,4,0), 'post0038', 'TEST02', 'D:\UPLOAD\RANGERS\CONY.PNG');
INSERT INTO POST_FILE(FILE_ID, POST_ID, FILE_NM, REALFILEPATH) VALUES ('f' || LPAD(POST_FILE_SEQ.NEXTVAL,4,0), 'post0039', 'TEST02', 'D:\UPLOAD\RANGERS\CONY.PNG');
INSERT INTO POST_FILE(FILE_ID, POST_ID, FILE_NM, REALFILEPATH) VALUES ('f' || LPAD(POST_FILE_SEQ.NEXTVAL,4,0), 'post0039', 'TEST02', 'D:\UPLOAD\RANGERS\CONY.PNG');
INSERT INTO POST_FILE(FILE_ID, POST_ID, FILE_NM, REALFILEPATH) VALUES ('f' || LPAD(POST_FILE_SEQ.NEXTVAL,4,0), 'post0040', 'TEST02', 'D:\UPLOAD\RANGERS\CONY.PNG');
INSERT INTO POST_FILE(FILE_ID, POST_ID, FILE_NM, REALFILEPATH) VALUES ('f' || LPAD(POST_FILE_SEQ.NEXTVAL,4,0), 'post0040', 'TEST02', 'D:\UPLOAD\RANGERS\CONY.PNG');

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--댓글
INSERT INTO COMMENTS(COM_ID, POST_ID, EMP_ID, REG_DT, CONT, ABLE, PA_COM_ID) VALUES ('com' || LPAD(COMMENTS_SEQ.NEXTVAL,4,0), 'post0022', 'e0002', SYSDATE, 'TEST', 'T', NULL);
INSERT INTO COMMENTS(COM_ID, POST_ID, EMP_ID, REG_DT, CONT, ABLE, PA_COM_ID) VALUES ('com' || LPAD(COMMENTS_SEQ.NEXTVAL,4,0), 'post0023', 'e0002', SYSDATE, 'TEST', 'T', NULL);
INSERT INTO COMMENTS(COM_ID, POST_ID, EMP_ID, REG_DT, CONT, ABLE, PA_COM_ID) VALUES ('com' || LPAD(COMMENTS_SEQ.NEXTVAL,4,0), 'post0024', 'e0002', SYSDATE, 'TEST', 'T', NULL);
INSERT INTO COMMENTS(COM_ID, POST_ID, EMP_ID, REG_DT, CONT, ABLE, PA_COM_ID) VALUES ('com' || LPAD(COMMENTS_SEQ.NEXTVAL,4,0), 'post0025', 'e0002', SYSDATE, 'TEST', 'T', NULL);
INSERT INTO COMMENTS(COM_ID, POST_ID, EMP_ID, REG_DT, CONT, ABLE, PA_COM_ID) VALUES ('com' || LPAD(COMMENTS_SEQ.NEXTVAL,4,0), 'post0026', 'e0002', SYSDATE, 'TEST', 'T', NULL);
INSERT INTO COMMENTS(COM_ID, POST_ID, EMP_ID, REG_DT, CONT, ABLE, PA_COM_ID) VALUES ('com' || LPAD(COMMENTS_SEQ.NEXTVAL,4,0), 'post0027', 'e0002', SYSDATE, 'TEST', 'T', NULL);
INSERT INTO COMMENTS(COM_ID, POST_ID, EMP_ID, REG_DT, CONT, ABLE, PA_COM_ID) VALUES ('com' || LPAD(COMMENTS_SEQ.NEXTVAL,4,0), 'post0028', 'e0002', SYSDATE, 'TEST', 'T', NULL);

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--프로젝트

INSERT INTO PROJECT VALUES ('pj' || LPAD(PROJECT_SEQ.NEXTVAL,4,0), '영화관 예매 시스템', to_date('20190612', 'YYYYMMDD'), to_date('20190906', 'YYYYMMDD'), NULL);
INSERT INTO PROJECT VALUES ('pj' || LPAD(PROJECT_SEQ.NEXTVAL,4,0), '유기동물 입양 시스템', to_date('20190819', 'YYYYMMDD'), to_date('20190906', 'YYYYMMDD'), NULL);
INSERT INTO PROJECT VALUES ('pj' || LPAD(PROJECT_SEQ.NEXTVAL,4,0), '스마트 웨어', trunc(sysdate, 'iw')-14, trunc(sysdate, 'iw')+12+23/24+59/1440, NULL);
     
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
INSERT INTO TASK VALUES ('task' || LPAD(TASK_SEQ.NEXTVAL,4,0), '기능', to_date('201906120000', 'YYYYMMDDHH24MI'), to_date('201907052359', 'YYYYMMDDHH24MI'), 'pj0001', null, 100);
INSERT INTO TASK VALUES ('task' || LPAD(TASK_SEQ.NEXTVAL,4,0), '로그인과 로그아웃', to_date('201906120000', 'YYYYMMDDHH24MI'), to_date('201907052359', 'YYYYMMDDHH24MI'), 'pj0001', 'task0001', 100);
INSERT INTO TASK VALUES ('task' || LPAD(TASK_SEQ.NEXTVAL,4,0), '게시판 구현', to_date('201906120000', 'YYYYMMDDHH24MI'), to_date('201907052359', 'YYYYMMDDHH24MI'), 'pj0001', 'task0001', 100);
INSERT INTO TASK VALUES ('task' || LPAD(TASK_SEQ.NEXTVAL,4,0), '예매 구현', to_date('201906120000', 'YYYYMMDDHH24MI'), to_date('201907052359', 'YYYYMMDDHH24MI'), 'pj0001', 'task0001', 100);
INSERT INTO TASK VALUES ('task' || LPAD(TASK_SEQ.NEXTVAL,4,0), '공지사항 구현', to_date('201907080000', 'YYYYMMDDHH24MI'), to_date('201907262359', 'YYYYMMDDHH24MI'), 'pj0001', 'task0001', 100);
INSERT INTO TASK VALUES ('task' || LPAD(TASK_SEQ.NEXTVAL,4,0), '영화관 배치 구현', to_date('201907080000', 'YYYYMMDDHH24MI'), to_date('201907262359', 'YYYYMMDDHH24MI'), 'pj0001', 'task0001', 100);
INSERT INTO TASK VALUES ('task' || LPAD(TASK_SEQ.NEXTVAL,4,0), '예매 내역 구현', to_date('201907080000', 'YYYYMMDDHH24MI'), to_date('201907262359', 'YYYYMMDDHH24MI'), 'pj0001', 'task0001', 100);
INSERT INTO TASK VALUES ('task' || LPAD(TASK_SEQ.NEXTVAL,4,0), '영화관 관리 구현', to_date('201907080000', 'YYYYMMDDHH24MI'), to_date('201907262359', 'YYYYMMDDHH24MI'), 'pj0001', 'task0001', 100);
INSERT INTO TASK VALUES ('task' || LPAD(TASK_SEQ.NEXTVAL,4,0), '마이페이지 구현', to_date('201909020000', 'YYYYMMDDHH24MI'), to_date('201909062359', 'YYYYMMDDHH24MI'), 'pj0001', 'task0001', 100);
INSERT INTO TASK VALUES ('task' || LPAD(TASK_SEQ.NEXTVAL,4,0), '회원탈퇴 구현', to_date('201909020000', 'YYYYMMDDHH24MI'), to_date('201909062359', 'YYYYMMDDHH24MI'), 'pj0001', 'task0001', 100);

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
-- task0106 ~  task0109 ==> 김도훈 e0014
INSERT INTO TASK VALUES ('task' || LPAD(TASK_SEQ.NEXTVAL,4,0), '로그인', trunc(sysdate, 'iw')-14, trunc(sysdate, 'iw')-13+23/24+59/1440, 'pj0003', null, 100);	
INSERT INTO TASK VALUES ('task' || LPAD(TASK_SEQ.NEXTVAL,4,0), '로그인 기능', trunc(sysdate, 'iw')-14, trunc(sysdate, 'iw')-14+23/24+59/1440, 'pj0003', 'task0106', 100);			
INSERT INTO TASK VALUES ('task' || LPAD(TASK_SEQ.NEXTVAL,4,0), '로그아웃 기능', trunc(sysdate, 'iw')-14, trunc(sysdate, 'iw')-14+23/24+59/1440, 'pj0003', 'task0106', 100);
INSERT INTO TASK VALUES ('task' || LPAD(TASK_SEQ.NEXTVAL,4,0), '현재 로그인한 사원리스트 조회 기능', trunc(sysdate, 'iw')-14, trunc(sysdate, 'iw')-13+23/24+59/1440, 'pj0003', 'task0106', 100);

-- task0110 ~ task0114 ==> 홍다은 e0015
INSERT INTO TASK VALUES ('task' || LPAD(TASK_SEQ.NEXTVAL,4,0), '마이페이지', trunc(sysdate, 'iw')-14, trunc(sysdate, 'iw')-9+23/24+59/1440, 'pj0003', null, 100);
INSERT INTO TASK VALUES ('task' || LPAD(TASK_SEQ.NEXTVAL,4,0), '마이페이지 화면 구현'	, trunc(sysdate, 'iw')-14, trunc(sysdate, 'iw')-13+23/24+59/1440, 'pj0003', 'task0110', 100);
INSERT INTO TASK VALUES ('task' || LPAD(TASK_SEQ.NEXTVAL,4,0), '마이 페이지 상세정보 출력', trunc(sysdate, 'iw')-13, trunc(sysdate, 'iw')-12+23/24+59/1440, 'pj0003', 'task0110', 100);
INSERT INTO TASK VALUES ('task' || LPAD(TASK_SEQ.NEXTVAL,4,0), '마이페이지 상세정보 수정 기능', trunc(sysdate, 'iw')-11, trunc(sysdate, 'iw')-10+23/24+59/1440, 'pj0003', 'task0110', 100);			
INSERT INTO TASK VALUES ('task' || LPAD(TASK_SEQ.NEXTVAL,4,0), '프로필, 서명 사진 등록/수정 기능', trunc(sysdate, 'iw')-10, trunc(sysdate, 'iw')-9+23/24+59/1440, 'pj0003', 'task0110', 100);

-- task0115 ~ task0119 ==> 전민규 e0013
INSERT INTO TASK VALUES ('task' || LPAD(TASK_SEQ.NEXTVAL,4,0), '채팅', trunc(sysdate, 'iw')-14, trunc(sysdate, 'iw')-9+23/24+59/1440, 'pj0003', null, 100);
INSERT INTO TASK VALUES ('task' || LPAD(TASK_SEQ.NEXTVAL,4,0), '채팅방 생성 기능', trunc(sysdate, 'iw')-14, trunc(sysdate, 'iw')-13+23/24+59/1440, 'pj0003', 'task0115', 100);
INSERT INTO TASK VALUES ('task' || LPAD(TASK_SEQ.NEXTVAL,4,0), '다중 채팅 기능', trunc(sysdate, 'iw')-13, trunc(sysdate, 'iw')-12+23/24+59/1440, 'pj0003', 'task0115', 100);
INSERT INTO TASK VALUES ('task' || LPAD(TASK_SEQ.NEXTVAL,4,0), '채팅방 초대 기능	', trunc(sysdate, 'iw')-11, trunc(sysdate, 'iw')-10+23/24+59/1440, 'pj0003', 'task0115', 100);
INSERT INTO TASK VALUES ('task' || LPAD(TASK_SEQ.NEXTVAL,4,0), '채팅 수신 시 알림 기능', trunc(sysdate, 'iw')-10, trunc(sysdate, 'iw')-9+23/24+59/1440, 'pj0003', 'task0115', 100);

-- task0120 ~ task0124 ==> 조민수 e0009
INSERT INTO TASK VALUES ('task' || LPAD(TASK_SEQ.NEXTVAL,4,0), '일정관리', trunc(sysdate, 'iw')-14, trunc(sysdate, 'iw')-2+23/24+59/1440, 'pj0003', null, 95);
INSERT INTO TASK VALUES ('task' || LPAD(TASK_SEQ.NEXTVAL,4,0), '계정 연동 구글 캘린더 화면 출력', trunc(sysdate, 'iw')-14, trunc(sysdate, 'iw')-12+23/24+59/1440, 'pj0003', 'task0120', 100);
INSERT INTO TASK VALUES ('task' || LPAD(TASK_SEQ.NEXTVAL,4,0), '캘린더 일정 등록 기능', trunc(sysdate, 'iw')-11, trunc(sysdate, 'iw')-9+23/24+59/1440, 'pj0003', 'task0120', 100);
INSERT INTO TASK VALUES ('task' || LPAD(TASK_SEQ.NEXTVAL,4,0), '캘린더 조회/삭제/수정 연동 기능', trunc(sysdate, 'iw')-7, trunc(sysdate, 'iw')-5+23/24+59/1440, 'pj0003', 'task0120', 100);
INSERT INTO TASK VALUES ('task' || LPAD(TASK_SEQ.NEXTVAL,4,0), '일정 알림 기능 구현', trunc(sysdate, 'iw')-4, trunc(sysdate, 'iw')-2+23/24+59/1440, 'pj0003', 'task0120', 80);

-- task0125 ~ task0129 ==> 배상현 e0005
INSERT INTO TASK VALUES ('task' || LPAD(TASK_SEQ.NEXTVAL,4,0), '출퇴근 앱', trunc(sysdate, 'iw')-14, trunc(sysdate, 'iw')-6+23/24+59/1440, 'pj0003', null, 100);
INSERT INTO TASK VALUES ('task' || LPAD(TASK_SEQ.NEXTVAL,4,0), '지문인식 로그인', trunc(sysdate, 'iw')-14, trunc(sysdate, 'iw')-13+23/24+59/1440, 'pj0003', 'task0125', 100);
INSERT INTO TASK VALUES ('task' || LPAD(TASK_SEQ.NEXTVAL,4,0), 'GPS 기반 출퇴근 기록', trunc(sysdate, 'iw')-12, trunc(sysdate, 'iw')-11+23/24+59/1440, 'pj0003', 'task0125', 100);
INSERT INTO TASK VALUES ('task' || LPAD(TASK_SEQ.NEXTVAL,4,0), '출퇴근 기록 확인 기능', trunc(sysdate, 'iw')-10, trunc(sysdate, 'iw')-9+23/24+59/1440, 'pj0003', 'task0125', 100);
INSERT INTO TASK VALUES ('task' || LPAD(TASK_SEQ.NEXTVAL,4,0), '근태 사유서 전송 및 확인 기능', trunc(sysdate, 'iw')-7, trunc(sysdate, 'iw')-6+23/24+59/1440, 'pj0003', 'task0125', 100);

-- task0130 ~ task0132 ==> 김도훈 e0014
INSERT INTO TASK VALUES ('task' || LPAD(TASK_SEQ.NEXTVAL,4,0), '주소록', trunc(sysdate, 'iw')-12, trunc(sysdate, 'iw')-9+23/24+59/1440, 'pj0003', null, 100);
INSERT INTO TASK VALUES ('task' || LPAD(TASK_SEQ.NEXTVAL,4,0), '주소록 부서별 조회', trunc(sysdate, 'iw')-12, trunc(sysdate, 'iw')-11+23/24+59/1440, 'pj0003', 'task0130', 100);
INSERT INTO TASK VALUES ('task' || LPAD(TASK_SEQ.NEXTVAL,4,0), '주소록 추가 삭제 수정 기능', trunc(sysdate, 'iw')-10, trunc(sysdate, 'iw')-9+23/24+59/1440, 'pj0003', 'task0130', 100);

-- task0133 ~ task0139 ==> 김도훈 e0014
INSERT INTO TASK VALUES ('task' || LPAD(TASK_SEQ.NEXTVAL,4,0), '메일', trunc(sysdate, 'iw')-7, trunc(sysdate, 'iw')+5+23/24+59/1440, 'pj0003', null, 55);
INSERT INTO TASK VALUES ('task' || LPAD(TASK_SEQ.NEXTVAL,4,0), '메일 페이지 구현', trunc(sysdate, 'iw')-7, trunc(sysdate, 'iw')-6+23/24+59/1440, 'pj0003', 'task0133', 100);
INSERT INTO TASK VALUES ('task' || LPAD(TASK_SEQ.NEXTVAL,4,0), '받은 메일함 기능', trunc(sysdate, 'iw')-5, trunc(sysdate, 'iw')-4+23/24+59/1440, 'pj0003', 'task0133', 100);
INSERT INTO TASK VALUES ('task' || LPAD(TASK_SEQ.NEXTVAL,4,0), '메일 쓰기 및 답장 기능', trunc(sysdate, 'iw')-3, trunc(sysdate, 'iw')-2+23/24+59/1440, 'pj0003', 'task0133', 80);
INSERT INTO TASK VALUES ('task' || LPAD(TASK_SEQ.NEXTVAL,4,0), '보낸 메일함 기능', trunc(sysdate, 'iw'), trunc(sysdate, 'iw')+1+23/24+59/1440, 'pj0003', 'task0133', 50);
INSERT INTO TASK VALUES ('task' || LPAD(TASK_SEQ.NEXTVAL,4,0), '스팸 메일 기능', trunc(sysdate, 'iw')+2, trunc(sysdate, 'iw')+3+23/24+59/1440, 'pj0003', 'task0133', 0);
INSERT INTO TASK VALUES ('task' || LPAD(TASK_SEQ.NEXTVAL,4,0), '휴지통 및 검색 기능', trunc(sysdate, 'iw')+4, trunc(sysdate, 'iw')+5+23/24+59/1440, 'pj0003', 'task0133', 0);

-- task0140 ~ task0150 ==> 홍다은 e0015
INSERT INTO TASK VALUES ('task' || LPAD(TASK_SEQ.NEXTVAL,4,0), '게시판', trunc(sysdate, 'iw')-7, trunc(sysdate, 'iw')-2+23/24+59/1440, 'pj0003', null, 96);
INSERT INTO TASK VALUES ('task' || LPAD(TASK_SEQ.NEXTVAL,4,0), '메뉴 및 게시판 관리 페이지 구현', trunc(sysdate, 'iw')-7, trunc(sysdate, 'iw')-6+23/24+59/1440, 'pj0003', 'task0140', 100);
INSERT INTO TASK VALUES ('task' || LPAD(TASK_SEQ.NEXTVAL,4,0), '공지사항 게시글 생성 기능', trunc(sysdate, 'iw')-7, trunc(sysdate, 'iw')-6+23/24+59/1440, 'pj0003', 'task0140', 100);
INSERT INTO TASK VALUES ('task' || LPAD(TASK_SEQ.NEXTVAL,4,0), '공지사항 게시글 삭제', trunc(sysdate, 'iw')-7, trunc(sysdate, 'iw')-6+23/24+59/1440, 'pj0003', 'task0140', 100);
INSERT INTO TASK VALUES ('task' || LPAD(TASK_SEQ.NEXTVAL,4,0), '공지사항 게시글 수정', trunc(sysdate, 'iw')-7, trunc(sysdate, 'iw')-6+23/24+59/1440, 'pj0003', 'task0140', 100);
INSERT INTO TASK VALUES ('task' || LPAD(TASK_SEQ.NEXTVAL,4,0), '직원소통 게시글 생성', trunc(sysdate, 'iw')-5, trunc(sysdate, 'iw')-4+23/24+59/1440, 'pj0003', 'task0140', 100);
INSERT INTO TASK VALUES ('task' || LPAD(TASK_SEQ.NEXTVAL,4,0), '직원소통 게시글 삭제', trunc(sysdate, 'iw')-5, trunc(sysdate, 'iw')-4+23/24+59/1440, 'pj0003', 'task0140', 100);
INSERT INTO TASK VALUES ('task' || LPAD(TASK_SEQ.NEXTVAL,4,0), '직원소통 게시글 수정', trunc(sysdate, 'iw')-5, trunc(sysdate, 'iw')-4+23/24+59/1440, 'pj0003', 'task0140', 100);
INSERT INTO TASK VALUES ('task' || LPAD(TASK_SEQ.NEXTVAL,4,0), '자료실 게시글 생성', trunc(sysdate, 'iw')-3, trunc(sysdate, 'iw')-2+23/24+59/1440, 'pj0003', 'task0140', 100);
INSERT INTO TASK VALUES ('task' || LPAD(TASK_SEQ.NEXTVAL,4,0), '자료실 게시글 삭제', trunc(sysdate, 'iw')-3, trunc(sysdate, 'iw')-2+23/24+59/1440, 'pj0003', 'task0140', 80);
INSERT INTO TASK VALUES ('task' || LPAD(TASK_SEQ.NEXTVAL,4,0), '자료실 게시글 수정', trunc(sysdate, 'iw')-3, trunc(sysdate, 'iw')-2+23/24+59/1440, 'pj0003', 'task0140', 80);

-- task0151 ~ task0155 ==> 홍다은 e0015
INSERT INTO TASK VALUES ('task' || LPAD(TASK_SEQ.NEXTVAL,4,0), '사원 관리자', trunc(sysdate, 'iw'), trunc(sysdate, 'iw')+5+23/24+59/1440, 'pj0003', null, 5);
INSERT INTO TASK VALUES ('task' || LPAD(TASK_SEQ.NEXTVAL,4,0), '사원 리스트 페이징 구현', trunc(sysdate, 'iw'), trunc(sysdate, 'iw')+1+23/24+59/1440, 'pj0003', 'task0151', 20);
INSERT INTO TASK VALUES ('task' || LPAD(TASK_SEQ.NEXTVAL,4,0), '사원 계정 비활성화/삭제 기능', trunc(sysdate, 'iw')+1, trunc(sysdate, 'iw')+2+23/24+59/1440, 'pj0003', 'task0151', 0);
INSERT INTO TASK VALUES ('task' || LPAD(TASK_SEQ.NEXTVAL,4,0), '사원 계정 부서/직책 변경 기능', trunc(sysdate, 'iw')+3, trunc(sysdate, 'iw')+4+23/24+59/1440, 'pj0003', 'task0151', 0);
INSERT INTO TASK VALUES ('task' || LPAD(TASK_SEQ.NEXTVAL,4,0), '신규 사원 계정 추가 기능', trunc(sysdate, 'iw')+4, trunc(sysdate, 'iw')+5+23/24+59/1440, 'pj0003', 'task0151', 0);

-- task0156 ~ task0159 ==> 전민규 e0013
INSERT INTO TASK VALUES ('task' || LPAD(TASK_SEQ.NEXTVAL,4,0), '팝업', trunc(sysdate, 'iw')-7, trunc(sysdate, 'iw')-2+23/24+59/1440, 'pj0003', null, 93);			
INSERT INTO TASK VALUES ('task' || LPAD(TASK_SEQ.NEXTVAL,4,0), '팝업 위치별 추가 기능', trunc(sysdate, 'iw')-7, trunc(sysdate, 'iw')-6+23/24+59/1440, 'pj0003', 'task0156', 100);			
INSERT INTO TASK VALUES ('task' || LPAD(TASK_SEQ.NEXTVAL,4,0), '팝업 비활성화 버튼 기능', trunc(sysdate, 'iw')-5, trunc(sysdate, 'iw')-4+23/24+59/1440, 'pj0003', 'task0156', 100);
INSERT INTO TASK VALUES ('task' || LPAD(TASK_SEQ.NEXTVAL,4,0), '팝업 삭제 및 기간 수정 기능', trunc(sysdate, 'iw')-3, trunc(sysdate, 'iw')-2+23/24+59/1440, 'pj0003', 'task0156', 80);			

-- task0160 ~ task0164 ==> 배상현 e0005
INSERT INTO TASK VALUES ('task' || LPAD(TASK_SEQ.NEXTVAL,4,0), '전자결재', trunc(sysdate, 'iw')-5, trunc(sysdate, 'iw')+3+23/24+59/1440, 'pj0003', null, 45);			
INSERT INTO TASK VALUES ('task' || LPAD(TASK_SEQ.NEXTVAL,4,0), '전자결재 신청서 화면 구현', trunc(sysdate, 'iw')-5, trunc(sysdate, 'iw')-4+23/24+59/1440, 'pj0003', 'task0160', 100);			
INSERT INTO TASK VALUES ('task' || LPAD(TASK_SEQ.NEXTVAL,4,0), '전자결재 신청서 및 결재선 연동 기능', trunc(sysdate, 'iw')-3, trunc(sysdate, 'iw')-2+23/24+59/1440, 'pj0003', 'task0160', 80);			
INSERT INTO TASK VALUES ('task' || LPAD(TASK_SEQ.NEXTVAL,4,0), '결재선 배치 설정', trunc(sysdate, 'iw'), trunc(sysdate, 'iw')+1+23/24+59/1440, 'pj0003', 'task0160', 0);			
INSERT INTO TASK VALUES ('task' || LPAD(TASK_SEQ.NEXTVAL,4,0), '결재자 신청서 결재 기능', trunc(sysdate, 'iw')+2, trunc(sysdate, 'iw')+3+23/24+59/1440, 'pj0003', 'task0160', 0);			

-- task0165 ~ task0166 ==> 홍다은 e0015
INSERT INTO TASK VALUES ('task' || LPAD(TASK_SEQ.NEXTVAL,4,0), '영상통화', trunc(sysdate, 'iw')+7, trunc(sysdate, 'iw')+12+23/24+59/1440, 'pj0003', null, 0);			
INSERT INTO TASK VALUES ('task' || LPAD(TASK_SEQ.NEXTVAL,4,0), '영상통화 기능 구현', trunc(sysdate, 'iw')+7, trunc(sysdate, 'iw')+12+23/24+59/1440, 'pj0003', 'task0165', 0);			

-- task0167 ~ task0171 ==> 전민규 e0013
INSERT INTO TASK VALUES ('task' || LPAD(TASK_SEQ.NEXTVAL,4,0), '스마트미러/웹(날씨)', trunc(sysdate, 'iw'), trunc(sysdate, 'iw')+12+23/24+59/1440, 'pj0003', null, 5);			
INSERT INTO TASK VALUES ('task' || LPAD(TASK_SEQ.NEXTVAL,4,0), '날씨 정보 출력 구현', trunc(sysdate, 'iw'), trunc(sysdate, 'iw')+2+23/24+59/1440, 'pj0003', 'task0167', 20);			
INSERT INTO TASK VALUES ('task' || LPAD(TASK_SEQ.NEXTVAL,4,0), '라즈베리파이 리눅스 환경 구성', trunc(sysdate, 'iw')+3, trunc(sysdate, 'iw')+5+23/24+59/1440, 'pj0003', 'task0167', 0);			
INSERT INTO TASK VALUES ('task' || LPAD(TASK_SEQ.NEXTVAL,4,0), '날씨 정보 라즈베리파이 적용', trunc(sysdate, 'iw')+7, trunc(sysdate, 'iw')+9+23/24+59/1440, 'pj0003', 'task0167', 0);			
INSERT INTO TASK VALUES ('task' || LPAD(TASK_SEQ.NEXTVAL,4,0), 'Google Cloud Speech 연동', trunc(sysdate, 'iw')+10, trunc(sysdate, 'iw')+12+23/24+59/1440, 'pj0003', 'task0167', 0);			

-- task0172 ~ task0176 ==> 조민수 e0009
INSERT INTO TASK VALUES ('task' || LPAD(TASK_SEQ.NEXTVAL,4,0), 'PMS', trunc(sysdate, 'iw'), trunc(sysdate, 'iw')+12+23/24+59/1440, 'pj0003', null, 5);			
INSERT INTO TASK VALUES ('task' || LPAD(TASK_SEQ.NEXTVAL,4,0), '프로젝트 생성 기능', trunc(sysdate, 'iw'), trunc(sysdate, 'iw')+2+23/24+59/1440, 'pj0003', 'task0172', 20);			
INSERT INTO TASK VALUES ('task' || LPAD(TASK_SEQ.NEXTVAL,4,0), '프로젝트 구성원 등록', trunc(sysdate, 'iw')+3, trunc(sysdate, 'iw')+5+23/24+59/1440, 'pj0003', 'task0172', 0);			
INSERT INTO TASK VALUES ('task' || LPAD(TASK_SEQ.NEXTVAL,4,0), '프로젝트 일감 배분', trunc(sysdate, 'iw')+7, trunc(sysdate, 'iw')+9+23/24+59/1440, 'pj0003', 'task0172', 0);			
INSERT INTO TASK VALUES ('task' || LPAD(TASK_SEQ.NEXTVAL,4,0), '프로젝트 일감 수정 및 검색', trunc(sysdate, 'iw')+10, trunc(sysdate, 'iw')+12+23/24+59/1440, 'pj0003', 'task0172', 0);			

-- task0177 ~ task0178 ==> 김도훈 e0014
INSERT INTO TASK VALUES ('task' || LPAD(TASK_SEQ.NEXTVAL,4,0), '메일 알람', trunc(sysdate, 'iw')+7, trunc(sysdate, 'iw')+9+23/24+59/1440, 'pj0003', null, 0);			
INSERT INTO TASK VALUES ('task' || LPAD(TASK_SEQ.NEXTVAL,4,0), '메일 알람 연동 기능', trunc(sysdate, 'iw')+7, trunc(sysdate, 'iw')+9+23/24+59/1440, 'pj0003', 'task0177', 0);			

-- task0179 ~ task0180 ==> 김도훈 e0014
INSERT INTO TASK VALUES ('task' || LPAD(TASK_SEQ.NEXTVAL,4,0), '출퇴근 버스', trunc(sysdate, 'iw')+10, trunc(sysdate, 'iw')+12+23/24+59/1440, 'pj0003', null, 0);			
INSERT INTO TASK VALUES ('task' || LPAD(TASK_SEQ.NEXTVAL,4,0), '출퇴근 버스 실시간 조회 기능 구현', trunc(sysdate, 'iw')+10, trunc(sysdate, 'iw')+12+23/24+59/1440, 'pj0003','task0179', 0);			

-- task0181 ~ task0182 ==> 배상현 e0005
INSERT INTO TASK VALUES ('task' || LPAD(TASK_SEQ.NEXTVAL,4,0), '스마트미러/웹(일정)', trunc(sysdate, 'iw')+4, trunc(sysdate, 'iw')+12+23/24+59/1440, 'pj0003', null, 0);			
INSERT INTO TASK VALUES ('task' || LPAD(TASK_SEQ.NEXTVAL,4,0), '일정 관리 기능 라즈베리파이 적용', trunc(sysdate, 'iw')+4, trunc(sysdate, 'iw')+12+23/24+59/1440, 'pj0003', 'task0181', 0);			

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
INSERT INTO PRO_TASK VALUES('e0014', 'task0106', 'pj0003');
INSERT INTO PRO_TASK VALUES('e0014', 'task0107', 'pj0003');
INSERT INTO PRO_TASK VALUES('e0014', 'task0108', 'pj0003');
INSERT INTO PRO_TASK VALUES('e0014', 'task0109', 'pj0003');
INSERT INTO PRO_TASK VALUES('e0015', 'task0110', 'pj0003');
INSERT INTO PRO_TASK VALUES('e0015', 'task0111', 'pj0003');
INSERT INTO PRO_TASK VALUES('e0015', 'task0112', 'pj0003');
INSERT INTO PRO_TASK VALUES('e0015', 'task0113', 'pj0003');
INSERT INTO PRO_TASK VALUES('e0015', 'task0114', 'pj0003');
INSERT INTO PRO_TASK VALUES('e0013', 'task0115', 'pj0003');
INSERT INTO PRO_TASK VALUES('e0013', 'task0116', 'pj0003');
INSERT INTO PRO_TASK VALUES('e0013', 'task0117', 'pj0003');
INSERT INTO PRO_TASK VALUES('e0013', 'task0118', 'pj0003');
INSERT INTO PRO_TASK VALUES('e0013', 'task0119', 'pj0003');
INSERT INTO PRO_TASK VALUES('e0009', 'task0120', 'pj0003');
INSERT INTO PRO_TASK VALUES('e0009', 'task0121', 'pj0003');
INSERT INTO PRO_TASK VALUES('e0009', 'task0122', 'pj0003');
INSERT INTO PRO_TASK VALUES('e0009', 'task0123', 'pj0003');
INSERT INTO PRO_TASK VALUES('e0009', 'task0124', 'pj0003');
INSERT INTO PRO_TASK VALUES('e0005', 'task0125', 'pj0003');
INSERT INTO PRO_TASK VALUES('e0005', 'task0126', 'pj0003');
INSERT INTO PRO_TASK VALUES('e0005', 'task0127', 'pj0003');
INSERT INTO PRO_TASK VALUES('e0005', 'task0128', 'pj0003');
INSERT INTO PRO_TASK VALUES('e0005', 'task0129', 'pj0003');
INSERT INTO PRO_TASK VALUES('e0014', 'task0130', 'pj0003');
INSERT INTO PRO_TASK VALUES('e0014', 'task0131', 'pj0003');
INSERT INTO PRO_TASK VALUES('e0014', 'task0132', 'pj0003');
INSERT INTO PRO_TASK VALUES('e0014', 'task0133', 'pj0003');
INSERT INTO PRO_TASK VALUES('e0014', 'task0134', 'pj0003');
INSERT INTO PRO_TASK VALUES('e0014', 'task0135', 'pj0003');
INSERT INTO PRO_TASK VALUES('e0014', 'task0136', 'pj0003');
INSERT INTO PRO_TASK VALUES('e0014', 'task0137', 'pj0003');
INSERT INTO PRO_TASK VALUES('e0014', 'task0138', 'pj0003');
INSERT INTO PRO_TASK VALUES('e0014', 'task0139', 'pj0003');
INSERT INTO PRO_TASK VALUES('e0015', 'task0140', 'pj0003');
INSERT INTO PRO_TASK VALUES('e0015', 'task0141', 'pj0003');
INSERT INTO PRO_TASK VALUES('e0015', 'task0142', 'pj0003');
INSERT INTO PRO_TASK VALUES('e0015', 'task0143', 'pj0003');
INSERT INTO PRO_TASK VALUES('e0015', 'task0144', 'pj0003');
INSERT INTO PRO_TASK VALUES('e0015', 'task0145', 'pj0003');
INSERT INTO PRO_TASK VALUES('e0015', 'task0146', 'pj0003');
INSERT INTO PRO_TASK VALUES('e0015', 'task0147', 'pj0003');
INSERT INTO PRO_TASK VALUES('e0015', 'task0148', 'pj0003');
INSERT INTO PRO_TASK VALUES('e0015', 'task0149', 'pj0003');
INSERT INTO PRO_TASK VALUES('e0015', 'task0150', 'pj0003');
INSERT INTO PRO_TASK VALUES('e0015', 'task0151', 'pj0003');
INSERT INTO PRO_TASK VALUES('e0015', 'task0152', 'pj0003');
INSERT INTO PRO_TASK VALUES('e0015', 'task0153', 'pj0003');
INSERT INTO PRO_TASK VALUES('e0015', 'task0154', 'pj0003');
INSERT INTO PRO_TASK VALUES('e0015', 'task0155', 'pj0003');
INSERT INTO PRO_TASK VALUES('e0013', 'task0156', 'pj0003');
INSERT INTO PRO_TASK VALUES('e0013', 'task0157', 'pj0003');
INSERT INTO PRO_TASK VALUES('e0013', 'task0158', 'pj0003');
INSERT INTO PRO_TASK VALUES('e0013', 'task0159', 'pj0003');
INSERT INTO PRO_TASK VALUES('e0005', 'task0160', 'pj0003');
INSERT INTO PRO_TASK VALUES('e0005', 'task0161', 'pj0003');
INSERT INTO PRO_TASK VALUES('e0005', 'task0162', 'pj0003');
INSERT INTO PRO_TASK VALUES('e0005', 'task0163', 'pj0003');
INSERT INTO PRO_TASK VALUES('e0005', 'task0164', 'pj0003');
INSERT INTO PRO_TASK VALUES('e0015', 'task0165', 'pj0003');
INSERT INTO PRO_TASK VALUES('e0015', 'task0166', 'pj0003');
INSERT INTO PRO_TASK VALUES('e0013', 'task0167', 'pj0003');
INSERT INTO PRO_TASK VALUES('e0013', 'task0168', 'pj0003');
INSERT INTO PRO_TASK VALUES('e0013', 'task0169', 'pj0003');
INSERT INTO PRO_TASK VALUES('e0013', 'task0170', 'pj0003');
INSERT INTO PRO_TASK VALUES('e0013', 'task0171', 'pj0003');
INSERT INTO PRO_TASK VALUES('e0009', 'task0172', 'pj0003');
INSERT INTO PRO_TASK VALUES('e0009', 'task0173', 'pj0003');
INSERT INTO PRO_TASK VALUES('e0009', 'task0174', 'pj0003');
INSERT INTO PRO_TASK VALUES('e0009', 'task0175', 'pj0003');
INSERT INTO PRO_TASK VALUES('e0009', 'task0176', 'pj0003');
INSERT INTO PRO_TASK VALUES('e0014', 'task0177', 'pj0003');
INSERT INTO PRO_TASK VALUES('e0014', 'task0178', 'pj0003');
INSERT INTO PRO_TASK VALUES('e0014', 'task0179', 'pj0003');
INSERT INTO PRO_TASK VALUES('e0014', 'task0180', 'pj0003');
INSERT INTO PRO_TASK VALUES('e0005', 'task0181', 'pj0003');
INSERT INTO PRO_TASK VALUES('e0005', 'task0182', 'pj0003');

-------------------------------------------------------------------------------------------------------------------------------------------------

--업무 기록

-- pj0001
INSERT INTO TASK_HISTORY VALUES('hist' || LPAD(TASK_HISTORY_SEQ.NEXTVAL,4,0), 'task0002', 'e0009', '진척도를 0에서 100으로 변경하였습니다.', to_date('201907041300', 'YYYYMMDDHH24MI'));
INSERT INTO TASK_HISTORY VALUES('hist' || LPAD(TASK_HISTORY_SEQ.NEXTVAL,4,0), 'task0003', 'e0013', '진척도를 0에서 100으로 변경하였습니다.', to_date('201907041300', 'YYYYMMDDHH24MI'));
INSERT INTO TASK_HISTORY VALUES('hist' || LPAD(TASK_HISTORY_SEQ.NEXTVAL,4,0), 'task0004', 'e0015', '진척도를 0에서 100으로 변경하였습니다.', to_date('201907041300', 'YYYYMMDDHH24MI'));
INSERT INTO TASK_HISTORY VALUES('hist' || LPAD(TASK_HISTORY_SEQ.NEXTVAL,4,0), 'task0005', 'e0005', '진척도를 0에서 100으로 변경하였습니다.', to_date('201907251300', 'YYYYMMDDHH24MI'));
INSERT INTO TASK_HISTORY VALUES('hist' || LPAD(TASK_HISTORY_SEQ.NEXTVAL,4,0), 'task0006', 'e0009', '진척도를 0에서 100으로 변경하였습니다.', to_date('201907251300', 'YYYYMMDDHH24MI'));
INSERT INTO TASK_HISTORY VALUES('hist' || LPAD(TASK_HISTORY_SEQ.NEXTVAL,4,0), 'task0007', 'e0013', '진척도를 0에서 100으로 변경하였습니다.', to_date('201907251300', 'YYYYMMDDHH24MI'));
INSERT INTO TASK_HISTORY VALUES('hist' || LPAD(TASK_HISTORY_SEQ.NEXTVAL,4,0), 'task0008', 'e0015', '진척도를 0에서 100으로 변경하였습니다.', to_date('201907251300', 'YYYYMMDDHH24MI'));
INSERT INTO TASK_HISTORY VALUES('hist' || LPAD(TASK_HISTORY_SEQ.NEXTVAL,4,0), 'task0009', 'e0005', '진척도를 0에서 100으로 변경하였습니다.', to_date('201908011300', 'YYYYMMDDHH24MI'));
INSERT INTO TASK_HISTORY VALUES('hist' || LPAD(TASK_HISTORY_SEQ.NEXTVAL,4,0), 'task0010', 'e0009', '진척도를 0에서 100으로 변경하였습니다.', to_date('201908011300', 'YYYYMMDDHH24MI'));
                                                                                                              
-- pj0002                                                                                                     
INSERT INTO TASK_HISTORY VALUES('hist' || LPAD(TASK_HISTORY_SEQ.NEXTVAL,4,0), 'task0011', 'e0002', '진척도를 0에서 100으로 변경하였습니다.', to_date('201908231300', 'YYYYMMDDHH24MI'));
INSERT INTO TASK_HISTORY VALUES('hist' || LPAD(TASK_HISTORY_SEQ.NEXTVAL,4,0), 'task0012', 'e0002', '진척도를 0에서 100으로 변경하였습니다.', to_date('201908231300', 'YYYYMMDDHH24MI'));
INSERT INTO TASK_HISTORY VALUES('hist' || LPAD(TASK_HISTORY_SEQ.NEXTVAL,4,0), 'task0013', 'e0002', '진척도를 0에서 100으로 변경하였습니다.', to_date('201908231300', 'YYYYMMDDHH24MI'));
INSERT INTO TASK_HISTORY VALUES('hist' || LPAD(TASK_HISTORY_SEQ.NEXTVAL,4,0), 'task0014', 'e0002', '진척도를 0에서 100으로 변경하였습니다.', to_date('201908231300', 'YYYYMMDDHH24MI'));
INSERT INTO TASK_HISTORY VALUES('hist' || LPAD(TASK_HISTORY_SEQ.NEXTVAL,4,0), 'task0015', 'e0002', '진척도를 0에서 100으로 변경하였습니다.', to_date('201908231300', 'YYYYMMDDHH24MI'));
INSERT INTO TASK_HISTORY VALUES('hist' || LPAD(TASK_HISTORY_SEQ.NEXTVAL,4,0), 'task0016', 'e0002', '진척도를 0에서 100으로 변경하였습니다.', to_date('201908231300', 'YYYYMMDDHH24MI'));
INSERT INTO TASK_HISTORY VALUES('hist' || LPAD(TASK_HISTORY_SEQ.NEXTVAL,4,0), 'task0017', 'e0002', '진척도를 0에서 100으로 변경하였습니다.', to_date('201908231300', 'YYYYMMDDHH24MI'));
INSERT INTO TASK_HISTORY VALUES('hist' || LPAD(TASK_HISTORY_SEQ.NEXTVAL,4,0), 'task0018', 'e0002', '진척도를 0에서 100으로 변경하였습니다.', to_date('201908231300', 'YYYYMMDDHH24MI'));
INSERT INTO TASK_HISTORY VALUES('hist' || LPAD(TASK_HISTORY_SEQ.NEXTVAL,4,0), 'task0019', 'e0002', '진척도를 0에서 100으로 변경하였습니다.', to_date('201908231300', 'YYYYMMDDHH24MI'));
INSERT INTO TASK_HISTORY VALUES('hist' || LPAD(TASK_HISTORY_SEQ.NEXTVAL,4,0), 'task0020', 'e0002', '진척도를 0에서 100으로 변경하였습니다.', to_date('201908231300', 'YYYYMMDDHH24MI'));
INSERT INTO TASK_HISTORY VALUES('hist' || LPAD(TASK_HISTORY_SEQ.NEXTVAL,4,0), 'task0021', 'e0002', '진척도를 0에서 100으로 변경하였습니다.', to_date('201908231300', 'YYYYMMDDHH24MI'));
INSERT INTO TASK_HISTORY VALUES('hist' || LPAD(TASK_HISTORY_SEQ.NEXTVAL,4,0), 'task0022', 'e0002', '진척도를 0에서 100으로 변경하였습니다.', to_date('201908231300', 'YYYYMMDDHH24MI'));
INSERT INTO TASK_HISTORY VALUES('hist' || LPAD(TASK_HISTORY_SEQ.NEXTVAL,4,0), 'task0023', 'e0002', '진척도를 0에서 100으로 변경하였습니다.', to_date('201908231300', 'YYYYMMDDHH24MI'));
INSERT INTO TASK_HISTORY VALUES('hist' || LPAD(TASK_HISTORY_SEQ.NEXTVAL,4,0), 'task0024', 'e0002', '진척도를 0에서 100으로 변경하였습니다.', to_date('201908231300', 'YYYYMMDDHH24MI'));
INSERT INTO TASK_HISTORY VALUES('hist' || LPAD(TASK_HISTORY_SEQ.NEXTVAL,4,0), 'task0025', 'e0002', '진척도를 0에서 100으로 변경하였습니다.', to_date('201908231300', 'YYYYMMDDHH24MI'));
INSERT INTO TASK_HISTORY VALUES('hist' || LPAD(TASK_HISTORY_SEQ.NEXTVAL,4,0), 'task0026', 'e0002', '진척도를 0에서 100으로 변경하였습니다.', to_date('201908231300', 'YYYYMMDDHH24MI'));
INSERT INTO TASK_HISTORY VALUES('hist' || LPAD(TASK_HISTORY_SEQ.NEXTVAL,4,0), 'task0027', 'e0005', '진척도를 0에서 100으로 변경하였습니다.', to_date('201909061300', 'YYYYMMDDHH24MI'));
INSERT INTO TASK_HISTORY VALUES('hist' || LPAD(TASK_HISTORY_SEQ.NEXTVAL,4,0), 'task0028', 'e0005', '진척도를 0에서 100으로 변경하였습니다.', to_date('201909061300', 'YYYYMMDDHH24MI'));
INSERT INTO TASK_HISTORY VALUES('hist' || LPAD(TASK_HISTORY_SEQ.NEXTVAL,4,0), 'task0029', 'e0005', '진척도를 0에서 100으로 변경하였습니다.', to_date('201909061300', 'YYYYMMDDHH24MI'));
INSERT INTO TASK_HISTORY VALUES('hist' || LPAD(TASK_HISTORY_SEQ.NEXTVAL,4,0), 'task0030', 'e0005', '진척도를 0에서 100으로 변경하였습니다.', to_date('201909061300', 'YYYYMMDDHH24MI'));
INSERT INTO TASK_HISTORY VALUES('hist' || LPAD(TASK_HISTORY_SEQ.NEXTVAL,4,0), 'task0031', 'e0005', '진척도를 0에서 100으로 변경하였습니다.', to_date('201909061300', 'YYYYMMDDHH24MI'));
INSERT INTO TASK_HISTORY VALUES('hist' || LPAD(TASK_HISTORY_SEQ.NEXTVAL,4,0), 'task0033', 'e0005', '진척도를 0에서 100으로 변경하였습니다.', to_date('201908301300', 'YYYYMMDDHH24MI'));
INSERT INTO TASK_HISTORY VALUES('hist' || LPAD(TASK_HISTORY_SEQ.NEXTVAL,4,0), 'task0034', 'e0005', '진척도를 0에서 100으로 변경하였습니다.', to_date('201908301300', 'YYYYMMDDHH24MI'));
INSERT INTO TASK_HISTORY VALUES('hist' || LPAD(TASK_HISTORY_SEQ.NEXTVAL,4,0), 'task0035', 'e0005', '진척도를 0에서 100으로 변경하였습니다.', to_date('201908301300', 'YYYYMMDDHH24MI'));
INSERT INTO TASK_HISTORY VALUES('hist' || LPAD(TASK_HISTORY_SEQ.NEXTVAL,4,0), 'task0036', 'e0005', '진척도를 0에서 100으로 변경하였습니다.', to_date('201908301300', 'YYYYMMDDHH24MI'));
INSERT INTO TASK_HISTORY VALUES('hist' || LPAD(TASK_HISTORY_SEQ.NEXTVAL,4,0), 'task0037', 'e0005', '진척도를 0에서 100으로 변경하였습니다.', to_date('201908301300', 'YYYYMMDDHH24MI'));
INSERT INTO TASK_HISTORY VALUES('hist' || LPAD(TASK_HISTORY_SEQ.NEXTVAL,4,0), 'task0038', 'e0005', '진척도를 0에서 100으로 변경하였습니다.', to_date('201908301300', 'YYYYMMDDHH24MI'));
INSERT INTO TASK_HISTORY VALUES('hist' || LPAD(TASK_HISTORY_SEQ.NEXTVAL,4,0), 'task0039', 'e0005', '진척도를 0에서 100으로 변경하였습니다.', to_date('201908301300', 'YYYYMMDDHH24MI'));
INSERT INTO TASK_HISTORY VALUES('hist' || LPAD(TASK_HISTORY_SEQ.NEXTVAL,4,0), 'task0040', 'e0005', '진척도를 0에서 100으로 변경하였습니다.', to_date('201908301300', 'YYYYMMDDHH24MI'));
INSERT INTO TASK_HISTORY VALUES('hist' || LPAD(TASK_HISTORY_SEQ.NEXTVAL,4,0), 'task0041', 'e0005', '진척도를 0에서 100으로 변경하였습니다.', to_date('201908301300', 'YYYYMMDDHH24MI'));
INSERT INTO TASK_HISTORY VALUES('hist' || LPAD(TASK_HISTORY_SEQ.NEXTVAL,4,0), 'task0042', 'e0005', '진척도를 0에서 100으로 변경하였습니다.', to_date('201908301300', 'YYYYMMDDHH24MI'));
INSERT INTO TASK_HISTORY VALUES('hist' || LPAD(TASK_HISTORY_SEQ.NEXTVAL,4,0), 'task0043', 'e0005', '진척도를 0에서 100으로 변경하였습니다.', to_date('201908301300', 'YYYYMMDDHH24MI'));
INSERT INTO TASK_HISTORY VALUES('hist' || LPAD(TASK_HISTORY_SEQ.NEXTVAL,4,0), 'task0044', 'e0005', '진척도를 0에서 100으로 변경하였습니다.', to_date('201908301300', 'YYYYMMDDHH24MI'));
INSERT INTO TASK_HISTORY VALUES('hist' || LPAD(TASK_HISTORY_SEQ.NEXTVAL,4,0), 'task0045', 'e0009', '진척도를 0에서 100으로 변경하였습니다.', to_date('201908301300', 'YYYYMMDDHH24MI'));
INSERT INTO TASK_HISTORY VALUES('hist' || LPAD(TASK_HISTORY_SEQ.NEXTVAL,4,0), 'task0046', 'e0009', '진척도를 0에서 100으로 변경하였습니다.', to_date('201908301300', 'YYYYMMDDHH24MI'));
INSERT INTO TASK_HISTORY VALUES('hist' || LPAD(TASK_HISTORY_SEQ.NEXTVAL,4,0), 'task0047', 'e0009', '진척도를 0에서 100으로 변경하였습니다.', to_date('201908301300', 'YYYYMMDDHH24MI'));
INSERT INTO TASK_HISTORY VALUES('hist' || LPAD(TASK_HISTORY_SEQ.NEXTVAL,4,0), 'task0048', 'e0009', '진척도를 0에서 100으로 변경하였습니다.', to_date('201908301300', 'YYYYMMDDHH24MI'));
INSERT INTO TASK_HISTORY VALUES('hist' || LPAD(TASK_HISTORY_SEQ.NEXTVAL,4,0), 'task0049', 'e0009', '진척도를 0에서 100으로 변경하였습니다.', to_date('201908301300', 'YYYYMMDDHH24MI'));
INSERT INTO TASK_HISTORY VALUES('hist' || LPAD(TASK_HISTORY_SEQ.NEXTVAL,4,0), 'task0050', 'e0009', '진척도를 0에서 100으로 변경하였습니다.', to_date('201908301300', 'YYYYMMDDHH24MI'));
INSERT INTO TASK_HISTORY VALUES('hist' || LPAD(TASK_HISTORY_SEQ.NEXTVAL,4,0), 'task0051', 'e0009', '진척도를 0에서 100으로 변경하였습니다.', to_date('201908301300', 'YYYYMMDDHH24MI'));
INSERT INTO TASK_HISTORY VALUES('hist' || LPAD(TASK_HISTORY_SEQ.NEXTVAL,4,0), 'task0052', 'e0009', '진척도를 0에서 100으로 변경하였습니다.', to_date('201908301300', 'YYYYMMDDHH24MI'));
INSERT INTO TASK_HISTORY VALUES('hist' || LPAD(TASK_HISTORY_SEQ.NEXTVAL,4,0), 'task0053', 'e0009', '진척도를 0에서 100으로 변경하였습니다.', to_date('201908301300', 'YYYYMMDDHH24MI'));
INSERT INTO TASK_HISTORY VALUES('hist' || LPAD(TASK_HISTORY_SEQ.NEXTVAL,4,0), 'task0054', 'e0009', '진척도를 0에서 100으로 변경하였습니다.', to_date('201908301300', 'YYYYMMDDHH24MI'));
INSERT INTO TASK_HISTORY VALUES('hist' || LPAD(TASK_HISTORY_SEQ.NEXTVAL,4,0), 'task0055', 'e0009', '진척도를 0에서 100으로 변경하였습니다.', to_date('201908301300', 'YYYYMMDDHH24MI'));
INSERT INTO TASK_HISTORY VALUES('hist' || LPAD(TASK_HISTORY_SEQ.NEXTVAL,4,0), 'task0056', 'e0009', '진척도를 0에서 100으로 변경하였습니다.', to_date('201908301300', 'YYYYMMDDHH24MI'));
INSERT INTO TASK_HISTORY VALUES('hist' || LPAD(TASK_HISTORY_SEQ.NEXTVAL,4,0), 'task0057', 'e0009', '진척도를 0에서 100으로 변경하였습니다.', to_date('201908301300', 'YYYYMMDDHH24MI'));
INSERT INTO TASK_HISTORY VALUES('hist' || LPAD(TASK_HISTORY_SEQ.NEXTVAL,4,0), 'task0058', 'e0009', '진척도를 0에서 100으로 변경하였습니다.', to_date('201908301300', 'YYYYMMDDHH24MI'));
INSERT INTO TASK_HISTORY VALUES('hist' || LPAD(TASK_HISTORY_SEQ.NEXTVAL,4,0), 'task0059', 'e0009', '진척도를 0에서 100으로 변경하였습니다.', to_date('201908301300', 'YYYYMMDDHH24MI'));
INSERT INTO TASK_HISTORY VALUES('hist' || LPAD(TASK_HISTORY_SEQ.NEXTVAL,4,0), 'task0060', 'e0009', '진척도를 0에서 100으로 변경하였습니다.', to_date('201908301300', 'YYYYMMDDHH24MI'));
INSERT INTO TASK_HISTORY VALUES('hist' || LPAD(TASK_HISTORY_SEQ.NEXTVAL,4,0), 'task0061', 'e0013', '진척도를 0에서 100으로 변경하였습니다.', to_date('201908301300', 'YYYYMMDDHH24MI'));
INSERT INTO TASK_HISTORY VALUES('hist' || LPAD(TASK_HISTORY_SEQ.NEXTVAL,4,0), 'task0062', 'e0013', '진척도를 0에서 100으로 변경하였습니다.', to_date('201908301300', 'YYYYMMDDHH24MI'));
INSERT INTO TASK_HISTORY VALUES('hist' || LPAD(TASK_HISTORY_SEQ.NEXTVAL,4,0), 'task0063', 'e0013', '진척도를 0에서 100으로 변경하였습니다.', to_date('201908301300', 'YYYYMMDDHH24MI'));
INSERT INTO TASK_HISTORY VALUES('hist' || LPAD(TASK_HISTORY_SEQ.NEXTVAL,4,0), 'task0064', 'e0013', '진척도를 0에서 100으로 변경하였습니다.', to_date('201908301300', 'YYYYMMDDHH24MI'));
INSERT INTO TASK_HISTORY VALUES('hist' || LPAD(TASK_HISTORY_SEQ.NEXTVAL,4,0), 'task0065', 'e0013', '진척도를 0에서 100으로 변경하였습니다.', to_date('201908301300', 'YYYYMMDDHH24MI'));
INSERT INTO TASK_HISTORY VALUES('hist' || LPAD(TASK_HISTORY_SEQ.NEXTVAL,4,0), 'task0066', 'e0013', '진척도를 0에서 100으로 변경하였습니다.', to_date('201908301300', 'YYYYMMDDHH24MI'));
INSERT INTO TASK_HISTORY VALUES('hist' || LPAD(TASK_HISTORY_SEQ.NEXTVAL,4,0), 'task0067', 'e0013', '진척도를 0에서 100으로 변경하였습니다.', to_date('201908301300', 'YYYYMMDDHH24MI'));
INSERT INTO TASK_HISTORY VALUES('hist' || LPAD(TASK_HISTORY_SEQ.NEXTVAL,4,0), 'task0068', 'e0013', '진척도를 0에서 100으로 변경하였습니다.', to_date('201908301300', 'YYYYMMDDHH24MI'));
INSERT INTO TASK_HISTORY VALUES('hist' || LPAD(TASK_HISTORY_SEQ.NEXTVAL,4,0), 'task0069', 'e0013', '진척도를 0에서 100으로 변경하였습니다.', to_date('201908301300', 'YYYYMMDDHH24MI'));
INSERT INTO TASK_HISTORY VALUES('hist' || LPAD(TASK_HISTORY_SEQ.NEXTVAL,4,0), 'task0070', 'e0013', '진척도를 0에서 100으로 변경하였습니다.', to_date('201908301300', 'YYYYMMDDHH24MI'));
INSERT INTO TASK_HISTORY VALUES('hist' || LPAD(TASK_HISTORY_SEQ.NEXTVAL,4,0), 'task0071', 'e0013', '진척도를 0에서 100으로 변경하였습니다.', to_date('201908301300', 'YYYYMMDDHH24MI'));
INSERT INTO TASK_HISTORY VALUES('hist' || LPAD(TASK_HISTORY_SEQ.NEXTVAL,4,0), 'task0072', 'e0013', '진척도를 0에서 100으로 변경하였습니다.', to_date('201908301300', 'YYYYMMDDHH24MI'));
INSERT INTO TASK_HISTORY VALUES('hist' || LPAD(TASK_HISTORY_SEQ.NEXTVAL,4,0), 'task0073', 'e0015', '진척도를 0에서 100으로 변경하였습니다.', to_date('201908301300', 'YYYYMMDDHH24MI'));
INSERT INTO TASK_HISTORY VALUES('hist' || LPAD(TASK_HISTORY_SEQ.NEXTVAL,4,0), 'task0074', 'e0015', '진척도를 0에서 100으로 변경하였습니다.', to_date('201908301300', 'YYYYMMDDHH24MI'));
INSERT INTO TASK_HISTORY VALUES('hist' || LPAD(TASK_HISTORY_SEQ.NEXTVAL,4,0), 'task0075', 'e0015', '진척도를 0에서 100으로 변경하였습니다.', to_date('201908301300', 'YYYYMMDDHH24MI'));
INSERT INTO TASK_HISTORY VALUES('hist' || LPAD(TASK_HISTORY_SEQ.NEXTVAL,4,0), 'task0076', 'e0015', '진척도를 0에서 100으로 변경하였습니다.', to_date('201908301300', 'YYYYMMDDHH24MI'));
INSERT INTO TASK_HISTORY VALUES('hist' || LPAD(TASK_HISTORY_SEQ.NEXTVAL,4,0), 'task0077', 'e0015', '진척도를 0에서 100으로 변경하였습니다.', to_date('201908301300', 'YYYYMMDDHH24MI'));
INSERT INTO TASK_HISTORY VALUES('hist' || LPAD(TASK_HISTORY_SEQ.NEXTVAL,4,0), 'task0078', 'e0015', '진척도를 0에서 100으로 변경하였습니다.', to_date('201908301300', 'YYYYMMDDHH24MI'));
INSERT INTO TASK_HISTORY VALUES('hist' || LPAD(TASK_HISTORY_SEQ.NEXTVAL,4,0), 'task0079', 'e0015', '진척도를 0에서 100으로 변경하였습니다.', to_date('201908301300', 'YYYYMMDDHH24MI'));
INSERT INTO TASK_HISTORY VALUES('hist' || LPAD(TASK_HISTORY_SEQ.NEXTVAL,4,0), 'task0080', 'e0015', '진척도를 0에서 100으로 변경하였습니다.', to_date('201908301300', 'YYYYMMDDHH24MI'));
INSERT INTO TASK_HISTORY VALUES('hist' || LPAD(TASK_HISTORY_SEQ.NEXTVAL,4,0), 'task0081', 'e0015', '진척도를 0에서 100으로 변경하였습니다.', to_date('201908301300', 'YYYYMMDDHH24MI'));
INSERT INTO TASK_HISTORY VALUES('hist' || LPAD(TASK_HISTORY_SEQ.NEXTVAL,4,0), 'task0082', 'e0015', '진척도를 0에서 100으로 변경하였습니다.', to_date('201908301300', 'YYYYMMDDHH24MI'));
INSERT INTO TASK_HISTORY VALUES('hist' || LPAD(TASK_HISTORY_SEQ.NEXTVAL,4,0), 'task0083', 'e0015', '진척도를 0에서 100으로 변경하였습니다.', to_date('201908301300', 'YYYYMMDDHH24MI'));
INSERT INTO TASK_HISTORY VALUES('hist' || LPAD(TASK_HISTORY_SEQ.NEXTVAL,4,0), 'task0084', 'e0015', '진척도를 0에서 100으로 변경하였습니다.', to_date('201908301300', 'YYYYMMDDHH24MI'));
INSERT INTO TASK_HISTORY VALUES('hist' || LPAD(TASK_HISTORY_SEQ.NEXTVAL,4,0), 'task0085', 'e0015', '진척도를 0에서 100으로 변경하였습니다.', to_date('201908301300', 'YYYYMMDDHH24MI'));
INSERT INTO TASK_HISTORY VALUES('hist' || LPAD(TASK_HISTORY_SEQ.NEXTVAL,4,0), 'task0086', 'e0015', '진척도를 0에서 100으로 변경하였습니다.', to_date('201908301300', 'YYYYMMDDHH24MI'));
INSERT INTO TASK_HISTORY VALUES('hist' || LPAD(TASK_HISTORY_SEQ.NEXTVAL,4,0), 'task0087', 'e0015', '진척도를 0에서 100으로 변경하였습니다.', to_date('201908301300', 'YYYYMMDDHH24MI'));
INSERT INTO TASK_HISTORY VALUES('hist' || LPAD(TASK_HISTORY_SEQ.NEXTVAL,4,0), 'task0088', 'e0009', '진척도를 0에서 100으로 변경하였습니다.', to_date('201908301300', 'YYYYMMDDHH24MI'));
INSERT INTO TASK_HISTORY VALUES('hist' || LPAD(TASK_HISTORY_SEQ.NEXTVAL,4,0), 'task0089', 'e0009', '진척도를 0에서 100으로 변경하였습니다.', to_date('201909061300', 'YYYYMMDDHH24MI'));
INSERT INTO TASK_HISTORY VALUES('hist' || LPAD(TASK_HISTORY_SEQ.NEXTVAL,4,0), 'task0090', 'e0009', '진척도를 0에서 100으로 변경하였습니다.', to_date('201909061300', 'YYYYMMDDHH24MI'));
INSERT INTO TASK_HISTORY VALUES('hist' || LPAD(TASK_HISTORY_SEQ.NEXTVAL,4,0), 'task0091', 'e0009', '진척도를 0에서 100으로 변경하였습니다.', to_date('201909061300', 'YYYYMMDDHH24MI'));
INSERT INTO TASK_HISTORY VALUES('hist' || LPAD(TASK_HISTORY_SEQ.NEXTVAL,4,0), 'task0092', 'e0009', '진척도를 0에서 100으로 변경하였습니다.', to_date('201909061300', 'YYYYMMDDHH24MI'));
INSERT INTO TASK_HISTORY VALUES('hist' || LPAD(TASK_HISTORY_SEQ.NEXTVAL,4,0), 'task0093', 'e0013', '진척도를 0에서 100으로 변경하였습니다.', to_date('201909061300', 'YYYYMMDDHH24MI'));
INSERT INTO TASK_HISTORY VALUES('hist' || LPAD(TASK_HISTORY_SEQ.NEXTVAL,4,0), 'task0094', 'e0013', '진척도를 0에서 100으로 변경하였습니다.', to_date('201909061300', 'YYYYMMDDHH24MI'));
INSERT INTO TASK_HISTORY VALUES('hist' || LPAD(TASK_HISTORY_SEQ.NEXTVAL,4,0), 'task0095', 'e0013', '진척도를 0에서 100으로 변경하였습니다.', to_date('201909061300', 'YYYYMMDDHH24MI'));
INSERT INTO TASK_HISTORY VALUES('hist' || LPAD(TASK_HISTORY_SEQ.NEXTVAL,4,0), 'task0096', 'e0013', '진척도를 0에서 100으로 변경하였습니다.', to_date('201909061300', 'YYYYMMDDHH24MI'));
INSERT INTO TASK_HISTORY VALUES('hist' || LPAD(TASK_HISTORY_SEQ.NEXTVAL,4,0), 'task0097', 'e0013', '진척도를 0에서 100으로 변경하였습니다.', to_date('201909061300', 'YYYYMMDDHH24MI'));
INSERT INTO TASK_HISTORY VALUES('hist' || LPAD(TASK_HISTORY_SEQ.NEXTVAL,4,0), 'task0098', 'e0013', '진척도를 0에서 100으로 변경하였습니다.', to_date('201909061300', 'YYYYMMDDHH24MI'));
INSERT INTO TASK_HISTORY VALUES('hist' || LPAD(TASK_HISTORY_SEQ.NEXTVAL,4,0), 'task0099', 'e0013', '진척도를 0에서 100으로 변경하였습니다.', to_date('201909061300', 'YYYYMMDDHH24MI'));
INSERT INTO TASK_HISTORY VALUES('hist' || LPAD(TASK_HISTORY_SEQ.NEXTVAL,4,0), 'task0100', 'e0015', '진척도를 0에서 100으로 변경하였습니다.', to_date('201909061300', 'YYYYMMDDHH24MI'));
INSERT INTO TASK_HISTORY VALUES('hist' || LPAD(TASK_HISTORY_SEQ.NEXTVAL,4,0), 'task0101', 'e0015', '진척도를 0에서 100으로 변경하였습니다.', to_date('201909061300', 'YYYYMMDDHH24MI'));
INSERT INTO TASK_HISTORY VALUES('hist' || LPAD(TASK_HISTORY_SEQ.NEXTVAL,4,0), 'task0102', 'e0015', '진척도를 0에서 100으로 변경하였습니다.', to_date('201909061300', 'YYYYMMDDHH24MI'));
INSERT INTO TASK_HISTORY VALUES('hist' || LPAD(TASK_HISTORY_SEQ.NEXTVAL,4,0), 'task0103', 'e0015', '진척도를 0에서 100으로 변경하였습니다.', to_date('201909061300', 'YYYYMMDDHH24MI'));
INSERT INTO TASK_HISTORY VALUES('hist' || LPAD(TASK_HISTORY_SEQ.NEXTVAL,4,0), 'task0104', 'e0015', '진척도를 0에서 100으로 변경하였습니다.', to_date('201909061300', 'YYYYMMDDHH24MI'));
INSERT INTO TASK_HISTORY VALUES('hist' || LPAD(TASK_HISTORY_SEQ.NEXTVAL,4,0), 'task0105', 'e0015', '진척도를 0에서 100으로 변경하였습니다.', to_date('201909061300', 'YYYYMMDDHH24MI'));
                                
-- pj0003                      
INSERT INTO TASK_HISTORY VALUES('hist' || LPAD(TASK_HISTORY_SEQ.NEXTVAL,4,0), 'task0107', 'e0014', '진척도를 0에서 100으로 변경하였습니다.', trunc(sysdate, 'iw')-14+16/24+50/1440);
INSERT INTO TASK_HISTORY VALUES('hist' || LPAD(TASK_HISTORY_SEQ.NEXTVAL,4,0), 'task0108', 'e0014', '진척도를 0에서 100으로 변경하였습니다.', trunc(sysdate, 'iw')-14+17/24+50/1440);
INSERT INTO TASK_HISTORY VALUES('hist' || LPAD(TASK_HISTORY_SEQ.NEXTVAL,4,0), 'task0109', 'e0014', '진척도를 0에서 100으로 변경하였습니다.', trunc(sysdate, 'iw')-13+16/24+50/1440);
                               
INSERT INTO TASK_HISTORY VALUES('hist' || LPAD(TASK_HISTORY_SEQ.NEXTVAL,4,0), 'task0111', 'e0015', '진척도를 0에서 100으로 변경하였습니다.', trunc(sysdate, 'iw')-13+17/24+50/1440);
INSERT INTO TASK_HISTORY VALUES('hist' || LPAD(TASK_HISTORY_SEQ.NEXTVAL,4,0), 'task0112', 'e0015', '진척도를 0에서 100으로 변경하였습니다.', trunc(sysdate, 'iw')-12+17/24+50/1440);
INSERT INTO TASK_HISTORY VALUES('hist' || LPAD(TASK_HISTORY_SEQ.NEXTVAL,4,0), 'task0113', 'e0015', '진척도를 0에서 100으로 변경하였습니다.', trunc(sysdate, 'iw')-10+17/24+40/1440);
INSERT INTO TASK_HISTORY VALUES('hist' || LPAD(TASK_HISTORY_SEQ.NEXTVAL,4,0), 'task0114', 'e0015', '진척도를 0에서 100으로 변경하였습니다.', trunc(sysdate, 'iw')-9+17/24+40/1440);
                        
INSERT INTO TASK_HISTORY VALUES('hist' || LPAD(TASK_HISTORY_SEQ.NEXTVAL,4,0), 'task0116', 'e0013', '진척도를 0에서 100으로 변경하였습니다.', trunc(sysdate, 'iw')-13+17/24+30/1440);
INSERT INTO TASK_HISTORY VALUES('hist' || LPAD(TASK_HISTORY_SEQ.NEXTVAL,4,0), 'task0117', 'e0013', '진척도를 0에서 100으로 변경하였습니다.', trunc(sysdate, 'iw')-12+15/24+40/1440);
INSERT INTO TASK_HISTORY VALUES('hist' || LPAD(TASK_HISTORY_SEQ.NEXTVAL,4,0), 'task0118', 'e0013', '진척도를 0에서 100으로 변경하였습니다.', trunc(sysdate, 'iw')-10+17/24+30/1440);
INSERT INTO TASK_HISTORY VALUES('hist' || LPAD(TASK_HISTORY_SEQ.NEXTVAL,4,0), 'task0119', 'e0013', '진척도를 0에서 100으로 변경하였습니다.', trunc(sysdate, 'iw')-9+15/24+10/1440);
                               
INSERT INTO TASK_HISTORY VALUES('hist' || LPAD(TASK_HISTORY_SEQ.NEXTVAL,4,0), 'task0121', 'e0009', '진척도를 0에서 55으로 변경하였습니다.', trunc(sysdate, 'iw')-13+17/24+50/1440);
INSERT INTO TASK_HISTORY VALUES('hist' || LPAD(TASK_HISTORY_SEQ.NEXTVAL,4,0), 'task0121', 'e0009', '진척도를 0에서 70으로 변경하였습니다.', trunc(sysdate, 'iw')-12+12/24+00/1440);
INSERT INTO TASK_HISTORY VALUES('hist' || LPAD(TASK_HISTORY_SEQ.NEXTVAL,4,0), 'task0121', 'e0009', '진척도를 0에서 100으로 변경하였습니다.', trunc(sysdate, 'iw')-12+17/24+50/1440);
INSERT INTO TASK_HISTORY VALUES('hist' || LPAD(TASK_HISTORY_SEQ.NEXTVAL,4,0), 'task0122', 'e0009', '진척도를 0에서 60으로 변경하였습니다.', trunc(sysdate, 'iw')-10+17/24+20/1440);
INSERT INTO TASK_HISTORY VALUES('hist' || LPAD(TASK_HISTORY_SEQ.NEXTVAL,4,0), 'task0122', 'e0009', '진척도를 0에서 100으로 변경하였습니다.', trunc(sysdate, 'iw')-9+16/24+20/1440);
INSERT INTO TASK_HISTORY VALUES('hist' || LPAD(TASK_HISTORY_SEQ.NEXTVAL,4,0), 'task0123', 'e0009', '진척도를 0에서 40으로 변경하였습니다.', trunc(sysdate, 'iw')-6+17/24+10/1440);
INSERT INTO TASK_HISTORY VALUES('hist' || LPAD(TASK_HISTORY_SEQ.NEXTVAL,4,0), 'task0123', 'e0009', '진척도를 0에서 100으로 변경하였습니다.', trunc(sysdate, 'iw')-5+15/24+10/1440);
INSERT INTO TASK_HISTORY VALUES('hist' || LPAD(TASK_HISTORY_SEQ.NEXTVAL,4,0), 'task0124', 'e0009', '진척도를 0에서 30으로 변경하였습니다.', trunc(sysdate, 'iw')-3+17/24+50/1440);
INSERT INTO TASK_HISTORY VALUES('hist' || LPAD(TASK_HISTORY_SEQ.NEXTVAL,4,0), 'task0124', 'e0009', '진척도를 0에서 70으로 변경하였습니다.', trunc(sysdate, 'iw')-2+12/24);
INSERT INTO TASK_HISTORY VALUES('hist' || LPAD(TASK_HISTORY_SEQ.NEXTVAL,4,0), 'task0124', 'e0009', '진척도를 0에서 100으로 변경하였습니다.', trunc(sysdate, 'iw')-2+17/24);
                             
INSERT INTO TASK_HISTORY VALUES('hist' || LPAD(TASK_HISTORY_SEQ.NEXTVAL,4,0), 'task0126', 'e0005', '진척도를 0에서 100으로 변경하였습니다.', trunc(sysdate, 'iw')-13+17/24+40/1440);
INSERT INTO TASK_HISTORY VALUES('hist' || LPAD(TASK_HISTORY_SEQ.NEXTVAL,4,0), 'task0127', 'e0005', '진척도를 0에서 100으로 변경하였습니다.', trunc(sysdate, 'iw')-11+17/24+50/1440);
INSERT INTO TASK_HISTORY VALUES('hist' || LPAD(TASK_HISTORY_SEQ.NEXTVAL,4,0), 'task0128', 'e0005', '진척도를 0에서 100으로 변경하였습니다.', trunc(sysdate, 'iw')-9+17/24+40/1440);
INSERT INTO TASK_HISTORY VALUES('hist' || LPAD(TASK_HISTORY_SEQ.NEXTVAL,4,0), 'task0129', 'e0005', '진척도를 0에서 100으로 변경하였습니다.', trunc(sysdate, 'iw')-6+17/24+50/1440);
               
INSERT INTO TASK_HISTORY VALUES('hist' || LPAD(TASK_HISTORY_SEQ.NEXTVAL,4,0), 'task0131', 'e0014', '진척도를 0에서 100으로 변경하였습니다.', trunc(sysdate, 'iw')-11+17/24+50/1440);
INSERT INTO TASK_HISTORY VALUES('hist' || LPAD(TASK_HISTORY_SEQ.NEXTVAL,4,0), 'task0132', 'e0014', '진척도를 0에서 100으로 변경하였습니다.', trunc(sysdate, 'iw')-9+17/24+50/1440);
                          
INSERT INTO TASK_HISTORY VALUES('hist' || LPAD(TASK_HISTORY_SEQ.NEXTVAL,4,0), 'task0134', 'e0014', '진척도를 0에서 100으로 변경하였습니다.', trunc(sysdate, 'iw')-6+17/24+40/1440);
INSERT INTO TASK_HISTORY VALUES('hist' || LPAD(TASK_HISTORY_SEQ.NEXTVAL,4,0), 'task0135', 'e0014', '진척도를 0에서 100으로 변경하였습니다.', trunc(sysdate, 'iw')-4+17/24+40/1440);
INSERT INTO TASK_HISTORY VALUES('hist' || LPAD(TASK_HISTORY_SEQ.NEXTVAL,4,0), 'task0136', 'e0014', '진척도를 0에서 80으로 변경하였습니다.', trunc(sysdate, 'iw')-2+17/24+50/1440);
INSERT INTO TASK_HISTORY VALUES('hist' || LPAD(TASK_HISTORY_SEQ.NEXTVAL,4,0), 'task0137', 'e0014', '진척도를 0에서 50으로 변경하였습니다.', trunc(sysdate, 'iw')+12/24+20/1440);
        
INSERT INTO TASK_HISTORY VALUES('hist' || LPAD(TASK_HISTORY_SEQ.NEXTVAL,4,0), 'task0141', 'e0015', '진척도를 0에서 100으로 변경하였습니다.', trunc(sysdate, 'iw')-6+17/24+30/1440);
INSERT INTO TASK_HISTORY VALUES('hist' || LPAD(TASK_HISTORY_SEQ.NEXTVAL,4,0), 'task0142', 'e0015', '진척도를 0에서 100으로 변경하였습니다.', trunc(sysdate, 'iw')-6+14/24+20/1440);
INSERT INTO TASK_HISTORY VALUES('hist' || LPAD(TASK_HISTORY_SEQ.NEXTVAL,4,0), 'task0143', 'e0015', '진척도를 0에서 100으로 변경하였습니다.', trunc(sysdate, 'iw')-6+15/24+50/1440);
INSERT INTO TASK_HISTORY VALUES('hist' || LPAD(TASK_HISTORY_SEQ.NEXTVAL,4,0), 'task0144', 'e0015', '진척도를 0에서 100으로 변경하였습니다.', trunc(sysdate, 'iw')-6+17/24+40/1440);
INSERT INTO TASK_HISTORY VALUES('hist' || LPAD(TASK_HISTORY_SEQ.NEXTVAL,4,0), 'task0145', 'e0015', '진척도를 0에서 100으로 변경하였습니다.', trunc(sysdate, 'iw')-4+13/24+15/1440);
INSERT INTO TASK_HISTORY VALUES('hist' || LPAD(TASK_HISTORY_SEQ.NEXTVAL,4,0), 'task0146', 'e0015', '진척도를 0에서 100으로 변경하였습니다.', trunc(sysdate, 'iw')-4+14/24+10/1440);
INSERT INTO TASK_HISTORY VALUES('hist' || LPAD(TASK_HISTORY_SEQ.NEXTVAL,4,0), 'task0147', 'e0015', '진척도를 0에서 100으로 변경하였습니다.', trunc(sysdate, 'iw')-4+15/24+30/1440);
INSERT INTO TASK_HISTORY VALUES('hist' || LPAD(TASK_HISTORY_SEQ.NEXTVAL,4,0), 'task0148', 'e0015', '진척도를 0에서 100으로 변경하였습니다.', trunc(sysdate, 'iw')-2+16/24+35/1440);
INSERT INTO TASK_HISTORY VALUES('hist' || LPAD(TASK_HISTORY_SEQ.NEXTVAL,4,0), 'task0149', 'e0015', '진척도를 0에서 80으로 변경하였습니다.', trunc(sysdate, 'iw')-2+17/24+50/1440);
INSERT INTO TASK_HISTORY VALUES('hist' || LPAD(TASK_HISTORY_SEQ.NEXTVAL,4,0), 'task0150', 'e0015', '진척도를 0에서 80으로 변경하였습니다.', trunc(sysdate, 'iw')-2+17/24+50/1440);
                               
INSERT INTO TASK_HISTORY VALUES('hist' || LPAD(TASK_HISTORY_SEQ.NEXTVAL,4,0), 'task0152', 'e0015', '진척도를 0에서 20으로 변경하였습니다.', trunc(sysdate, 'iw')+10/24+30/1440);
                               
INSERT INTO TASK_HISTORY VALUES('hist' || LPAD(TASK_HISTORY_SEQ.NEXTVAL,4,0), 'task0157', 'e0013', '진척도를 0에서 100으로 변경하였습니다.', trunc(sysdate, 'iw')-6+17/24+15/1440);
INSERT INTO TASK_HISTORY VALUES('hist' || LPAD(TASK_HISTORY_SEQ.NEXTVAL,4,0), 'task0158', 'e0013', '진척도를 0에서 100으로 변경하였습니다.', trunc(sysdate, 'iw')-4+16/24+10/1440);
INSERT INTO TASK_HISTORY VALUES('hist' || LPAD(TASK_HISTORY_SEQ.NEXTVAL,4,0), 'task0159', 'e0013', '진척도를 0에서 80으로 변경하였습니다.', trunc(sysdate, 'iw')-2+17/24+50/1440);
                              
INSERT INTO TASK_HISTORY VALUES('hist' || LPAD(TASK_HISTORY_SEQ.NEXTVAL,4,0), 'task0161', 'e0005', '진척도를 0에서 100으로 변경하였습니다.', trunc(sysdate, 'iw')-4+17/24+50/1440);
INSERT INTO TASK_HISTORY VALUES('hist' || LPAD(TASK_HISTORY_SEQ.NEXTVAL,4,0), 'task0162', 'e0005', '진척도를 0에서 80으로 변경하였습니다.', trunc(sysdate, 'iw')-2+17/24+50/1440);
                               
INSERT INTO TASK_HISTORY VALUES('hist' || LPAD(TASK_HISTORY_SEQ.NEXTVAL,4,0), 'task0168', 'e0013', '진척도를 0에서 20으로 변경하였습니다.', trunc(sysdate, 'iw')+10/24+20/1440);
                              
INSERT INTO TASK_HISTORY VALUES('hist' || LPAD(TASK_HISTORY_SEQ.NEXTVAL,4,0), 'task0173', 'e0009', '진척도를 0에서 20으로 변경하였습니다.', trunc(sysdate, 'iw')+10/24);

-------------------------------------------------------------------------------------------------------------------------------------------------

--팝업

INSERT INTO POPUP VALUES('pop' || LPAD(POPUP_SEQ.NEXTVAL,4,0),  to_date('20181008', 'YYYYMMDD'), to_date('20181102', 'YYYYMMDD'), 710, 215, 0, 0, '시민 아이디어 공모전', SYSDATE, 'e0015', empty_blob(), 'T');
INSERT INTO POPUP VALUES('pop' || LPAD(POPUP_SEQ.NEXTVAL,4,0),  to_date('20190201', 'YYYYMMDD'), to_date('20190331', 'YYYYMMDD'), 715, 220, 0, 0, 'ICT융합 프로젝트 공모전', SYSDATE, 'e0015', empty_blob(), 'T');
INSERT INTO POPUP VALUES('pop' || LPAD(POPUP_SEQ.NEXTVAL,4,0),  to_date('20190516', 'YYYYMMDD'), to_date('20190618', 'YYYYMMDD'), 600, 300, 0, 0, '공공데이터 활용 아이디어 공모전', SYSDATE, 'e0015', empty_blob(), 'T');
INSERT INTO POPUP VALUES('pop' || LPAD(POPUP_SEQ.NEXTVAL,4,0),  to_date('20191009', 'YYYYMMDD'), to_date('20191009', 'YYYYMMDD'), 800, 250, 0, 0, '한글날 기념 포스터', SYSDATE, 'e0015', empty_blob(), 'T');
INSERT INTO POPUP VALUES('pop' || LPAD(POPUP_SEQ.NEXTVAL,4,0),  to_date('20191014', 'YYYYMMDD'), to_date('20191017', 'YYYYMMDD'), 710, 215, 0, 0, 'ㅇㅇ공모전', SYSDATE, 'e0015', empty_blob(), 'T');
INSERT INTO POPUP VALUES('pop' || LPAD(POPUP_SEQ.NEXTVAL,4,0),  to_date('20191023', 'YYYYMMDD'), to_date('20191103', 'YYYYMMDD'), 710, 215, 0, 0, 'ㅇㅇ공모전', SYSDATE, 'e0015', empty_blob(), 'T');

--------------------------------------------------------------------------------------------------------------------------------
--채팅방
 
INSERT INTO CHAT VALUES('ch' || LPAD(CHAT_SEQ.NEXTVAL,4,0), '영화관 예매 시스템', 'T');
INSERT INTO CHAT VALUES('ch' || LPAD(CHAT_SEQ.NEXTVAL,4,0), '유기동물 입양 시스템', 'T');
INSERT INTO CHAT VALUES('ch' || LPAD(CHAT_SEQ.NEXTVAL,4,0), '스마트 웨어', 'T');
INSERT INTO CHAT VALUES('ch' || LPAD(CHAT_SEQ.NEXTVAL,4,0), '최종프로젝트 젊은이 모임', 'T');
INSERT INTO CHAT VALUES('ch' || LPAD(CHAT_SEQ.NEXTVAL,4,0), '오늘 저녁 회식 단톡방 ', 'T');

------------------------------------------------------------------------------------------------------------
--메세지

INSERT INTO MESSAGE VALUES('msg' || LPAD(MESSAGE_SEQ.NEXTVAL,4,0), 'ch0001', '<a href=''chatFile?path=C:/picture/file/수행계획서_영화관 예매 시스템.hwp'' download><i class=''fa fa-download''></i>수행계획서_영화관 예매 시스템.hwp</a>', 'e0002', to_date('20190612 13:20:00', 'YYYYMMDD HH24:MI:SS'));
INSERT INTO MESSAGE VALUES('msg' || LPAD(MESSAGE_SEQ.NEXTVAL,4,0), 'ch0001', '<a href=''chatFile?path=C:/picture/file/요구사항정의서_영화관 예매 시스템.xlsx'' download><i class=''fa fa-download''></i>요구사항정의서_영화관 예매 시스템.xlsx</a>', 'e0002', to_date('20190612 13:20:00', 'YYYYMMDD HH24:MI:SS'));
INSERT INTO MESSAGE VALUES('msg' || LPAD(MESSAGE_SEQ.NEXTVAL,4,0), 'ch0002', '<a href=''chatFile?path=C:/picture/file/수행계획서_유기동물 입양 시스템.hwp'' download><i class=''fa fa-download''></i>수행계획서_유기동물 입양 시스템.hwp</a>', 'e0002', to_date('20190819 10:15:00', 'YYYYMMDD HH24:MI:SS'));
INSERT INTO MESSAGE VALUES('msg' || LPAD(MESSAGE_SEQ.NEXTVAL,4,0), 'ch0002', '<a href=''chatFile?path=C:/picture/file/요구사항정의서_유기동물 입양 시스템.xlsx'' download><i class=''fa fa-download''></i>요구사항정의서_유기동물 입양 시스템.xlsx</a>', 'e0002', to_date('20190819 10:15:00', 'YYYYMMDD HH24:MI:SS'));
INSERT INTO MESSAGE VALUES('msg' || LPAD(MESSAGE_SEQ.NEXTVAL,4,0), 'ch0003', '<a href=''chatFile?path=C:/picture/file/수행계획서_스마트 웨어.hwp'' download><i class=''fa fa-download''></i>수행계획서_스마트 웨어.hwp</a>', 'e0005', trunc(sysdate, 'iw')-14+10/24+111/1440);
INSERT INTO MESSAGE VALUES('msg' || LPAD(MESSAGE_SEQ.NEXTVAL,4,0), 'ch0003', '<a href=''chatFile?path=C:/picture/file/요구사항정의서_스마트 웨어.xlsx'' download><i class=''fa fa-download''></i>요구사항정의서_스마트 웨어.xlsx</a>', 'e0005', trunc(sysdate, 'iw')-14+10/24+111/1440);
Insert into MESSAGE values ('msg' || LPAD(MESSAGE_SEQ.NEXTVAL,4,0),'ch0004','부장 배상현을 제외한 최종프로젝트 젊은이 모임 단톡방입니다','e0014',to_date('2019/11/04 18:31:00','YYYY/MM/DD HH24:MI:SS'));
Insert into MESSAGE values ('msg' || LPAD(MESSAGE_SEQ.NEXTVAL,4,0),'ch0004','아 있었네.. 죄송합니다','e0014',to_date('2019/11/04 18:31:08','YYYY/MM/DD HH24:MI:SS'));
Insert into MESSAGE values ('msg' || LPAD(MESSAGE_SEQ.NEXTVAL,4,0),'ch0004','부장님 사랑합니다','e0013',to_date('2019/11/04 18:31:25','YYYY/MM/DD HH24:MI:SS'));
Insert into MESSAGE values ('msg' || LPAD(MESSAGE_SEQ.NEXTVAL,4,0),'ch0005','오늘 저녁 회식 장소입니다 참고해주세요','e0013',to_date('2019/11/04 18:33:33','YYYY/MM/DD HH24:MI:SS'));
Insert into MESSAGE values ('msg' || LPAD(MESSAGE_SEQ.NEXTVAL,4,0),'ch0005','<img src=''chatImgFile?path=C:picture/file/회식장소.PNG'' style=''width:150px; height:150px; border-radius: 30%;''><a href=''chatFile?path=C:/picture/file/회식장소.PNG'' download><i class=''fa fa-download''></i>회식장소.PNG</a>','e0013',to_date('2019/11/04 18:40:38','YYYY/MM/DD HH24:MI:SS'));

---------------------------------------------------------------------------------------------------------
--참가자

Insert into CHAT_EMP (EMP_ID,CHAT_ID,LAST_MSG,INVITE_ID) values ('e0002','ch0001',null,null);
Insert into CHAT_EMP (EMP_ID,CHAT_ID,LAST_MSG,INVITE_ID) values ('e0005','ch0001',null,null);
Insert into CHAT_EMP (EMP_ID,CHAT_ID,LAST_MSG,INVITE_ID) values ('e0009','ch0001',null,null);
Insert into CHAT_EMP (EMP_ID,CHAT_ID,LAST_MSG,INVITE_ID) values ('e0013','ch0001',null,null);
Insert into CHAT_EMP (EMP_ID,CHAT_ID,LAST_MSG,INVITE_ID) values ('e0015','ch0001',null,null);
Insert into CHAT_EMP (EMP_ID,CHAT_ID,LAST_MSG,INVITE_ID) values ('e0002','ch0002',null,null);
Insert into CHAT_EMP (EMP_ID,CHAT_ID,LAST_MSG,INVITE_ID) values ('e0005','ch0002',null,null);
Insert into CHAT_EMP (EMP_ID,CHAT_ID,LAST_MSG,INVITE_ID) values ('e0009','ch0002',null,null);
Insert into CHAT_EMP (EMP_ID,CHAT_ID,LAST_MSG,INVITE_ID) values ('e0013','ch0002',null,null);
Insert into CHAT_EMP (EMP_ID,CHAT_ID,LAST_MSG,INVITE_ID) values ('e0015','ch0002',null,null);
Insert into CHAT_EMP (EMP_ID,CHAT_ID,LAST_MSG,INVITE_ID) values ('e0005','ch0003',null,null);
Insert into CHAT_EMP (EMP_ID,CHAT_ID,LAST_MSG,INVITE_ID) values ('e0009','ch0003',null,null);
Insert into CHAT_EMP (EMP_ID,CHAT_ID,LAST_MSG,INVITE_ID) values ('e0013','ch0003',null,null);
Insert into CHAT_EMP (EMP_ID,CHAT_ID,LAST_MSG,INVITE_ID) values ('e0014','ch0003',null,null);
Insert into CHAT_EMP (EMP_ID,CHAT_ID,LAST_MSG,INVITE_ID) values ('e0015','ch0003',null,null);
Insert into CHAT_EMP (EMP_ID,CHAT_ID,LAST_MSG,INVITE_ID) values ('e0013','ch0004','msg0009',null);
Insert into CHAT_EMP (EMP_ID,CHAT_ID,LAST_MSG,INVITE_ID) values ('e0013','ch0005','msg0015',null);
Insert into CHAT_EMP (EMP_ID,CHAT_ID,LAST_MSG,INVITE_ID) values ('e0014','ch0004','msg0009',null);
Insert into CHAT_EMP (EMP_ID,CHAT_ID,LAST_MSG,INVITE_ID) values ('e0014','ch0005',null,null);
Insert into CHAT_EMP (EMP_ID,CHAT_ID,LAST_MSG,INVITE_ID) values ('e0009','ch0004',null,null);
Insert into CHAT_EMP (EMP_ID,CHAT_ID,LAST_MSG,INVITE_ID) values ('e0005','ch0004',null,null);
Insert into CHAT_EMP (EMP_ID,CHAT_ID,LAST_MSG,INVITE_ID) values ('e0012','ch0005',null,null);
Insert into CHAT_EMP (EMP_ID,CHAT_ID,LAST_MSG,INVITE_ID) values ('e0022','ch0005',null,null);
Insert into CHAT_EMP (EMP_ID,CHAT_ID,LAST_MSG,INVITE_ID) values ('e0024','ch0005',null,null);
Insert into CHAT_EMP (EMP_ID,CHAT_ID,LAST_MSG,INVITE_ID) values ('e0015','ch0004',null,null);
Insert into CHAT_EMP (EMP_ID,CHAT_ID,LAST_MSG,INVITE_ID) values ('e0016','ch0005',null,null);
Insert into CHAT_EMP (EMP_ID,CHAT_ID,LAST_MSG,INVITE_ID) values ('e0010','ch0005',null,null);
Insert into CHAT_EMP (EMP_ID,CHAT_ID,LAST_MSG,INVITE_ID) values ('e0019','ch0005',null,null);
Insert into CHAT_EMP (EMP_ID,CHAT_ID,LAST_MSG,INVITE_ID) values ('e0017','ch0005',null,null);
Insert into CHAT_EMP (EMP_ID,CHAT_ID,LAST_MSG,INVITE_ID) values ('e0007','ch0005',null,null);
Insert into CHAT_EMP (EMP_ID,CHAT_ID,LAST_MSG,INVITE_ID) values ('e0020','ch0005',null,null);
Insert into CHAT_EMP (EMP_ID,CHAT_ID,LAST_MSG,INVITE_ID) values ('e0008','ch0005',null,null);
Insert into CHAT_EMP (EMP_ID,CHAT_ID,LAST_MSG,INVITE_ID) values ('e0005','ch0005',null,null);
Insert into CHAT_EMP (EMP_ID,CHAT_ID,LAST_MSG,INVITE_ID) values ('e0011','ch0005',null,null);
Insert into CHAT_EMP (EMP_ID,CHAT_ID,LAST_MSG,INVITE_ID) values ('e0006','ch0005',null,null);
Insert into CHAT_EMP (EMP_ID,CHAT_ID,LAST_MSG,INVITE_ID) values ('e0009','ch0005',null,null);
Insert into CHAT_EMP (EMP_ID,CHAT_ID,LAST_MSG,INVITE_ID) values ('e0021','ch0005',null,null);
Insert into CHAT_EMP (EMP_ID,CHAT_ID,LAST_MSG,INVITE_ID) values ('e0018','ch0005',null,null);
Insert into CHAT_EMP (EMP_ID,CHAT_ID,LAST_MSG,INVITE_ID) values ('e0023','ch0005',null,null);
Insert into CHAT_EMP (EMP_ID,CHAT_ID,LAST_MSG,INVITE_ID) values ('e0001','ch0005',null,null);
Insert into CHAT_EMP (EMP_ID,CHAT_ID,LAST_MSG,INVITE_ID) values ('e0015','ch0005',null,null);

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--카테고리
INSERT INTO CATEGORY VALUES ('cate' || LPAD(CATEGORY_SEQ .NEXTVAL,4,0), '내 일정', '#372A50', null, 'e0009', null);
INSERT INTO CATEGORY VALUES ('cate' || LPAD(CATEGORY_SEQ .NEXTVAL,4,0), '내 일정_중요', '#C80141', null, 'e0009', null);

INSERT INTO CATEGORY VALUES ('cate' || LPAD(CATEGORY_SEQ .NEXTVAL,4,0), '개발 1팀', '#FFBF00', 'de0002', 'e0005', null);
INSERT INTO CATEGORY VALUES ('cate' || LPAD(CATEGORY_SEQ .NEXTVAL,4,0), '개발 1팀_생일', '#0D9A00', 'de0002', 'e0005', null);
INSERT INTO CATEGORY VALUES ('cate' || LPAD(CATEGORY_SEQ .NEXTVAL,4,0), '개발 1팀_휴가', '#FF7F50', 'de0002', 'e0005', null);

INSERT INTO CATEGORY VALUES ('cate' || LPAD(CATEGORY_SEQ .NEXTVAL,4,0), '스마트웨어', '#00C0EF', null, null, 'pj0003');

---------------------------------------------------------------------------------------------------------------
--일정
  -- 개인
INSERT INTO CALENDAR VALUES 
     ('cal' || LPAD(CALENDAR_SEQ .NEXTVAL,4,0), '치과 예약', '서울치과병원', TO_DATE('201911041800', 'YYYYMMDDHH24MI'),
      TO_DATE('201911041800', 'YYYYMMDDHH24MI'), 'F', null, 'e0009', 'cate0002');
INSERT INTO CALENDAR VALUES
     ('cal' || LPAD(CALENDAR_SEQ .NEXTVAL,4,0), '멜론 만기', null, TO_DATE('201911150000', 'YYYYMMDDHH24MI'), 
      TO_DATE('201911152359', 'YYYYMMDDHH24MI'), 'T', null, 'e0009', 'cate0001');
INSERT INTO CALENDAR VALUES 
     ('cal' || LPAD(CALENDAR_SEQ .NEXTVAL,4,0), '정보처리기사 접수기간', null, TO_DATE('201911040000', 'YYYYMMDDHH24MI'),
      TO_DATE('201911082359', 'YYYYMMDDHH24MI'), 'T', null, 'e0009', 'cate0002');
INSERT INTO CALENDAR VALUES 
     ('cal' || LPAD(CALENDAR_SEQ .NEXTVAL,4,0), '세스코 예약', null, TO_DATE('201911201830', 'YYYYMMDDHH24MI'),
      TO_DATE('201911201830', 'YYYYMMDDHH24MI'), 'F', null, 'e0009', 'cate0001');
INSERT INTO CALENDAR VALUES 
     ('cal' || LPAD(CALENDAR_SEQ .NEXTVAL,4,0), '아버지 생신', null, TO_DATE('201911120000', 'YYYYMMDDHH24MI'),
      TO_DATE('201911122359', 'YYYYMMDDHH24MI'), 'T', null, 'e0009', 'cate0002');
INSERT INTO CALENDAR VALUES 
     ('cal' || LPAD(CALENDAR_SEQ .NEXTVAL,4,0), '치과 예약', '서울치과병원', TO_DATE('201911181800', 'YYYYMMDDHH24MI'),
      TO_DATE('201911181800', 'YYYYMMDDHH24MI'), 'F', null, 'e0009', 'cate0002');  
INSERT INTO CALENDAR VALUES 
     ('cal' || LPAD(CALENDAR_SEQ .NEXTVAL,4,0), '세차 예약', null, TO_DATE('201911231500', 'YYYYMMDDHH24MI'),
      TO_DATE('201911231600', 'YYYYMMDDHH24MI'), 'F', null, 'e0009', 'cate0001');        
INSERT INTO CALENDAR VALUES 
     ('cal' || LPAD(CALENDAR_SEQ .NEXTVAL,4,0), '출장', null, TO_DATE('201911280000', 'YYYYMMDDHH24MI'),
      TO_DATE('201912032359', 'YYYYMMDDHH24MI'), 'T', null, 'e0009', 'cate0002');   

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--일정
  -- 부서
INSERT INTO CALENDAR VALUES
     ('cal' || LPAD(CALENDAR_SEQ .NEXTVAL,4,0), '개발 1팀 회식', null, TO_DATE('201911081800', 'YYYYMMDDHH24MI'), 
      TO_DATE('201911082350', 'YYYYMMDDHH24MI'), 'T', 'de0002', 'e0005', 'cate0003');
INSERT INTO CALENDAR VALUES
     ('cal' || LPAD(CALENDAR_SEQ .NEXTVAL,4,0), '배상현 생일', null, TO_DATE('201911010000', 'YYYYMMDDHH24MI'), 
      TO_DATE('201911012359', 'YYYYMMDDHH24MI'), 'T', 'de0002', 'e0005', 'cate0004');
INSERT INTO CALENDAR VALUES
     ('cal' || LPAD(CALENDAR_SEQ .NEXTVAL,4,0), '조민수 생일', null, TO_DATE('201909030000', 'YYYYMMDDHH24MI'), 
      TO_DATE('201909032359', 'YYYYMMDDHH24MI'), 'T', 'de0002', 'e0009', 'cate0004');
INSERT INTO CALENDAR VALUES
     ('cal' || LPAD(CALENDAR_SEQ .NEXTVAL,4,0), '전민규 생일', null, TO_DATE('201911290000', 'YYYYMMDDHH24MI'), 
      TO_DATE('201911292359', 'YYYYMMDDHH24MI'), 'T', 'de0002', 'e0013', 'cate0004');
INSERT INTO CALENDAR VALUES
     ('cal' || LPAD(CALENDAR_SEQ .NEXTVAL,4,0), '김도훈 생일', null, TO_DATE('201910150000', 'YYYYMMDDHH24MI'), 
      TO_DATE('201910152359', 'YYYYMMDDHH24MI'), 'T', 'de0002', 'e0014', 'cate0004');
INSERT INTO CALENDAR VALUES
     ('cal' || LPAD(CALENDAR_SEQ .NEXTVAL,4,0), '홍다은 생일', null, TO_DATE('201910250000', 'YYYYMMDDHH24MI'), 
      TO_DATE('201910252359', 'YYYYMMDDHH24MI'), 'T', 'de0002', 'e0015', 'cate0004');
INSERT INTO CALENDAR VALUES
     ('cal' || LPAD(CALENDAR_SEQ .NEXTVAL,4,0), '조민수 휴가', null, TO_DATE('201911010000', 'YYYYMMDDHH24MI'),
      TO_DATE('201911022359', 'YYYYMMDDHH24MI'), 'T', 'de0002', 'e0009', 'cate0005');
INSERT INTO CALENDAR VALUES
     ('cal' || LPAD(CALENDAR_SEQ .NEXTVAL,4,0), '배상현 휴가', null, TO_DATE('201911250000', 'YYYYMMDDHH24MI'),
      TO_DATE('201911272359', 'YYYYMMDDHH24MI'), 'T', 'de0002', 'e0005', 'cate0005');
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--일정
  -- 프로젝트(pj0003, 스마트웨어)
INSERT INTO CALENDAR VALUES
     ('cal' || LPAD(CALENDAR_SEQ .NEXTVAL,4,0), '출퇴근 앱', null, trunc(sysdate, 'iw')-14, trunc(sysdate, 'iw')-6+23/24+59/1440, 'T', null, 'e0005', 'cate0006');
INSERT INTO CALENDAR VALUES
     ('cal' || LPAD(CALENDAR_SEQ .NEXTVAL,4,0), '지문인식 로그인', null, trunc(sysdate, 'iw')-14, trunc(sysdate, 'iw')-13+23/24+59/1440, 'T', null, 'e0005', 'cate0006');
INSERT INTO CALENDAR VALUES
     ('cal' || LPAD(CALENDAR_SEQ .NEXTVAL,4,0), 'GPS 기반 출퇴근 기록', null, trunc(sysdate, 'iw')-12, trunc(sysdate, 'iw')-11+23/24+59/1440, 'T', null, 'e0005', 'cate0006');
INSERT INTO CALENDAR VALUES
     ('cal' || LPAD(CALENDAR_SEQ .NEXTVAL,4,0), '출퇴근 기록 확인 기능', null, trunc(sysdate, 'iw')-10, trunc(sysdate, 'iw')-9+23/24+59/1440, 'T', null, 'e0005', 'cate0006');
INSERT INTO CALENDAR VALUES
     ('cal' || LPAD(CALENDAR_SEQ .NEXTVAL,4,0), '근태 사유서 전송 및 확인 기능', null, trunc(sysdate, 'iw')-7, trunc(sysdate, 'iw')-6+23/24+59/1440, 'T', null, 'e0005', 'cate0006');
INSERT INTO CALENDAR VALUES
     ('cal' || LPAD(CALENDAR_SEQ .NEXTVAL,4,0), '전자결재', null, trunc(sysdate, 'iw')-5, trunc(sysdate, 'iw')+3+23/24+59/1440, 'T', null, 'e0005', 'cate0006');	
INSERT INTO CALENDAR VALUES
     ('cal' || LPAD(CALENDAR_SEQ .NEXTVAL,4,0), '전자결재 신청서 화면 구현', null, trunc(sysdate, 'iw')-5, trunc(sysdate, 'iw')-4+23/24+59/1440, 'T', null, 'e0005', 'cate0006');		
INSERT INTO CALENDAR VALUES
     ('cal' || LPAD(CALENDAR_SEQ .NEXTVAL,4,0), '전자결재 신청서 및 결재선 연동 기능', null, trunc(sysdate, 'iw')-3, trunc(sysdate, 'iw')-2+23/24+59/1440, 'T', null, 'e0005', 'cate0006');		
INSERT INTO CALENDAR VALUES
     ('cal' || LPAD(CALENDAR_SEQ .NEXTVAL,4,0), '결재선 배치 설정', null, trunc(sysdate, 'iw'), trunc(sysdate, 'iw')+1+23/24+59/1440, 'T', null, 'e0005', 'cate0006');	
INSERT INTO CALENDAR VALUES
     ('cal' || LPAD(CALENDAR_SEQ .NEXTVAL,4,0), '결재자 신청서 결재 기능', null, trunc(sysdate, 'iw')+2, trunc(sysdate, 'iw')+3+23/24+59/1440, 'T', null, 'e0005', 'cate0006');		
INSERT INTO CALENDAR VALUES
     ('cal' || LPAD(CALENDAR_SEQ .NEXTVAL,4,0), '스마트미러/웹(일정)', null, trunc(sysdate, 'iw')+4, trunc(sysdate, 'iw')+12+23/24+59/1440, 'T', null, 'e0005', 'cate0006');			
INSERT INTO CALENDAR VALUES
     ('cal' || LPAD(CALENDAR_SEQ .NEXTVAL,4,0), '일정 관리 기능 라즈베리파이 적용', null, trunc(sysdate, 'iw')+4, trunc(sysdate, 'iw')+12+23/24+59/1440, 'T', null, 'e0005', 'cate0006');			

INSERT INTO CALENDAR VALUES
     ('cal' || LPAD(CALENDAR_SEQ .NEXTVAL,4,0), '일정관리', null, trunc(sysdate, 'iw')-14, trunc(sysdate, 'iw')-2+23/24+59/1440, 'T', null, 'e0009', 'cate0006');		
INSERT INTO CALENDAR VALUES
     ('cal' || LPAD(CALENDAR_SEQ .NEXTVAL,4,0), '계정 연동 구글 캘린더 화면 출력', null, trunc(sysdate, 'iw')-14, trunc(sysdate, 'iw')-12+23/24+59/1440, 'T', null, 'e0009', 'cate0006');	
INSERT INTO CALENDAR VALUES
     ('cal' || LPAD(CALENDAR_SEQ .NEXTVAL,4,0), '캘린더 일정 등록 기능', null, trunc(sysdate, 'iw')-11, trunc(sysdate, 'iw')-9+23/24+59/1440, 'T', null, 'e0009', 'cate0006');	
INSERT INTO CALENDAR VALUES
     ('cal' || LPAD(CALENDAR_SEQ .NEXTVAL,4,0), '캘린더 조회/삭제/수정 연동 기능', null, trunc(sysdate, 'iw')-7, trunc(sysdate, 'iw')-5+23/24+59/1440, 'T', null, 'e0009', 'cate0006');	
INSERT INTO CALENDAR VALUES
     ('cal' || LPAD(CALENDAR_SEQ .NEXTVAL,4,0), '일정 알림 기능 구현', null, trunc(sysdate, 'iw')-4, trunc(sysdate, 'iw')-2+23/24+59/1440, 'T', null, 'e0009', 'cate0006');	
INSERT INTO CALENDAR VALUES
     ('cal' || LPAD(CALENDAR_SEQ .NEXTVAL,4,0), 'PMS', null, trunc(sysdate, 'iw'), trunc(sysdate, 'iw')+12+23/24+59/1440, 'T', null, 'e0009', 'cate0006');		
INSERT INTO CALENDAR VALUES
     ('cal' || LPAD(CALENDAR_SEQ .NEXTVAL,4,0), '프로젝트 생성 기능', null, trunc(sysdate, 'iw'), trunc(sysdate, 'iw')+2+23/24+59/1440, 'T', null, 'e0009', 'cate0006');		
INSERT INTO CALENDAR VALUES
     ('cal' || LPAD(CALENDAR_SEQ .NEXTVAL,4,0), '프로젝트 구성원 등록', null, trunc(sysdate, 'iw')+3, trunc(sysdate, 'iw')+5+23/24+59/1440, 'T', null, 'e0009', 'cate0006');				
INSERT INTO CALENDAR VALUES
     ('cal' || LPAD(CALENDAR_SEQ .NEXTVAL,4,0), '프로젝트 일감 배분', null, trunc(sysdate, 'iw')+7, trunc(sysdate, 'iw')+9+23/24+59/1440, 'T', null, 'e0009', 'cate0006');		
INSERT INTO CALENDAR VALUES
     ('cal' || LPAD(CALENDAR_SEQ .NEXTVAL,4,0), '프로젝트 일감 수정 및 검색', null, trunc(sysdate, 'iw')+10, trunc(sysdate, 'iw')+12+23/24+59/1440, 'T', null, 'e0009', 'cate0006');			


INSERT INTO CALENDAR VALUES
     ('cal' || LPAD(CALENDAR_SEQ .NEXTVAL,4,0), '채팅', null, trunc(sysdate, 'iw')-14, trunc(sysdate, 'iw')-9+23/24+59/1440, 'T', null, 'e0013', 'cate0006');	
INSERT INTO CALENDAR VALUES
     ('cal' || LPAD(CALENDAR_SEQ .NEXTVAL,4,0), '채팅방 생성 기능', null, trunc(sysdate, 'iw')-14, trunc(sysdate, 'iw')-13+23/24+59/1440, 'T', null, 'e0013', 'cate0006');	
INSERT INTO CALENDAR VALUES
     ('cal' || LPAD(CALENDAR_SEQ .NEXTVAL,4,0), '다중 채팅 기능', null, trunc(sysdate, 'iw')-13, trunc(sysdate, 'iw')-12+23/24+59/1440, 'T', null, 'e0013', 'cate0006');	
INSERT INTO CALENDAR VALUES
     ('cal' || LPAD(CALENDAR_SEQ .NEXTVAL,4,0), '채팅방 초대 기능	', null, trunc(sysdate, 'iw')-11, trunc(sysdate, 'iw')-10+23/24+59/1440, 'T', null, 'e0013', 'cate0006');	
INSERT INTO CALENDAR VALUES
     ('cal' || LPAD(CALENDAR_SEQ .NEXTVAL,4,0), '채팅 수신 시 알림 기능', null, trunc(sysdate, 'iw')-10, trunc(sysdate, 'iw')-9+23/24+59/1440, 'T', null, 'e0013', 'cate0006');	
INSERT INTO CALENDAR VALUES
     ('cal' || LPAD(CALENDAR_SEQ .NEXTVAL,4,0), '팝업', null, trunc(sysdate, 'iw')-7, trunc(sysdate, 'iw')-2+23/24+59/1440, 'T', null, 'e0013', 'cate0006');		
INSERT INTO CALENDAR VALUES
     ('cal' || LPAD(CALENDAR_SEQ .NEXTVAL,4,0), '팝업 위치별 추가 기능', null, trunc(sysdate, 'iw')-7, trunc(sysdate, 'iw')-6+23/24+59/1440, 'T', null, 'e0013', 'cate0006');			
INSERT INTO CALENDAR VALUES
     ('cal' || LPAD(CALENDAR_SEQ .NEXTVAL,4,0), '팝업 비활성화 버튼 기능', null, trunc(sysdate, 'iw')-5, trunc(sysdate, 'iw')-4+23/24+59/1440, 'T', null, 'e0013', 'cate0006');	
INSERT INTO CALENDAR VALUES
     ('cal' || LPAD(CALENDAR_SEQ .NEXTVAL,4,0), '팝업 삭제 및 기간 수정 기능', null, trunc(sysdate, 'iw')-3, trunc(sysdate, 'iw')-2+23/24+59/1440, 'T', null, 'e0013', 'cate0006');			
INSERT INTO CALENDAR VALUES
     ('cal' || LPAD(CALENDAR_SEQ .NEXTVAL,4,0), '스마트미러/웹(날씨)', null, trunc(sysdate, 'iw'), trunc(sysdate, 'iw')+12+23/24+59/1440, 'T', null, 'e0013', 'cate0006');		
INSERT INTO CALENDAR VALUES
     ('cal' || LPAD(CALENDAR_SEQ .NEXTVAL,4,0), '날씨 정보 출력 구현', null, trunc(sysdate, 'iw'), trunc(sysdate, 'iw')+2+23/24+59/1440, 'T', null, 'e0013', 'cate0006');		
INSERT INTO CALENDAR VALUES
     ('cal' || LPAD(CALENDAR_SEQ .NEXTVAL,4,0), '라즈베리파이 리눅스 환경 구성', null, trunc(sysdate, 'iw')+3, trunc(sysdate, 'iw')+5+23/24+59/1440, 'T', null, 'e0013', 'cate0006');			
INSERT INTO CALENDAR VALUES
     ('cal' || LPAD(CALENDAR_SEQ .NEXTVAL,4,0), '날씨 정보 라즈베리파이 적용', null, trunc(sysdate, 'iw')+7, trunc(sysdate, 'iw')+9+23/24+59/1440, 'T', null, 'e0013', 'cate0006');			
INSERT INTO CALENDAR VALUES
     ('cal' || LPAD(CALENDAR_SEQ .NEXTVAL,4,0), 'Google Cloud Speech 연동', null, trunc(sysdate, 'iw')+10, trunc(sysdate, 'iw')+12+23/24+59/1440, 'T', null, 'e0013', 'cate0006');				

INSERT INTO CALENDAR VALUES
     ('cal' || LPAD(CALENDAR_SEQ .NEXTVAL,4,0), '로그인', null, trunc(sysdate, 'iw')-14, trunc(sysdate, 'iw')-13+23/24+59/1440, 'T', null, 'e0014', 'cate0006');	
INSERT INTO CALENDAR VALUES
     ('cal' || LPAD(CALENDAR_SEQ .NEXTVAL,4,0), '로그인 기능', null, trunc(sysdate, 'iw')-14, trunc(sysdate, 'iw')-14+23/24+59/1440, 'T', null, 'e0014', 'cate0006');		
INSERT INTO CALENDAR VALUES
     ('cal' || LPAD(CALENDAR_SEQ .NEXTVAL,4,0), '로그아웃 기능', null, trunc(sysdate, 'iw')-14, trunc(sysdate, 'iw')-14+23/24+59/1440, 'T', null, 'e0014', 'cate0006');
INSERT INTO CALENDAR VALUES
     ('cal' || LPAD(CALENDAR_SEQ .NEXTVAL,4,0), '현재 로그인한 사원리스트 조회 기능', null, trunc(sysdate, 'iw')-14, trunc(sysdate, 'iw')-13+23/24+59/1440, 'T', null, 'e0014', 'cate0006');
INSERT INTO CALENDAR VALUES
     ('cal' || LPAD(CALENDAR_SEQ .NEXTVAL,4,0), '주소록', null, trunc(sysdate, 'iw')-12, trunc(sysdate, 'iw')-9+23/24+59/1440, 'T', null, 'e0014', 'cate0006');
INSERT INTO CALENDAR VALUES
     ('cal' || LPAD(CALENDAR_SEQ .NEXTVAL,4,0), '주소록 부서별 조회', null, trunc(sysdate, 'iw')-12, trunc(sysdate, 'iw')-11+23/24+59/1440, 'T', null, 'e0014', 'cate0006');
INSERT INTO CALENDAR VALUES
     ('cal' || LPAD(CALENDAR_SEQ .NEXTVAL,4,0), '주소록 추가 삭제 수정 기능', null, trunc(sysdate, 'iw')-10, trunc(sysdate, 'iw')-9+23/24+59/1440, 'T', null, 'e0014', 'cate0006');
INSERT INTO CALENDAR VALUES
     ('cal' || LPAD(CALENDAR_SEQ .NEXTVAL,4,0), '메일', null, trunc(sysdate, 'iw')-7, trunc(sysdate, 'iw')+5+23/24+59/1440, 'T', null, 'e0014', 'cate0006');
INSERT INTO CALENDAR VALUES
     ('cal' || LPAD(CALENDAR_SEQ .NEXTVAL,4,0), '메일 페이지 구현', null, trunc(sysdate, 'iw')-7, trunc(sysdate, 'iw')-6+23/24+59/1440, 'T', null, 'e0014', 'cate0006');
INSERT INTO CALENDAR VALUES
     ('cal' || LPAD(CALENDAR_SEQ .NEXTVAL,4,0), '받은 메일함 기능', null, trunc(sysdate, 'iw')-5, trunc(sysdate, 'iw')-4+23/24+59/1440, 'T', null, 'e0014', 'cate0006');
INSERT INTO CALENDAR VALUES
     ('cal' || LPAD(CALENDAR_SEQ .NEXTVAL,4,0), '메일 쓰기 및 답장 기능', null, trunc(sysdate, 'iw')-3, trunc(sysdate, 'iw')-2+23/24+59/1440, 'T', null, 'e0014', 'cate0006');
INSERT INTO CALENDAR VALUES
     ('cal' || LPAD(CALENDAR_SEQ .NEXTVAL,4,0), '보낸 메일함 기능', null, trunc(sysdate, 'iw'), trunc(sysdate, 'iw')+1+23/24+59/1440, 'T', null, 'e0014', 'cate0006');
INSERT INTO CALENDAR VALUES
     ('cal' || LPAD(CALENDAR_SEQ .NEXTVAL,4,0), '스팸 메일 기능', null, trunc(sysdate, 'iw')+2, trunc(sysdate, 'iw')+3+23/24+59/1440, 'T', null, 'e0014', 'cate0006');
INSERT INTO CALENDAR VALUES
     ('cal' || LPAD(CALENDAR_SEQ .NEXTVAL,4,0), '휴지통 및 검색 기능', null, trunc(sysdate, 'iw')+4, trunc(sysdate, 'iw')+5+23/24+59/1440, 'T', null, 'e0014', 'cate0006');
INSERT INTO CALENDAR VALUES
     ('cal' || LPAD(CALENDAR_SEQ .NEXTVAL,4,0), '메일 알람', null, trunc(sysdate, 'iw')+7, trunc(sysdate, 'iw')+9+23/24+59/1440, 'T', null, 'e0014', 'cate0006');		
INSERT INTO CALENDAR VALUES
     ('cal' || LPAD(CALENDAR_SEQ .NEXTVAL,4,0), '메일 알람 연동 기능', null, trunc(sysdate, 'iw')+7, trunc(sysdate, 'iw')+9+23/24+59/1440, 'T', null, 'e0014', 'cate0006');	
INSERT INTO CALENDAR VALUES
     ('cal' || LPAD(CALENDAR_SEQ .NEXTVAL,4,0), '출퇴근 버스', null, trunc(sysdate, 'iw')+10, trunc(sysdate, 'iw')+12+23/24+59/1440, 'T', null, 'e0014', 'cate0006');			
INSERT INTO CALENDAR VALUES
     ('cal' || LPAD(CALENDAR_SEQ .NEXTVAL,4,0), '출퇴근 버스 실시간 조회 기능 구현', null, trunc(sysdate, 'iw')+10, trunc(sysdate, 'iw')+12+23/24+59/1440, 'T', null, 'e0014', 'cate0006');		

commit;
