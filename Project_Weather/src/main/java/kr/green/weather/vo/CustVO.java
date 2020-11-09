package kr.green.weather.vo;

import javax.xml.bind.annotation.XmlRootElement;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;



@Data
@NoArgsConstructor
@AllArgsConstructor
@XmlRootElement
public class CustVO {
	private int 	custno;
	private String	cemail;
	private String	cpassword;
	private String	cname;
	private String	cnickname;
	private String	cbirth;
	private char	cgender;
	private String	cphone;
	private String	czipcode;
	private String	caddress;
	private String	caddress2;
	private int 	enabled;
	private RoleVO 	rol;
	
	/*
	 * custno NUMBER PRIMARY KEY, 		-- 회원번호
	cemail  varchar(100)NOT NULL,	-- 이메일주소
	cpassword  varchar(100)NOT NULL, -- 비밀번호
	cname  varchar(100)NOT NULL,	-- 이름
	cnickname  varchar(100)NOT NULL,-- 별칭
	cbirth  varchar(100)NOT NULL,	-- 생년월일
	cgender  varchar(10)NOT NULL,	-- 성별
	cphone  varchar(100)NOT NULL,	-- 폰번호
	czipcode	varchar(50)NOT NULL, -- 우편번호
	caddress  varchar(300)NOT NULL, -- 주소
	caddress2  varchar(300)NOT NULL  -- 상세주소
	 */
}
