package com.zb.mapper;

import java.util.List;

import com.zb.entity.LocaleArea;

public interface LocaleAreaMapper {
	
	//全部查询，用于场所信息地区下拉菜单
	public List<LocaleArea> findLocaleArea();
}
