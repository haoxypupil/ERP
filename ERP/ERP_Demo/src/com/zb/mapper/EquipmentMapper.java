package com.zb.mapper;

import java.util.List;
import java.util.Map;

import com.zb.entity.Equipment;

public interface EquipmentMapper {
	
	public List<Equipment> findEquList(Map<String,Object> map);
	
	public int findEquCount(Map<String, Object> map);
	
	//新增
	public void addEqu(Equipment equipment);
	
	//领料
	public void equOut(Equipment equipment);
	
	//安装
	public void equImpl(Equipment equipment);
	
	//返修
	public void equReIn(Equipment equipment);
	
	//返厂回库
	public void inSuEqu(Equipment equipment);
	
	//修改是否上平台
	public void equUpOrDown(Equipment equipment);
}
