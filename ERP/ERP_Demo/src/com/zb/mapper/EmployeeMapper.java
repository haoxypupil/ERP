package com.zb.mapper;

import java.util.List;

import com.zb.entity.Employee;

public interface EmployeeMapper {
	
		//ȫ����ѯ����������ά����Ϣ�����˵�
		public List<Employee> findEmployeeList();
}
