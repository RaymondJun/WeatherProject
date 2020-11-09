/*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
DROP SEQUENCE cust_idx_seq;
DROP TABLE CUSTOMER ;
/*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
CREATE SEQUENCE cust_idx_seq;

CREATE TABLE customer(
	custno NUMBER NOT null, 		-- 회원번호
	cemail  varchar(100)PRIMARY KEY,	-- 이메일주소
	cpassword  varchar(100)NOT NULL, -- 비밀번호
	cname  varchar(100)NOT NULL,	-- 이름
	cnickname  varchar(100)NOT NULL,-- 별칭
	cbirth  varchar(100)NOT NULL,	-- 생년월일
	cgender  char(1) NOT NULL,	-- 성별
	cphone  varchar(100)NOT NULL,	-- 폰번호
	czipcode	varchar(50)NOT NULL, -- 우편번호
	caddress  varchar(300)NOT NULL, -- 주소
	caddress2  varchar(300)NOT NULL,  -- 상세주소	
	enabled  NUMBER DEFAULT 1 		-- 권한설정
);
/*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
INSERT INTO customer  
	(custno,cemail,cpassword,cname,cnickname,cbirth,cgender,cphone,czipcode,caddress,caddress2,enabled)
VALUES 
	(cust_idx_seq.nextval,'test@gmail.com','123456','전병선','관리자','1991/02/06','M','010-5674-9399','63304','경기도 용인시 처인구','정암',1);
/*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
SELECT CEMAIL FROM CUSTOMER WHERE CEMAIL ='jbs0206j@gmail.com';
SELECT * FROM CUSTOMER c ;
SELECT * FROM CUST_ROLE cr ;
COMMIT;

/*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
DROP SEQUENCE cust_role_idx_seq;
DROP TABLE cust_role;
/*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
CREATE SEQUENCE cust_role_idx_seq;

CREATE TABLE cust_role(
	--role_idx number(11) PRIMARY KEY,
	cemail   varchar2(100) NOT null,
	role 	 varchar2(50) NOT NULL,
	CONSTRAINT fk_cemail FOREIGN KEY (cemail) REFERENCES customer (cemail) ON DELETE CASCADE 
);
/*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
INSERT INTO cust_role (cemail,role) VALUES ('jbs0206j@gmail.com','ROLE_MANAGER');
INSERT INTO cust_role (cemail,role) VALUES ('jbs0206j@naver.com','ROLE_MANAGER');
INSERT INTO cust_role (cemail,role) VALUES ('jbs0206j@gmail.com','ROLE_WEATHER');
INSERT INTO cust_role (cemail, ROLE) VALUES ('js','ROLE_MANAGER');
INSERT INTO cust_role (cemail, ROLE) VALUES ('js','ROLE_WEATHER');
INSERT INTO cust_role (cemail, ROLE) VALUES ('test9','ROLE_WEATHER');
INSERT ALL 
	INTO CUSTOMER VALUES (custno,cemail,cpassword,cname,cnickname,cbirth,cgender,cphone,czipcode,caddress,caddress2,enabled)
	INTO CUST_ROLE VALUES (cemail,ROLE)
SELECT 
	custno,cemail,cpassword,cname,cnickname,cbirth,cgender,cphone,czipcode,caddress,caddress2,enabled,ROLE
FROM manage;

/*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
COMMIT;

SELECT * FROM cust_role;


select cemail as username, cpassword AS password, enabled from CUSTOMER where cemail='jbs0206j@gmail.com';
select cemail as username, role from cust_role where cemail='jbs0206j@gmail.com';
/*   유저정보와 권한을 동시에  insert 할 때 필요한 테이블       */
CREATE TABLE manage(
	custno NUMBER NOT null, 		-- 회원번호
	cemail  varchar(100)PRIMARY KEY,	-- 이메일주소
	cpassword  varchar(100)NOT NULL, -- 비밀번호
	cname  varchar(100)NOT NULL,	-- 이름
	cnickname  varchar(100)NOT NULL,-- 별칭
	cbirth  varchar(100)NOT NULL,	-- 생년월일
	cgender  char(1) NOT NULL,	-- 성별
	cphone  varchar(100)NOT NULL,	-- 폰번호
	czipcode	varchar(50)NOT NULL, -- 우편번호
	caddress  varchar(300)NOT NULL, -- 주소
	caddress2  varchar(300)NOT NULL,  -- 상세주소	
	enabled  NUMBER DEFAULT 1, 		-- 권한설정
	role 	 varchar2(50) NOT NULL  -- 권한 내용
);
SELECT * FROM manage;

