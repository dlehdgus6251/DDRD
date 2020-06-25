package kr.web.login.mapper;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
@Repository
public class LoginDao {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	public int Login(HashMap<String,Object> map){
		int result = sqlSessionTemplate.selectOne("login", map);
		return result;
	}
	public List<HashMap<String, Object>> SelectOBJNAME(HashMap<String,Object> map){
		return sqlSessionTemplate.selectList("selectOBJNAME", map);
	}
}
