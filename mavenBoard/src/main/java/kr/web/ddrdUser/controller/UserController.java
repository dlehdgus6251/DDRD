package kr.web.ddrdUser.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.web.ddrdUser.service.UserService;

@Controller
public class UserController {
	
	@Autowired
	private UserService UserService;

	@RequestMapping("/usermain.do")
	public ModelAndView main(
			@RequestParam(value="searchWord", defaultValue="")String searchWord){
		
		ModelAndView mav = new ModelAndView();
		HashMap<String,Object> map = new HashMap<String,Object>();
		map.put("searchWord", searchWord);
		
		map.put("UserList", UserService.UserList(map));
		System.out.println("userList="+map.get("UserList"));
		
		
		mav.setViewName("userMain");
		mav.addObject("map",map);
	
		return mav;
	}
	@ResponseBody
	@RequestMapping("/search.do")
	public HashMap<String, Object> search(
			@RequestParam(value="searchWord", defaultValue="")String searchWord){
		System.out.println("searchWord="+searchWord);
		HashMap<String,Object> map = new HashMap<String,Object>();
		map.put("searchWord", searchWord);
		
		map.put("UserList", UserService.UserList(map));
		return map;
	}
	@ResponseBody
	@RequestMapping("/userInsert.do")
	public HashMap<String, Object> userInsert(@RequestParam(value="searchWord", defaultValue="")String searchWord, @RequestBody List<HashMap<String,Object>> list){
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("searchWord", searchWord);
		UserService.UserInsert(list);
		map.put("UserList", UserService.UserList(map));
		return map;		
	}
	@ResponseBody
	@RequestMapping("/userDelete.do")
	public HashMap<String, Object> userDelete(@RequestParam(value="searchWord", defaultValue="")String searchWord, @RequestBody List<HashMap<String,Object>> list){
		System.out.println("delete_list=" + list);
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("searchWord", searchWord);
		UserService.UserDelete(list);
		map.put("UserList", UserService.UserList(map));
		return map;		
	}
	@ResponseBody
	@RequestMapping("/userUpdate.do")
	public HashMap<String, Object> userUpdate(@RequestParam(value="searchWord", defaultValue="")String searchWord, @RequestBody List<HashMap<String,Object>> list){
		System.out.println("delete_list=" + list);
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("searchWord", searchWord);
		UserService.UserUpdate(list);
		map.put("UserList", UserService.UserList(map));
		return map;		
	}
}