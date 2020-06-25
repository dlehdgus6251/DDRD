package kr.web.commonCode.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Service;
@Service
public interface CommCodeService {
	public List<HashMap<String, Object>> selectCommonCodeList(HashMap<String,Object> map);
	public List<HashMap<String, Object>> selectCommonCode(HashMap<String,Object> map);
	public List<HashMap<String, Object>> selectCommonCodeDetail(HashMap<String,Object> map);
	public void commonCodeInsert(List<HashMap<String, Object>> Ilist);
	public int DCODECheck(List<HashMap<String, Object>> DCODEList);
	public void commonCodeModify(List<HashMap<String, Object>> Ulist);
	public void commonCodeDelete(List<HashMap<String, Object>> Dlist);
}
