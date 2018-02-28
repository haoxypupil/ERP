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
	 * ������ɫ����ӦȨ������
	 * @param list
	 */
	public void saveRoleRights(RoleRights roleRights) {
		roleRightsMapper.saveRoleRights(roleRights);
	}
	/**
	 * ɾ����ɫ����ӦȨ������
	 * @param roleidList
	 */
	public void deleteRoleRights(Integer roleid) {
		// TODO Auto-generated method stub
		roleRightsMapper.deleteRoleRights(roleid);
	}

}
