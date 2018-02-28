package com.zb.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zb.entity.LocaleOperator;
import com.zb.service.LocaleOperatorService;

@Component
@Scope("prototype")
@RequestMapping("/localeOp.do")
public class LocaleOperatorController {
	
	    @Autowired
		private LocaleOperatorService localeOperatorService;
	    
	    @RequestMapping(params = "operatorList")
	    @ResponseBody
	    public List<LocaleOperator> findOperatorList(){
	    	List<LocaleOperator> list = 	localeOperatorService.findLocaleOperator();
			return list;
	    	
	    }
}
