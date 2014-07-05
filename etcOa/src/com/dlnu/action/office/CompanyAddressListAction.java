package com.dlnu.action.office;

import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.TreeSet;

import org.springframework.beans.factory.annotation.Autowired;

import com.dlnu.pojo.Department;
import com.dlnu.pojo.Users;
import com.dlnu.vo.Vo;
import com.dlnu.base.action.BaseAction;
import com.dlnu.dao.CardFloderDao;
import com.dlnu.dao.DepartmentDao;
import com.dlnu.dao.UsersDao;

public class CompanyAddressListAction extends BaseAction {
	@Autowired
	private UsersDao usersDao;
	@Autowired
	private CardFloderDao cardFloderDao;
	@Autowired
	private DepartmentDao departmentDao;
	private Vo vo = new Vo();

	// 新加获取id

	public UsersDao getUsersDao() {
		return usersDao;
	}

	public void setUsersDao(UsersDao usersDao) {
		this.usersDao = usersDao;
	}

	public CardFloderDao getCardFloderDao() {
		return cardFloderDao;
	}

	public void setCardFloderDao(CardFloderDao cardFloderDao) {
		this.cardFloderDao = cardFloderDao;
	}

	public Vo getVo() {
		return vo;
	}

	public void setVo(Vo vo) {
		this.vo = vo;
	}

	public String getCAList() { // 获取全部用户的通讯录
		vo.setDepartments(departmentDao.get());
		List list = usersDao.getUsers();
		vo.setTotal(cardFloderDao.getTotal(vo.getPAGESIZE(), list));
		vo.setUsers(cardFloderDao.getPage(vo.getCur(), vo.getPAGESIZE(), list));
		return SUCCESS;
	}

	/* 查询分页 */
	public String searchCAList() { // 按部门和姓名查询
		vo.setDepartments(departmentDao.get());
		Department dept;
		if (vo.getDid() == null || vo.getDid() == 0) {
			dept = null;
		} else {
			dept = departmentDao.get(vo.getDid());
			vo.setDid(dept.getDid());;
		}
		String name = vo.getName() == null ? "" : vo.getName();
		List list = usersDao.getUsers(name, dept);
		vo.setTotal(cardFloderDao.getTotal(vo.getPAGESIZE(), list));
		vo.setUsers(cardFloderDao.getPage(vo.getCur(), vo.getPAGESIZE(), list));
		return SUCCESS;
	}
	public String excel(){
		vo.setDepartments(departmentDao.get());
		Department dept;
		if (vo.getDid() == null || vo.getDid() == 0) {
			dept = null;
		} else {
			dept = departmentDao.get(vo.getDid());
		}
		String name = vo.getName() == null ? "" : vo.getName();
		List list = usersDao.getUsers(name, dept);
		try {
			vo.setExcelStream(usersDao.writeExcel(list));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return SUCCESS;
	}
	
}
