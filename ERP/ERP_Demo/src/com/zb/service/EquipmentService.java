package com.zb.service;

import java.util.List;
import java.util.Map;
import com.zb.entity.Equipment;

public interface EquipmentService {

	public List<Equipment> findEquList(String equCode,String equMac,String equModel,String equType,Integer suid, String equLocaleCode, String equStatus, Integer equServiceLog,String equUpOrDown, int index,int size);
	
	public int findEquCount(String equCode,String equMac,String equModel,String equType,Integer suid, String equLocaleCode, String equStatus, Integer equServiceLog,String equUpOrDown);
	
	
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
