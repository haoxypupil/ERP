package com.zb.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zb.entity.Invoice;
import com.zb.entity.Overdue;
import com.zb.service.InvoiceService;
import com.zb.service.OverdueService;

@Component
@Scope("prototype")
@RequestMapping("/overdue.do")
public class OverdueController {
	
	@Autowired
	private OverdueService overdueService;
	
	@Autowired
	private InvoiceService invoiceService;
	
	//逾期表信息展示
	@RequestMapping(params = "findOverdueList")
	@ResponseBody
	public Map<String, Object>findOverdueList(String ovCode, String ovName,
			String ovLocalecode, String ovUnit, String ovPayunit,
			String ovInvoiceunit, String timeFrom, String timeTo, int page,
			int rows){
		Map<String,Object> map = new HashMap<String, Object>();
		List<Overdue> list = overdueService.findOverdueList(ovCode, ovName, ovLocalecode, ovUnit, ovPayunit, ovInvoiceunit, timeFrom, timeTo, page, rows);
		int count = overdueService.findOverdueCount(ovCode, ovName, ovLocalecode, ovUnit, ovPayunit, ovInvoiceunit, timeFrom, timeTo);
		map.put("total", count);
		map.put("rows",list);
		return map;
	}
	
	//修改逾期表开票状态-同步写入发票待付款表
	@RequestMapping(params = "updateInvoiceStatus")
	@ResponseBody
	public String updateInvoiceStatus(Overdue overdue){
		Invoice invoice = new Invoice();
		invoice.setInConcode(overdue.getOvCode());
		invoice.setInConname(overdue.getOvName());
		invoice.setInConunit(overdue.getOvUnit());
		invoice.setInCycle(overdue.getOvCycle());
		invoice.setInInvoicetype(overdue.getOvInvoicetype());
		invoice.setInInvoiceunit(overdue.getOvInvoiceunit());
		invoice.setInLocalecode(overdue.getOvLocalecode());
		invoice.setInPaymoney(overdue.getOvPaymoney());
		invoice.setInPaytype(overdue.getOvPaymethod());
		invoice.setInPayunit(overdue.getOvPayunit());
		invoice.setInOvid(overdue.getOvId());
		try {
			invoiceService.addInvoice(invoice);
			overdueService.updateInvoiceStatus(overdue);
			return "ok";
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return "error";
		}
	}
}
