package com.zb.service.impl;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import com.zb.entity.Contract;
import com.zb.entity.Overdue;
import com.zb.mapper.ContractMapper;
import com.zb.mapper.OverdueMapper;
import com.zb.service.ContractService;
@Service
@Component("contractService")
public class ContractServiceImpl implements ContractService{

	@Autowired
	private ContractMapper contractMapper;
	
	@Autowired
	private OverdueMapper overdueMapper;

	public List<Contract> findContractList(String conCode, String conName,
			String conTimefrom, String conTimeto, String conLinkman,
			String conCycle, String conUnit, String conInvoice,
			String conPayunit, String conInvoicestatus, String conCollection,int index,int size) {
			Map<String,Object> map = new HashMap<String, Object>();
			map.put("start", (index-1)*size);
			map.put("end", index*size);
			
			if(conCode !=null&& !"".equals(conCode)){
				map.put("conCode", conCode);
			}
			if(conName !=null&& !"".equals(conName)){
				map.put("conName", conName);
			}
			if(conTimefrom !=null&& !"".equals(conTimefrom)){
				map.put("conTimefrom", conTimefrom);
			}
			if(conTimeto !=null&& !"".equals(conTimeto)){
				map.put("conTimeto", conTimeto);
			}
			if(conLinkman !=null&& !"".equals(conLinkman)){
				map.put("conLinkman", conLinkman);
			}
			if(conCycle !=null&& !"".equals(conCycle)){
				map.put("conCycle", conCycle);
			}
			if(conUnit !=null&& !"".equals(conUnit)){
				map.put("conUnit", conUnit);
			}
			if(conInvoice !=null&& !"".equals(conInvoice)){
				map.put("conInvoice", conInvoice);
			}
			if(conPayunit !=null&& !"".equals(conPayunit)){
				map.put("conPayunit", conPayunit);
			}
			if(conInvoicestatus !=null&& !"".equals(conInvoicestatus)){
				map.put("conInvoicestatus", conInvoicestatus);
			}
			if(conCollection !=null&& !"".equals(conCollection)){
				map.put("conCollection", conCollection);
			}	
		return contractMapper.findContractList(map);
	}

	public int findContractCount(String conCode, String conName,
			String conTimefrom, String conTimeto, String conLinkman,
			String conCycle, String conUnit, String conInvoice,
			String conPayunit, String conInvoicestatus, String conCollection) {
		
		
			Map<String,Object> map = new HashMap<String, Object>();
			
			if(conCode !=null&& !"".equals(conCode)){
				map.put("conCode", conCode);
			}
			if(conName !=null&& !"".equals(conName)){
				map.put("conName", conName);
			}
			if(conTimefrom !=null&& !"".equals(conTimefrom)){
				map.put("conTimefrom", conTimefrom);
			}
			if(conTimeto !=null&& !"".equals(conTimeto)){
				map.put("conTimeto", conTimeto);
			}
			if(conLinkman !=null&& !"".equals(conLinkman)){
				map.put("conLinkman", conLinkman);
			}
			if(conCycle !=null&& !"".equals(conCycle)){
				map.put("conCycle", conCycle);
			}
			if(conUnit !=null&& !"".equals(conUnit)){
				map.put("conUnit", conUnit);
			}
			if(conInvoice !=null&& !"".equals(conInvoice)){
				map.put("conInvoice", conInvoice);
			}
			if(conPayunit !=null&& !"".equals(conPayunit)){
				map.put("conPayunit", conPayunit);
			}
			if(conInvoicestatus !=null&& !"".equals(conInvoicestatus)){
				map.put("conInvoicestatus", conInvoicestatus);
			}
			if(conCollection !=null&& !"".equals(conCollection)){
				map.put("conCollection", conCollection);
			}	
		return contractMapper.findContractCount(map);
	}

	public void addContract(Contract contract) {
		// TODO Auto-generated method stub
		contractMapper.addContract(contract);
	}

	public void updateUnit(Contract contract) {
		// TODO Auto-generated method stub
		contractMapper.updateUnit(contract);
	}

	public List<Contract> findInvoidceList(String conCode, String conName,
			String conUnit, String conInvoice, String conPayunit, int index,
			int size) {
		
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("start", (index-1)*size);
		map.put("end", index*size);
		Date date =new Date();
		int Month1 = date.getMonth();
		map.put("Month", Month1+1);
		
		
		if(conCode !=null&& !"".equals(conCode)){
			map.put("conCode", conCode);
		}
		if(conName !=null&& !"".equals(conName)){
			map.put("conName", conName);
		}
		if(conUnit !=null&& !"".equals(conUnit)){
			map.put("conUnit", conUnit);
		}
		if(conInvoice !=null&& !"".equals(conInvoice)){
			map.put("conInvoice", conInvoice);
		}
		if(conPayunit !=null&& !"".equals(conPayunit)){
			map.put("conPayunit", conPayunit);
		}
		return contractMapper.findInvoidceList(map);
	}

