package com.zb.mapper;

import java.util.List;
import java.util.Map;

import com.zb.entity.Contract;

public interface ContractMapper {
	
	//查询
	public List<Contract> findContractList(Map<String , Object> map);
	
	public int findContractCount(Map<String , Object> map);
	
	//添加
	public void addContract(Contract contract);
	
	//修改开票和付款单位
	public void updateUnit(Contract contract);
	
	//查询可开发票合同信息
	public List<Contract> findInvoidceList(Map<String , Object> map);
	
	public int findInvoiceCount(Map<String,Object> map);
	
	//修改开票状态进行开票操作
	public void updateInvoiceStatus(Contract contract);
	
	//退票修改退票状态为0
	public void updateInvoiceStatusTo0(Contract contract);
	
	//查询可收款信息
	public List<Contract> findCollectionList(Map<String, Object> map);
	
	public int findCollectionCount(Map<String ,Object> map);
	
	//收款操作
	public void updateCollectionStatus(Contract contract);
	
	//定时更新的方法
	public void updateJob(int Mouth);
	
	//定时查
	public List<Contract>  findStatusInfoList(Map<String, Object> map); 
}
