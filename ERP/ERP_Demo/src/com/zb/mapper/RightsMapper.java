package com.zb.mapper;

import java.util.List;

import com.zb.entity.Rights;

public interface RightsMapper {

	/**
	 * 对权限功能进行全部查询
	 * @return
	 */
	public List<Rights> findRights();
}
