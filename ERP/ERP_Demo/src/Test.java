import java.io.File;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import oracle.net.aso.e;
import oracle.net.aso.i;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.sun.java.swing.plaf.windows.WindowsInternalFrameTitlePane.ScalableIconUIResource;
import com.sun.org.apache.regexp.internal.recompile;
import com.zb.entity.Contract;
import com.zb.entity.Employee;
import com.zb.entity.Equ_Locale;
import com.zb.entity.Equipment;
import com.zb.entity.Invoice;
import com.zb.entity.LocaleArea;
import com.zb.entity.LocaleBasicInfo;
import com.zb.entity.LocaleIdType;
import com.zb.entity.LocaleNetway;
import com.zb.entity.LocaleOperator;
import com.zb.entity.LocaleType;
import com.zb.entity.Maintenance;
import com.zb.entity.Overdue;
import com.zb.entity.Rights;
import com.zb.entity.Role;
import com.zb.entity.Supplier;
import com.zb.entity.Users;
import com.zb.service.ContractService;
import com.zb.service.Equ_LocaleService;
import com.zb.service.EquipmentService;
import com.zb.service.InvoiceService;
import com.zb.service.LocaleBasicInfoService;
import com.zb.service.MaintenanceService;
import com.zb.service.OverdueService;
import com.zb.service.RightService;
import com.zb.service.RoleRightsService;
import com.zb.service.RoleService;
import com.zb.service.UserService;
import com.zb.util.CSVBean;


