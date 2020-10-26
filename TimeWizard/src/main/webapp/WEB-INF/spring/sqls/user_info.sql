select object_name, object_type from user_objects

-----------------------------------------------------

DROP SEQUENCE USER_INFO_SEQ;
DROP TABLE USER_INFO;

CREATE SEQUENCE USER_INFO_SEQ;
CREATE TABLE USER_INFO(
	USER_NO NUMBER NOT NULL, -- CONSTRAINT UNIQUE 추가 필요?
	USER_ID VARCHAR2(500) PRIMARY KEY,
	USER_PW VARCHAR2(4000) NOT NULL,
	USER_NAME VARCHAR2(1000) NOT NULL,
	USER_EMAIL VARCHAR2(4000) NOT NULL,
	USER_ROLE VARCHAR2(500) NOT NULL,
	USER_PHOTO VARCHAR2(4000), -- ERD 수정사항
	USER_ACTIVE VARCHAR2(100) NOT NULL, -- 추가
	USER_REGDATE DATE NOT NULL,
	-- CONSTRAINT USER_INFO_EMAIL_UQ UNIQUE(USER_EMAIL), -- 확인바람
	CONSTRAINT USER_INFO_ROLE_CK CHECK(USER_ROLE IN ('ADMIN','USER')),
	CONSTRAINT USER_INFO_ACTIVE_CK CHECK(USER_ACTIVE IN('Y','N'))
);


INSERT INTO USER_INFO VALUES(USER_INFO_SEQ.NEXTVAL, 'admin', 'admin1234', 
'관리자', 'tiwi.minibean@gmail.com', 'ADMIN', NULL, 'Y', SYSDATE);
INSERT INTO USER_INFO VALUES(USER_INFO_SEQ.NEXTVAL, 'test', 'test1234',
'테스트1','test01@tiwi.com', 'USER', NULL, 'Y', SYSDATE);

INSERT INTO USER_INFO VALUES(USER_INFO_SEQ.NEXTVAL, 'ming', 'ming1234',
'밍','mingyeung@naver.com','ADMIN',NULL,'Y',SYSDATE);

INSERT INTO USER_INFO VALUES(USER_INFO_SEQ.NEXTVAL, 'user', 'user1234',
'유저','mddd','USER',NULL,'Y',SYSDATE);


SELECT USER_NO, USER_ID, USER_PW, USER_NAME, USER_EMAIL, 
USER_ROLE, USER_PHOTO, USER_ACTIVE, USER_REGDATE
FROM USER_INFO;


--------------------------------

DROP SEQUENCE BOARD_NOTICE_SEQ;
DROP TABLE BOARD_NOTICE;

CREATE SEQUENCE BOARD_NOTICE_SEQ;
CREATE TABLE BOARD_NOTICE(
	NOTICE_NO NUMBER PRIMARY KEY,
	NOTICE_TITLE VARCHAR2(4000) NOT NULL,
	NOTICE_CONTENT VARCHAR2(4000) NOT NULL,
	NOTICE_REGDATE DATE NOT NULL
);

INSERT INTO BOARD_NOTICE 
VALUES(BOARD_NOTICE_SEQ.NEXTVAL, '테스트공지','테스트공지입니다.', SYSDATE);

SELECT *
FROM BOARD_NOTICE;

----------------------------

DROP SEQUENCE USER_TODO_SEQ;
DROP TABLE USER_TODO;

CREATE SEQUENCE USER_TODO_SEQ;
CREATE TABLE USER_TODO(
	TODO_NO NUMBER PRIMARY KEY,
	USER_NO NUMBER NOT NULL,
	TODO_TITLE VARCHAR2(4000) NOT NULL,
	TODO_COLOR VARCHAR2(1000) NOT NULL,
	TODO_CONTENT VARCHAR2(4000),
	TODO_CATEGORY VARCHAR2(4000),
	TODO_HASHTAG VARCHAR2(4000),
	TODO_DATE DATE NOT NULL, -- DATE? VARCHAR2?
	-- regdate 등록할 필요가 있을지 ??
	TODO_COMPLETE VARCHAR(100) NOT NULL,
	CONSTRAINT USER_TODO_UN_FK FOREIGN KEY (USER_NO) REFERENCES USER_INFO(USER_NO),
	CONSTRAINT USER_TODO_COMPLETE_CK CHECK(TODO_COMPLETE IN ('Y','N'))
);
	-- TODO_REGDATE DATE NOT NULL,
	

INSERT INTO USER_TODO
VALUES(USER_TODO_SEQ.NEXTVAL, 'user', '모의고사풀기','RED','언어영역모의고사풀자~','모의고사','#공부',SYSDATE,'Y')

SELECT *
FROM USER_TODO;

DROP SEQUENCE STOPWATCH_SEQ;
DROP TABLE STOPWATCH;

CREATE SEQUENCE STOPWATCH_SEQ;
CREATE TABLE STOPWATCH(
	STOPWATCH_NO NUMBER PRIMARY KEY,
	USER_NO NUMBER NOT NULL, -- TODO_NO 있지만 그래도 USER_NO 기록하게 할까요??
	TODO_NO NUMBER NOT NULL,
	STOPWATCH_START DATE NOT NULL, -- DATE? VARCHAR2? 어느쪽이 나을지 생각해야할 것 같음
	STOPWATCH_END DATE NOT NULL,
	STOPWATCH_REGDATE DATE NOT NULL,
	CONSTRAINT STOPWATCH_UN_FK FOREIGN KEY(USER_NO) REFERENCES USER_INFO(USER_NO),
	CONSTRAINT STOPWATCH_TN_FK FOREIGN KEY(TODO_NO) REFERENCES USER_TODO(TODO_NO)
);

