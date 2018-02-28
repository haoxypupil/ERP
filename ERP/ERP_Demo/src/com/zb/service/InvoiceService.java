package com.zb.service;

import java.util.List;
import java.util.Map;

import com.zb.entity.Invoice;

public interface InvoiceService {
	// 开票同步写入
	public void addInvoice(Invoice invoice);

	// 收款同步写入
	public void updatePayStatus(Invoice invoice);

	//作废
	public void cancelPayStatus(Invoice invoice);
			
	//收款页面展示
	public List<Invoice> findInvoiceStatusto0List(String inConcode,
			String inConname, String inLocalecode, String inConunit,
			String inPayunit, String inInvoiceunit,int index,int size);

	public int findStatusTo0Count(String inConcode,
			String inConname, String inLocalecode, String inConunit,
			String inPayunit, String inInvoiceunit);
	
	//已收款页面展示
		public List<Invoice> findStatusTo1List(String inConcode,
				String inConname, String inLocalecode, String inConunit,
				String inPayunit, String inInvoiceunit, String timeFrom,String timeTo,int index,int size);

		public int findStatusTo1Count(String inConcode,
				String inConname, String inLocalecode, String inConunit,
				String inPayunit, String inInvoiceunit,String timeFrom,String timeTo);
}
