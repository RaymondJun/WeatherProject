package kr.green.weather.service;

import java.util.HashMap;
import java.util.List;
import java.util.Random;

import javax.xml.bind.annotation.XmlRootElement;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.green.weather.dao.CustDAO;
import kr.green.weather.vo.CustVO;
import lombok.extern.slf4j.Slf4j;

@Service("custService")
@XmlRootElement
@Slf4j
@Transactional
public class CustServiceImpl implements CustService{

	@Autowired
	CustDAO custDAO;
	
	@Autowired
	RoleService RoleService;
	
	@Autowired
	BCryptPasswordEncoder bCryptPasswordEncoder;
	
	// 저장
	@Override
	public void insert(CustVO custVO) {
		log.debug("CustServiceImpl.insert 호출 : " + custVO);
		String cpassword = custVO.getCpassword();
		cpassword = bCryptPasswordEncoder.encode(cpassword);
		custVO.setCpassword(cpassword);
		custDAO.insert(custVO);
		RoleService.insertRole(custVO.getRol());
		// 회원 등록할 때 권한 부여
	}
	// 수정
	@Override
	public CustVO update(CustVO custVO) {
		log.debug("CustServiceImpl.update 호출 : " + custVO);
		CustVO vo = null;
		if(custVO != null) {
			CustVO dbVO = custDAO.selectById(custVO.getCemail());
			if (bCryptPasswordEncoder.matches(custVO.getCpassword(), dbVO.getCpassword())) {
				log.debug("CustServiceImpl.update 수정함 : " + custVO);
				custVO.setCpassword(bCryptPasswordEncoder.encode(custVO.getCpassword()));
				custDAO.update(custVO);
				vo = custDAO.selectById(custVO.getCemail());
			}
		}
		return vo;
	}
	// 삭제
	@Override
	public void delete(@Param("cemail") String cemail) {
		log.debug("CustServiceImpl.delete 호출  : " + cemail);
		RoleService.delRole(cemail);
		custDAO.delete(cemail);
	}
	// 이메일로 찾기
	@Override
	public List<CustVO> selectByEmail(String cemail) {
		log.debug("CustServiceImpl.selectByEmail 호출" + cemail);
		List<CustVO> list = custDAO.selectByEmail(cemail);
		return list;
	}
	// 고객번호로 찾기
//	@Override
//	public List<CustVO> selectByNo(int custno) {
//		log.debug("CustServiceImpl.selectByNo 호출" + custno);
//		List<CustVO> list = custDAO.selectByNo(custno);
//		return list;
//	}
	// 회원 번호를 위한 메서드
	@Override
	public int maxCustno() {
		int custno = custDAO.maxCustno();
		log.debug("CustServiceImpl.maxCustno 호출");
		return custno;
	}
	
	
	// 고객 리스트 가져오기
	@Override
	public List<CustVO> selectCustList() {
		List<CustVO> list = custDAO.selectCustList();
		log.debug("CustServiceImpl.selectCustList 호출");
		return list;
	}
	// 이메일 아이디로 찾기
	@Override
	public CustVO selectById(String cemail) {
		return custDAO.selectById(cemail);
	}
	@Override
	public String findPass(String cname,String cemail, String cphone) {
		log.debug("================================================================================");
		log.debug("CustServiceImpl.findPass 호출"+ cname + ", " + cemail + ", " + cphone);
		log.debug("================================================================================");
		String newPass = "";
		String cpassword = "";
		CustVO custVO = custDAO.selectById(cemail);
		if(custVO != null) {
			if (custVO.getCphone().equals(cphone)) {
				if(custVO.getCname().equals(cname)) {
					newPass = makePass(10);
					cpassword = bCryptPasswordEncoder.encode(newPass);
					HashMap<String, String> map = new HashMap<String, String>();
					map.put("cpassword", cpassword);
					custDAO.changePass(map);
				}
			}
		}
		return null;
	}
	@Override
	public boolean changePass(String cemail, String cpassword,String npassword) {
		log.debug("========================================================================");
		log.debug("CustServiceImpl.changePass 호출" +cemail  + "," + cpassword + ","+ npassword);
		log.debug("========================================================================");
		boolean isChange = false;
		CustVO dbVO = custDAO.selectById(cemail);
		log.debug("========================================================================");
		log.debug("CustServiceImpl.dbVO 호출" + dbVO);
		log.debug("========================================================================");
		if(dbVO != null) {
			if (bCryptPasswordEncoder.matches(cpassword, dbVO.getCpassword())) {
				log.debug("CustServiceImpl.changePass 호출 : 암호 변경!!!");
				String newPassword = bCryptPasswordEncoder.encode(npassword);
				HashMap<String, String> map = new HashMap<String, String>();
				map.put("cpassword", newPassword);
				map.put("cemail", cemail);
				custDAO.changePass(map);
				isChange = true;
			}
		}
		return isChange;
	}
	
	// 비밀번호 보안을 위한 무작위 문자 생성(길이만큼 무작위로 비번을 생성한다.)
		@Override
		public String makePass(int length) {
			log.debug("CustServiceImpl.makePass 호출");
			StringBuffer sb = new StringBuffer();
			Random rnd = new Random();
			for(int i=0;i<length;i++) {
				if((i+1)%3==0) {
					sb.append((char)('A' + rnd.nextInt(26)));
				}else if((i+1)%3==1) {
					sb.append((char)('a' + rnd.nextInt(26)));
				}else {
					sb.append((char)('0' + rnd.nextInt(26)));
				}
			}
			return sb.toString();
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
	
	
//	// 로그인을 위한 아이디와 비번
//	@Override
//	public CustVO selectLogin(String cemail, String cpassword) {
//		log.debug("CustServiceImpl.selectLogin 호출");
//		CustVO vo = custDAO.selectLogin(cemail);
//			if(bCryptPasswordEncoder.matches(cpassword, vo.getCpassword())) {
//				
//			}
//		return null;
//	}
//	// 권한 확인 하기
//	@Override
//	public List<RoleVO> selectRole(String cemail) {
//		return custDAO.selectRole(cemail);
//	}
//	@Override
//	public void insertAll(ManageVO manageVO,CustVO custVO) {
//		String cpassword = custVO.getCpassword();
//		cpassword = bCryptPasswordEncoder.encode(cpassword);
//		custVO.setCpassword(cpassword);
//		custDAO.insertAll(manageVO);
//	}

}
