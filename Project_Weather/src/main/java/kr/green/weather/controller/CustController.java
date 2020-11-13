package kr.green.weather.controller;


import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessResourceFailureException;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import kr.green.weather.dao.QDAO;
import kr.green.weather.getJson.GetApi;
import kr.green.weather.service.CustService;
import kr.green.weather.service.EmailService;
import kr.green.weather.service.MapService;
import kr.green.weather.service.QService;
import kr.green.weather.service.RoleService;
import kr.green.weather.vo.CustVO;
import kr.green.weather.vo.MapVO;
import kr.green.weather.vo.QVO;
import kr.green.weather.vo.RoleVO;
import lombok.extern.slf4j.Slf4j;
import oracle.jdbc.dcn.QueryChangeDescription.QueryChangeEventType;

@CrossOrigin
@Controller
@Slf4j
public class CustController {
	
	@Autowired
	QDAO qDAO;
	@Autowired
	CustService custService;
	@Autowired
	RoleService roleService;
	@Autowired
	MapService mapService;
	@Autowired
	QService qService;
	@Autowired
	private EmailService emailService;
	
	 @RequestMapping(value = "/{name}") 
	 public String path(@PathVariable("name") String name, Model model,@ModelAttribute CustVO custVO) { 
		 log.debug("CustController."+ name +" 호출");
		 //List<CustVO> list = null;
		 String principal = getPrincipal();
		 //if(principal != null) list = custService.selectByEmail(principal);
		 //model.addAttribute("custVO", list);
		 if (custVO!=null) {
			custVO = custService.selectById(principal);
			model.addAttribute("custVO", custVO);
		 }
	 return name; 
	 }
// ============================================= 페이지 오픈 ==================================================================
	 @RequestMapping(value = {"/","/home"})
	 public String home(@ModelAttribute CustVO custVO, ModelMap model) {
		 log.debug("==============================================================================================");
		 log.debug("CustController.home 호출 : " + getPrincipal());
		 log.debug("==============================================================================================");
//		 custVO = null; 
//		 List<CustVO> list = null;
//		 String principal = getPrincipal();
//		 if(principal != null) list = custService.selectByEmail(principal);
//		 model.addAttribute("custVO", list);
		 String principal = getPrincipal();
		 if (custVO!=null) {
				custVO = custService.selectById(principal);
				model.addAttribute("custVO", custVO);
		 }
		 
		 return "home";
	 }
	 @RequestMapping(value = "/about", method = RequestMethod.POST)
	 public String about(@ModelAttribute CustVO custVO,Model model) {
		 log.debug("==============================================================================================");
		 log.debug("CustController.about 호출" );
		 log.debug("==============================================================================================");
		 int custno = custService.maxCustno();
		 model.addAttribute("custno",custno);
		 return "about";
	 }
	 
// ============================================= 페이지 오픈 끝 ==================================================================
	// ajax 로 이걸 불러온다.
		@RequestMapping(value = "/xxx")
		@ResponseBody
		public String callAjax() {
			log.debug("==============================================================================================");
			log.debug("CustController.callAjax 호출" );
			log.debug("==============================================================================================");
			String principal = getPrincipal();
			CustVO custVO = custService.selectById(principal);
			String addr = custVO.getCaddress();
			log.debug("CustController.showWeather.addr 호출 : " +  addr);
			String[] list = addr.split(" ");
			log.debug("CustController.showWeather.list 호출 : " +  list[0]);
			log.debug("CustController.showWeather.list 호출 : " +  list[1]);
			log.debug("CustController.showWeather.list 호출 : " +  list[2]);
			log.debug("CustController.showWeather.list 호출 : " +  list[3]);
			//cemail = custVO.getCemail();
//					String dong = list[3];
			String si = list[0]+"%";
			String gu = list[1];
			String dong = list[2];
			MapVO x = mapService.selectBySiGuLikeX(si, gu);
			MapVO y = mapService.selectBySiGuLikeY(si, gu);
			if(x == null || y == null) {
				gu = list[1]+list[2];
				x = mapService.selectBySiGuLikeX(si, gu);
				y = mapService.selectBySiGuLikeY(si, gu);
				if(x == null || y == null) {
					gu = list[1];
					dong = list[2];
					x = mapService.selectByGuDongX(gu, dong);
					y = mapService.selectByGuDongY(gu, dong);
					if(x == null || y == null) {
						gu = list[1]+list[2];
						dong = list[3];
						x = mapService.selectByGuDongX(gu, dong);
						y = mapService.selectByGuDongY(gu, dong);
					}
				}
			}
			log.debug("==============================================================================================");
			log.debug("CustController.callAjax 호출 x  :" + x + " y : " + y );
			log.debug("==============================================================================================");
			String result = GetApi.getGjson(x.getX(), y.getY());
//			GsonPar gp = new GsonPar();
//			result = gp.gsonParse(result);
			log.debug("==============================================================================================");
			log.debug("CustController.callAjax 호출 result  :" + result );
			log.debug("==============================================================================================");
			
			
			return result;
		}
// ============================================= 아이디 중복 체크 ==================================================================
		@RequestMapping(value = "/idCheck")
		@ResponseBody
		public Boolean idCheck(String cemail) {
			log.debug("==============================================================================================");
			log.debug("CustController.idCheck 호출"  + cemail);
			log.debug("==============================================================================================");
			boolean result = false;
			String idCk = custService.idCheck(cemail);
			if(idCk != null) {
				result = true;
			}
			return result;
		}
	 
// ============================================= 아이디 중복 체크 ==================================================================
// ============================================= 비밀번호 찾기 ==================================================================
	 @RequestMapping(value = "/findpass")
	 public String findpass() {
		 log.debug("==============================================================================================");
		 log.debug("CustController.findpass 호출" );
		 log.debug("==============================================================================================");
		 return "findpass";
	 }
	 
// ============================================= 비밀번호 찾기 끝 ==================================================================
	 
	 
	 
// =============================================!!!!!! 날씨 보기!!!!!  ==================================================================
	 @RequestMapping(value = "/showWeather", method = RequestMethod.GET)
	 @CrossOrigin
	 public String showWeather(@ModelAttribute CustVO custVO, Model model,@Param("si") String si,@Param("gu") String gu,@Param("dong") String dong) {
		 log.debug("==============================================================================================");
		 log.debug("CustController.showWeather 호출 : " +  getPrincipal());
		 log.debug("==============================================================================================");
		 SimpleDateFormat sdf1 = new SimpleDateFormat("MM/dd");
		 Date date = new Date();
		 String time = sdf1.format(date);
		 String principal = getPrincipal();
		 if (custVO!=null) {
				custVO = custService.selectById(principal);
				String addr = custVO.getCaddress();
				log.debug("CustController.showWeather.addr 호출 : " +  addr);
				String[] list = addr.split(" ");
				log.debug("CustController.showWeather.list 호출 : " +  list[0]);
				log.debug("CustController.showWeather.list 호출 : " +  list[1]);
				log.debug("CustController.showWeather.list 호출 : " +  list[2]);
				log.debug("CustController.showWeather.list 호출 : " +  list[3]);
				//cemail = custVO.getCemail();
//				String dong = list[3];
				si = list[0]+"%";
				gu = list[1]+"%";
				dong = list[2]+"%";
				MapVO x = mapService.selectBySiGuLikeX(si, gu);
				MapVO y = mapService.selectBySiGuLikeY(si, gu);
				if(x == null || y == null) {
					gu = list[1]+list[2];
					x = mapService.selectBySiGuLikeX(si, gu);
					y = mapService.selectBySiGuLikeY(si, gu);
					if(x == null || y == null) {
						gu = list[1];
						dong = list[2];
						x = mapService.selectByGuDongX(gu, dong);
						y = mapService.selectByGuDongY(gu, dong);
						if(x == null || y == null) {
							gu = list[1]+list[2];
							dong = list[3];
							x = mapService.selectByGuDongX(gu, dong);
							y = mapService.selectByGuDongY(gu, dong);
						}
					}
				}
				log.debug("=====================================================================================");
				log.debug("CustController.showWeather 호출,  불러온 x =" + x);
				log.debug("=====================================================================================");
				log.debug("=====================================================================================");
				log.debug("CustController.showWeather 호출,  불러온 y =" + y);
				log.debug("=====================================================================================");
				
				model.addAttribute("times", time);
				model.addAttribute("si", list[0]);
				model.addAttribute("gu", list[1]);
				model.addAttribute("dong", list[2]);
				model.addAttribute("custVO", custVO);
				model.addAttribute("x", x.getX());
				model.addAttribute("y", y.getY());
				
		 }
		 return "showWeather";
	 }
// =============================================!!!!!! 날씨 보기 끝!!!!!  ==================================================================
// =============================================!!!!!! 알람 보기 시작!!!!!  ==================================================================
	
