package com.zb.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zb.entity.LocaleIdType;
import com.zb.service.LocaleIdTypeService;

@Component
@Scope("prototype")
@RequestMapping("/localeIdType.do")
public class LocaleIdTypeController {

	@Autowired
	private LocaleIdTypeService localeIdTypeService;
	
	@RequestMapping(params = "IdTypeList")
	@ResponseBody
	public List<LocaleIdType> findLocaleIdTypeList(){
		List<LocaleIdType> list = localeIdTypeService.findLocaleIdType();
		return list;
	}
}
