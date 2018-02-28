package com.zb.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.sound.midi.VoiceStatus;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.zb.mapper.RoleMapper;
import com.zb.entity.Role;
import com.zb.service.RoleService;

@Component("roleService")
public class RoleServiceImpl implements RoleService{

	@Autowired
	private RoleMapper roleMapper;
	

	public List<Role> findRolelist(String rolename, int index, int size) {
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("start",(index-1)*size);
		map.put("end",index*size);
		if(rolename !=null&&!"".equals(rolename)){
			map.put("rolename",rolename);
		}
		return roleMapper.findRolelist(map);
	}

	public int findRoleCount(String rolename) {
		Map<String,Object> map = new HashMap<String, Object>();
		if(rolename !=null&&!"".equals(rolename)){
			map.put("rolename",rolename);
		}
		return roleMapper.findRoleCount(map);
	}

	public void addRole(Role role) {
		// TODO Auto-generated method stub
		roleMapper.addRole(role);
	}

	public void updateRole(Role role) {
		// TODO Auto-generated method stub
		roleMapper.updateRole(role);
	}

	public void delRole(Integer rid) {
		// TODO Auto-generated method stub
		roleMapper.delRole(rid);
	}

	public void  findRoleByRoleName(Role role) {
		Integer roleid = roleMapper.findRoleByRoleName(role.getRolename());
		role.setRid(roleid);
	}

	public Role findRoleById(Integer rid) {
		Role role = roleMapper.findRoleById(rid);
		return role;
	}
	
	public Integer nameCheck(String rolename) {
		Integer num = roleMapper.nameCheck(rolename);
		return num;
	}



}
