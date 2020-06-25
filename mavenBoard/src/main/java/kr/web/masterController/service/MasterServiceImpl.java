package kr.web.masterController.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.web.masterController.mapper.MasterDao;
@Service
public class MasterServiceImpl implements MasterService {

	@Autowired
	private MasterDao Dao;
	@Override
	public List<HashMap<String, Object>> selectMasterControllerList(HashMap<String, Object> map) {
	
		return Dao.selectMasterControllerList(map);
	}
	@Override
	public List<HashMap<String, Object>> selectMasterOBJList(HashMap<String, Object> map) {

		return Dao.selectMasterOBJList(map);
	}
	@Override
	public List<HashMap<String, Object>> selectMasterMappingList(HashMap<String, Object> map) {

		return Dao.selectMasterMappingList(map);
	}
	@Override
	public int insertMasterMapping(List<HashMap<String, Object>> IList) {

		return Dao.insertMasterMapping(IList);
	}
	@Override
	public int deleteMasterMapping(List<HashMap<String, Object>> DList) {

		return Dao.deleteMasterMapping(DList);
	}

}
