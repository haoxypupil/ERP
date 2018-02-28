package com.zb.controller;

import org.springframework.beans.factory.annotation.Autowired;

import com.zb.service.ContractService;

public class TimeJob {
	
	@Autowired
	private ContractService contractService;
	
		public void doTimeJob(){
				contractService.findStatusInfoList(2);
			
		}
}
