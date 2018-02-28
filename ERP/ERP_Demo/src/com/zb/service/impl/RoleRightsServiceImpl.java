package com.zb.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.zb.entity.RoleRights;
import com.zb.mapper.RoleRightsMapper;
import com.zb.service.RoleRightsService;

@Component("roleRightsService")
public class RoleRightsServiceImpl implements RoleRightsService{

	@Autowired
	private RoleRightsMapper roleRightsMapper;
	

	/**
	 * 新增角色及对应权利集合
	 * @param list
	 */
	public void saveRoleRights(RoleRights roleRights) {
		roleRightsMapper.saveRoleRights(roleRights);
	}
	/**
	 * 删除角色及对应权利集合
	 * @param roleidList
	 */
	public void deleteRoleRights(Integer roleid) {
		// TODO Auto-generated method stub
		roleRightsMapper.deleteRoleRights(roleid);
	}

}
