package com.zb.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zb.entity.LocaleType;
import com.zb.service.LocaleTypeService;

@Component
@Scope("prototype")
@RequestMapping("/localeType.do")
public class LocaleTypeController {
	
		@Autowired
		private LocaleTypeService localeTypeService;
	
		@RequestMapping(params = "typeList")
		@ResponseBody
		public List<LocaleType>  findLocaleTypeList(){
			List<LocaleType> list = localeTypeService.findLocaleType();
			return list;	
		}
}
