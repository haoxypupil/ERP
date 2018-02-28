package com.zb.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.zb.entity.RoleRights;
import com.zb.entity.Role;
import com.zb.service.RoleRightsService;
import com.zb.service.RoleService;

@Component
@Scope("prototype")
@RequestMapping("/role.do")
public class RoleController {
	
	@Autowired
	private RoleService roleService;
	
	@Autowired
	private RoleRightsService roleRightsService;
	
	/**
	 * 对角色展示及分页，
	 * 
	 * @param page
	 * @param rows
	 * @param rolename
	 * @return
	 */
	@RequestMapping(params ="findRolePage")
	@ResponseBody
	public Map<String,Object> findRolelist(Integer page,Integer rows,String rolename){
		List<Role> role = roleService.findRolelist(rolename, page, rows);
		int count = roleService.findRoleCount(rolename);
		Map<String,Object> map=new HashMap<String, Object>();
		map.put("total",count);
		map.put("rows",role);
		return map;
	}
	
	/**
	 * 保存/修改角色及其中间表数据
	 * @param role
	 * @param rightsIdList
	 * @return
	 */
	@RequestMapping(params="saveOrUpdateRole")
	@ResponseBody
	public boolean saveRole(Role role,Integer [] rightsid){

		try {
			if(role.getRid()!=null && role.getRid()>0){
				roleService.updateRole(role);
				roleRightsService.deleteRoleRights(role.getRid());
			}else{
				roleService.addRole(role);
				roleService.findRoleByRoleName(role);
			}
			
			for (Integer rgid : rightsid) {
				RoleRights rr=new RoleRights();
				rr.setRoleid(role.getRid());
				rr.setRightsid(rgid);
				System.out.println(rgid);
				System.out.println(role.getRid());
				roleRightsService.saveRoleRights(rr);
			}
				return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}		
	}
	
	/**
	 * 获得角色列表(下拉菜单)
	 * @return
	 */
	@RequestMapping(params="roleList")
	@ResponseBody
	public List<Role> findRoleList(){
		int count=roleService.findRoleCount(null);
		List<Role> roles=roleService.findRolelist(null,1,count);
		return roles;
	}
	
	/**
	 * 删除角色，--先删除中间表然后再删除角色表
	 * @param rid
	 * @return
	 */
	@RequestMapping(params = "delRole")
	@ResponseBody
	public boolean delRole(Integer rid){
		try {
			roleRightsService.deleteRoleRights(rid);
			roleService.delRole(rid);
			return true;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
	}
	
	/**
	 * 查询role表ById
	 * @param rid
	 * @return
	 */
	@RequestMapping(params="findRoleById")
	@ResponseBody
	public Role findRoleById(Integer rid){
		Role role=roleService.findRoleById(rid);
		return role;
	}
	
	/**
	 * 按名称查找
	 * @param rolename
	 * @return
	 */
	@RequestMapping(params = "nameCheck")
	@ResponseBody
	public String nameCheck(String rolename){
			int num = roleService.nameCheck(rolename);
					if(num>0){
						return "no";
					}else{
						return "ok";
					}
	}
}

