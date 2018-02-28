package com.zb.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zb.entity.Contract;
import com.zb.entity.Invoice;
import com.zb.entity.Overdue;
import com.zb.service.ContractService;
import com.zb.service.InvoiceService;
import com.zb.service.OverdueService;

@Component
@Scope("prototype")
@RequestMapping("/contract.do")
public class ContractController {

	@Autowired
	private ContractService contractService;
	
	@Autowired
	private InvoiceService invoiceService;
	
	@Autowired
	private OverdueService overdueService;

	@RequestMapping(params = "findConList")
	@ResponseBody
	public Map<String, Object> findContractList(String conCode, String conName,
			String conTimefrom, String conTimeto, String conLinkman,
			String conCycle, String conUnit, String conInvoice,
			String conPayunit, String conInvoicestatus, String conCollection,
			int page, int rows) {
		List<Contract> list = contractService.findContractList(conCode,
				conName, conTimefrom, conTimeto, conLinkman, conCycle, conUnit,
				conInvoice, conPayunit, conInvoicestatus, conCollection, page,
				rows);

		int count = contractService.findContractCount(conCode, conName,
				conTimefrom, conTimeto, conLinkman, conCycle, conUnit,
				conInvoice, conPayunit, conInvoicestatus, conCollection);
		
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("total",count);
				map.put("rows",list);
		return map;
	}
	
	//新增
	@RequestMapping(params = "addCon")
	@ResponseBody
	public String addContract(Contract contract){
				try {
					contractService.addContract(contract);
					return "ok";
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
					return "error";
				}
				
	}
	//修改开票/付款单位
	@RequestMapping(params = "updateUnit")
	@ResponseBody
	public String updateUnit(Contract contract){
		try {
			contractService.updateUnit(contract);
			return "ok";
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return "error";
		}		
	}
	
	@RequestMapping(params = "findInvoiceList")
	@ResponseBody
	public Map<String, Object> findInvoiceList(String conCode, String conName,
			String conUnit, String conInvoice, String conPayunit, int page,
			int rows){
			
			List<Contract> list = contractService.findInvoidceList(conCode, conName, conUnit, conInvoice,conPayunit, page, rows);
			int count = contractService.findInvoiceCount(conCode, conName, conUnit, conInvoice, conPayunit);
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("total", count);
			map.put("rows", list);
			
				return map;
	}
	
	//通过修改开票状态进行开票操作//////同步写入发票表
	@RequestMapping(params = "updateInvoiceStatus")
	@ResponseBody
	public String updateInvoiceStatus(Contract contract){
				Invoice invoice = new Invoice();
				invoice.setInConcode(contract.getConCode());
				invoice.setInConname(contract.getConName());
				invoice.setInLocalecode(contract.getConLocalecode());
				invoice.setInConunit(contract.getConUnit());
				invoice.setInInvoiceunit(contract.getConInvoice());
				invoice.setInPayunit(contract.getConPayunit());
				invoice.setInPaymoney(contract.getConPaymoney());
				invoice.setInInvoicetype(contract.getConInvoicetype());
				invoice.setInPaytype(contract.getConPaymethod());
				invoice.setInCycle(contract.getConCycle());
				invoice.setInOvid(0);
				
		try {
			contractService.updateInvoiceStatus(contract);
			invoiceService.addInvoice(invoice);
			return "ok";
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return "error";
		}
	}
	
	
	//查出待付款的信息
	@RequestMapping(params = "findInvoiceStatusto0List")
	@ResponseBody
	public Map<String, Object> findInvoiceStatusto0List(String inConcode,
			String inConname, String inLocalecode, String inConunit,
			String inPayunit, String inInvoiceunit, int page,
			int rows){
			
			List<Invoice> list = invoiceService.findInvoiceStatusto0List(inConcode, inConname, inLocalecode, inConunit, inPayunit, inInvoiceunit, page, rows);
			int count =invoiceService.findStatusTo0Count(inConcode, inConname, inLocalecode, inConunit, inPayunit, inInvoiceunit);
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("total", count);
			map.put("rows", list);
			
			return map;
	}

	
	
	
	//收款
	@RequestMapping(params = "updateCollectionStatus")
	@ResponseBody
	public String updatePayStatus(Invoice invoice){
			Contract contract = new Contract();
			Overdue overdue = new Overdue();
			contract.setConCode(invoice.getInConcode());
			overdue.setOvId(invoice.getInOvid());
			try {
				contractService.updateCollectionStatus(contract);
				invoiceService.updatePayStatus(invoice);
				overdueService.updateCollectionStatus(overdue);
				return "ok";
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				return "error";
			}
	}
	/*
	public String aaaa(int Month){
		contractService.findStatusInfoList(Month);
		return null;
	}
	*/
	
	//已收款记录展示
	@RequestMapping(params = "findInvoiceStatusto1List")
	@ResponseBody
	public Map<String, Object> findInvoiceStatusto1List(String inConcode,
			String inConname, String inLocalecode, String inConunit,
			String inPayunit, String inInvoiceunit, String timeFrom, String timeTo, int page,
			int rows){
			
			List<Invoice> list = invoiceService.findStatusTo1List(inConcode, inConname, inLocalecode, inConunit, inPayunit, inInvoiceunit, timeFrom, timeTo, page, rows);
			int count =invoiceService.findStatusTo1Count(inConcode, inConname, inLocalecode, inConunit, inPayunit, inInvoiceunit, timeFrom, timeTo);
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("total", count);
			map.put("rows", list);
			
			return map;
	}
	
		//退票
		@RequestMapping(params = "updateInvoiceStatusTo0")
		@ResponseBody
		public String updateInvoiceStatusTo0(Invoice invoice){
				Contract contract = new Contract();
				Overdue overdue = new Overdue();
				contract.setConCode(invoice.getInConcode());
				overdue.setOvId(invoice.getInOvid());
				try {
					contractService.updateInvoiceStatusTo0(contract);
					invoiceService.cancelPayStatus(invoice);
					overdueService.updateInvoiceStatusTo0(overdue);
					return "ok";
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
					return "error";
				}
		}
}