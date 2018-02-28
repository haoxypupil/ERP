package com.zb.entity;

public class Equipment {
	
		private int equId;
		private String equCode;
		private String equName;
		private String equMac;
		private String equModel;
		private String equType;
		private Supplier supplier;
		private String equIndate;
		private String equLocaleCode;
		private String equStatus;
		private int equServiceLog;
		private String equRemark;
		private String equPerson;
		private String equUpOrDown;
		
		public String getEquUpOrDown() {
			return equUpOrDown;
		}
		public void setEquUpOrDown(String equUpOrDown) {
			this.equUpOrDown = equUpOrDown;
		}
		public String getEquPerson() {
			return equPerson;
		}
		public void setEquPerson(String equPerson) {
			this.equPerson = equPerson;
		}
		public int getEquId() {
		return equId;
	}
	public void setEquId(int equId) {
		this.equId = equId;
	}
	public String getEquCode() {
		return equCode;
	}
	public void setEquCode(String equCode) {
		this.equCode = equCode;
	}
	public String getEquName() {
		return equName;
	}
	public void setEquName(String equName) {
		this.equName = equName;
	}
	public String getEquMac() {
		return equMac;
	}
	public void setEquMac(String equMac) {
		this.equMac = equMac;
	}
	public String getEquModel() {
		return equModel;
	}
	public void setEquModel(String equModel) {
		this.equModel = equModel;
	}
	public String getEquType() {
		return equType;
	}
	public void setEquType(String equType) {
		this.equType = equType;
	}
	public Supplier getSupplier() {
		return supplier;
	}
	public void setSupplier(Supplier supplier) {
		this.supplier = supplier;
	}
	public String getEquIndate() {
		return equIndate;
	}
	public void setEquIndate(String equIndate) {
		this.equIndate = equIndate;
	}
	public String getEquLocaleCode() {
		return equLocaleCode;
	}
	public void setEquLocaleCode(String equLocaleCode) {
		this.equLocaleCode = equLocaleCode;
	}
	public String getEquStatus() {
		return equStatus;
	}
	public void setEquStatus(String equStatus) {
		this.equStatus = equStatus;
	}
	public int getEquServiceLog() {
		return equServiceLog;
	}
	public void setEquServiceLog(int equServiceLog) {
		this.equServiceLog = equServiceLog;
	}
	public String getEquRemark() {
		return equRemark;
	}
	public void setEquRemark(String equRemark) {
		this.equRemark = equRemark;
	}
		
}
