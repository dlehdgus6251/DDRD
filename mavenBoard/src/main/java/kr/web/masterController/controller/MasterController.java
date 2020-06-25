package kr.web.masterController.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.web.masterController.service.MasterService;

@Controller
public class MasterController {
	@Autowired 
	private MasterService masterService;
	@RequestMapping("/masterControllerMain.do")
	public ModelAndView MasterControllerMain(HttpServletRequest req){
		ModelAndView mav = new ModelAndView();
		HashMap<String,Object> map = new HashMap<String,Object>();
		map.put("list", masterService.selectMasterControllerList(map));
		mav.addObject("map", map);
		mav.setViewName("masterControllerMain");
		return mav;
	}
	@ResponseBody
	@RequestMapping("/OBJList.do")
	public HashMap<String, Object> OBJList(HttpServletRequest request, @RequestParam(value="GROUPID", defaultValue="100")String GROUPID) {
		HashMap<String,Object> map = new HashMap<String,Object>();
		map.put("GROUPID", GROUPID);
		map.put("list", masterService.selectMasterOBJList(map));
		map.put("MList", masterService.selectMasterMappingList(map));
		return map;
	}
	@ResponseBody
	@RequestMapping("/Insert.do")
	public HashMap<String, Object> Insert(HttpServletRequest request, @RequestBody List<HashMap<String,Object>> list) {
		List<HashMap<String,Object>> IList = new ArrayList<HashMap<String,Object>>();
		List<HashMap<String,Object>> DList = new ArrayList<HashMap<String,Object>>();
		HashMap<String,Object> map = new HashMap<String,Object>();
		String GROUPID = (String) list.get(0).get("GROUPID");
		map.put("GROUPID", GROUPID);
		for(int i=0; i<list.size(); i++) {			
			if(list.get(i).get("FLAG").equals("등록")) {
				HashMap<String,Object> Imap = new HashMap<String,Object>();
				Imap.put("GROUPID", list.get(i).get("GROUPID"));
				Imap.put("OBJID", list.get(i).get("OBJID"));
				Imap.put("GROUPNAME", list.get(i).get("GROUPNAME"));
				Imap.put("OBJNAME", list.get(i).get("OBJNAME"));
				Imap.put("HIGH_OBJ", list.get(i).get("HIGH_OBJ"));
				Imap.put("DEPT", list.get(i).get("DEPT"));
				IList.add(Imap);
			}
			if(list.get(i).get("FLAG").equals("삭제")) {
				HashMap<String,Object> Dmap = new HashMap<String,Object>();
				Dmap.put("GROUPID", list.get(i).get("GROUPID"));
				Dmap.put("OBJID", list.get(i).get("OBJID"));
				DList.add(Dmap);
			}
		}
		System.out.println("GROUPID="+map.get("GROUPID"));
		if(IList.size() != 0) {
			masterService.insertMasterMapping(IList);			
			map.put("list", masterService.selectMasterOBJList(map));
			map.put("MList", masterService.selectMasterMappingList(map));
			
		}
		if(DList.size() != 0) {
			masterService.deleteMasterMapping(DList);
			map.put("list", masterService.selectMasterOBJList(map));
			map.put("MList", masterService.selectMasterMappingList(map));
		}
		return map;
		
	}
}