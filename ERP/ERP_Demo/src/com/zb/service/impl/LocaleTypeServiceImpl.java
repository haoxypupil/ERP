package com.zb.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.zb.entity.LocaleType;
import com.zb.mapper.LocaleTypeMapper;
import com.zb.service.LocaleTypeService;

@Component("localeTypeService")
public class LocaleTypeServiceImpl implements LocaleTypeService{

	@Autowired
	private LocaleTypeMapper localeTypeMapper;
	
	public List<LocaleType> findLocaleType(){
		List<LocaleType> list = localeTypeMapper.findLocaleType();
		return list;
	}

}
