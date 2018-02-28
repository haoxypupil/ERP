package com.zb.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.zb.entity.Rights;
import com.zb.mapper.RightsMapper;
import com.zb.service.RightService;

@Component("rightService")
public class RightServiceImpl implements RightService{

	@Autowired
	private RightsMapper rightsMapper;
	
	public List<Rights> findRights() {
		return rightsMapper.findRights();
	}

}
