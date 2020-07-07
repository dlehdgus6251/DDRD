package kr.web.ddrdUser.service;

import java.util.HashMap;
import java.util.List;

public interface UserService {
	public List<HashMap<String, Object>> UserList(HashMap<String,Object> map);
	public int UserInsert(List<HashMap<String,Object>> list);
	public int UserDelete(List<HashMap<String, Object>> list);
	public int UserUpdate(List<HashMap<String, Object>> list);
}
