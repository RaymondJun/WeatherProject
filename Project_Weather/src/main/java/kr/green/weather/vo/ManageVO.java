package kr.green.weather.vo;

import javax.xml.bind.annotation.XmlRootElement;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


/*
 *       customer 와 role 에 동시 저장을 위한 VO
 * */
@Data
@NoArgsConstructor
@AllArgsConstructor
@XmlRootElement
public class ManageVO {
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
	private String	role;
	
}
