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

SELECT USER_NO, USER_ID, USER_PW, USER_NAME, USER_EMAIL, 
USER_ROLE, USER_PHOTO, USER_ACTIVE, USER_REGDATE
FROM USER_INFO;