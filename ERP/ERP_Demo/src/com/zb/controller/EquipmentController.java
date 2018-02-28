package com.zb.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zb.entity.Equ_Locale;
import com.zb.entity.Equipment;
import com.zb.entity.Supplier;
import com.zb.service.Equ_LocaleService;
import com.zb.service.EquipmentService;

@Component
@Scope("prototype")
@RequestMapping("/equipment.do")
public class EquipmentController {
	
		@Autowired
		private EquipmentService equipmentService;
		
		@Autowired
		private Equ_LocaleService equ_LocaleService;
		
		@RequestMapping(params="EquList")
		@ResponseBody
		public Map<String, Object> findEquList(String equCode,String equMac,String equModel,String equType,Integer suid, String equLocaleCode, String equStatus, Integer equServiceLog,String equUpOrDown,int page,int rows){
	
			
		List<Equipment> list = 	equipmentService.findEquList(equCode, equMac, equModel, equType, suid, equLocaleCode, equStatus, equServiceLog,equUpOrDown, page, rows);
		int count = equipmentService.findEquCount(equCode, equMac, equModel, equType, suid, equLocaleCode, equStatus, equServiceLog,equUpOrDown);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("total",count);
		map.put("rows",list);
		
			
			return map;
		}
		//新增
		@RequestMapping(params ="addEqu")
		@ResponseBody
		public String addEquipment(Equipment equipment, Integer suid){
			
			Supplier supplier = new Supplier();
			supplier.setSuId(suid);
			equipment.setSupplier(supplier);
			try {
				equipmentService.addEqu(equipment);
				return "ok";
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				return "error";
			}
			
		}
		
		//出库或暂借
		@RequestMapping(params = "equOut")
		@ResponseBody
		public String equOut(Equipment equipment, String elStatus){
			Equ_Locale equ_Locale = new Equ_Locale();
			equ_Locale.setEquCode(equipment.getEquCode());
			equ_Locale.setElPersonOut(equipment.getEquPerson());
			equ_Locale.setElStatus(elStatus);
			equ_Locale.setElReason(equipment.getEquRemark());
			try {
				equipmentService.equOut(equipment);
				equ_LocaleService.addEquLocale(equ_Locale);
				return "ok";
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				return "error";
			}
		}
		
		//安装
		@RequestMapping(params ="equImp")
		@ResponseBody
		public String equImpl(Equipment equipment){
			Equ_Locale equ_Locale = new Equ_Locale();
			equ_Locale.setEquCode(equipment.getEquCode());
			equ_Locale.setLocaleCode(equipment.getEquLocaleCode());
			try {
				equipmentService.equImpl(equipment);
				equ_LocaleService.implEquLocale(equ_Locale);
				return "ok";
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				return "error";
			}	
		}
		//返修
		@RequestMapping(params = "equReIn")
		@ResponseBody
		public String  equReIn(Equipment equipment,String elPersonIn,String elReason,String elStatus){
			Equ_Locale equ_Locale = new Equ_Locale();
			equ_Locale.setEquCode(equipment.getEquCode());
			equ_Locale.setElPersonIn(elPersonIn);
			equ_Locale.setElReason(elReason);
			equ_Locale.setElStatus(elStatus);
			try {
				equipmentService.equReIn(equipment);
				equ_LocaleService.reInEquLocale(equ_Locale);
				return "ok";
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				return "error";
			}
		}
		
		//返厂维修回库
		@RequestMapping(params ="equBackforSu")
		@ResponseBody
		public String equbackforSu(Equipment equipment,String elPersonIn){
			Equ_Locale equ_Locale = new Equ_Locale();
			equ_Locale.setEquCode(equipment.getEquCode());
			equ_Locale.setElPersonIn(elPersonIn);
			try {
				equipmentService.inSuEqu(equipment);
				equ_LocaleService.backInEqu(equ_Locale);
				return "ok";
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				return "error";
			}
		}
		
		@RequestMapping(params = "equUpOrDown")
		@ResponseBody
		public String equUpOrDown(Equipment equipment){
			try {
				equipmentService.equUpOrDown(equipment);
				return "ok";
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				return "error";
			}	
		}
		
		//查询返修记录
		@RequestMapping(params = "findReInList")
		@ResponseBody
		public List<Equ_Locale> findReInList(Equ_Locale equ_Locale,String equCode){
			
			equ_Locale.setEquCode(equCode);
			 List<Equ_Locale> list =  equ_LocaleService.findElByEquCode(equ_Locale);

				return list;

		}
		
		//查询返厂记录
			@RequestMapping(params ="findReSuList")
			@ResponseBody
			public List<Equ_Locale> findReSuList(Equ_Locale equ_Locale,String equCode){
				equ_Locale.setEquCode(equCode);
						List<Equ_Locale> list = equ_LocaleService.findElBackByEquCode(equ_Locale);
							return list;
			}

		
}
