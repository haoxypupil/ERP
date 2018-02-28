package com.zb.service;

import java.util.List;
import java.util.Map;
import com.zb.entity.Equipment;

public interface EquipmentService {

	public List<Equipment> findEquList(String equCode,String equMac,String equModel,String equType,Integer suid, String equLocaleCode, String equStatus, Integer equServiceLog,String equUpOrDown, int index,int size);
	
	public int findEquCount(String equCode,String equMac,String equModel,String equType,Integer suid, String equLocaleCode, String equStatus, Integer equServiceLog,String equUpOrDown);
	
	
	//����
	public void addEqu(Equipment equipment);
	
	//����
	public void equOut(Equipment equipment);
	
	//��װ
	public void equImpl(Equipment equipment);
	
	//����
	public void equReIn(Equipment equipment);

	//�����ؿ�
	public void inSuEqu(Equipment equipment);
	
	//�޸��Ƿ���ƽ̨
	public void equUpOrDown(Equipment equipment);
}
