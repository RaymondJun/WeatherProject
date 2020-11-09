package kr.green.weather.service;

import java.util.List;

import kr.green.weather.vo.QVO;

public interface QService {
	int 	maxNum();
	QVO 	selectByname(String name);
	List<QVO>	selectByQList();
	void	insertQ(QVO qVO);
	void	updateQ(QVO qVO);
	void	delQ(String name);
}