	 @RequestMapping(value = "/showAlarm", method = RequestMethod.GET)
	 @CrossOrigin
	 public String showAlarm(@ModelAttribute CustVO custVO, Model model,@Param("si") String si,@Param("gu") String gu,@Param("dong") String dong) {
		 log.debug("==============================================================================================");
		 log.debug("CustController.showAlram 호출 : " +  getPrincipal());
		 log.debug("==============================================================================================");
		 SimpleDateFormat sdf1 = new SimpleDateFormat("MM/dd");
		 Date date = new Date();
		 String time = sdf1.format(date);
		 String principal = getPrincipal();
		 if (custVO!=null) {
			 custVO = custService.selectById(principal);
			 String addr = custVO.getCaddress();
			 log.debug("CustController.showWeather.addr 호출 : " +  addr);
			 String[] list = addr.split(" ");
			 log.debug("CustController.showAlram.list 호출 : " +  list[0]);
			 log.debug("CustController.showAlram.list 호출 : " +  list[1]);
			 log.debug("CustController.showAlram.list 호출 : " +  list[2]);
			 log.debug("CustController.showAlram.list 호출 : " +  list[3]);
			 //cemail = custVO.getCemail();
//				String dong = list[3];
			 si = list[0]+"%";
			 gu = list[1]+"%";
			 dong = list[2]+"%";
			 MapVO x = mapService.selectBySiGuLikeX(si, gu);
			 MapVO y = mapService.selectBySiGuLikeY(si, gu);
			 if(x == null || y == null) {
				 gu = list[1]+list[2];
				 x = mapService.selectBySiGuLikeX(si, gu);
				 y = mapService.selectBySiGuLikeY(si, gu);
				 if(x == null || y == null) {
					 gu = list[1];
					 dong = list[2];
					 x = mapService.selectByGuDongX(gu, dong);
					 y = mapService.selectByGuDongY(gu, dong);
					 if(x == null || y == null) {
						 gu = list[1]+list[2];
						 dong = list[3];
						 x = mapService.selectByGuDongX(gu, dong);
						 y = mapService.selectByGuDongY(gu, dong);
					 }
				 }
			 }
			 log.debug("=====================================================================================");
			 log.debug("CustController.showAlram 호출,  불러온 x =" + x);
			 log.debug("=====================================================================================");
			 log.debug("=====================================================================================");
			 log.debug("CustController.showAlram 호출,  불러온 y =" + y);
			 log.debug("=====================================================================================");
			 
			 model.addAttribute("times", time);
			 model.addAttribute("si", list[0]);
			 model.addAttribute("gu", list[1]);
			 model.addAttribute("dong", list[2]);
			 model.addAttribute("custVO", custVO);
			 model.addAttribute("x", x.getX());
			 model.addAttribute("y", y.getY());
			 
		 }
		 return "showAlarm";
	 }
	 
	 
	 
	 
	 
	 
	 
	 
// =============================================!!!!!! 알람 보기 끝!!!!!  ==================================================================

// ============================================= 회원 관리 ==================================================================
	 @RequestMapping(value = "/custLists")
	 public String custLists(@ModelAttribute CustVO custVO, Model model, @ModelAttribute String cemail) {
		 log.debug("==============================================================================================");
		 log.debug("CustController.custLists 호출 : " +  custVO);
		 log.debug("==============================================================================================");
		 List<CustVO> list = custService.selectCustList();
		 List<CustVO> solo = custService.selectByEmail(cemail);
		 model.addAttribute("custVO", list);
		 model.addAttribute("solo", solo);
		 return "custLists";
	 }
	 @RequestMapping(value = "/custLists2")
	 public String custLists2(@ModelAttribute CustVO custVO, Model model, @ModelAttribute String cemail) {
		 log.debug("==============================================================================================");
		 log.debug("CustController.custLists 호출 : " +  custVO);
		 log.debug("==============================================================================================");
		 List<CustVO> list = custService.selectCustList();
		 List<CustVO> solo = custService.selectByEmail(cemail);
		 model.addAttribute("custVO", list);
		 model.addAttribute("solo", solo);
		 return "custLists2";
	 }
// ============================================= 회원 관리 끝  ==================================================================
// ============================================= 문의 사항  ==================================================================
	 @RequestMapping(value = "/question" )
	 public String questionPost(@ModelAttribute QVO qVO, Model model) {
		 log.debug("==============================================================================================");
		 log.debug("CustController.question 호출 : " +  qVO);
		 log.debug("==============================================================================================");
		 List<QVO> list = qService.selectByQList();
		 model.addAttribute("qVO", list);
		 return "question";
	 }
	 @RequestMapping(value = "/question2" )
	 public String question2(@ModelAttribute QVO qVO, Model model) {
		 log.debug("==============================================================================================");
		 log.debug("CustController.question 호출 : " +  qVO);
		 log.debug("==============================================================================================");
		 List<QVO> list = qService.selectByQList();
		 model.addAttribute("qVO", list);
		 return "question2";
	 }
	 @RequestMapping(value = "/json", produces = "text/json;charset=UTF-8" )
	 @ResponseBody
	 public String memolist(@ModelAttribute QVO qVO, Model model) {
		 log.debug("==============================================================================================");
		 log.debug("CustController.question 호출 : " +  qVO);
		 log.debug("==============================================================================================");
		 List<QVO> list = qService.selectByQList();
		 Gson gson = new Gson();
		 String test = gson.toJson(list);
		 return test;
	 }
	 @RequestMapping(value = "/quest")
	 public String questGet(@ModelAttribute QVO qVO,String name,String password,String content, Model model, HttpServletRequest req) {
		 log.debug("==============================================================================================");
		 log.debug("CustController.questGet 호출 : " +  qVO);
		 log.debug("==============================================================================================");
		 SimpleDateFormat sdf = new SimpleDateFormat("YY/MM/dd hh:mm");
		 Date date = new Date();
		 String now = sdf.format(date);
		 qVO.setName(name);
		 qVO.setPassword(password);
		 qVO.setContent(content);
		 qVO.setNow(now);
		 log.debug("==============================================================================================");
		 log.debug("CustController.questGet 넣은 값 : " +  qVO);
		 log.debug("==============================================================================================");
		 qService.insertQ(qVO);
		 return "question";
	 }
	 @RequestMapping(value = "/change")
	 public String change(@ModelAttribute QVO qVO, int num,String name,String password,String content, Model model, HttpServletRequest req) {
		 log.debug("==============================================================================================");
		 log.debug("CustController.change 호출 : " +  qVO);
		 log.debug("==============================================================================================");
		 SimpleDateFormat sdf = new SimpleDateFormat("YY/MM/dd hh:mm");
		 Date date = new Date();
		 String now = sdf.format(date);
		 qVO.setNum(num);
		 qVO.setName(name);
		 qVO.setPassword(password);
		 qVO.setContent(content);
		 qVO.setNow(now);
		 log.debug("==============================================================================================");
		 log.debug("CustController.change 넣은 값 : " +  qVO);
		 log.debug("==============================================================================================");
		 qService.updateQ(qVO);
		 return "question";
	 }
	 @RequestMapping(value = "/delQ")
	 public String delQ(@ModelAttribute QVO qVO,String name, Model model, HttpServletRequest req) {
		 log.debug("==============================================================================================");
		 log.debug("CustController.delQ 호출 : " +  name);
		 log.debug("==============================================================================================");
		 name = qVO.getName();
		 qService.delQ(name);
		 log.debug("==============================================================================================");
		 log.debug("CustController.delQ 호출 후 name , qVO: " +  name + " :  :" + qVO);
		 log.debug("==============================================================================================");
		 return "redirect:/";
	 }
// ============================================= 문의 사항 끝  ==================================================================
	 
	 

	 
	 
// ============================================= 회원 관리 ==================================================================
	 @RequestMapping(value = "/roleLists")
	 public String roleLists(@ModelAttribute RoleVO roleVO, Model model, @ModelAttribute String cemail) {
		 log.debug("==============================================================================================");
		 log.debug("CustController.custLists 호출 : " +  roleVO);
		 log.debug("==============================================================================================");
		 List<RoleVO> list = roleService.selectByRoleList();
		 model.addAttribute("roleVO", list);
		 return "roleLists";
	 }
// ============================================= 회원 관리 끝  ==================================================================
// ============================================= 회원 삭제 ==================================================================
	 @RequestMapping(value = "/delCustLists")
	 public String delCustLists(@ModelAttribute CustVO custVO, Model model, @ModelAttribute String cemail, HttpServletRequest request) {
		 log.debug("==============================================================================================");
		 log.debug("CustController.delCustLists 호출 : " +  custVO);// @Param("cemail")
		 log.debug("==============================================================================================");
		 String principal = getPrincipal();
		 custVO = custService.selectById(principal);
		 List<CustVO> list = custService.selectCustList();
		 //List<CustVO> solo = custService.selectByEmail(cemail);
		 cemail = (String) request.getAttribute(cemail);
		 log.debug("CustController.delCustLists 호출 list[0]: " +  list);
		 //custService.delete(cemail);
		 //model.addAttribute("solo", solo);
		 model.addAttribute("user", custVO);
		 model.addAttribute("custVO", list);
		 return "delCustLists";
	 }
	 @RequestMapping(value = "/delList", produces = "text/json;charset=UTF-8" )
	 @ResponseBody
	 public String delList(@ModelAttribute CustVO custVO, Model model, @ModelAttribute String cemail, HttpServletRequest request) {
		 log.debug("==============================================================================================");
		 log.debug("CustController.delList 호출 : " +  custVO);// @Param("cemail")
		 log.debug("==============================================================================================");
		 List<CustVO> list = custService.selectCustList();
		 Gson gson = new Gson();
		 String test = gson.toJson(list);
		 return test;
	 }
	 @RequestMapping(value = "/delListsOk", method = RequestMethod.GET)
	 public String delListsOkGet(@ModelAttribute CustVO custVO, Model model, @ModelAttribute String cemail) {
		 log.debug("==============================================================================================");
		 log.debug("CustController.delListsOkGet 호출 : " +  custVO);
		 log.debug("==============================================================================================");
		 cemail = custVO.getCemail();
		 log.debug("==============================================================================================");
		 log.debug("CustController.delListsOkGet 호출 cemail : " +  cemail);
		 log.debug("==============================================================================================");
		 custService.delete(cemail);
		 return "redirect:/";
	 }
		/*
		 * @RequestMapping(value = "/delListsOk", method = RequestMethod.POST) public
		 * String delListsOkPost(Model model,HttpServletRequest request,
		 * HttpServletResponse response) { log.debug(
		 * "=============================================================================================="
		 * ); log.debug("CustController.delListsOkPost 호출 : "); log.debug(
		 * "=============================================================================================="
		 * ); String principal = getPrincipal(); CustVO custVO =
		 * custService.selectById(principal);
		 * 
		 * return "redirect:/"; }
		 */
// ============================================= 회원 삭제 끝  ==================================================================
	 
	 
	 
// ============================================= 정보 수정  ==================================================================
	 @RequestMapping(value = "/updateOk", method = RequestMethod.GET)
	 public String updateOkGet() {
		 return "redirect:/";
	 }
	 @RequestMapping(value = "/updateOk", method = RequestMethod.POST)
	 public String updateOkPost(HttpServletRequest request,@ModelAttribute CustVO custVO, Model model) {
		 if (custVO!=null) {
			 custVO = custService.update(custVO);
			 request.getSession().setAttribute("custVO", custVO);
			 model.addAttribute("custVO",custVO);
		}
		 return "updateOk";
	 }
// ============================================= 정보 수정 끝  ==================================================================
// ============================================= 정보 수정  ==================================================================
	 @RequestMapping(value = "/deleteOk", method = RequestMethod.GET)
	 public String deleteOkGet() {
		 return "redirect:/";
	 }
	 @RequestMapping(value = "/deleteOk", method = RequestMethod.POST)
	 public String deleteOkPost(HttpServletRequest request,@ModelAttribute CustVO custVO, Model model) {
		 if (custVO!=null) {
		 }
		 return "deleteOk";
	 }
// ============================================= 정보 수정 끝  ==================================================================
// ============================================= 비밀번호 찾기   ==================================================================
	 @RequestMapping(value = "/findPassOk", method = RequestMethod.GET)
		public String findPassOkGet() {
			log.debug("CustController.findPassOk 호출 : " );
			return "redirect:/";
		}
		
