package kr.web.commonCode.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.web.commonCode.service.CommCodeService;

@Controller
public class CommCodeController {
	@Autowired 
	private CommCodeService commCodeService;
	@Autowired
	private PlatformTransactionManager transactionManager;	
	@RequestMapping("/commonCode.do")
	public ModelAndView commonCode(HttpServletRequest req){		
		ModelAndView mav = new ModelAndView();
		HashMap<String,Object> map = new HashMap<String,Object>();
		map.put("list", commCodeService.selectCommonCode(map));
		mav.addObject("map", map);
		mav.setViewName("commonCodeMain");		
		return mav;
	}
	@RequestMapping("/commonCodeDetail.do")
	public ModelAndView commonCodeDetail(@RequestParam("CODE") String CODE) {		
		ModelAndView mav = new ModelAndView();
		HashMap<String,Object> map = new HashMap<String,Object>();
		map.put("CODE", CODE);
		map.put("list", commCodeService.selectCommonCodeDetail(map));
		mav.addObject("map", map);
		mav.setViewName("commonCodeDetail");		
		return mav;
	}
	@ResponseBody
	@RequestMapping("/commonCodeInsert.do")
	public int commonCodeInsert(HttpServletRequest request) {
		int DCODECheck =0;		
		String[] CODE = request.getParameterValues("CODE");
		String[] DCODE = request.getParameterValues("DCODE");
		String[] DCODE_NAME = request.getParameterValues("DCODE_NAME");
		String[] USE_YN = request.getParameterValues("USE_YN");
		String[] FLAG = request.getParameterValues("FLAG");		
		List<HashMap<String,Object>> Ulist = new ArrayList<HashMap<String,Object>>();
		List<HashMap<String,Object>> Ilist = new ArrayList<HashMap<String,Object>>();
		List<HashMap<String,Object>> Dlist = new ArrayList<HashMap<String,Object>>();
		List<HashMap<String,Object>> DCODEList = new ArrayList<HashMap<String,Object>>();
		for(int i=0; i<DCODE.length; i++) {
			HashMap<String,Object> Umap = new HashMap<String,Object>();
			HashMap<String,Object> Imap = new HashMap<String,Object>();
			HashMap<String,Object> Dmap = new HashMap<String,Object>();
				if(FLAG[i].equals("U")) {
					Umap.put("DCODE", DCODE[i]);
					Umap.put("DCODE_NAME", DCODE_NAME[i]);
					Umap.put("USE_YN", USE_YN[i]);
					Umap.put("FLAG", FLAG[i]);
					Ulist.add(Umap);
				}
				if(FLAG[i].equals("I")) {
					HashMap<String,Object> DCODEmap = new HashMap<String,Object>();
					DCODEmap.put("DCODE", DCODE[i]);
					DCODEList.add(DCODEmap);
					Imap.put("CODE", CODE[i]);
					Imap.put("DCODE", DCODE[i]);
					Imap.put("DCODE_NAME", DCODE_NAME[i]);
					Imap.put("USE_YN", USE_YN[i]);
					Imap.put("FLAG", FLAG[i]);
					Ilist.add(Imap);
				}
				if(FLAG[i].equals("D")) {
					Dmap.put("DCODE", DCODE[i]);
					Dlist.add(Dmap);
				}		
		}		
		TransactionStatus status = transactionManager.getTransaction(new DefaultTransactionDefinition());
			System.out.println(Ilist);
		try {
			if(DCODEList.size()!=0) {
				DCODECheck = commCodeService.DCODECheck(DCODEList);	
			}	
			if(Ulist.size() !=0) {
				commCodeService.commonCodeModify(Ulist);
			}
			if(Ilist.size() !=0) {
				commCodeService.commonCodeInsert(Ilist);	
			}
			if(Dlist.size() !=0) {
				commCodeService.commonCodeDelete(Dlist);	
			}
			transactionManager.commit(status); 
			return DCODECheck;
		}catch(Exception e){
			transactionManager.rollback(status);
			DCODECheck=-1;
			return DCODECheck;
		}		
	}	
}