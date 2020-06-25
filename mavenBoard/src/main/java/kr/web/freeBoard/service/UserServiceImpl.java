package kr.web.freeBoard.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.web.freeBoard.mapper.UserDao;
@Service
public class UserServiceImpl implements UserService {
	@Autowired
	private UserDao Dao;


	@Override
	public List<HashMap<String, Object>> UserList(HashMap<String,Object> map) {
		
		return Dao.UserList(map);
	}
	@Override
	public int UserInsert(List<HashMap<String,Object>> list) {
		
		return Dao.UserInsert(list);
	}
	@Override
	public int UserDelete(List<HashMap<String, Object>> list) {
		
		return Dao.UserDelete(list);
	}
	@Override
	public int UserUpdate(List<HashMap<String, Object>> list) {
		
		return Dao.UserUpdate(list);
	}
}
