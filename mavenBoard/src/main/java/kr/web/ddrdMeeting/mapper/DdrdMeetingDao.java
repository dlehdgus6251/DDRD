package kr.web.ddrdMeeting.mapper;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
@Repository
public class DdrdMeetingDao {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	public List<HashMap<String, Object>>  selectDdrdMeeting(HashMap<String,Object> map) {

		return sqlSessionTemplate.selectList("selectDdrdMeeting", map);
	}
	
	public void  insertDdrdMeeting(List<HashMap<String,Object>> list) {
		sqlSessionTemplate.insert("insertDdrdMeeting", list);
	}
	public int  deleteMasterMapping(List<HashMap<String,Object>> DList) {

		return sqlSessionTemplate.insert("deleteMasterMapping", DList);
	}
	public List<HashMap<String, Object>> selectDdrdUserList(){
		
		return sqlSessionTemplate.selectList("selectDdrdUserList");
	}
	public void  insertAttend(HashMap<String,Object> map) {

		sqlSessionTemplate.insert("insertAttend", map);
	}
	public void  deleteAttend(HashMap<String,Object> map) {
		
		sqlSessionTemplate.delete("deleteAttend", map);
	}
	public void  deleteAttendAll(HashMap<String,Object> map) {
		
		sqlSessionTemplate.delete("deleteAttendAll", map);
	}
	public void  deleteMeeting(HashMap<String,Object> map) {
		
		sqlSessionTemplate.delete("deleteMeeting", map);
	}
	public void  updateAttend(HashMap<String,Object> map) {
		
		sqlSessionTemplate.update("updateAttend", map);
	}
	public void  updateTotalUser(HashMap<String,Object> map) {
		
		sqlSessionTemplate.update("updateTotalUser", map);
	}
	public List<HashMap<String, Object>> selectAttend(HashMap<String, Object> map) {

		return sqlSessionTemplate.selectList("selectAttend", map);
	}
	public List<HashMap<String, Object>> selectAttendUserNum(HashMap<String, Object> map) {
		
		return sqlSessionTemplate.selectList("selectAttendUserNum", map);
	}
}
