package kr.web.ddrdFinances.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.web.ddrdFinances.mapper.FinancesDao;
@Service
public class FinancesServiceImpl implements FinancesService {
	@Autowired
	private FinancesDao Dao;
	public List<HashMap<String, Object>> selectFinancesMain(HashMap<String,Object> map) {
		
		return Dao.selectFinancesMain(map);
	}
	
}
