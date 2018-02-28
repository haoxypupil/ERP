package com.zb.mapper;

import java.util.List;
import java.util.Map;

import com.zb.entity.Invoice;


public interface InvoiceMapper {
		//��Ʊͬ��д��
		public void addInvoice(Invoice invoice);
		
		//�տ�ͬ��д��
		public void updatePayStatus(Invoice invoice);
		
		//����
		public void cancelPayStatus(Invoice invoice);
		
		//�տ�ҳ��չʾ
		public List<Invoice> findInvoiceStatusto0List(Map<String , Object> map);
		
		public  int findStatusTo0Count(Map<String , Object> map);
		
		//�տ��¼ҳ��չʾ
		public List<Invoice> findStatusTo1List(Map<String , Object> map);
				
		public  int findStatusTo1Count(Map<String , Object> map);
		
}
