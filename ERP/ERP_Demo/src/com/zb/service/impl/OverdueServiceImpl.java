package com.zb.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import oracle.net.aso.i;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.zb.entity.Overdue;
import com.zb.mapper.OverdueMapper;
import com.zb.service.OverdueService;

@Component("overdueService")
public class OverdueServiceImpl implements OverdueService{

	@Autowired
	public OverdueMapper overdueMapper;
	
	public void addOverdue(Overdue overdue) {
		// TODO Auto-generated method stub
		overdueMapper.addOverdue(overdue);
	}

	public List<Overdue> findOverdueList(String ovCode, String ovName,
			String ovLocalecode, String ovUnit, String ovPayunit,
			String ovInvoiceunit, String timeFrom, String timeTo, int index,
			int size) {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("start", (index-1)*size);
			map.put("end",index*size);
			
			if(ovCode !=null&&!"".equals(ovCode)){
				map.put("ovCode",ovCode);
			}
			if(ovName !=null&&!"".equals(ovName)){
				map.put("ovName",ovName);
			}
			if(ovLocalecode !=null&&!"".equals(ovLocalecode)){
				map.put("ovLocalecode",ovLocalecode);
			}
			if(ovUnit !=null&&!"".equals(ovUnit)){
				map.put("ovUnit",ovUnit);
			}
			if(ovPayunit !=null&&!"".equals(ovPayunit)){
				map.put("ovPayunit",ovPayunit);
			}
			if(ovInvoiceunit !=null&&!"".equals(ovInvoiceunit)){
				map.put("ovInvoiceunit",ovInvoiceunit);
			}
			if(timeFrom !=null&&!"".equals(timeFrom)){
				map.put("timeFrom",timeFrom);
			}
			if(timeTo !=null&&!"".equals(timeTo)){
				map.put("timeTo",timeTo);
			}
		return overdueMapper.findOverdueList(map);
	}

	public int findOverdueCount(String ovCode, String ovName,
			String ovLocalecode, String ovUnit, String ovPayunit,
			String ovInvoiceunit, String timeFrom, String timeTo) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		if(ovCode !=null&&!"".equals(ovCode)){
			map.put("ovCode",ovCode);
		}
		if(ovName !=null&&!"".equals(ovName)){
			map.put("ovName",ovName);
		}
		if(ovLocalecode !=null&&!"".equals(ovLocalecode)){
			map.put("ovLocalecode",ovLocalecode);
		}
		if(ovUnit !=null&&!"".equals(ovUnit)){
			map.put("ovUnit",ovUnit);
		}
		if(ovPayunit !=null&&!"".equals(ovPayunit)){
			map.put("ovPayunit",ovPayunit);
		}
		if(ovInvoiceunit !=null&&!"".equals(ovInvoiceunit)){
			map.put("ovInvoiceunit",ovInvoiceunit);
		}
		if(timeFrom !=null&&!"".equals(timeFrom)){
			map.put("timeFrom",timeFrom);
		}
		if(timeTo !=null&&!"".equals(timeTo)){
			map.put("timeTo",timeTo);
		}
		return overdueMapper.findOverdueCount(map);
	}

	public void updateInvoiceStatus(Overdue overdue) {
		// TODO Auto-generated method stub
		overdueMapper.updateInvoiceStatus(overdue);
	}

	public void updateCollectionStatus(Overdue overdue) {
		// TODO Auto-generated method stub
		overdueMapper.updateCollectionStatus(overdue);
	}

	public void updateInvoiceStatusTo0(Overdue overdue) {
		// TODO Auto-generated method stub
		overdueMapper.updateInvoiceStatusTo0(overdue);
	}
		
}
