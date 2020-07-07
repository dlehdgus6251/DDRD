package kr.web.ddrdFinances.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.web.ddrdFinances.service.FinancesService;

@Controller
public class FinancesController {
	@Autowired 
	private FinancesService financesService;
	@RequestMapping("/financesMain.do")
	public ModelAndView commonCode(HttpServletRequest req){		
		ModelAndView mav = new ModelAndView();
		HashMap<String,Object> map = new HashMap<String,Object>();
		map.put("list", financesService.selectFinancesMain(map));
		mav.addObject("map", map);
		mav.setViewName("financesMain");		
		return mav;
	}
}