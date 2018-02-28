package com.zb.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zb.entity.Rights;
import com.zb.service.RightService;

@Component
@Scope("prototype")
@RequestMapping("/rights.do")
public class RightsController {
	
		@Autowired
		private RightService rightService;
		/**
		 * 查询全部权限
		 * @return
		 */
		@RequestMapping(params = "findRights")
		@ResponseBody
		public List<Rights> findRights(){
			List<Rights> list = rightService.findRights();
			return list;
	}
}
