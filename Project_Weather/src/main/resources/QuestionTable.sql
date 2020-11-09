

CREATE SEQUENCE ques_idx; 
CREATE TABLE question(
	num NUMBER NOT NULL,
	content varchar(500) NOT NULL,
	name varchar(50) PRIMARY KEY,
	password varchar(50) NOT NULL,
	now varchar(50) NOT null
);

INSERT INTO question (num, content, name, password, now) VALUES (ques_idx.nextval , '아무내용', '비번' , '별명', '20201103/0432'); 
COMMIT;
UPDATE QUESTION SET content='바뀐내용', now='바뀐날짜44' WHERE password='2';
DROP TABLE QUESTION;
DROP SEQUENCE ques_idx;
SELECT * FROM question;
update question 
set
	content='바뀐내용',name='4', password='바뀌비번',now='4453464'
where
	name='4';
SELECT * FROM customer;
DELETE * FROM CUSTOMER c  WHERE cname='운영자';