package kr.green.weather.service;

import kr.green.weather.vo.MapVO;

public interface MapService {
	// dong로만 찾는게 좋다
	MapVO selectBySi(String si);
	MapVO selectByGu(String gu);
	MapVO selectByGuX(String gu);
	MapVO selectByGuY(String gu);
	MapVO selectByDong(String dong);
	MapVO selectBySiGuX(String si,String gu);
	MapVO selectBySiGuLikeX(String si,String gu);
	MapVO selectBySiGuLikeY(String si,String gu);
	MapVO selectByGuDongX(String gu,String dong);
	MapVO selectByGuDongY(String gu,String dong);
	MapVO selectByDongX(String dong);
	MapVO selectByDongY(String dong);
	
}
