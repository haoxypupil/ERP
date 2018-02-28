package com.zb.service;

import java.util.List;
import java.util.Map;

import com.zb.entity.Invoice;

public interface InvoiceService {
	// ��Ʊͬ��д��
	public void addInvoice(Invoice invoice);

	// �տ�ͬ��д��
	public void updatePayStatus(Invoice invoice);

	//����
	public void cancelPayStatus(Invoice invoice);
			
	//�տ�ҳ��չʾ
	public List<Invoice> findInvoiceStatusto0List(String inConcode,
			String inConname, String inLocalecode, String inConunit,
			String inPayunit, String inInvoiceunit,int index,int size);

	public int findStatusTo0Count(String inConcode,
			String inConname, String inLocalecode, String inConunit,
			String inPayunit, String inInvoiceunit);
	
	//���տ�ҳ��չʾ
		public List<Invoice> findStatusTo1List(String inConcode,
				String inConname, String inLocalecode, String inConunit,
				String inPayunit, String inInvoiceunit, String timeFrom,String timeTo,int index,int size);

		public int findStatusTo1Count(String inConcode,
				String inConname, String inLocalecode, String inConunit,
				String inPayunit, String inInvoiceunit,String timeFrom,String timeTo);
}