		@RequestMapping(value = "/findPassOk", method = RequestMethod.POST)
		public String findPassOkPost(HttpServletRequest request,  Model model) {
			// 데이터 받기
			String cname = request.getParameter("cname");
			String cemail = request.getParameter("cemail");
			String cphone = request.getParameter("cphone");
			log.debug("==============================================================================================");
			log.debug("CustController.findPassOkPost 호출 : "+ cname + ", " + cemail + ", " + cphone);
			log.debug("==============================================================================================");
			
			// 서비스 클래스를 호출하여 비밀번호를 만들어 업데이트하고
			String newPassword = custService.findPass(cname, cemail, cphone); 

			if(newPassword!=null && newPassword.trim().length()>0 ) {
				// 사용자에게 이메일을 보내준다.
				StringBuffer sb = new StringBuffer();
				sb.append(cname + "님 새로운 비번이 만들러 졌습니다.<br>");
				sb.append("만들어진 임시 비밀번호는 \"" + newPassword + "\"입니다.");
				sb.append("<br>");
				sb.append("로그인하셔서 반드시 비밀번호를 변경하여 사용해 주세요!!!");
				emailService.sendMail(cemail, "새로운 비번이 만들어 졌습니다.", sb.toString());
				model.addAttribute("cemail", cemail);
			}
			return "findPassOk";
		}
	 
	 
// ============================================= 비밀번호 찾기 끝  ==================================================================
// ============================================= 로그인  ==================================================================
	 @RequestMapping(value = "/login") 
	 public String login(Model model, @ModelAttribute CustVO custVO) { 
		 log.debug("==============================================================================================");
		 log.debug("CustController.login 호출 : " + getPrincipal());
		 log.debug("==============================================================================================");
		 //model.addAttribute("custVO", getPrincipal());
		 String principal = getPrincipal();
//		 List<CustVO> list = null;
//		 if(principal != null) list = custService.selectByEmail(principal);
//		 model.addAttribute("custVO", list);
		 if (custVO!=null) {
				custVO = custService.selectById(principal);
				model.addAttribute("custVO", custVO);
		 }
		 return "login";
	 }
	 @RequestMapping(value = "/logout")
	 public String logout(HttpServletRequest request, HttpServletResponse response) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (auth != null) {
			new SecurityContextLogoutHandler().logout(request, response, auth);
		}
		return "redirect:/";
	}
	 
