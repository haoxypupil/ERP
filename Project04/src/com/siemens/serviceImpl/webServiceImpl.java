package com.siemens.serviceImpl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.siemens.entity.Website;
import com.siemens.mapper.websiteMapper;

@Service("webServiceImpl")
public class webServiceImpl {
	
	@Autowired
	private websiteMapper websiteMap;
	
	public List<Website> findWinList(){
		
		return websiteMap.findWebList();
	}
	
	public List<Map<String, Object>> findMap2(){
		return websiteMap.findMap2();
		
	}
	
	public List<Website> findById(int wid){
		
		return websiteMap.findById(wid);
	}
	
}
