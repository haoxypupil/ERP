package com.zb.mapper;

import java.util.List;
import java.util.Map;
import com.zb.entity.Maintenance;


public interface MaintenanceMapper {
		
		//��ϲ�ѯ��¼����ҳչʾ
		public List<Maintenance> findMainList(Map<String ,Object> map);
		
		public int findMainCount(Map<String, Object> map);
		
		//����
		public void addMain(Maintenance maintenance);
		
}
