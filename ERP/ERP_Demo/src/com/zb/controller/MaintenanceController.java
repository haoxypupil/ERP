package com.zb.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zb.entity.Employee;
import com.zb.entity.LocaleArea;
import com.zb.entity.LocaleBasicInfo;
import com.zb.entity.Maintenance;
import com.zb.service.MaintenanceService;

@Component
@Scope("prototype")
@RequestMapping("/main.do")
public class MaintenanceController {

	@Autowired
	private MaintenanceService maintenanceService;

	@RequestMapping(params="mainList")
	@ResponseBody
	public Map<String, Object> mainList(
			String mainType,String localeName, String mainFaultCause, String mainEquipmentModel,
			String mainResult,String mainLocaleStatus,Integer areaid,
			String mainCompany,String mainDateFrom,String mainDateTo,String mainEquipmentType,Integer page, Integer rows) {
		
		List<Maintenance> list = maintenanceService.findMainList(areaid, mainCompany, localeName, mainDateFrom, mainDateTo, mainType, mainFaultCause, mainEquipmentModel, mainResult, mainLocaleStatus, mainEquipmentType, page,rows);

		int count = maintenanceService.findMainCount(areaid, mainCompany, localeName,mainDateFrom,mainDateTo, mainType, mainFaultCause, mainEquipmentModel, mainResult, mainLocaleStatus, mainEquipmentType);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("total",count);
		map.put("rows",list);
		return map;
		
	}
	//ÐÂÔö
	@RequestMapping(params ="addMain")
	@ResponseBody
	public String addMain(Maintenance maintenance,Integer localeId,Integer areaId,Integer empId){
		
		LocaleBasicInfo localeBasicInfo = new LocaleBasicInfo();
		LocaleArea localeArea = new LocaleArea();
		Employee employee = new Employee();
		localeBasicInfo.setLocaleId(localeId);
		localeArea.setAreaId(areaId);
		employee.setEmpId(empId);
		
		maintenance.setLocalBasicInfo(localeBasicInfo);
		maintenance.setLocaleArea(localeArea);
		maintenance.setEmployee(employee);
		
		try {
			maintenanceService.addMain(maintenance);
			return "ok";
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return "error";
		}	
	}
}
