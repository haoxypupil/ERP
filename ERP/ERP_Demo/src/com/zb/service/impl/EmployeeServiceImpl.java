package com.zb.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.zb.entity.Employee;
import com.zb.mapper.EmployeeMapper;
import com.zb.service.EmployeeService;

@Component("employeeService")
public class EmployeeServiceImpl implements EmployeeService{

	@Autowired
	private EmployeeMapper employeeMapper;
	
	public List<Employee> findEmployeeList() {
	List<Employee> list = employeeMapper.findEmployeeList();
		return list;
	}

}
