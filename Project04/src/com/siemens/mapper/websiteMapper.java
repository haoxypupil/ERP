package com.siemens.mapper;

import java.util.List;
import java.util.Map;

import com.siemens.entity.Website;

public interface websiteMapper {
	public List<Website> findWebList();
	
	public List<Map<String, Object>> findMap2();
	
	public List<Website> findById(int wid);
}