public class Test {
	public static void main(String[] args) {
			ApplicationContext ac = new ClassPathXmlApplicationContext("applicationContext.xml");
		
//			UserService us =(UserService)ac.getBean("userService");
//	
//			Users u = us.findUserLogin("root", "123");
//			Role r = u.getRole();
//			System.out.println(u.getUsername()+"  "+r.getRolename()+" "+u.getRole().getRid());
//			List<Rights> list = r.getRights();
//			for (Rights rights : list) {
//		    System.out.println(rights.getRightsname());
//	    	System.out.println(rights.getId());
//			System.out.println(rights.getParentid());
//			}
			
//			PuductService ps = (PuductService)ac.getBean("puductService");
//			List<Puduct> list = ps.findSupplierPage("交", null,1,5);
//			for(Puduct p : list ){
//				System.out.println(p.getPname()+"    "+p.getSupplier().getSuname());
//			}
			
//			SupplierService ss = (SupplierService)ac.getBean("supplierService");
//			List<Supplier> list = ss.findSupplierList();
//			for(Supplier s : list){
//			System.out.println(s.getSuname()+" "+s.getSuid());
//			}
//			List<Supplier> list = ss.findSupplierPage(null,1,5);
//			for(Supplier s : list){
//				System.out.println(s.getSuname()+" "+s.getSuid()+" "+s.getSulevel().getLname());
//			}
//		
			
//			
	LocaleBasicInfoService lbs = (LocaleBasicInfoService)ac.getBean("localeBasicInfoService");
//	LocaleBasicInfo localeBasicInfo = new LocaleBasicInfo();
//	localeBasicInfo.setLocaleCode("31011521141250");
	List<LocaleBasicInfo> list  = lbs.findLocaleNameAndLocaleCodeList();
			for(LocaleBasicInfo lbi : list ){
				System.out.println(lbi.getLocaleCode()+"  "+lbi.getLocaleName());
			}
	
//	List<LocaleBasicInfo> list = lbs.findLocaleBasicInfo(null, null, null,1,10);
//	List<String> dataList = new ArrayList<String>();
//	for(LocaleBasicInfo lbi : list){
//			dataList.add(lbi.getLocaleCode()+","+lbi.getLocaleName());
//	}
//	boolean inSuccess = CSVBean.exportCsv(new File("c:/app/csv.csv"), dataList);
//	System.out.println(inSuccess);
	
//			List<String> dataList = CSVBean.importCsv(new File("c:/app/csv2.csv"));
//				if(dataList !=null && !dataList.isEmpty()){
//					for(int i = 1;i<dataList.size();i++){
//						String data = dataList.get(i);
//						LocaleBasicInfo lbi= new LocaleBasicInfo();
//						LocaleArea localeArea = new LocaleArea();
//						LocaleIdType localeIdType = new LocaleIdType();
//						LocaleNetway localeNetway = new LocaleNetway();
//						LocaleOperator localeOperator = new LocaleOperator();
//						LocaleType localeType = new LocaleType();
//						String [] source = data.split(",");
//					//	System.out.println(source[0]+" "+source[1]);
//					if(source[0] !=""){
//							lbi.setLocaleCode(source[0]);
//							lbi.setLocaleName(source[1]);
//							lbi.setLocaleAddress(source[2]);
//							localeArea.setAreaId(Integer.parseInt(source[3]));
//							lbi.setLocaleArea(localeArea);
//							lbi.setLocaleLongitude(source[4]);
//							lbi.setLocaleLatitude(source[5]);
//							localeType.setTypeId(Integer.parseInt(source[6]));
//							lbi.setLocaleType(localeType);
//							lbi.setLocaleNature(source[7]);
//							lbi.setLocaleLegalPerson(source[8]);
//							localeIdType.setIdTypeId(Integer.parseInt(source[9]));
//							lbi.setLocaleIdType(localeIdType);
//							lbi.setLocaleIdNum(source[10]);
//							lbi.setLocaleTelnum(source[11]);
//							lbi.setLocaleOpen(source[12]);
//							lbi.setLocaleClose(source[13]);
//							localeNetway.setNetwayId(Integer.parseInt(source[14]));
//							lbi.setLocaleNetway(localeNetway);
//							localeOperator.setOperatorId(Integer.parseInt(source[15]));
//							lbi.setLocaleOperator(localeOperator);
//							lbi.setLocaleNetadd(source[16]);
//							lbi.setLocaleOrgCode(source[17]);
//							lbi.setLocaleStatus(source[18]);
//							lbi.setLocaleVpn(source[19]);	
//							lbs.addLocale(lbi);  
//						}
//					}
//				}
//		LocaleBasicInfo lb = new LocaleBasicInfo();
//		lb.setLocaleCode("1321313");
//		LocaleBasicInfo localeBasicInfo = lbs.findLocaleNameByLocaleCode(lb);
//			System.out.println(localeBasicInfo.getLocaleName());
//		
//		
//			lb.setLocaleName("北京王府井大酒店3333");
//			lb.setLocaleCode("45643230das");
//			lb.setLocaleAddress("北京，，");
//			lb.setLocaleClose("22:00");
//			lb.setLocaleIdNum("1212121212");
//			lb.setLocaleLatitude("12.1542");
//			lb.setLocaleLegalPerson("zhangzhang");
//			lb.setLocaleLongitude("5455433");
//			lb.setLocaleNature("1");
//			lb.setLocaleOpen("09:00");
//			lb.setLocaleTelnum("01084546254");
//			lb.setLocaleMark("qiaoping");
//			lb.setLocaleNetadd("19225513");
//			lb.setLocaleOrgCode("5413612");
//			lb.setLocaleOther("qdyhdiaoa");
//			
//			LocaleType localeType = new LocaleType();
//			localeType.setTypeId(1);
//			LocaleIdType localeIdType = new LocaleIdType();
//			localeIdType.setIdTypeId(2);
//			LocaleArea localeArea = new LocaleArea();
//			localeArea.setAreaId(4);
//			LocaleOperator localeOperator = new LocaleOperator();
//			localeOperator.setOperatorId(5);
//			LocaleNetway localeNetway = new LocaleNetway();
//			localeNetway.setNetwayId(2);
//			
//			lb.setLocaleArea(localeArea);
//			lb.setLocaleIdType(localeIdType);
//			lb.setLocaleOperator(localeOperator);
//			lb.setLocaleNetway(localeNetway);
//			lb.setLocaleType(localeType);
//			lbs.addLocale(lb);
			
//			RequService rs = (RequService)ac.getBean("requService");
//			Requisition re = new Requisition();
//			Supplier supplier = new Supplier();
//			supplier.setSuid(2);
//			re.setRsupplier(supplier);
//			re.setRname("篮球求");
//			re.setRnum(10);
//			re.setRtotal(1000);
//			re.setRpicker("科比");
//			rs.addRequ(re);
			
//		    RequService rs = (RequService)ac.getBean("requService");
//			List<Requisition> list  = rs.findRequPage(null,null,null,1,5);
//			for(Requisition r : list){
//				System.out.println(r.getRname()+"  "+r.getRtotal()+" "+r.getRsupplier());
//			}
//			Requisition requisition = new Requisition();
//			requisition.setRid(23);
//			requisition.setRstatus(1);
//			rs.updateRequ(requisition);
			
			
//			SupplierService ss = (SupplierService)ac.getBean("supplierService");
//			Supplier supplier = new Supplier();
//			supplier.setSuname("apple");
//			Level level = new Level();
//			level.setLid(1);
//			supplier.setSulevel(level);
//			supplier.setSuphone("0211115111");
//			supplier.setSucity("美国");
//			supplier.setSumark("加利福尼亚");
//			ss.addSupplier(supplier);

//			  RequService rs = (RequService)ac.getBean("requService");
//			 
//			  List<Requisition> list = rs.findRequPage(null,null,null,3,1,5);
//			  for(Requisition r : list){
//				System.out.println(r.getRname()+"  "+r.getRtotal()+" "+r.getRsupplier());
//			}
			
//			 ReceiptService rs = (ReceiptService)ac.getBean("receiptService");
//			List<Receipt> list = rs.findReceiptPage(null,null,null,1,5);
//			for(Receipt r : list){
//				System.out.println(r.getRename()+" "+r.getResupplier());
//			}
//			
//			InvoiceService is = (InvoiceService)ac.getBean("invoiceService");
//			List<Invoice> list = is.findInvoPage(null,null,null,1,5);
//			for(Invoice i : list){
//				System.out.println(i.getIname()+" "+i.getIstandard());
//			}
			
//			RoleService rs =(RoleService)ac.getBean("roleService");
//			List<Role> role = rs.findRolelist(null, 1,5);
//			int count = rs.findRoleCount(null);
//			System.out.println(count);
//			for (Role r : role){
//					System.out.println(r.getRid()+"  "+r.getRolename());
//			}
//			
//			RightService rs = (RightService)ac.getBean("rightService");
//			List<Rights> list = rs.findRights();
//			for(Rights r : list){
//				System.out.println(r.getId()+" "+r.getRightsname());
//			}
			
//			UserService us =(UserService)ac.getBean("userService");
//			List<Users> u = us.findUserlist(1,5,null);
//			for(Users users : u){
//				System.out.println(users.getUname()+" "+users.getUsername());
//			}
			
//			UserService us =(UserService)ac.getBean("userService");
//			Users u = new Users();
//			u.setUname("BBB");
//			u.setUpwd("123456");
//			u.setUsername("");
//			Role r = new Role();
//			r.setRid(5);
//			u.setRole(r);
//			us.addUser(u);
//			
//			UserService us =(UserService)ac.getBean("userService");
//			List<Users> list = us.findUserlist(1,10,null,null);
//			for(Users u: list){
//				System.out.println(u.getUname()+" "+u.getUsername()+" "+u.getRole().getRolename()+" "+u.getUid());
//			}
//			RoleService rs =(RoleService)ac.getBean("roleService");
//			RoleRightsService rrs = (RoleRightsService)ac.getBean("roleRightsService");
//			Role r = new Role();
//			r.setRolename("asdasd");
//			rs.findRoleByRoleName(r);
			
			
//			MaintenanceService ms = (MaintenanceService)ac.getBean("maintenanceService");
//			List<Maintenance> list = ms.findMainList(2, null, null, null, null, null, null, null, null, null, null,1, 5);
//			int count = ms.findMainCount(2, null, null, null, null, null, null, null, null, null, null);
//			for(Maintenance  m : list){
//				System.out.println(m.getMainCompany()+" "+m.getMainFaultCause()+" "+m.getEmployee().getEmpName()+" "+m.getLocaleArea().getAreaName());
//			}
//			
//			System.out.println(count);
			
			
//			Maintenance maintenance = new Maintenance();
//			LocaleBasicInfo localeBasicInfo = new LocaleBasicInfo();
//			LocaleArea localeArea = new LocaleArea();
//			Employee employee = new Employee();
//			localeBasicInfo.setLocaleId(5);
//			localeArea.setAreaId(2);
//			employee.setEmpId(3);
//			
//			maintenance.setLocalBasicInfo(localeBasicInfo);
//			maintenance.setLocaleArea(localeArea);
//			maintenance.setEmployee(employee);
//			
//			maintenance.setMainCccType("1");
//			maintenance.setMainCompany("2");
//			maintenance.setMainDate("2017-03-23");
//			maintenance.setMainEquipmentModel("1");
//			maintenance.setMainEquipmentType("1");
//			maintenance.setMainFaultCause("1");
//			maintenance.setMainFaultDescription("qweqweqw");
//			maintenance.setMainLocaleLink("qwe");
//			maintenance.setMainLocaleStatus("1");
//			maintenance.setMainLocaleTel("0215454545");
//			maintenance.setMainProcessMode("qweqwe1");
//			maintenance.setMainResult("1");
//			maintenance.setMainType("1");
//			maintenance.setMainRemark("123123");
//			
//			
//			
//			ms.addMain(maintenance);
//			
//		EquipmentService es = (EquipmentService)ac.getBean("equipmentService");
//		Equ_LocaleService els = (Equ_LocaleService)ac.getBean("equ_LocaleService");
//				Equipment e = new Equipment();
//				e.setEquCode("23");
//				e.setEquLocaleCode("22222");
//				e.setEquUpOrDown("1");
//				Equ_Locale el = new Equ_Locale();
//				el.setEquCode("23");
//				el.setLocaleCode("22222");
//				es.equImpl(e);
//				els.implEquLocale(el);
//		
//			List<Equ_locale_el> list =es.findEquList(null, null, null,null, null, null, null, null, 1, 10);
//			int count = es.findEquCount(null, null, null, null, null, null, null, null);
//			
//			for(Equ_locale_el e: list){
//					System.out.println(e.getElequCode()+" "+e.geteLlocaleCode()+" "+e.getEquMac()+" "+e.getElTimein());
//			}
//			Equipment equipment = new Equipment();
//			Supplier supplier = new Supplier();
//			supplier.setSuId(2);
//			equipment.setEquCode("11");
//			equipment.setEquMac("2e-3e");
//			equipment.setEquModel("x86");
//			equipment.setEquName("AP");
//			equipment.setEquType("SJ");
//			equipment.setSupplier(supplier);
//			equipment.setEquRemark("1");
//			es.addEqu(equipment);
			
//			EquipmentService ems =(EquipmentService)ac.getBean("equipmentService");
//			Equ_LocaleService es = (Equ_LocaleService)ac.getBean("equ_LocaleService");
//			Equipment et = new Equipment();
//			Equ_Locale el = new Equ_Locale();
//			el.setEquCode("1212121212");
//			el.setLocaleCode("66666666666");
//			
//			et.setEquCode("1212121212");
//			et.setEquLocaleCode("66666666666");
//			et.setEquUpOrDown("1");
//			ems.equImpl(et);
//			es.implEquLocale(el);
			
//			Equ_Locale el = new Equ_Locale();
//			el.setEquCode("2222222222");
//		List<Equ_Locale> list = es.findElBackByEquCode(el);
//			for(Equ_Locale e : list){
//				System.out.println(e.getElTimeout()+" "+e.getElReason());
//			}
//			
			
//			Date date = new Date();
//			int m = date.getMonth();
//			System.out.println(m);
			
			
//	       ContractService cs =(ContractService)ac.getBean("contractService");
//			List<Contract> list = cs.findStatusInfoList(3);
//			for(Contract c : list){
//				System.out.println(c.getConName()+"  "+c.getConCode());	
//			}
//			List<Contract> list2 = cs.findContractList(null, null, null, null, null, null, null, "华住", null, null, null, 1,5);
//			for(Contract c2 : list2){
//					System.out.println(c2.getConInvoice());
//				
//			}
//			
//			InvoiceService is = (InvoiceService)ac.getBean("invoiceService");
//			Invoice invoice = new Invoice();
//			invoice.setInConcode("0000006");
//			invoice.setInConname("沪太路中网络管家");
//			invoice.setInConunit("华住酒家管理有限公司");
//			invoice.setInCycle("2");
//			invoice.setInInvoicetype("2");
//			invoice.setInInvoiceunit("华住酒家管理有限公司");
//			invoice.setInLocalecode("55555555");
//			invoice.setInPaymoney(3333);
//			invoice.setInPaytype("1");
//		    invoice.setInPayunit("华住酒家管理有限公司");
//			
//				is.addInvoice(invoice);
			
//			InvoiceService cs =(InvoiceService)ac.getBean("invoiceService");
//			List<Invoice> list = cs.findStatusTo1List(null, null, null, null, null, null, null, null, 1, 5);
//			for(Invoice i : list){
//				System.out.println(i.getInConname());
//			}
			
//			OverdueService os = (OverdueService)ac.getBean("overdueService");
//			Overdue o = new Overdue();
//				o.setOvId(10000);
//				os.updateInvoiceStatus(o);
//				System.out.println("end");	
				
				
	}
}
