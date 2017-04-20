package com.caveofprogramming.spring.web.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Service;

import com.caveofprogramming.spring.web.dao.User;
import com.caveofprogramming.spring.web.dao.UsersDAO;

@Service("usersService")
public class UsersService {

	private UsersDAO usersDao;

	@Autowired
	public void setOffersDao(UsersDAO usersDao) {
		this.usersDao = usersDao;
	}
	
	public void create(User user){
		this.usersDao.create(user);
	}

	public boolean exists(String username) {
		return this.usersDao.exists(username);
	}
	
	@Secured("ROLE_ADMIN")
	public List<User> getAllUsers() {
		return this.usersDao.getAllUsers();
	}

}
