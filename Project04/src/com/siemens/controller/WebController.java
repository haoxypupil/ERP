package com.siemens.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import sun.reflect.ReflectionFactory.GetReflectionFactoryAction;

import com.siemens.entity.Website;
import com.siemens.serviceImpl.webServiceImpl;

@Controller
@RequestMapping("/web.do")
public class WebController {	
	
	@Autowired
	private webServiceImpl webService;
	
	
	//返回用json序列化过的List
	@RequestMapping(params = "findMap")
	@ResponseBody
	public List<Website> findWebMap(){
		
		List<Website> list = webService.findWinList();
		JSONArray jsonArray = JSONArray.fromObject(list);
		
		//System.out.println(jsonArray);
		return jsonArray;
		
	}
	
	
	//直接返回List
	@RequestMapping(params = "findMap22")
	@ResponseBody
	public List<Map<String, Object>> findWeb(){
		List<Map<String, Object>> webmapMap = webService.findMap2();
		return webmapMap;
	}
	
	@RequestMapping(params = "findById2")
	@ResponseBody
	public List<Website> findById(int wid){
		//Map<String, Object> map = new HashMap<String, Object>();
		List<Website> webmap = webService.findById(wid);
		System.out.println(webmap);
		//map.put("webMap", webmap);
		return 	webmap;
	}
}
