package kr.web.freeBoard.mapper;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
@Repository
public class CommCodeDao {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	public List<HashMap<String, Object>> selectCommonCode(HashMap<String,Object> map) {
		
		return sqlSessionTemplate.selectList("selectCommonCode", map);
	}
	public List<HashMap<String, Object>> selectCommonCodeList(HashMap<String,Object> map) {
		
		return sqlSessionTemplate.selectList("selectCommonCodeList", map);
	}
	public List<HashMap<String, Object>> selectCommonCodeDetail(HashMap<String,Object> map) {
	
		return sqlSessionTemplate.selectList("selectCommonCodeDetail", map);
	}
	public int commonCodeInsert(List<HashMap<String, Object>> Ilist) {
		
		return sqlSessionTemplate.insert("commonCodeInsert", Ilist);
	}
	public int DCODECheck(List<HashMap<String,Object>> DCODEList) {
		
		return sqlSessionTemplate.selectOne("DCODECheck", DCODEList);
	}
	public int commonCodeModify(List<HashMap<String, Object>> Ulist) {
		
		return sqlSessionTemplate.update("commonCodeModify", Ulist);
	}
	public int commonCodeDelete(List<HashMap<String, Object>> Dlist) {
		
		return sqlSessionTemplate.delete("commonCodeDelete", Dlist);
	}
}