	public int findInvoiceCount(String conCode, String conName, String conUnit,
			String conInvoice, String conPayunit) {
		Map<String,Object> map = new HashMap<String, Object>();
		
		Date date =new Date();
		int Month1 = date.getMonth();
		map.put("Month", Month1+1);
		
		if(conCode !=null&& !"".equals(conCode)){
			map.put("conCode", conCode);
		}
		if(conName !=null&& !"".equals(conName)){
			map.put("conName", conName);
		}
		if(conUnit !=null&& !"".equals(conUnit)){
			map.put("conUnit", conUnit);
		}
		if(conInvoice !=null&& !"".equals(conInvoice)){
			map.put("conInvoice", conInvoice);
		}
		if(conPayunit !=null&& !"".equals(conPayunit)){
			map.put("conPayunit", conPayunit);
		}
		return contractMapper.findInvoiceCount(map);
	}

	public void updateInvoiceStatus(Contract contract) {
		// TODO Auto-generated method stub
		contractMapper.updateInvoiceStatus(contract);
	}

	public List<Contract> findCollectionList(String conCode, String conName,
			String conUnit, String conInvoice, String conPayunit, int index,
			int size) {
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("start", (index-1)*size);
		map.put("end", index*size);
		
		if(conCode !=null&& !"".equals(conCode)){
			map.put("conCode", conCode);
		}
		if(conName !=null&& !"".equals(conName)){
			map.put("conName", conName);
		}
		if(conUnit !=null&& !"".equals(conUnit)){
			map.put("conUnit", conUnit);
		}
		if(conInvoice !=null&& !"".equals(conInvoice)){
			map.put("conInvoice", conInvoice);
		}
		if(conPayunit !=null&& !"".equals(conPayunit)){
			map.put("conPayunit", conPayunit);
		}
		return contractMapper.findCollectionList(map);
	}

	public int findCollectionCount(String conCode, String conName,
			String conUnit, String conInvoice, String conPayunit) {
		Map<String,Object> map = new HashMap<String, Object>();
		
		if(conCode !=null&& !"".equals(conCode)){
			map.put("conCode", conCode);
		}
		if(conName !=null&& !"".equals(conName)){
			map.put("conName", conName);
		}
		if(conUnit !=null&& !"".equals(conUnit)){
			map.put("conUnit", conUnit);
		}
		if(conInvoice !=null&& !"".equals(conInvoice)){
			map.put("conInvoice", conInvoice);
		}
		if(conPayunit !=null&& !"".equals(conPayunit)){
			map.put("conPayunit", conPayunit);
		}
		return contractMapper.findCollectionCount(map);
	}

	public void updateCollectionStatus(Contract contract) {
		// TODO Auto-generated method stub
		contractMapper.updateCollectionStatus(contract);
	}
	
	//更新为1的状态改为0
	public void updateJob(int Month) {
		Date date = new Date();
		Month = date.getMonth();
		contractMapper.updateJob(Month);
	}


	//查询上个月为0的 写入逾期表///为1的更新状态为0
	public  List<Contract> findStatusInfoList(int Month) {
		Date date = new Date();
		Month = date.getMonth();
		
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("Month", Month);
		List<Contract> list = contractMapper.findStatusInfoList(map);
		Overdue overdue = new Overdue();
		for(Contract c : list){
			overdue.setOvCode(c.getConCode());
			overdue.setOvName(c.getConName());
			overdue.setOvAmount(c.getConAmount());
			overdue.setOvCycle(c.getConCycle());
			overdue.setOvPaymethod(c.getConPaymethod());
			overdue.setOvLocalecode(c.getConLocalecode());
			overdue.setOvUnit(c.getConUnit());
			overdue.setOvInvoiceunit(c.getConInvoice());
			overdue.setOvPayunit(c.getConPayunit());
			overdue.setOvPaymoney(c.getConPaymoney());
			overdue.setOvInvoicetype(c.getConInvoicetype());
			overdueMapper.addOverdue(overdue);
		}
		
		//更新为1的状态改为0
			contractMapper.updateJob(Month);
		System.out.println("更新"+Month+"月状态开始执行。。。");
		
		return list;
	}

	public void updateInvoiceStatusTo0(Contract contract) {
		// TODO Auto-generated method stub
			contractMapper.updateInvoiceStatusTo0(contract);
	}
	
}
