package com.zb.mapper;

import java.util.List;
import java.util.Map;

import com.zb.entity.Invoice;


public interface InvoiceMapper {
		//开票同步写入
		public void addInvoice(Invoice invoice);
		
		//收款同步写入
		public void updatePayStatus(Invoice invoice);
		
		//作废
		public void cancelPayStatus(Invoice invoice);
		
		//收款页面展示
		public List<Invoice> findInvoiceStatusto0List(Map<String , Object> map);
		
		public  int findStatusTo0Count(Map<String , Object> map);
		
		//收款记录页面展示
		public List<Invoice> findStatusTo1List(Map<String , Object> map);
				
		public  int findStatusTo1Count(Map<String , Object> map);
		
}
