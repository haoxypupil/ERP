package com.zb.service;

import java.util.List;
import java.util.Map;

import com.zb.entity.Maintenance;

public interface MaintenanceService {
	//组合查询记录，分页展示
			public List<Maintenance> findMainList(Integer areaid,String mainCompany,String localeName,String mainDateFrom,String mainDateTo,String mainType,String mainFaultCause,String mainEquipmentModel,String mainResult, String mainLocaleStatus,String mainEquipmentType,int index,int size);
			
			public int findMainCount(Integer areaid,String mainCompany,String localeName,String mainDateFrom,String mainDateTo,String mainType,String mainFaultCause,String mainEquipmentModel,String mainResult, String mainLocaleStatus,String mainEquipmentType);
			
			//新增
			public void addMain(Maintenance maintenance);
}
