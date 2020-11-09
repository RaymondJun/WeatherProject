package kr.green.weather.vo;

import javax.xml.bind.annotation.XmlRootElement;

import lombok.Data;

@XmlRootElement
@Data
public class TestVO {
	private String today;
	private int    sum;
	private int    mul;
}
