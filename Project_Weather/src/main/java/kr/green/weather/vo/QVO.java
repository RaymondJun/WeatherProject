package kr.green.weather.vo;

import javax.xml.bind.annotation.XmlRootElement;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@XmlRootElement
public class QVO {
	private int		num;
	private String	content;
	private String	name;
	private String	password;
	private String	now;
}
