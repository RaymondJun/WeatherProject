package kr.green.weather.service;


import javax.xml.bind.annotation.XmlRootElement;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Service;

import kr.green.weather.controller.CustController;
import kr.green.weather.dao.CustDAO;
import kr.green.weather.dao.MapDAO;
import kr.green.weather.vo.CustVO;
import kr.green.weather.vo.MapVO;
import lombok.extern.slf4j.Slf4j;

@Service("mapService")
@XmlRootElement
@Slf4j
public class MapServiceImpl implements MapService{
	
	@Autowired
	MapDAO mapDAO;
	@Autowired
	CustDAO custDAO;

	CustController custController;
	
	
	@Override
	public MapVO selectBySi(String si) {
		log.debug("=====================================================================================");
		log.debug("MapServiceImpl.selectBySi 호출,  불러온 SI :" + si);
		log.debug("=====================================================================================");
		return mapDAO.selectBySi(si);
	}

	@Override
	public MapVO selectByGu(String gu) {
		log.debug("=====================================================================================");
		log.debug("MapServiceImpl.selectByGu 호출,  불러온 GU :" + gu);
		log.debug("=====================================================================================");
		return mapDAO.selectByGu(gu);
	}
	@Override
	public MapVO selectByGuX(String gu) {
		log.debug("=====================================================================================");
		log.debug("MapServiceImpl.selectByGu 호출,  불러온 GU :" + gu);
		log.debug("=====================================================================================");
		String principal = getPrincipal();
		CustVO custVO = custDAO.selectById(principal);
		String addr = custVO.getCaddress();
		String[] list = addr.split(" ");
		gu = list[1];
		for(int i=0;i<=list.length;i++) {
			log.debug("잘라진  주소들 : " + i + "번째 주소 : " + list[i]);
		}
		MapVO result= mapDAO.selectByGuX(gu);
		if(result == null) {
			gu = list[1]+list[2];
			result = mapDAO.selectByGuX(gu);
		}
		return result;
	}
	
	@Override
	public MapVO selectByGuY(String gu) {
		log.debug("=====================================================================================");
		log.debug("MapServiceImpl.selectByGu 호출,  불러온 GU :" + gu);
		log.debug("=====================================================================================");
		String principal = getPrincipal();
		CustVO custVO = custDAO.selectById(principal);
		String addr = custVO.getCaddress();
		String[] list = addr.split(" ");
		gu = list[1];
		for(int i=0;i<=list.length;i++) {
			log.debug("잘라진  주소들 : " + i + "번째 주소 : " + list[i]);
		}
		MapVO result= mapDAO.selectByGuY(gu);
		if(result == null) {
			gu = list[1]+list[2];
			result = mapDAO.selectByGuY(gu);
		}
		return result;
	}

	@Override
	public MapVO selectByDong(String dong) {
		log.debug("=====================================================================================");
		log.debug("MapServiceImpl.selectByDong 호출,  불러온 DONG :" + dong);
		log.debug("=====================================================================================");
		return mapDAO.selectByDong(dong);
	}

	@Override
	
