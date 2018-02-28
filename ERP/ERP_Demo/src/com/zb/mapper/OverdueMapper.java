package com.zb.mapper;

import java.util.List;
import java.util.Map;

import com.zb.entity.Overdue;

public interface OverdueMapper {
	//�Ը���״̬ʱΪ0��ͬ��д��
	public void addOverdue(Overdue overdue);
	
	//չʾ����δ��Ʊ��Ϣ
	public List<Overdue> findOverdueList(Map<String, Object> map);
	
	public int findOverdueCount(Map<String, Object> map);
	
	//��Ʊ-�޸Ŀ�Ʊ״̬
	public void updateInvoiceStatus(Overdue overdue);
	
	//����-�޸��տ�״̬
	public void updateCollectionStatus(Overdue overdue);
	
	//��Ʊ-�޸Ŀ�Ʊ״̬Ϊ0
	public void updateInvoiceStatusTo0(Overdue overdue);
	
}
