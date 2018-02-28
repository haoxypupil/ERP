package com.zb.mapper;

import com.zb.entity.RoleRights;

public interface RoleRightsMapper {

	/**
	 * 新增角色及对应权利
	 * @param list
	 */
	public void saveRoleRights(RoleRights roleRights);
	
	/**
	 * 删除角色及对应权利
	 * @param roleIdList
	 */
	public void deleteRoleRights(Integer roleid);
}
