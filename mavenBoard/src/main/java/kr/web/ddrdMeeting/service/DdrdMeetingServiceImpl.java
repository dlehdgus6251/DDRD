package kr.web.ddrdMeeting.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.web.ddrdMeeting.mapper.DdrdMeetingDao;
@Service
public class DdrdMeetingServiceImpl implements DdrdMeetingService {

	@Autowired
	private DdrdMeetingDao Dao;
	@Override
	public List<HashMap<String, Object>> selectDdrdMeeting(HashMap<String, Object> map) {
	
		return Dao.selectDdrdMeeting(map);
	}

	@Override
	public void insertDdrdMeeting(List<HashMap<String, Object>> list) {

		Dao.insertDdrdMeeting(list);
	}
	@Override
	public void insertAttend(HashMap<String, Object> map) {
		
		Dao.insertAttend(map);
	}
	@Override
	public void deleteAttend(HashMap<String, Object> map) {
		
		Dao.deleteAttend(map);
	}
	@Override
	public void deleteAttendAll(HashMap<String, Object> map) {
		
		Dao.deleteAttendAll(map);
	}
	@Override
	public void deleteMeeting(HashMap<String, Object> map) {
		
		Dao.deleteMeeting(map);
	}
	@Override
	public void updateAttend(HashMap<String, Object> map) {
		
		Dao.updateAttend(map);
	}
	@Override
	public void updateTotalUser(HashMap<String, Object> map) {
		
		Dao.updateTotalUser(map);
	}
	@Override
	public List<HashMap<String, Object>> selectAttend(HashMap<String, Object> map) {
	
		return Dao.selectAttend(map);
	}
	@Override
	public List<HashMap<String, Object>> selectAttendUserNum(HashMap<String, Object> map) {
		
		return Dao.selectAttendUserNum(map);
	}
	@Override
	public int deleteMasterMapping(List<HashMap<String, Object>> DList) {

		return Dao.deleteMasterMapping(DList);
	}
	@Override
	public List<HashMap<String, Object>> selectDdrdUserList(){
		return Dao.selectDdrdUserList();
		
	};
}
