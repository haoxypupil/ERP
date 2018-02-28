package com.zb.mapper;

import java.util.List;
import java.util.Map;

import com.zb.entity.Overdue;

public interface OverdueMapper {
	//对更新状态时为0的同步写入
	public void addOverdue(Overdue overdue);
	
	//展示逾期未开票信息
	public List<Overdue> findOverdueList(Map<String, Object> map);
	
	public int findOverdueCount(Map<String, Object> map);
	
	//开票-修改开票状态
	public void updateInvoiceStatus(Overdue overdue);
	
	//付款-修改收款状态
	public void updateCollectionStatus(Overdue overdue);
	
	//退票-修改开票状态为0
	public void updateInvoiceStatusTo0(Overdue overdue);
	
}
