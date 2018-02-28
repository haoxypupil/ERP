package com.zb.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zb.entity.LocaleArea;
import com.zb.service.LocaleAreaService;

@Component
@Scope("prototype")
@RequestMapping("/localeArea.do")
public class LocaleAreaController {

	@Autowired
	private LocaleAreaService localeAreaService;
	
	@RequestMapping(params ="areaList")
	@ResponseBody
	public List<LocaleArea> findAreaList(){
		 List<LocaleArea> list = localeAreaService.findLocaleArea();
		return list;
		 
	}
}
