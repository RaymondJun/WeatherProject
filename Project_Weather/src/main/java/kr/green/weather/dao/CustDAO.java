package kr.green.weather.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.green.weather.vo.CustVO;

public interface CustDAO {
	// 고객 리스트 가져오기
	List<CustVO> selectCustList();
	// 아이디 중복 체크
	String idCheck(String cemail);
	// 고객번호로 찾기
	CustVO selectByNo(int custno);
	// 이메일로 찾기
	List<CustVO> selectByEmail(String cemail);
	// 이메일 아이디로 찾기
	CustVO selectById(String cemail);
	// 저장
	void insert(CustVO custVO);
	// 수정
	void update(CustVO custVO);
	// 삭제
	void delete(@Param("cemail") String cemail);
	// 회원번호 증가를 위한 마지막 번호 찾기
	int	 maxCustno();
	// 비밀번호 변경
	void changePass(HashMap<String, String> map);
//	// 로그인을 위한 아이디와 비번
//	CustVO selectLogin(String cemail);
//	// 권한 확인
//	List<RoleVO> selectRole(String cemail);
//	// 회원 등록시 권한 부여
//	//void insertAuth(RoleVO roleVO);
//	// 회원 등록 동시 권한 부여 테이블 insert
//	void insertAll(ManageVO manageVO);
}
