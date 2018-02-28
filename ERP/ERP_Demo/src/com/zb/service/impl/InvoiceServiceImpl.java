package com.zb.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.zb.entity.Invoice;
import com.zb.mapper.InvoiceMapper;
import com.zb.service.InvoiceService;

@Component("invoiceService")
public class InvoiceServiceImpl implements InvoiceService {

		@Autowired
		private InvoiceMapper invoiceMapper;
		
	public void addInvoice(Invoice invoice) {
		// TODO Auto-generated method stub
		invoiceMapper.addInvoice(invoice);
	}

	public void updatePayStatus(Invoice invoice) {
		// TODO Auto-generated method stub
		invoiceMapper.updatePayStatus(invoice);
	}

	public List<Invoice> findInvoiceStatusto0List(String inConcode,
			String inConname, String inLocalecode, String inConunit,
			String inPayunit, String inInvoiceunit, int index, int size) {
		Map<String,Object> map = new HashMap<String, Object>();
		
			map.put("start", (index-1) * size);
			map.put("end", index * size);
			
			if(inConcode !=null&&!"".equals(inConcode)){
				map.put("inConcode", inConcode);	
			}
			if(inConname !=null&&!"".equals(inConname)){
				map.put("inConname", inConname);	
			}
			if(inLocalecode !=null&&!"".equals(inLocalecode)){
				map.put("inLocalecode", inLocalecode);	
			}
			if(inConunit !=null&&!"".equals(inConunit)){
				map.put("inConunit", inConunit);	
			}
			if(inPayunit !=null&&!"".equals(inPayunit)){
				map.put("inPayunit", inPayunit);	
			}
			if(inInvoiceunit !=null&&!"".equals(inInvoiceunit)){
				map.put("inInvoiceunit", inInvoiceunit);	
			}
			return invoiceMapper.findInvoiceStatusto0List(map);
	}

	public int findStatusTo0Count(String inConcode, String inConname,
			String inLocalecode, String inConunit, String inPayunit,
			String inInvoiceunit) {
		Map<String,Object> map = new HashMap<String, Object>();
		
		if(inConcode !=null&&!"".equals(inConcode)){
			map.put("inConcode", inConcode);	
		}
		if(inConname !=null&&!"".equals(inConname)){
			map.put("inConname", inConname);	
		}
		if(inLocalecode !=null&&!"".equals(inLocalecode)){
			map.put("inLocalecode", inLocalecode);	
		}
		if(inConunit !=null&&!"".equals(inConunit)){
			map.put("inConunit", inConunit);	
		}
		if(inPayunit !=null&&!"".equals(inPayunit)){
			map.put("inPayunit", inPayunit);	
		}
		if(inInvoiceunit !=null&&!"".equals(inInvoiceunit)){
			map.put("inInvoiceunit", inInvoiceunit);	
		}
		return invoiceMapper.findStatusTo0Count(map);
	}

	//收款记录页面展示
	public List<Invoice> findStatusTo1List(String inConcode,
			String inConname, String inLocalecode, String inConunit,
			String inPayunit, String inInvoiceunit, String timeFrom,
			String timeTo, int index, int size) {
		Map<String,Object> map = new HashMap<String, Object>();
		
		map.put("start", (index-1) * size);
		map.put("end", index * size);
		
		if(inConcode !=null&&!"".equals(inConcode)){
			map.put("inConcode", inConcode);	
		}
		if(inConname !=null&&!"".equals(inConname)){
			map.put("inConname", inConname);	
		}
		if(inLocalecode !=null&&!"".equals(inLocalecode)){
			map.put("inLocalecode", inLocalecode);	
		}
		if(inConunit !=null&&!"".equals(inConunit)){
			map.put("inConunit", inConunit);	
		}
		if(inPayunit !=null&&!"".equals(inPayunit)){
			map.put("inPayunit", inPayunit);	
		}
		if(inInvoiceunit !=null&&!"".equals(inInvoiceunit)){
			map.put("inInvoiceunit", inInvoiceunit);	
		}
		if(timeFrom !=null&&!"".equals(timeFrom)){
			map.put("timeFrom", timeFrom);	
		}
		if(timeTo !=null&&!"".equals(timeTo)){
			map.put("timeTo", timeTo);	
		}
		return invoiceMapper.findStatusTo1List(map);
	}

	public int findStatusTo1Count(String inConcode, String inConname,
			String inLocalecode, String inConunit, String inPayunit,
			String inInvoiceunit, String timeFrom, String timeTo) {
		Map<String,Object> map = new HashMap<String, Object>();
		
		if(inConcode !=null&&!"".equals(inConcode)){
			map.put("inConcode", inConcode);	
		}
		if(inConname !=null&&!"".equals(inConname)){
			map.put("inConname", inConname);	
		}
		if(inLocalecode !=null&&!"".equals(inLocalecode)){
			map.put("inLocalecode", inLocalecode);	
		}
		if(inConunit !=null&&!"".equals(inConunit)){
			map.put("inConunit", inConunit);	
		}
		if(inPayunit !=null&&!"".equals(inPayunit)){
			map.put("inPayunit", inPayunit);	
		}
		if(inInvoiceunit !=null&&!"".equals(inInvoiceunit)){
			map.put("inInvoiceunit", inInvoiceunit);	
		}
		if(timeFrom !=null&&!"".equals(timeFrom)){
			map.put("timeFrom", timeFrom);	
		}
		if(timeTo !=null&&!"".equals(timeTo)){
			map.put("timeTo", timeTo);	
		}
		return invoiceMapper.findStatusTo1Count(map);
	}

	public void cancelPayStatus(Invoice invoice) {
		// TODO Auto-generated method stub
		invoiceMapper.cancelPayStatus(invoice);
	}
		
}
