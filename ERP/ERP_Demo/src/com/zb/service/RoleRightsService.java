package com.zb.service;

import java.util.List;

import com.zb.entity.RoleRights;

public interface RoleRightsService {
	/**
	 * ������ɫ����ӦȨ��
	 * @param list
	 */
	public void saveRoleRights(RoleRights roleRights);
	
	/**
	 * ɾ����ɫ����ӦȨ��
	 * @param roleIdList
	 */
	public void deleteRoleRights(Integer roleid);
}
