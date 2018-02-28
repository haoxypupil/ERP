package com.zb.service;

import java.util.List;
import java.util.Map;

import com.zb.entity.LocaleArea;
import com.zb.entity.LocaleBasicInfo;

public interface LocaleBasicInfoService {
	
	//��ʱ�Լ���ϲ�ѯ
	public List<LocaleBasicInfo> findLocaleBasicInfo(String localeCode,String localeName,Integer areaid,String localeStatus,int index,int size);
	
	//��������
	public int findLocaleBasicInfoCount(String localeCode,String localeName,Integer areaid,String localeStatus);
	
	public void addLocale(LocaleBasicInfo localeBasicInfo);
	
	//�޸�
	public void updateLocale(LocaleBasicInfo localeBasicInfo);
	
	//ɾ��
	public void delLocale(Integer localeId);
	
	public List<LocaleBasicInfo> localeList();
	
	public LocaleBasicInfo findLocaleNameByLocaleCode(LocaleBasicInfo localeBasicInfo);
	
	public List<LocaleBasicInfo> findLocaleNameAndLocaleCodeList();
	
}