// ============================================ 로그인 끝  ==================================================================
	 
	 
	 
// ========================================= 회원 등록 ============================================================
	@RequestMapping(value = {"/insert"})
	public String insert(@ModelAttribute CustVO custVO,@ModelAttribute RoleVO roleVO, Model model, String cemail) {
		log.debug("==============================================================================================");
		log.debug("CustController.insert 호출" + custVO);
		log.debug("==============================================================================================");
		int custno = custService.maxCustno();
		model.addAttribute("custno",custno);
		
		
		
		return "insert";
	}
	@RequestMapping(value = {"/insertOk"}, method = RequestMethod.GET)
	public String insertOkGet() {
		log.debug("CustController.insertOkGet 호출");
		return "redirect:/";
	}
	@RequestMapping(value = "/insertOk" , method = RequestMethod.POST)
	public String insertOkPost(@ModelAttribute CustVO custVO,@ModelAttribute RoleVO roleVO, Model model, String cemail) {
		log.debug("==============================================================================================");
		log.debug("CustController.insertOkPost 호출" + custVO  + " 이 가져갈 내용");
		log.debug("==============================================================================================");
		log.debug("cemail  === 값 가져오니? " + cemail);
		List<CustVO> dbVO = custService.selectByEmail(custVO.getCemail());
		if (custVO != null) {
			custVO.setRol(roleVO);
			custService.insert(custVO);
		}
		return "insertOk";
	}
