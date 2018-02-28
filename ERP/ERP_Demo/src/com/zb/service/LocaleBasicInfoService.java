package com.zb.service;

import java.util.List;
import java.util.Map;

import com.zb.entity.LocaleArea;
import com.zb.entity.LocaleBasicInfo;

public interface LocaleBasicInfoService {
	
	//暂时以及组合查询
	public List<LocaleBasicInfo> findLocaleBasicInfo(String localeCode,String localeName,Integer areaid,String localeStatus,int index,int size);
	
	//求总条数
	public int findLocaleBasicInfoCount(String localeCode,String localeName,Integer areaid,String localeStatus);
	
	public void addLocale(LocaleBasicInfo localeBasicInfo);
	
	//修改
	public void updateLocale(LocaleBasicInfo localeBasicInfo);
	
	//删除
	public void delLocale(Integer localeId);
	
	public List<LocaleBasicInfo> localeList();
	
	public LocaleBasicInfo findLocaleNameByLocaleCode(LocaleBasicInfo localeBasicInfo);
	
	public List<LocaleBasicInfo> findLocaleNameAndLocaleCodeList();
	
}
