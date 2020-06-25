package kr.web.commonCode.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.web.freeBoard.mapper.CommCodeDao;
@Service
public class CommCodeServiceImpl implements CommCodeService {
	@Autowired
	private CommCodeDao Dao;
	public List<HashMap<String, Object>> selectCommonCodeList(HashMap<String,Object> map) {
		
		return Dao.selectCommonCodeList(map);
	}
	public List<HashMap<String, Object>> selectCommonCode(HashMap<String,Object> map) {
	
		return Dao.selectCommonCode(map);
	}
	public List<HashMap<String, Object>> selectCommonCodeDetail(HashMap<String,Object> map) {
	
		return Dao.selectCommonCodeDetail(map);
	}
	public void commonCodeInsert(List<HashMap<String, Object>> Ilist) {
	
		Dao.commonCodeInsert(Ilist);
	}
	public int DCODECheck(List<HashMap<String, Object>> DCODEList){
		int result = 0;
		result = Dao.DCODECheck(DCODEList);
		return result; 
	}
	public void commonCodeModify(List<HashMap<String, Object>> Ulist) {
		System.out.println("Impl="+Ulist);
		Dao.commonCodeModify(Ulist);
	}
	public void commonCodeDelete(List<HashMap<String, Object>> Dlist) {
		
		Dao.commonCodeDelete(Dlist);
	}
}
