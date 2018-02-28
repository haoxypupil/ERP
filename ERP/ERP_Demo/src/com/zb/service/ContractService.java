package com.zb.service;

import java.util.List;
import java.util.Map;

import com.zb.entity.Contract;

public interface ContractService {

	// 查询
	public List<Contract> findContractList(String conCode, String conName,
			String conTimefrom, String conTimeto, String conLinkman,
			String conCycle, String conUnit, String conInvoice,
			String conPayunit, String conInvoicestatus, String conCollection,
			int index, int size);

	public int findContractCount(String conCode, String conName,
			String conTimefrom, String conTimeto, String conLinkman,
			String conCycle, String conUnit, String conInvoice,
			String conPayunit, String conInvoicestatus, String conCollection);

	// 添加
	public void addContract(Contract contract);

	// 修改开票和付款单位
	public void updateUnit(Contract contract);

	// 查询可开发票合同信息
	public List<Contract> findInvoidceList(String conCode, String conName,
			String conUnit, String conInvoice, String conPayunit, int index,
			int size);
	
	public int findInvoiceCount(String conCode, String conName,
			String conUnit, String conInvoice, String conPayunit);
	
	//修改开票状态进行开票操作
	public void updateInvoiceStatus(Contract contract);
	
	//退票修改退票状态为0
	public void updateInvoiceStatusTo0(Contract contract);
	
	//查询可收款信息
	public List<Contract> findCollectionList(String conCode, String conName,
			String conUnit, String conInvoice, String conPayunit, int index,
			int size);
	
	public int findCollectionCount(String conCode, String conName,
			String conUnit, String conInvoice, String conPayunit);
	
	//收款操作
	public void updateCollectionStatus(Contract contract);

/*
	public void updateJob(int Month);
	*/
	//定时查
	public  List<Contract> findStatusInfoList(int Month); 
	

}
