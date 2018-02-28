package com.zb.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zb.entity.Equipment;
import com.zb.mapper.EquipmentMapper;
import com.zb.service.EquipmentService;

@Component("equipmentService")
public class EquipmentServiceImpl implements EquipmentService {

	@Autowired
	private EquipmentMapper equipmentMapper;

	public List<Equipment> findEquList(String equCode,String equMac,String equModel,String equType,Integer suid, String equLocaleCode, String equStatus, Integer equServiceLog,String equUpOrDown,int index,int size) {
		Map<String ,Object> map = new HashMap<String, Object>();
		map.put("start",(index-1)*size);
		map.put("end", index*size);
		if(equCode !=null && !"".equals(equCode)){
			map.put("equCode", equCode);
		}
		if(equMac !=null && !"".equals(equMac)){
			map.put("equMac", equMac);
		}
		if(equModel !=null && !"".equals(equModel)){
			map.put("equModel", equModel);
		}
		if(equType !=null && !"".equals(equType)){
			map.put("equType", equType);
		}
		if(suid !=null && !"".equals(suid)){
			map.put("supplier", suid);
		}
		if(equLocaleCode !=null && !"".equals(equLocaleCode)){
			map.put("equLocaleCode", equLocaleCode);
		}
		if(equStatus !=null && !"".equals(equStatus)){
			map.put("equStatus", equStatus);
		}
		if(equServiceLog !=null && !"".equals(equServiceLog)){
			map.put("equServiceLog", equServiceLog);
		}
		if(equUpOrDown !=null && !"".equals(equUpOrDown)){
			map.put("equUpOrDown", equUpOrDown);
		}
		return equipmentMapper.findEquList(map);
	}

	public int findEquCount(String equCode,String equMac,String equModel,String equType,Integer suid, String equLocaleCode, String equStatus, Integer equServiceLog,String equUpOrDown) {
		Map<String ,Object> map = new HashMap<String, Object>();
		if(equCode !=null && !"".equals(equCode)){
			map.put("equCode", equCode);
		}
		if(equMac !=null && !"".equals(equMac)){
			map.put("equMac", equMac);
		}
		if(equModel !=null && !"".equals(equModel)){
			map.put("equModel", equModel);
		}
		if(equType !=null && !"".equals(equType)){
			map.put("equType", equType);
		}
		if(suid !=null && !"".equals(suid)){
			map.put("supplier", suid);
		}
		if(equLocaleCode !=null && !"".equals(equLocaleCode)){
			map.put("equLocaleCode", equLocaleCode);
		}
		if(equStatus !=null && !"".equals(equStatus)){
			map.put("equStatus", equStatus);
		}
		if(equServiceLog !=null && !"".equals(equServiceLog)){
			map.put("equServiceLog", equServiceLog);
		}
		if(equUpOrDown !=null && !"".equals(equUpOrDown)){
			map.put("equUpOrDown", equUpOrDown);
		}
		int count = equipmentMapper.findEquCount(map);
		return count;
	}

	public void addEqu(Equipment equipment) {
		// TODO Auto-generated method stub
		equipmentMapper.addEqu(equipment);
	}

	public void equOut(Equipment equipment) {
		// TODO Auto-generated method stub
		equipmentMapper.equOut(equipment);
	}
	
	public void equImpl(Equipment equipment) {
		// TODO Auto-generated method stub
		equipmentMapper.equImpl(equipment);
	}

	public void equReIn(Equipment equipment) {
		// TODO Auto-generated method stub
		equipmentMapper.equReIn(equipment);
	}

	public void inSuEqu(Equipment equipment) {
		// TODO Auto-generated method stub
		equipmentMapper.inSuEqu(equipment);
	}

	public void equUpOrDown(Equipment equipment) {
		// TODO Auto-generated method stub
		equipmentMapper.equUpOrDown(equipment);
	}

}
