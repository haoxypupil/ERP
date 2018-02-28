package com.zb.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.zb.entity.LocaleArea;
import com.zb.mapper.LocaleAreaMapper;
import com.zb.service.LocaleAreaService;

@Component("localeAreaService")
public class LocaleAreaServiceImpl implements LocaleAreaService{

	@Autowired
	private LocaleAreaMapper localeAreaMapper;
	
	
	public List<LocaleArea> findLocaleArea() {
		List<LocaleArea> list = localeAreaMapper.findLocaleArea();
		return list;
	}

}
