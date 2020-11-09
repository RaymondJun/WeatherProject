package kr.green.weather.service;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import kr.green.weather.dao.CustDAO;
import kr.green.weather.vo.CustVO;
import lombok.Data;
import lombok.extern.slf4j.Slf4j;

@Data
@Slf4j
public class LoginSuccessHandler implements AuthenticationSuccessHandler {
	@Autowired
	private CustDAO custDAO;
	private String successUrl;

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		log.debug("======================================================================================");
		log.debug("LoginSuccessHandler 실행됨");
		log.debug("======================================================================================");
		// 여기서는 회원 정보를 읽어서 세션에 저장하기
		// 아이디 받기
		String cemail = request.getParameter("cemail");
		// 아이디로 회원정보 얻기
		// CustVO custVO = custDAO.selectById(cemail);
		List<CustVO> list = custDAO.selectByEmail(cemail);
		if(list!=null && list.size()>0) {
		// if(custVO!=null) {
			CustVO vo = list.get(0);
			// 회원정보를 세션에 저장하기
			request.getSession().setAttribute("custVO", list);
		}
		log.debug("======================================================================================");
		log.debug("LoginSuccessHandler 실행마침");
		log.debug("======================================================================================");

		// 어딘가로 이동
		response.sendRedirect(successUrl);
	}

}
