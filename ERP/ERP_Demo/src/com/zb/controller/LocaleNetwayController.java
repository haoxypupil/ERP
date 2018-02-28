package com.zb.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zb.entity.LocaleNetway;
import com.zb.service.LocaleNetwayService;

@Component
@Scope("prototype")
@RequestMapping("/localeNetway.do")
public class LocaleNetwayController {

	@Autowired
	private LocaleNetwayService localeNetwayService;
	
	@RequestMapping(params = "netwayList")
	@ResponseBody
	public List<LocaleNetway> findLocaleNetwayList(){
		List<LocaleNetway> list = localeNetwayService.findLocaleNetWay();
		return list;
	}
}
