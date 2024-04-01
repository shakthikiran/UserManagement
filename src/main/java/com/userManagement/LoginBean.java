package com.userManagement;

public class LoginBean {
	private String uname;
	private String password;
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	public boolean validate() {
		if(password.equals("rsa0502$")) {
			return true;
		}
		return false;
	}
	public void setPassword(String password) {
		this.password = password;
	}
}
