package com.zb.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.zb.entity.Equ_Locale;
import com.zb.mapper.Equ_LocaleMapper;
import com.zb.service.Equ_LocaleService;

@Component("equ_LocaleService")
public class Equ_LocaleServiceImpl implements Equ_LocaleService{

	@Autowired
	private Equ_LocaleMapper equ_LocaleMapper;

	public void addEquLocale(Equ_Locale equ_Locale) {
		// TODO Auto-generated method stub
		equ_LocaleMapper.addEquLocale(equ_Locale);
	}

	public void implEquLocale(Equ_Locale equ_Locale) {
		// TODO Auto-generated method stub
		equ_LocaleMapper.implEquLocale(equ_Locale);
	}


	public void reInEquLocale(Equ_Locale equ_Locale) {
		// TODO Auto-generated method stub
		equ_LocaleMapper.reInEquLocale(equ_Locale);
	}
	
	public void backInEqu(Equ_Locale equ_Locale) {
		// TODO Auto-generated method stub
		equ_LocaleMapper.backInEqu(equ_Locale);
	}
	public int elCount(Equ_Locale equ_Locale) {
		int count = equ_LocaleMapper.elCount(equ_Locale);
		return count;
	}

	public List<Equ_Locale> findElByEquCode(Equ_Locale equ_Locale) {
		List<Equ_Locale> list = equ_LocaleMapper.findElByEquCode(equ_Locale);
		return list;
	}

	public List<Equ_Locale> findElBackByEquCode(Equ_Locale equ_Locale) {
		List<Equ_Locale> list = equ_LocaleMapper.findElBackByEquCode(equ_Locale);
		return list;
	}

}
