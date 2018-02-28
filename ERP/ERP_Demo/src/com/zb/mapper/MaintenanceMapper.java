package com.zb.mapper;

import java.util.List;
import java.util.Map;
import com.zb.entity.Maintenance;


public interface MaintenanceMapper {
		
		//组合查询记录，分页展示
		public List<Maintenance> findMainList(Map<String ,Object> map);
		
		public int findMainCount(Map<String, Object> map);
		
		//新增
		public void addMain(Maintenance maintenance);
		
}
