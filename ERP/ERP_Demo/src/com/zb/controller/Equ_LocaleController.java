package com.zb.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zb.entity.Equ_Locale;
import com.zb.service.Equ_LocaleService;

@Component
@Scope("prototype")
@RequestMapping("/el.do")
public class Equ_LocaleController {
	
	@Autowired
	private Equ_LocaleService equ_LocaleService;
	
	//��ѯ���޼�¼
	@RequestMapping(params = "findReInList")
	@ResponseBody
	public List<Equ_Locale> findReInList(Equ_Locale equ_Locale){
		
		 List<Equ_Locale> list =  equ_LocaleService.findElByEquCode(equ_Locale);

			return list;

	}
	
	//��ѯ������¼
		@RequestMapping(params = "findBackSuList")
		@ResponseBody
		public List<Equ_Locale> findReSuList(Equ_Locale equ_Locale){
			
			 List<Equ_Locale> list =  equ_LocaleService.findElBackByEquCode(equ_Locale);

				return list;

		}


}
