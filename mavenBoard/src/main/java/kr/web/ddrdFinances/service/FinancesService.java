package kr.web.ddrdFinances.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Service;
@Service
public interface FinancesService {
	public List<HashMap<String, Object>> selectFinancesMain(HashMap<String,Object> map);
	
}
