package com.zb.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.zb.entity.Maintenance;
import com.zb.mapper.MaintenanceMapper;
import com.zb.service.MaintenanceService;

@Component("maintenanceService")
public class MaintenanceServiceImpl implements MaintenanceService {

	@Autowired
	private MaintenanceMapper maintenanceMapper;

	public List<Maintenance> findMainList(Integer areaid,String mainCompany,String  localeName,String mainDateFrom,String mainDateTo,String mainType,
			String mainFaultCause, String mainEquipmentModel,
			String mainResult, String mainLocaleStatus,String mainEquipmentType,int index, int size) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", (index - 1) * size);
		map.put("end", index * size);
		if (areaid !=null &&!"".equals(areaid)){
			map.put("localeArea",areaid);
		}
		if (mainCompany !=null &&!"".equals(mainCompany)){
			map.put("mainCompany",mainCompany);
		}
		if (mainDateFrom !=null &&!"".equals(mainDateFrom)){
			map.put("mainDateFrom",mainDateFrom);
		}
		if (mainDateTo !=null &&!"".equals(mainDateTo)){
			map.put("mainDateTo",mainDateTo);
		}
		if (mainType != null && !"".equals(mainType)) {
			map.put("mainType", mainType);
		}
		if (mainFaultCause != null && !"".equals(mainFaultCause)) {
			map.put("mainFaultCause", mainFaultCause);
		}
		if (mainEquipmentModel != null && !"".equals(mainEquipmentModel)) {
			map.put("mainEquipmentModel", mainEquipmentModel);
		}
		if (mainResult != null && !"".equals(mainResult)) {
			map.put("mainResult", mainResult);
		}
		if (mainLocaleStatus != null && !"".equals(mainLocaleStatus)) {
			map.put("mainLocaleStatus", mainLocaleStatus);
		}
		if (localeName != null && !"".equals(localeName)) {
			map.put("localeName", localeName);
		}
		if (mainEquipmentType != null && !"".equals(mainEquipmentType)) {
			map.put("mainEquipmentType", mainEquipmentType);
		}
		return maintenanceMapper.findMainList(map);
	}

	public int findMainCount(Integer areaid,String mainCompany,String localeName,String mainDateFrom,String mainDateTo,String mainType, String mainFaultCause,
			String mainEquipmentModel, String mainResult,
			String mainLocaleStatus,String mainEquipmentType) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		if (areaid !=null &&!"".equals(areaid)){
			map.put("localeArea",areaid);
		}
		if (mainCompany !=null &&!"".equals(mainCompany)){
			map.put("mainCompany",mainCompany);
		}
		if (mainDateFrom !=null &&!"".equals(mainDateFrom)){
			map.put("mainDateFrom",mainDateFrom);
		}
		if (mainDateTo !=null &&!"".equals(mainDateTo)){
			map.put("mainDateTo",mainDateTo);
		}
		if (mainType != null && !"".equals(mainType)) {
			map.put("mainType", mainType);
		}
		if (mainFaultCause != null && !"".equals(mainFaultCause)) {
			map.put("mainFaultCause", mainFaultCause);
		}
		if (mainEquipmentModel != null && !"".equals(mainEquipmentModel)) {
			map.put("mainEquipmentModel", mainEquipmentModel);
		}
		if (mainResult != null && !"".equals(mainResult)) {
			map.put("mainResult", mainResult);
		}
		if (mainLocaleStatus != null && !"".equals(mainLocaleStatus)) {
			map.put("mainLocaleStatus", mainLocaleStatus);
		}
		if (localeName != null && !"".equals(localeName)) {
			map.put("localeName", localeName);
		}
		if (mainEquipmentType != null && !"".equals(mainEquipmentType)) {
			map.put("mainEquipmentType", mainEquipmentType);
		}
		return maintenanceMapper.findMainCount(map);
	}

	public void addMain(Maintenance maintenance) {
		maintenanceMapper.addMain(maintenance);

	}

}
