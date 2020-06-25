package kr.web.masterController.mapper;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
@Repository
public class MasterDao {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	public List<HashMap<String, Object>>  selectMasterControllerList(HashMap<String,Object> map) {

		return sqlSessionTemplate.selectList("selectMasterControllerList", map);
	}
	public List<HashMap<String, Object>>  selectMasterOBJList(HashMap<String,Object> map) {

		return sqlSessionTemplate.selectList("selectMasterOBJList", map);
	}
	public List<HashMap<String, Object>>  selectMasterMappingList(HashMap<String,Object> map) {

		return sqlSessionTemplate.selectList("selectMasterMappingList", map);
	}
	public int  insertMasterMapping(List<HashMap<String,Object>> IList) {

		return sqlSessionTemplate.insert("insertMasterMapping", IList);
	}
	public int  deleteMasterMapping(List<HashMap<String,Object>> DList) {

		return sqlSessionTemplate.insert("deleteMasterMapping", DList);
	}
}
