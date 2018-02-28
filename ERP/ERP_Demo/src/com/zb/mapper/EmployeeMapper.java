package com.zb.mapper;

import java.util.List;

import com.zb.entity.Employee;

public interface EmployeeMapper {
	
		//全部查询，用于新增维护信息下拉菜单
		public List<Employee> findEmployeeList();
}
