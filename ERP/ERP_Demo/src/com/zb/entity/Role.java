package com.zb.entity;

import java.util.ArrayList;
import java.util.List;

public class Role {
	private Integer rid;
	private String rolename;
	private List<Rights> rights = new ArrayList<Rights>();
	

	public Integer getRid() {
		return rid;
	}
	public void setRid(Integer rid) {
		this.rid = rid;
	}
	public String getRolename() {
		return rolename;
	}
	public void setRolename(String rolename) {
		this.rolename = rolename;
	}
	public List<Rights> getRights() {
		return rights;
	}
	public void setRights(List<Rights> rights) {
		this.rights = rights;
	}
	
	
}
