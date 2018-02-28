package com.zb.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.zb.entity.LocaleOperator;
import com.zb.mapper.LocaleOperatorMapper;
import com.zb.service.LocaleOperatorService;

@Component("localeOperatorService")
public class LocaleOperatorServiceImpl implements LocaleOperatorService{

	@Autowired
	private  LocaleOperatorMapper localeOperatorMapper;
	
	public List<LocaleOperator> findLocaleOperator() {
	 List<LocaleOperator> list = localeOperatorMapper.findLocaleOperator();
		return list;
	}

}
