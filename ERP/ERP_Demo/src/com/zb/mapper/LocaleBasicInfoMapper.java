package com.zb.mapper;

import java.util.List;
import java.util.Map;

import com.zb.entity.LocaleBasicInfo;



public interface LocaleBasicInfoMapper {
	
		/**
		 * չʾ�Լ���ϲ�ѯ
		 * @param map
		 * @return
		 */
		public List<LocaleBasicInfo> findLocaleBasicInfo(Map<String , Object> map);
		
		public int findLocaleBasicInfoCount(Map<String, Object> map);
		
		
		//����
		public void addLocale(LocaleBasicInfo localeBasicInfo);
		
		//�޸�
		public void updateLocale(LocaleBasicInfo localeBasicInfo);
		
		//ɾ��
		public void delLocale(Integer localeId);
		
		public List<LocaleBasicInfo> localeList();
		
		public LocaleBasicInfo findLocaleNameByLocaleCode(LocaleBasicInfo localeBasicInfo);
		
		
		public List<LocaleBasicInfo> findLocaleNameAndLocaleCodeList();
}
