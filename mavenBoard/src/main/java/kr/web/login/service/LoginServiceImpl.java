package kr.web.login.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.web.login.mapper.LoginDao;
@Service
public class LoginServiceImpl implements LoginService {
	@Autowired 
	private LoginDao Dao;
	public int Login(HashMap<String,Object> map){
		int result = Dao.Login(map);
		return result;
	}
	public List<HashMap<String,Object>> SelectOBJNAME(HashMap<String,Object> map){
		return Dao.SelectOBJNAME(map);
	}
}
