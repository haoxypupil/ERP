package com.zb.entity;

public class Rights {
	private Integer id;
	private String rightsname;
	private Integer parentid;
	private String url;
	
	public String getRightsname() {
		return rightsname;
	}
	public void setRightsname(String rightsname) {
		this.rightsname = rightsname;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getParentid() {
		return parentid;
	}
	public void setParentid(Integer parentid) {
		this.parentid = parentid;
	}
	
	
}
