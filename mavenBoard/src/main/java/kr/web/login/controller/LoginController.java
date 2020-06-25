package kr.web.login.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.web.login.service.LoginService;

@Controller
public class LoginController {
	@Autowired 
	private LoginService loginService;
	@RequestMapping("/login.do")
	public ModelAndView LoginMain(HttpSession session){
		ModelAndView mav = new ModelAndView();
		mav.setViewName("login");
		session.invalidate();
		return mav;
	}
	@RequestMapping("/join.do")
	public ModelAndView Join(HttpServletRequest req){
		String USER_ID = req.getParameter("USER_ID");
		System.out.println(USER_ID);
		String USER_PW = req.getParameter("USER_PW");
		HashMap<String,Object> map = new HashMap<String,Object>();		
		ModelAndView mav = new ModelAndView();
		HttpSession session = req.getSession();
		map.put("USER_ID", USER_ID);
		map.put("USER_PW", USER_PW);						
		int result = loginService.Login(map);
		System.out.println(result);
		System.out.println(map);
		List<HashMap<String,Object>> list = loginService.SelectOBJNAME(map);
		System.out.println(list);
		String message = null;
		if(result == 1) {
			session.setAttribute("USER_ID", USER_ID);
			session.setAttribute("list", list);
			message = "";
			mav.addObject("message", message);
			mav.setViewName("login");
			System.out.println(message);
		}else {
			message = "아이디 또는 비밀번호가 틀렸습니다";
			mav.addObject("message", message);
			mav.setViewName("login");		
			System.out.println(message);
		}		
		return mav;
	}
	@RequestMapping("/logout.do")
	public String logout(HttpSession session) {	   
	    session.invalidate();	   
	    return "redirect:/";
	}	
	@RequestMapping("/sell1.do")
	public ModelAndView sell1(HttpSession session){
		ModelAndView mav = new ModelAndView();
		mav.setViewName("sell1");
		
		return mav;
	}
	@RequestMapping("/sell2.do")
	public ModelAndView sell2(HttpSession session){
		ModelAndView mav = new ModelAndView();
		mav.setViewName("sell2");
		
		return mav;
	}
}