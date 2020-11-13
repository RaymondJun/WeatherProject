package kr.green.weather.service;

import java.util.List;

import javax.xml.bind.annotation.XmlRootElement;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Service;

import kr.green.weather.dao.QDAO;
import kr.green.weather.dao.RoleDAO;
import kr.green.weather.vo.QVO;
import kr.green.weather.vo.RoleVO;
import lombok.extern.slf4j.Slf4j;

@Service("qService")
@XmlRootElement
@Slf4j
public class QServiceImpl implements QService{
	
		
	@Autowired
	QDAO qDAO;
	
	@Override
	public int maxNum() {
		log.debug("+=========================================================================");
		log.debug("QServiceImpl.maxNum 호출");
		log.debug("+=========================================================================");
		int num = qDAO.maxNum();
		return num;
	}
	@Override
	public int countQ() {
		log.debug("+=========================================================================");
		log.debug("QServiceImpl.countQ 호출");
		log.debug("+=========================================================================");
		int total = qDAO.countQ();
		return total;
	}
	@Override
	public QVO selectByname(String name) {
		log.debug("+=========================================================================");
		log.debug("QServiceImpl.selectByname 호출 name 은 : "+ name);
		log.debug("+=========================================================================");
		return qDAO.selectByname(name);
	}

	@Override
	public List<QVO> selectByQList() {
		log.debug("+=========================================================================");
		log.debug("QServiceImpl.selectByQList 호출");
		log.debug("+=========================================================================");
		return qDAO.selectByQList();
	}

	@Override
	public void insertQ(@Param("qVO") QVO qVO) {
		log.debug("+=========================================================================");
		log.debug("QServiceImpl.insertQ 호출");
		log.debug("+=========================================================================");
		qDAO.insertQ(qVO);
	}

	@Override
	public void updateQ(QVO qVO) {
		log.debug("+=========================================================================");
		log.debug("QServiceImpl.updateQ 호출");
		log.debug("+=========================================================================");
		if(qVO != null) {
			QVO dbVO = qDAO.selectByname(qVO.getName());
			log.debug("+=========================================================================");
			log.debug("QServiceImpl.updateQ 호출 dbVO.name : " + dbVO.getName());
			log.debug("+=========================================================================");
			log.debug("+=========================================================================");
			log.debug("QServiceImpl.updateQ 호출 qVO.name : " + qVO.getName());
			log.debug("+=========================================================================");
			if(qVO.getName().equals(dbVO.getName())) {
				qDAO.updateQ(qVO);
				log.debug("+=========================================================================");
				log.debug("QServiceImpl.updateQ 호출 업데이트 결과 : " + qVO);
				log.debug("+=========================================================================");
			}
		}
		
	}

	@Override
	public void delQ(String name) {
		log.debug("+=========================================================================");
		log.debug("QServiceImpl.delQ 호출");
		log.debug("+=========================================================================");
		QVO dbVO = qDAO.selectByname(name);
		if(name.equals(dbVO.getName()) ) {
			log.debug("+=========================================================================");
			log.debug("QServiceImpl.delQ 호출 name ,dbVO.getName()" + name + " : " + dbVO.getName());
			log.debug("+=========================================================================");
			qDAO.delQ(name);
		}
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
