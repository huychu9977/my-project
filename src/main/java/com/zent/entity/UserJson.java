package com.zent.entity;

import java.util.ArrayList;

import com.zent.entity.User;

public class UserJson {
	private Integer iTotalRecords;
	private Integer iTotalDisplayRecords;
	private ArrayList<User> aaData;

	
	public UserJson(Integer iTotalRecords, Integer iTotalDisplayRecords,
			ArrayList<User> aaData) {
		super();
		this.iTotalRecords = iTotalRecords;
		this.iTotalDisplayRecords = iTotalDisplayRecords;
		this.aaData = aaData;
	}


	public UserJson() {
		super();
	}


	public Integer getiTotalRecords() {
		return iTotalRecords;
	}


	public void setiTotalRecords(Integer iTotalRecords) {
		this.iTotalRecords = iTotalRecords;
	}


	public Integer getiTotalDisplayRecords() {
		return iTotalDisplayRecords;
	}


	public void setiTotalDisplayRecords(Integer iTotalDisplayRecords) {
		this.iTotalDisplayRecords = iTotalDisplayRecords;
	}


	public ArrayList<User> getAaData() {
		return aaData;
	}


	public void setAaData(ArrayList<User> aaData) {
		this.aaData = aaData;
	}
	
	
	
}
