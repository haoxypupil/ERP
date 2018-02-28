package com.zb.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.zb.entity.LocaleNetway;
import com.zb.mapper.LocaleNetwayMapper;
import com.zb.service.LocaleNetwayService;

@Component("localeNetwayService")
public class LocaleNetwayServiceImpl implements LocaleNetwayService{

	@Autowired
	private LocaleNetwayMapper localeNetwayMapper;
	
	public List<LocaleNetway> findLocaleNetWay() {
		List<LocaleNetway> list = localeNetwayMapper.findLocaleNetWay();
		return list;
	}

}
