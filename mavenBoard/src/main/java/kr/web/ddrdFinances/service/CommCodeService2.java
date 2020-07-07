package kr.web.commonCode.service;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CommCodeService2 {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public List<HashMap<String, Object>> selectCommonCodeList(HashMap<String,Object> map) {
		
		return sqlSessionTemplate.selectList("selectCommonCodeList", map);
	}
	
}
