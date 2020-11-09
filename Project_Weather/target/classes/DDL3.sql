CREATE TABLE customer(
	custno NUMBER PRIMARY KEY, 		-- 회원번호
	cname  varchar(100)NOT NULL,	-- 이름
	cpassword  varchar(100)NOT NULL,-- 비밀번호
	caddress  varchar(300)NOT NULL, -- 주소
	cpostno  varchar(100)NOT NULL,  -- 우편번호
	cnickname  varchar(100)NOT NULL,-- 별칭
	cbirth  varchar(100)NOT NULL,	-- 생년월일
	cemail  varchar(100)NOT NULL,	-- 이메일주소
	cphone  varchar(100)NOT NULL,	-- 폰번호
	cgender  varchar(10)NOT NULL	-- 성별
);
DROP SEQUENCE cust_idx_seq;
COMMIT;
CREATE SEQUENCE cust_idx_seq;
INSERT INTO customer  
	(custno,cemail,cpassword,cname,cnickname,cbirth,cgender,cphone,czipcode,caddress,caddress2)
VALUES 
	(cust_idx_seq.nextval,'jbs0206j@gmail.com','123456','전병선','관리자','1991/02/06','M','010-5674-9399','63304','경기도 용인시 처인구','정암');

DROP TABLE CUST_ROLE;
COMMIT;
CREATE TABLE cust_role(
	role_idx number(11) PRIMARY KEY,
	cemail   varchar2(100) NOT NULL,
	role 	 varchar2(50) NOT NULL,
	CONSTRAINT fk_cemail FOREIGN KEY (cemail) REFERENCES customer (cemail)
);
DROP TABLE cust_role;
INSERT INTO cust_role (role_idx,cemail,role)
VALUES 
	(cust_role_idx_seq.nextval,'jbs0206j@gmail.com','ROLE_ADMIN');
INSERT INTO cust_role (role_idx,cemail,role)  VALUES 
(cust_role_idx_seq.nextval,'jbs0206j@gmail.com','ROLE_DBA');
INSERT INTO cust_role (role_idx,cemail,role)  VALUES 
(cust_role_idx_seq.nextval,'jbs0206j@gmail.com','ROLE_USER');
INSERT INTO cust_role (role_idx,cemail,role)  VALUES 
(cust_role_idx_seq.nextval,'jbs0206j@gmail.com','ROLE_CUSTOMER');
COMMIT;
SELECT * FROM cust_role;
select cemail as username, cpassword, use as enabled from CUSTOMER where cemail='jbs0206j@gmail.com';
select cemail as username, role from cust_role where cemail='jbs0206j@gmail.com';


	