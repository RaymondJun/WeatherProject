package kr.green.weather.dao;



import java.util.List;


import kr.green.weather.vo.QVO;

public interface QDAO {
	
	int 	maxNum();
	QVO 	selectByname(String name);
	List<QVO>	selectByQList();
	void	insertQ(QVO qVO);
	void	updateQ(QVO qVO);
	void	delQ(String name);
	
}
