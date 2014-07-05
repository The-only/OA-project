package com.dlnu.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dlnu.dao.UsersDao;
import com.dlnu.pojo.Users;
import com.dlnu.pojo.UsersRole;

@Service
public class LoginService {
	@Autowired
	private UsersDao usersDao;

	public UsersDao getUsersDao() {
		return usersDao;
	}

	public void setUsersDao(UsersDao usersDao) {
		this.usersDao = usersDao;
	}

	public Users get(Users u) {
		return usersDao.get(u.getUname(), u.getUpass());
	}

	public List<Integer> getRoleid(Users u) {
		List<Integer> list = new ArrayList<Integer>();
		Set<UsersRole> sets = u.getUsersRoles();
		for (UsersRole r : sets) {
			list.add(r.getRole().getRoleid());
		}
		return list;
	}
}
