package kr.web.login.service;

import java.util.HashMap;
import java.util.List;

public interface LoginService {
	public int Login(HashMap<String,Object> map);
	public List<HashMap<String,Object>> SelectOBJNAME(HashMap<String,Object> map);
}
