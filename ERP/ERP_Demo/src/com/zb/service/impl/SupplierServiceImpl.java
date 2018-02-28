package com.zb.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.zb.entity.Supplier;
import com.zb.mapper.SupplierMapper;
import com.zb.service.SupplierService;

@Component("supplierService")
public class SupplierServiceImpl implements SupplierService{

	@Autowired
	private SupplierMapper supplierMapper;
	
	public List<Supplier> findSupplierList() {
		List<Supplier> list = supplierMapper.findSupplierList();
		return list;
	}

}
