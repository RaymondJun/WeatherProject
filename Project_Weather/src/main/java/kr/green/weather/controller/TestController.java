package kr.green.weather.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.green.weather.getJson.GetApi;
import kr.green.weather.service.TestService;
import kr.green.weather.vo.TestVO;

@Controller
public class TestController {

	@Autowired
	private TestService testService;
	
	@RequestMapping(value = "/testDB")
	public String testDB(Model model) {
		TestVO vo = new TestVO(); 
		vo.setToday(testService.selectToday());
		vo.setSum(testService.selectSum(22, 33));
		vo.setMul(testService.selectMul(1, 2, 3));
		model.addAttribute("vo", vo);
		return "testDB";
	}
	@RequestMapping(value = "/testVO")
	@ResponseBody
	public TestVO testDB() {
		TestVO vo = new TestVO(); 
		vo.setToday(testService.selectToday());
		vo.setSum(testService.selectSum(22, 33));
		vo.setMul(testService.selectMul(1, 2, 3));
		return vo;
	}
	
}
