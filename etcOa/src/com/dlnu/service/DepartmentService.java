package com.dlnu.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dlnu.dao.DepartmentDao;
import com.dlnu.pojo.Department;
import com.dlnu.pojo.Users;

@Service
public class DepartmentService {
	@Autowired
	private DepartmentDao departmentDao;

	public DepartmentDao getDepartmentDao() {
		return departmentDao;
	}

	public void setDepartmentDao(DepartmentDao departmentDao) {
		this.departmentDao = departmentDao;
	}

	public List<String> getDeptnames() {
		return departmentDao.getDeptnames();
	}

	public List<Department> get() {
		return departmentDao.get();
	}

	public Department get(int did) {
		return departmentDao.get(did);
	}

	public void add(Department department) {
		departmentDao.add(department);
	}

	public void update(Department department) {
		departmentDao.update(department);
	}

	public void delete(Department department) {
		departmentDao.delete(department);
	}

	public int total(int pagesize) {
		return departmentDao.total(pagesize);
	}

	public List<Department> getPage(int cur, int pagesize) {
		return departmentDao.getPage(cur, pagesize);
	}

	public List<String> getDeptPersons(String dname) {
		List<String> list = new ArrayList<String>();
		List<Users> ls = departmentDao.getDeptPersons(dname);
		for (Users u : ls) {
			list.add(u.getName());
		}
		return list;
	}
}
