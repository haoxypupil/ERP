package com.zb.mapper;

import java.util.List;
import java.util.Map;

import com.zb.entity.LocaleBasicInfo;



public interface LocaleBasicInfoMapper {
	
		/**
		 * 展示以及组合查询
		 * @param map
		 * @return
		 */
		public List<LocaleBasicInfo> findLocaleBasicInfo(Map<String , Object> map);
		
		public int findLocaleBasicInfoCount(Map<String, Object> map);
		
		
		//新增
		public void addLocale(LocaleBasicInfo localeBasicInfo);
		
		//修改
		public void updateLocale(LocaleBasicInfo localeBasicInfo);
		
		//删除
		public void delLocale(Integer localeId);
		
		public List<LocaleBasicInfo> localeList();
		
		public LocaleBasicInfo findLocaleNameByLocaleCode(LocaleBasicInfo localeBasicInfo);
		
		
		public List<LocaleBasicInfo> findLocaleNameAndLocaleCodeList();
}
