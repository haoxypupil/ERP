package com.zb.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zb.entity.Employee;
import com.zb.service.EmployeeService;

@Component
@Scope("prototype")
@RequestMapping("/emp.do")
public class EmployeeController {
	
	  @Autowired
      private EmployeeService employeeService;
	  
	  @RequestMapping(params = "findEmpList")
	  @ResponseBody
	  public List<Employee> findEmployeeList(){
		  List<Employee> list = employeeService.findEmployeeList();
		return list;  
	  }
}
