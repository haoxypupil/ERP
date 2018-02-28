package com.zb.mapper;

import java.util.List;
import java.util.Map;

import com.zb.entity.Equipment;

public interface EquipmentMapper {
	
	public List<Equipment> findEquList(Map<String,Object> map);
	
	public int findEquCount(Map<String, Object> map);
	
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
