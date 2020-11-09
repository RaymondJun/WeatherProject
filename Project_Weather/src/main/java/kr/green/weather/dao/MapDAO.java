package kr.green.weather.dao;


import org.apache.ibatis.annotations.Param;

import kr.green.weather.vo.MapVO;

public interface MapDAO {
	MapVO selectBySi(String si);
	MapVO selectByGu(String gu);
	MapVO selectByGuX(String gu);
	MapVO selectByGuY(String gu);
	MapVO selectByDong(String dong);
	MapVO selectBySiGuX(String si,String gu);
	MapVO selectBySiGuLikeX(@Param("si")String si,@Param("gu")String gu);
	MapVO selectBySiGuLikeY(@Param("si")String si,@Param("gu")String gu);
	MapVO selectByGuDongX(@Param("gu")String gu,@Param("dong")String dong);
	MapVO selectByGuDongY(@Param("gu")String gu,@Param("dong")String dong);
	MapVO selectByDongX(String dong);
	MapVO selectByDongY(String dong);
}
