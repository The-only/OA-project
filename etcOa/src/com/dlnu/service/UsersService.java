package com.dlnu.service;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dlnu.dao.CardFloderDao;
import com.dlnu.dao.DepartmentDao;
import com.dlnu.dao.PostionDao;
import com.dlnu.dao.UsersDao;
import com.dlnu.pojo.Department;
import com.dlnu.pojo.Postion;
import com.dlnu.pojo.Users;

@Service
public class UsersService {
	@Autowired
	public UsersDao usersDao;
	@Autowired
	private CardFloderDao cardFloderDao;
	@Autowired
	private PostionDao postionDao;
	@Autowired
	private DepartmentDao departmentDao;
	
	public CardFloderDao getCardFloderDao() {
		return cardFloderDao;
	}

	public void setCardFloderDao(CardFloderDao cardFloderDao) {
		this.cardFloderDao = cardFloderDao;
	}

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

	public List<Users> getUsers(String[] names) {
		List<Users> list = new ArrayList<Users>();
		for (String name : names) {
			list.add(usersDao.getUsersByName(name));
		}
		return list;
	}
	
	
	/**jeakon**/
	public Users get(int id){
		return usersDao.get(id);
	}
	public void update(Users u){
		usersDao.update(u);
	}
	public void delete(Users u){
		usersDao.delete(u);
	}
	public void save(Users u){
		usersDao.save(u);
	}
	public List getAllUsers(){
		return usersDao.getUsers();
	}
	public Postion getPostion(String name){
		return postionDao.get(name);
	}
	public Department getDepartment(String name){
		return departmentDao.getDepartment(name);
	}
	public int getTotal(int pagesize, Collection col) { // 获取名片夹页面总数
		return cardFloderDao.getTotal(pagesize, col);
	}
	public List getPage(int cur, int pagesize, // 按分页获取名片夹
			Collection col) {
		return cardFloderDao.getPage(cur, pagesize, col);
	}
	/**jeakon**/
}
