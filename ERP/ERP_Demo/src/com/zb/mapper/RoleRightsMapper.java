package com.zb.mapper;

import com.zb.entity.RoleRights;

public interface RoleRightsMapper {

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
