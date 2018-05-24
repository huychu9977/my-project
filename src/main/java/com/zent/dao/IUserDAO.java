package com.zent.dao;

import java.util.ArrayList;

import com.zent.entity.User;

public interface IUserDAO {
	public ArrayList<User> getAll();
	public void insert(User user);
	public void update(User user);
	public void delete(User user);
	public User getById(Integer id);
	public ArrayList<User> search(User user, Integer page, Integer check);
}
