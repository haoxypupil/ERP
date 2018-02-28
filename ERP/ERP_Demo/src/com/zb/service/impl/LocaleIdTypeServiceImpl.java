package com.zb.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.zb.entity.LocaleIdType;
import com.zb.mapper.LocaleIdTypeMapper;
import com.zb.service.LocaleIdTypeService;

@Component("localeIdTypeService")
public class LocaleIdTypeServiceImpl implements LocaleIdTypeService{

	@Autowired
	private LocaleIdTypeMapper localeIdTypeMapper;
	
	
	public List<LocaleIdType> findLocaleIdType() {
		List<LocaleIdType> list = localeIdTypeMapper.findLocaleIdType();
		return list;
	}

}
