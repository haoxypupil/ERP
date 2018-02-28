package com.zb.service;

import java.util.List;

import com.zb.entity.Equ_Locale;

public interface Equ_LocaleService {
	
	//新增设备出库
	public void addEquLocale(Equ_Locale equ_Locale);
	
	//安装，更新场所编码
	public void implEquLocale(Equ_Locale equ_Locale);
	
	//更新返修时间 返修时间，返修人，返修理由
	public void reInEquLocale(Equ_Locale equ_Locale);
					
	//返厂还回
	public void backInEqu(Equ_Locale equ_Locale);
	
	//查询总数
	public int elCount(Equ_Locale equ_Locale);
	
	//查询设备流转历史，（不包含设备返厂记录）
	public List<Equ_Locale> findElByEquCode(Equ_Locale equ_Locale);
			
	//查询设备返厂记录
	public List<Equ_Locale> findElBackByEquCode(Equ_Locale equ_Locale);
}
