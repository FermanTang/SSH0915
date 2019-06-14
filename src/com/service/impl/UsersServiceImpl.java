package com.service.impl;

import java.util.List;

import com.bean.Users;
import com.dao.UsersDao;
import com.service.UsersService;
import com.util.PageAssistant;

/**
 * 用户业务逻辑层实现类
 * @author Administrator
 *
 */
public class UsersServiceImpl implements UsersService {

	/** 在service实现类中, 需要调用对应的数据层接口对象 */
	private UsersDao usersDao;
	
	@Override
	public void insert(Users user) {
		usersDao.insert(user);
	}

	@Override
	public void delete(Users user) {
		usersDao.delete(user);
	}

	@Override
	public void update(Users user) {
		usersDao.update(user);
	}

	@Override
	public List<Users> select(String hql, Object... param) {
		return usersDao.select(hql, param);
	}
	
	@Override
	public int count(String hql, Object... param) {
		return usersDao.count(hql, param);
	}

	@Override
	public PageAssistant<Users> selectByPage(PageAssistant<Users> pa, String hql, Object... param) {
		return usersDao.selectByPage(pa, hql, param);
	}

	public UsersDao getUsersDao() {
		return usersDao;
	}

	public void setUsersDao(UsersDao userDao) {
		this.usersDao = userDao;
	}

	
}
