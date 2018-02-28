package com.siemens.test;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.print.attribute.HashAttributeSet;

import net.sf.json.JSONArray;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.siemens.controller.WebController;
import com.siemens.entity.Website;
import com.siemens.serviceImpl.webServiceImpl;


public class test {
	public static void main(String[] args) {
		ApplicationContext ac = new ClassPathXmlApplicationContext("applicationContext.xml");
		
		 webServiceImpl wsi = (webServiceImpl)ac.getBean("webServiceImpl");
		 
//		 List<Website> list = wsi.findWinList();
		 
//		 for (Website web :list) {  
//			  
//			    System.out.println(web.getW_name());  
//			  
//			}  
//		 Map<String, Object> map = new HashMap<String, Object>();
		 List<Website> list = wsi.findById(2);
		 System.out.println(list);

	}
}
