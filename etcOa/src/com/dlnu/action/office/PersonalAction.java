package com.dlnu.action.office;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.dlnu.base.action.BaseAction;
import com.dlnu.dao.CardFloderDao;
import com.dlnu.dao.DepartmentDao;
import com.dlnu.dao.UsersDao;
import com.dlnu.pojo.Department;
import com.dlnu.pojo.Users;
import com.dlnu.service.UsersService;
import com.dlnu.vo.Vo;
import com.opensymphony.xwork2.ActionContext;

public class PersonalAction extends BaseAction {
	private Vo vo = new Vo();
	@Autowired
	private UsersService usersService;
	@Autowired
	private UsersDao usersDao;
	@Autowired
	private DepartmentDao departmentDao;
	@Autowired
	private CardFloderDao cardFloderDao;

	public CardFloderDao getCardFloderDao() {
		return cardFloderDao;
	}

	public void setCardFloderDao(CardFloderDao cardFloderDao) {
		this.cardFloderDao = cardFloderDao;
	}

	public UsersDao getUsersDao() {
		return usersDao;
	}

	public void setUsersDao(UsersDao usersDao) {
		this.usersDao = usersDao;
	}

	public DepartmentDao getDepartmentDao() {
		return departmentDao;
	}

	public void setDepartmentDao(DepartmentDao departmentDao) {
		this.departmentDao = departmentDao;
	}

	public UsersService getUsersService() {
		return usersService;
	}

	public void setUsersService(UsersService usersService) {
		this.usersService = usersService;
	}

	public Vo getVo() {
		return vo;
	}

	public void setVo(Vo vo) {
		this.vo = vo;
	}

	public String personalInfoSelf() { // 获取当前用户资料
		Users users = (Users) ActionContext.getContext().getSession()
				.get("users");
		vo.setUserid(users.getUserid());
		vo.setName(users.getName());
		vo.setDept(users.getDepartment().getDname());
		vo.setEmail(users.getEmail());
		vo.setTel(users.getTel());
		vo.setAddress(users.getAddress());
		vo.setInterest(users.getInterest());
		vo.setIntroduce(users.getIntroduce());
		vo.setSex(users.getSex());
		vo.setAge(users.getAge());
		vo.setPosition(users.getPostion().getPostname());
		vo.setPhone(users.getPhone());
		vo.setDepartments(departmentDao.get());
		return SUCCESS;
	}

	public String updatePersonalInfoSelf() { // 修改当前用户资料
		Users users = (Users) ActionContext.getContext().getSession()
				.get("users");
		users.setDepartment(usersService.getDepartment(vo.getDept()));
		users.setEmail(vo.getEmail());
		users.setTel(vo.getTel());
		users.setAddress(vo.getAddress());
		users.setInterest(vo.getInterest());
		users.setIntroduce(vo.getIntroduce());
		users.setAge(vo.getAge());
		users.setPostion(usersService.getPostion(vo.getPosition()));
		users.setPhone(vo.getPhone());
		usersService.update(users);
		ActionContext.getContext().getSession().put("users", users);
		return SUCCESS;
	}

	public String personalInfoOthersAll() { // 获取全部他人信息
		vo.setDepartments(departmentDao.get());
		List list = usersService.getAllUsers();
		vo.setTotal(usersService.getTotal(vo.getPAGESIZE(), list));
		vo.setUsers(usersService.getPage(vo.getCur(), vo.getPAGESIZE(), list));
		return SUCCESS;
	}

	public String personalInfoOthersDetail() { // 获取他人详细信息
		Users users = usersService.get(vo.getUserid());
		vo.setCur(vo.getCur());
		vo.setUserid(users.getUserid());
		vo.setName(users.getName());
		vo.setDept(users.getDepartment().getDname());
		vo.setEmail(users.getEmail());
		vo.setTel(users.getTel());
		vo.setAddress(users.getAddress());
		vo.setInterest(users.getInterest());
		vo.setIntroduce(users.getIntroduce());
		vo.setSex(users.getSex());
		vo.setAge(users.getAge());
		vo.setPosition(users.getPostion().getPostname());
		vo.setPhone(users.getPhone());
		return SUCCESS;
	}

	public String getOthersInfo() { // 查询他人信息
		vo.setDepartments(departmentDao.get());
		Department dept;
		if (vo.getDid() == 0) {
			dept = null;
		} else {
			dept = departmentDao.get(vo.getDid());
		}
		String name = vo.getName() == null ? "" : vo.getName();
		List list = usersDao.getUsers(name, dept);
		vo.setTotal(cardFloderDao.getTotal(vo.getPAGESIZE(), list));
		list = cardFloderDao.getPage(vo.getCur(), vo.getPAGESIZE(), list);
		vo.setUsers(list);
		return SUCCESS;

	}

}
