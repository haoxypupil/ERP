package com.zb.service;

import java.util.List;

import com.zb.entity.Overdue;

public interface OverdueService {
	// �Ը���״̬ʱΪ0��ͬ��д��
	public void addOverdue(Overdue overdue);

	//չʾ����δ��Ʊ��Ϣ
	public List<Overdue> findOverdueList(String ovCode, String ovName,
			String ovLocalecode, String ovUnit, String ovPayunit,
			String ovInvoiceunit, String timeFrom, String timeTo,int index,int size);

	public int findOverdueCount(String ovCode, String ovName,
			String ovLocalecode, String ovUnit, String ovPayunit,
			String ovInvoiceunit, String timeFrom, String timeTo);
	
	//��Ʊ-�޸Ŀ�Ʊ״̬
	public void updateInvoiceStatus(Overdue overdue);
	
	//����-�޸��տ�״̬
	public void updateCollectionStatus(Overdue overdue);
	
	//��Ʊ-�޸Ŀ�Ʊ״̬Ϊ0
		public void updateInvoiceStatusTo0(Overdue overdue);
}
