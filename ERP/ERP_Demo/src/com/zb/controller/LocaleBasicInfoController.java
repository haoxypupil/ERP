package com.zb.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zb.entity.LocaleArea;
import com.zb.entity.LocaleBasicInfo;
import com.zb.entity.LocaleIdType;
import com.zb.entity.LocaleNetway;
import com.zb.entity.LocaleOperator;
import com.zb.entity.LocaleType;
import com.zb.service.LocaleBasicInfoService;
import com.zb.util.CSVBean;

@Component
@Scope("prototype")
@RequestMapping("/localeBI.do")
public class LocaleBasicInfoController {

	@Autowired
	private LocaleBasicInfoService localeBasicInfoService;

	/**
	 * 因为前台ajax控件使用的是datagrid ， 后台接收数据时，定义的变量必须名称叫page 和rows、
	 * 
	 * @param page
	 * @param rows
	 */
	@RequestMapping(params = "findLocaleBI")
	@ResponseBody
	public Map<String, Object> findLocaleBasicInfo(Integer page, Integer rows,
			String localeCode, String localeName, Integer areaid,String localeStatus) {
		List<LocaleBasicInfo> list = localeBasicInfoService
				.findLocaleBasicInfo(localeCode, localeName, areaid,localeStatus,page, rows);
		int count = localeBasicInfoService.findLocaleBasicInfoCount(localeCode,
				localeName, areaid,localeStatus);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("total", count);
		map.put("rows", list);
		return map;
	}

	@RequestMapping(params = "addOrUpdateLocale")
	@ResponseBody
	public String addOrUpdateLocale(LocaleBasicInfo localeBasicInfo,
			Integer typeId, Integer idTypeId, Integer areaId, Integer netwayId,
			Integer operatorId) {

		LocaleType localeType = new LocaleType();
		LocaleIdType localeIdType = new LocaleIdType();
		LocaleArea localeArea = new LocaleArea();
		LocaleOperator localeOperator = new LocaleOperator();
		LocaleNetway localeNetway = new LocaleNetway();

		localeType.setTypeId(typeId);
		localeIdType.setIdTypeId(idTypeId);
		localeArea.setAreaId(areaId);
		localeOperator.setOperatorId(operatorId);
		localeNetway.setNetwayId(netwayId);

		localeBasicInfo.setLocaleArea(localeArea);
		localeBasicInfo.setLocaleIdType(localeIdType);
		localeBasicInfo.setLocaleNetway(localeNetway);
		localeBasicInfo.setLocaleType(localeType);
		localeBasicInfo.setLocaleOperator(localeOperator);

		try {
			if (localeBasicInfo.getLocaleId() == null
					|| localeBasicInfo.getLocaleId() <= 0) {
				localeBasicInfoService.addLocale(localeBasicInfo);
			} else {
				localeBasicInfoService.updateLocale(localeBasicInfo);
			}
			return "ok";
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return "error";
		}

	}

