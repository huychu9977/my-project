package com.zent.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.zent.entity.User;

@Repository("userDAO")
public class UserDAO extends BaseDAO implements IUserDAO {

	@Override
	public ArrayList<User> getAll() {
		String hql =" SELECT u FROM User u";
		Session session = super.getSession();
		Query query = session.createQuery(hql);
		ArrayList<User> list = (ArrayList<User>) query.list();
		return list;
	}

	@Override
	public void insert(User user) {
		// TODO Auto-generated method stub
		super.getSession().save(user);
		

	}

	@Override
	public void update(User user) {
		// TODO Auto-generated method stub
		super.getSession().update(user);

	}

	@Override
	public void delete(User user) {
		// TODO Auto-generated method stub
		super.getSession().delete(user);
		

	}

	@Override
	public User getById(Integer id) {
		// TODO Auto-generated method stub
		return null;
	}
	public static void main(String[] args) {
		ArrayList<User> list = new UserDAO().getAll();
	}

	@Override
	public ArrayList<User> search(User user, Integer page, Integer check) {
		String hql = "SELECT u FROM User u WHERE 1=1";
		HashMap<String, Object> map = new HashMap<String, Object>();
		Integer count = -1;
		
		if(user.getName()!=null) {
			hql+= " AND u.name LIKE :name";
			count++;
			map.put("name", "%"+user.getName()+"%");
		}
		if(user.getGender()!=null) {
			hql+= " AND u.gender = :gender";
			count++;
			map.put("gender", user.getGender());
		}
		Query query = super.getSession().createQuery(hql);
		if(count == -1) {
			//args = new Object[] {};
		}else {
			//args =  new Object[count+1];
			for(String key:map.keySet()) {
				//args[key] = map.get(key);
				query.setParameter(key, map.get(key));
			}
		}
		
		if(check == 1){
			query.setFirstResult(page*10);
			query.setMaxResults(10);
			
		}
		
		ArrayList<User> listUser = (ArrayList<User>) query.list();
		return listUser;
	}
}
