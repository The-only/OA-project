package com.dlnu.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dlnu.dao.DepartmentDao;
import com.dlnu.dao.PostionDao;
import com.dlnu.dao.RoleDao;
import com.dlnu.dao.UsersDao;
import com.dlnu.dao.UsersRoleDao;
import com.dlnu.pojo.Department;
import com.dlnu.pojo.Postion;
import com.dlnu.pojo.Role;
import com.dlnu.pojo.Users;
import com.dlnu.pojo.UsersRole;

@Service
public class SystemService {
	@Autowired
	private UsersDao usersDao;
	@Autowired
	private DepartmentDao departmentDao;
	@Autowired
	private PostionDao postionDao;
	@Autowired
	private RoleDao roleDao;
	@Autowired
	private UsersRoleDao usersRoleDao;

	public PostionDao getPostionDao() {
		return postionDao;
	}

	public void setPostionDao(PostionDao postionDao) {
		this.postionDao = postionDao;
	}

	public DepartmentDao getDepartmentDao() {
		return departmentDao;
	}

	public void setDepartmentDao(DepartmentDao departmentDao) {
		this.departmentDao = departmentDao;
	}

	public UsersDao getUsersDao() {
		return usersDao;
	}

	public void setUsersDao(UsersDao usersDao) {
		this.usersDao = usersDao;
	}

	public List<Users> get(int cur, int pagesize, String param) {

		return usersDao.get(cur, pagesize, param);
	}

	public int getTotalPage(int pagesize, String param) {
		return usersDao.getTotalPage(pagesize, param);
	}

	public Users get(int id) {
		return usersDao.get(id);
	}

	public void delete(Users users) {
		usersDao.delete(users);
	}

	public void update(Users users) {
		usersDao.update(users);
	}

	public List<Department> getDepartments() {
		return departmentDao.getDepartments();
	}

	public List<Postion> getPositions() {
		return postionDao.getPostions();
	}

	public Postion getp(int id) {
		return postionDao.get(id);
	}

	public Department getd(int id) {
		return departmentDao.get(id);
	}

	public void save(Users users) {
		usersDao.save(users);
	}

	public Role getr(String name) {
		return roleDao.get(name);
	}

	public void save(UsersRole usersRole) {
		usersRoleDao.save(usersRole);
	}

	public void deleteUr(Users users) {
		List<UsersRole> list = usersRoleDao.getUsers(users);
		for (UsersRole ur : list) {
			usersRoleDao.delete(ur);
		}
	}
}