//=========================================== 회원 등록 끝 =================================================================

	
//=========================================== 비밀번호 변경 =================================================================

	@RequestMapping(value = "/changePassOk", method = RequestMethod.GET)
	public String changePasswordGet() {
		log.debug("CustController.changePasswordOk 호출 : " );
		return "redirect:/";
	}
	
	
	@RequestMapping(value = "/changePassOk", method = RequestMethod.POST)
	public String changePasswordPost(HttpServletRequest request, HttpSession session, Model model) {
		log.debug("======================================================================");
		log.debug("CustController.changePasswordOk session호출 : " + session );
		log.debug("======================================================================");
		// 데이터 받기
		String cpassword = request.getParameter("cpassword");
		String npassword = request.getParameter("npassword");
		// 서비스를 호출하여 현재 비번이 같으면 새로운 비번으로 업데이트 한다.
		//int idx = ((MemberVO)session.getAttribute("memberVO")).getIdx();
		String cemail = request.getParameter("cemail");;
		log.debug("CustController.changePasswordOk 호출 : " + cemail);
		boolean isChange = custService.changePass(cemail, cpassword, npassword);
		if(isChange){
			// 강제 로그아웃을 시키고
			session.removeAttribute("custVO");
			return "redirect:/login";
		}
		return "changePassOk";
	}
	
	
	
//=========================================== 비밀번호 변경 끝 =================================================================
	
	
	
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
