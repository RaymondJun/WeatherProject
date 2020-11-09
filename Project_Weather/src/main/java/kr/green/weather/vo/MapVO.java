package kr.green.weather.vo;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@XmlRootElement(name = "text")
@XmlAccessorType(XmlAccessType.FIELD)// 필드에다 직접 쓰겠다 롬복 쓸때 쓰면 좋음
public class MapVO {
	@XmlElement(name = "si")
	private String si;
	@XmlElement(name = "gu")
	private String gu;
	@XmlElement(name = "dong")
	private String dong;
	@XmlElement(name = "x")
	private String x;
	@XmlElement(name = "y")
	private String y;
}