	public MapVO selectBySiGuX(@Param("si") String si, @Param("gu")String gu) {
		log.debug("=====================================================================================");
		log.debug("MapServiceImpl.selectBySiGuX 호출,  불러온 si :" + si + "	불러온 gu : " + gu);
		log.debug("=====================================================================================");
		String principal = getPrincipal();
		CustVO custVO = custDAO.selectById(principal);
		String addr = custVO.getCaddress();
		String[] list = addr.split(" ");
		for(int i=0;i<=list.length-1;i++) {
			log.debug("selectBySiGuX에서 잘라진  주소들 : " + i + "번째 주소 : " + list[i]);
		}
//		si = list[0]+"%";
//		log.debug("si = list[0]+\"%\" ==== si ==== " + si);
		si = list[0];
		log.debug("si        ==================" + si);
		gu = list[1];
		MapVO result = mapDAO.selectBySiGuX(si, gu);
		try {
			log.debug("gu        ==================" + gu);
			String gg = mapDAO.selectBySiGuX(si, gu).toString();
			log.debug("gg        ==================" + gg);
			
			log.debug("=====================================================================================");
			log.debug("MapServiceImpl.selectBySiGuX 호출,  불러온 result =" + result);
			log.debug("=====================================================================================");
			
			if(result == null) {
				si = list[0];
				gu = list[1]+list[2];
				result = mapDAO.selectBySiGuX(si, gu);
				log.debug("=====================================================================================");
				log.debug("MapServiceImpl.selectBySiGuX 호출,  수정된 result =" + result);
				log.debug("=====================================================================================");
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return  result;
	}
	
	@Override
	public MapVO selectBySiGuLikeX(@Param("si")String si,@Param("gu") String gu) {
		log.debug("=====================================================================================");
		log.debug("MapServiceImpl.selectBySiGuX 호출,  불러온 si :" + si + "	불러온 gu : " + gu);
		log.debug("=====================================================================================");
		String principal = getPrincipal();
		CustVO custVO = custDAO.selectById(principal);
		String addr = custVO.getCaddress();
		String[] list = addr.split(" ");
		for(int i=0;i<=list.length-1;i++) {
			log.debug("selectBySiGuLikeX에서 잘라진  주소들 : " + i + "번째 주소 : " + list[i]);
		}
		si = list[0]+"%";
		log.debug("si  ================  " + si);
		gu = list[1];
		MapVO x = mapDAO.selectBySiGuLikeX(si, gu);
		log.debug("=====================================================================================");
		log.debug("MapServiceImpl.selectBySiGuLikeX 호출,  불러온 x =" + x);
		log.debug("=====================================================================================");
		if(x ==null) {
			gu = list[1]+list[2];
			x = mapDAO.selectBySiGuLikeX(si, gu);
			if(x ==null) {
				gu = list[1];
				String dong = list[2];
				//List<MapVO> xvList = 
				x = mapDAO.selectByGuDongX(gu, dong);
				if(x==null) {
					gu =list[1]+list[2];
					dong = list[3];
					x = mapDAO.selectByGuDongX(gu, dong);
				}
				
			}
		}
		return x;
	}
	@Override
	public MapVO selectBySiGuLikeY(@Param("si")String si, @Param("gu")String gu) {
		log.debug("=====================================================================================");
		log.debug("MapServiceImpl.selectBySiGuX 호출,  불러온 si :" + si + "	불러온 gu : " + gu);
		log.debug("=====================================================================================");
		String principal = getPrincipal();
		CustVO custVO = custDAO.selectById(principal);
		String addr = custVO.getCaddress();
		String[] list = addr.split(" ");
		for(int i=0;i<=list.length-1;i++) {
			log.debug("selectBySiGuLikeX에서 잘라진  주소들 : " + i + "번째 주소 : " + list[i]);
		}
		si = list[0]+"%";
		log.debug("si  ================  " + si);
		gu = list[1];
		MapVO y = mapDAO.selectBySiGuLikeY(si, gu);
		log.debug("=====================================================================================");
		log.debug("MapServiceImpl.selectBySiGuLikeY 호출,  불러온 y =" + y);
		log.debug("=====================================================================================");
		if(y ==null) {
			gu = list[1]+list[2];
			y = mapDAO.selectBySiGuLikeY(si, gu);
			if(y==null) {
				gu = list[1];
				String dong = list[2];
				//List<MapVO> xvList = 
				y = mapDAO.selectByGuDongY(gu, dong);
				if(y==null) {
					gu =list[1]+list[2];
					dong = list[3];
					y = mapDAO.selectByGuDongY(gu, dong);
				}
			}
			log.debug("=====================================================================================");
			log.debug("MapServiceImpl.selectBySiGuLikeY 호출,  수정된 y =" + y);
			log.debug("=====================================================================================");

		}
		return y;
	}
	
	
	@Override
	public MapVO selectByGuDongX(@Param("gu")String gu, @Param("dong")String dong) {
		log.debug("=====================================================================================");
		log.debug("MapServiceImpl.selectByGuDongX 호출,  불러온 gu :" + gu + "불러온 dong" + dong);
		log.debug("=====================================================================================");
		String principal = getPrincipal();
		CustVO custVO = custDAO.selectById(principal);
		String addr = custVO.getCaddress();
		log.debug("가져온 주소 : " + addr);
		String[] list = addr.split(" ");
		for(int i=0;i<=list.length-1;i++) {
			log.debug("잘라진  주소들 : " + i + "번째 주소 : " + list[i]);
		}
		gu = list[1];
		dong = list[2];
		//List<MapVO> xvList = 
		MapVO x = mapDAO.selectByGuDongX(gu, dong);
		if(x==null) {
			gu =list[1]+list[2];
			dong = list[3];
			x = mapDAO.selectByGuDongX(gu, dong);
		}
		log.debug("=====================================================================================");
		log.debug("MapServiceImpl.selectByGuDongX xxxx" + x);
		log.debug("=====================================================================================");
		
		return x;
	}
	@Override
	public MapVO selectByGuDongY(@Param("gu")String gu, @Param("dong")String dong) {
		log.debug("=====================================================================================");
		log.debug("MapServiceImpl.selectByGuDongY 호출,  불러온 gu :" + gu + "불러온 dong" + dong);
		log.debug("=====================================================================================");
		String principal = getPrincipal();
		CustVO custVO = custDAO.selectById(principal);
		String addr = custVO.getCaddress();
		log.debug("가져온 주소 : " + addr);
		String[] list = addr.split(" ");
		for(int i=0;i<=list.length-1;i++) {
			log.debug("잘라진  주소들 : " + i + "번째 주소 : " + list[i]);
		}
		gu = list[1];
		dong = list[2];
		//List<MapVO> xvList = 
		MapVO y = mapDAO.selectByGuDongY(gu, dong);
		if(y==null) {
			gu =list[1]+list[2];
			dong = list[3];
			y = mapDAO.selectByGuDongY(gu, dong);
		}
		log.debug("=====================================================================================");
		log.debug("MapServiceImpl.selectByGuDongX y" + y);
		log.debug("=====================================================================================");
		
		return y;
	}

	@Override
	public MapVO selectByDongX(String dong) {
		log.debug("=====================================================================================");
		log.debug("MapServiceImpl.selectByGuDongX 호출, 불러온 dong" + dong);
		log.debug("=====================================================================================");
		String principal = getPrincipal();
		CustVO custVO = custDAO.selectById(principal);
		String addr = custVO.getCaddress();
		log.debug("가져온 주소 : " + addr);
		String[] list = addr.split(" ");
		for(int i=0;i<=list.length;i++) {
			log.debug("잘라진  주소들 : " + i + "번째 주소 : " + list[i]);
		}
		dong = list[2];
		return mapDAO.selectByDongX(dong);
	}

	@Override
	public MapVO selectByDongY(String dong) {
		log.debug("=====================================================================================");
		log.debug("MapServiceImpl.selectByGuDongY 호출,  불러온 dong" + dong);
		log.debug("=====================================================================================");
		String principal = getPrincipal();
		CustVO custVO = custDAO.selectById(principal);
		String addr = custVO.getCaddress();
		log.debug("가져온 주소 : " + addr);
		String[] list = addr.split(" ");
		for(int i=0;i<=list.length-1;i++) {
			log.debug("서비스 에서잘라진  주소들 : " + i + "번째 주소 : " + list[i]);
		}
		dong = list[3];
		MapVO result = mapDAO.selectByDongY(dong);
		if (result == null) {
			String gu = list[1]+list[2];
			dong = list[3];
			result = mapDAO.selectByGuY(gu);
		}
		log.debug("=====================================================================================");
		log.debug("서비스에서 가져온 좌표 : " + result);
		log.debug("=====================================================================================");
		return result;
	}
	// 시크리트 사용자 정보 얻기
	private static String getPrincipal() {
		String userName = null;
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		if(principal instanceof UserDetails) {
			userName = ((UserDetails) principal).getUsername();
		}else {
			userName = principal.toString();
		}
		return userName;
	}

	


	



}