	public String delLocaleInfo(Integer localeId) {
		try {
			localeBasicInfoService.delLocale(localeId);
			return "ok";
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "error";
	}

	// 全部查询
	@RequestMapping(params = "localeList")
	@ResponseBody
	public List<LocaleBasicInfo> localeList() {
		List<LocaleBasicInfo> list = localeBasicInfoService.localeList();
		return list;
	}

	@RequestMapping(params="findByCode")
	@ResponseBody
	public String findByCode(String localeCode) {
		LocaleBasicInfo localeBasicInfo = new LocaleBasicInfo();
		localeBasicInfo.setLocaleCode(localeCode);
		LocaleBasicInfo lbi = localeBasicInfoService
				.findLocaleNameByLocaleCode(localeBasicInfo);
		return lbi.getLocaleName();
	}

	@RequestMapping(params = "findCodeAndNameList")
	@ResponseBody
	public List<LocaleBasicInfo> findCodeAndNameList() {
		List<LocaleBasicInfo> list = localeBasicInfoService
				.findLocaleNameAndLocaleCodeList();
		return list;
	}

	// 导出
	@RequestMapping(params = "exportCsv")
	@ResponseBody
	public String  exportCsv(String localeCode, String localeName, Integer areaid,String localeStatus) {
		try {
			List<String> dataList = new ArrayList<String>();
			List<LocaleBasicInfo> list = localeBasicInfoService
					.findLocaleBasicInfo(localeCode, localeName, areaid,localeStatus,1, 10000);
			dataList.add("场所编码,场所名称,场所地址,所属区域,场所经度,场所纬度,场所类型,经营性质,场所法人代表,证件类型,证件号码,联系方式,场所营业开始时间,场所营业结束时间,网络接入方式,网络运营商,网络接入账号,场所机构代码,营业状态,VPN,");
			for (LocaleBasicInfo lbi : list) {
				dataList.add(lbi.getLocaleCode() + "\t,\t"
						+ lbi.getLocaleName() + ","
						+ lbi.getLocaleAddress() + ","
						+ lbi.getLocaleArea().getAreaName() + ","
						+ lbi.getLocaleLongitude() + "\t,\t" 
						+ lbi.getLocaleLatitude()+ "\t," 
						+ lbi.getLocaleType().getTypeName() + "," 
						+ lbi.getLocaleNature()+ ","
						+ lbi.getLocaleLegalPerson() + ","
						+ lbi.getLocaleIdType().getIdTypeName() + ",\t" 
						+ lbi.getLocaleIdNum() + "\t,\t"
						+ lbi.getLocaleTelnum() + "\t," 
						+ lbi.getLocaleOpen() + ","
						+ lbi.getLocaleClose() + ","
						+ lbi.getLocaleNetway().getNetwayName() + ","
						+ lbi.getLocaleOperator().getOperatorName() + ",\t"
						+ lbi.getLocaleNetadd() + "\t,\t" 
						+ lbi.getLocaleOrgCode()+ "\t,\t"
						+ lbi.getLocaleStatus() + ",\t" 
						+ lbi.getLocaleVpn());
			}
			boolean isSuccess = CSVBean.exportCsv(new File("c:/app/csv.csv"),
					dataList);
			System.out.println(isSuccess);
			return "ok";
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "error";
	}
	
	//导入
	@RequestMapping(params = "importCsv")
	@ResponseBody
	public String importCsv(){
		try {
			List<String> dataList = CSVBean.importCsv(new File("c:/app/csv2.csv"));
			if(dataList !=null && !dataList.isEmpty()){
				for(int i = 1;i<dataList.size();i++){
					String data = dataList.get(i);
					LocaleBasicInfo lbi= new LocaleBasicInfo();
					LocaleArea localeArea = new LocaleArea();
					LocaleIdType localeIdType = new LocaleIdType();
					LocaleNetway localeNetway = new LocaleNetway();
					LocaleOperator localeOperator = new LocaleOperator();
					LocaleType localeType = new LocaleType();
					String [] source = data.split(",");
					//System.out.println(source[0]+"  "+source[1]+"  "+source[2]);
				if(source[0] !=""){
						lbi.setLocaleCode(source[0]);
						lbi.setLocaleName(source[1]);
						lbi.setLocaleAddress(source[2]);
						localeArea.setAreaId(Integer.parseInt(source[3]));
						lbi.setLocaleArea(localeArea);
						lbi.setLocaleLongitude(source[4]);
						lbi.setLocaleLatitude(source[5]);
						localeType.setTypeId(Integer.parseInt(source[6]));
						lbi.setLocaleType(localeType);
						lbi.setLocaleNature(source[7]);
						lbi.setLocaleLegalPerson(source[8]);
						localeIdType.setIdTypeId(Integer.parseInt(source[9]));
						lbi.setLocaleIdType(localeIdType);
						lbi.setLocaleIdNum(source[10]);
						lbi.setLocaleTelnum(source[11]);
						lbi.setLocaleOpen(source[12]);
						lbi.setLocaleClose(source[13]);
						localeNetway.setNetwayId(Integer.parseInt(source[14]));
						lbi.setLocaleNetway(localeNetway);
						localeOperator.setOperatorId(Integer.parseInt(source[15]));
						lbi.setLocaleOperator(localeOperator);
						lbi.setLocaleNetadd(source[16]);
						lbi.setLocaleOrgCode(source[17]);
						lbi.setLocaleStatus(source[18]);
						lbi.setLocaleVpn(source[19]);	
						localeBasicInfoService.addLocale(lbi);
					}
				}
			}
			return "ok";
		} catch (NumberFormatException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return "error";
		}
		
		
	}
}
