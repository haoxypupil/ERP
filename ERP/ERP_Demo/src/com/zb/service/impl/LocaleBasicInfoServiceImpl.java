package com.zb.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.zb.entity.LocaleArea;
import com.zb.entity.LocaleBasicInfo;
import com.zb.mapper.LocaleBasicInfoMapper;
import com.zb.service.LocaleBasicInfoService;

@Component("localeBasicInfoService")
public class LocaleBasicInfoServiceImpl implements LocaleBasicInfoService{

	@Autowired
	private LocaleBasicInfoMapper localeBasicInfoMapper;
	
	public List<LocaleBasicInfo> findLocaleBasicInfo(String localeCode,
			String localeName,Integer areaid,String localeStatus,int index,int size) {
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("start",size*(index-1));
		map.put("end",size*index);
		if(localeCode !=null&&!"".equals(localeCode)){
			map.put("localeCode",localeCode);
		}
		if(localeName !=null&&!"".equals(localeName)){
			map.put("localeName",localeName);
		}
		if (areaid !=null &&!"".equals(areaid)){
			map.put("localeArea",areaid);
		}
		if (localeStatus !=null &&!"".equals(localeStatus)){
			map.put("localeStatus",localeStatus);
		}
		return localeBasicInfoMapper.findLocaleBasicInfo(map);
	}

	public int findLocaleBasicInfoCount(String localeCode, String localeName,Integer areaid,String localeStatus) {
		Map<String,Object> map = new HashMap<String, Object>();
		if(localeCode !=null&&!"".equals(localeCode)){
			map.put("localeCode",localeCode);
		}
		if(localeName !=null&&!"".equals(localeName)){
			map.put("localeName",localeName);
		}
		if (areaid !=null &&!"".equals(areaid)){
			map.put("localeArea",areaid);
		}
		if (localeStatus !=null &&!"".equals(localeStatus)){
			map.put("localeStatus",localeStatus);
		}
		return localeBasicInfoMapper.findLocaleBasicInfoCount(map);
	}

	public void addLocale(LocaleBasicInfo localeBasicInfo) {
		localeBasicInfoMapper.addLocale(localeBasicInfo);
		System.out.println("执行了一次导入方法");
	}

	public void updateLocale(LocaleBasicInfo localeBasicInfo) {
		localeBasicInfoMapper.updateLocale(localeBasicInfo);
		
	}

	public void delLocale(Integer localeId) {
		localeBasicInfoMapper.delLocale(localeId);
		
	}

	public List<LocaleBasicInfo> localeList() {
		List<LocaleBasicInfo> list = localeBasicInfoMapper.localeList();
		return list;
	}

	public LocaleBasicInfo findLocaleNameByLocaleCode(
			LocaleBasicInfo localeBasicInfo) {
		LocaleBasicInfo lbi = localeBasicInfoMapper.findLocaleNameByLocaleCode(localeBasicInfo);
		return lbi;
	}

	public List<LocaleBasicInfo> findLocaleNameAndLocaleCodeList() {
		List<LocaleBasicInfo> list = localeBasicInfoMapper.findLocaleNameAndLocaleCodeList();
		return list;
	}

	

}
