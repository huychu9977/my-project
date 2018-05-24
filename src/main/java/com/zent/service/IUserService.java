package com.zent.service;

import java.util.ArrayList;

import com.zent.entity.User;

public interface IUserService {
	public ArrayList<User> getAll();
	public ArrayList<User> search(User user, Integer page, Integer check);
	public void insert(User user);
	public void update(User user);
	public void delete(User id);
}
