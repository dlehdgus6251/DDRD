package kr.web.ddrdMeeting.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.web.ddrdMeeting.service.DdrdMeetingService;
import kr.web.ddrdUser.service.UserService;

@Controller
public class DdrdMeetingController {
	@Autowired 
	private DdrdMeetingService DdrdMeetingService;
	
	@Autowired
	private UserService UserService;
	
	@RequestMapping("/ddrdMeeting.do")
	public ModelAndView DdrdMeetingMain(HttpServletRequest req){
		ModelAndView mav = new ModelAndView();
		HashMap<String,Object> map = new HashMap<String,Object>();
		map.put("list", DdrdMeetingService.selectDdrdMeeting(map));
		mav.addObject("map", map);
		mav.setViewName("ddrdMeetingMain");
		return mav;
	}
	
	@ResponseBody
	@RequestMapping("/ddrdMeetingInsert.do")
	public HashMap<String,Object> ddrdMeetingInsert(@RequestBody List<HashMap<String,Object>> list){
		HashMap<String,Object> map = new HashMap<String,Object>();
		System.out.println("모임등록="+list);
		DdrdMeetingService.insertDdrdMeeting(list);
		map.put("MeetingList", DdrdMeetingService.selectDdrdMeeting(map));
		return map;
		
	}
	@ResponseBody
	@RequestMapping("/deleteMeeting.do")
	public HashMap<String,Object> deleteMeeting(HttpServletRequest request){
		HashMap<String,Object> map = new HashMap<String,Object>();
		map.put("MEETING_NUMBER", request.getParameter("MEETING_NUMBER"));
		DdrdMeetingService.deleteAttendAll(map);
		DdrdMeetingService.deleteMeeting(map);
		map.put("MeetingList", DdrdMeetingService.selectDdrdMeeting(map));
		return map;
		
	}
	
	@RequestMapping("/ddrdMeetingDetail.do")
	public ModelAndView DdrdMeetingDetail(
			@RequestParam(value="searchWord", defaultValue="")String searchWord,
			HttpServletRequest request
			) throws UnsupportedEncodingException {
		ModelAndView mav = new ModelAndView();
		HashMap<String,Object> map = new HashMap<String,Object>();
		map.put("searchWord", searchWord);		
		map.put("UserList", UserService.UserList(map));		
		map.put("MEETING_NUMBER", URLDecoder.decode(request.getParameter("MEETING_NUMBER"),"UTF-8"));
		map.put("attendList", DdrdMeetingService.selectAttend(map));
		map.put("MEETING_NAME", URLDecoder.decode(request.getParameter("MEETING_NAME"),"UTF-8"));
		map.put("MEETING_DATE", URLDecoder.decode(request.getParameter("MEETING_DATE"),"UTF-8"));
		System.out.println("ZZZ="+map.get("attendList"));
		mav.addObject("map",map);
		mav.setViewName("ddrdMeetingDetail");
		return mav;
		
	}
	
	@ResponseBody
	@RequestMapping("/insertAttend.do")
	public HashMap<String,Object> InsertAttend(HttpServletRequest request){
		HashMap<String,Object> map = new HashMap<String,Object>();
		map.put("MEETING_NUMBER", request.getParameter("MEETING_NUMBER"));
		map.put("MEETING_NAME", request.getParameter("MEETING_NAME"));
		map.put("MEETING_DATE", request.getParameter("MEETING_DATE"));
		map.put("USER_NUMBER", request.getParameter("USER_NUMBER"));
		map.put("NAME", request.getParameter("NAME"));
		map.put("TOTAL_USER", request.getParameter("TOTAL_USER"));
		
		DdrdMeetingService.insertAttend(map);
		DdrdMeetingService.updateTotalUser(map);
		
		return map;
	}
	
	@ResponseBody
	@RequestMapping("/deleteAttend.do")
	public HashMap<String,Object> DeleteAttend(HttpServletRequest request){
		HashMap<String,Object> map = new HashMap<String,Object>();
		map.put("USER_NUMBER", request.getParameter("USER_NUMBER"));		
		map.put("MEETING_NUMBER", request.getParameter("MEETING_NUMBER"));		
		map.put("TOTAL_USER", request.getParameter("TOTAL_USER"));		
		DdrdMeetingService.deleteAttend(map);
		DdrdMeetingService.updateTotalUser(map);
		return map;
		
	}
	
	@ResponseBody
	@RequestMapping("/updateAttend.do")
	public HashMap<String,Object> UpdateAttend(HttpServletRequest request){
		HashMap<String,Object> map = new HashMap<String,Object>();
		map.put("USER_NUMBER", request.getParameter("USER_NUMBER"));		
		map.put("MEETING_NUMBER", request.getParameter("MEETING_NUMBER"));		
		map.put("DEPOSIT", request.getParameter("DEPOSIT"));		
		DdrdMeetingService.updateAttend(map);
		return map;
		
	}
	
	@RequestMapping("/load.do")
	@ResponseBody
	public Map<String,Object> selectAttend(HttpServletRequest request){
		
		
		HashMap<String,Object> map = new HashMap<String,Object>();	
		map.put("MEETING_NUMBER", request.getParameter("MEETING_NUMBER"));
		map.put("attendList", DdrdMeetingService.selectAttendUserNum(map));
		return map;
		
	}
}