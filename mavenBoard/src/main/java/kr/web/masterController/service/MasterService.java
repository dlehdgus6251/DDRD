package kr.web.masterController.service;

import java.util.HashMap;
import java.util.List;

public interface MasterService {
	public List<HashMap<String, Object>> selectMasterControllerList(HashMap<String,Object> map);
	public List<HashMap<String, Object>> selectMasterOBJList(HashMap<String,Object> map);
	public List<HashMap<String, Object>> selectMasterMappingList(HashMap<String, Object> map);
	public int insertMasterMapping(List<HashMap<String, Object>> IList);
	public int deleteMasterMapping(List<HashMap<String, Object>> DList);
}
