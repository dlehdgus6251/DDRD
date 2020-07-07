package kr.web.ddrdMeeting.service;

import java.util.HashMap;
import java.util.List;

public interface DdrdMeetingService {
	public List<HashMap<String, Object>> selectDdrdMeeting(HashMap<String,Object> map);
	public List<HashMap<String, Object>> selectDdrdUserList();
	public List<HashMap<String, Object>> selectAttend(HashMap<String, Object> map);	
	public List<HashMap<String, Object>> selectAttendUserNum(HashMap<String, Object> map);	
	public void insertDdrdMeeting(List<HashMap<String, Object>> list);
	public void insertAttend(HashMap<String, Object> map);
	public void deleteAttend(HashMap<String, Object> map);
	public void deleteAttendAll(HashMap<String, Object> map);
	public void deleteMeeting(HashMap<String, Object> map);
	public void updateAttend(HashMap<String, Object> map);
	public void updateTotalUser(HashMap<String, Object> map);
	public int deleteMasterMapping(List<HashMap<String, Object>> DList);
}
