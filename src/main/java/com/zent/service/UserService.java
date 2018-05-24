package com.zent.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.zent.dao.IUserDAO;
import com.zent.entity.User;

@Service("userService")
@Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
public class UserService implements IUserService{

	@Autowired
	IUserDAO userDAO;
	@Override
	public ArrayList<User> getAll() {
		// TODO Auto-generated method stub
		return userDAO.getAll();
	}
	@Override
	public ArrayList<User> search(User user, Integer page, Integer check) {
		// TODO Auto-generated method stub
		return userDAO.search(user, page, check);
	}
	@Override
	public void insert(User user) {
		// TODO Auto-generated method stub
		userDAO.insert(user);
	}
	@Override
	public void update(User user) {
		// TODO Auto-generated method stub
		userDAO.update(user);
	}
	@Override
	public void delete(User user) {
		// TODO Auto-generated method stub
		userDAO.delete(user);
	}

}
