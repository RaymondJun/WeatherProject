package kr.green.weather.service;

import java.util.List;

import kr.green.weather.vo.CustVO;

public interface CustService {
	// 고객 리스트 가져오기
	List<CustVO> selectCustList();
	// 아이디 중복 체크
	String idCheck(String cemail);
	// 이메일 아이디로 찾기
	CustVO selectById(String cemail);
	// 이메일로 찾기
	List<CustVO> selectByEmail(String cemail);
	// 저장
	void insert(CustVO custVO);
	// 수정
	CustVO update(CustVO custVO);
	// 삭제 
	void delete(String cemail);
	// 회원번호 증가를 위한 마지막 번호 찾기
	int	 maxCustno();
	// 비밀번호 보안을 위한 무작위 문자 생성
	String makePass(int length);
	// 비밀번호 찾기
	String findPass(String cname,String cemail, String cphone);
	// 비밀번호 변경하기
	boolean changePass(String cemail,String cpassword, String npassword);
//	// 로그인을 위한 아이디와 비번
//	CustVO selectLogin(String cemail,String cpassword);
//	// 권한 확인
//	List<RoleVO> selectRole(String cemail);
//	// 회원 등록 동시 권한 부여 테이블 insert
//	void insertAll(ManageVO manageVO,CustVO custVO);
	
}
