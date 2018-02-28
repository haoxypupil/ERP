package com.zb.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zb.entity.Supplier;
import com.zb.service.SupplierService;

@Component
@Scope("prototype")
@RequestMapping("/supp.do")
public class SupplierController {
	
	@Autowired
	private SupplierService supplierService;
	
	
	//全部查询。。。。。。。。。下拉菜单
	@RequestMapping(params = "suppList")
	@ResponseBody
	public List<Supplier> findSupplierList(){
		List<Supplier> list = supplierService.findSupplierList();
		return list;
	}
}
