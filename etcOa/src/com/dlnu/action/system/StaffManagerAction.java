package com.dlnu.action.system;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import org.apache.poi.util.SystemOutLogger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.dlnu.base.action.BaseAction;
import com.dlnu.pojo.Department;
import com.dlnu.pojo.Postion;
import com.dlnu.pojo.Role;
import com.dlnu.pojo.Users;
import com.dlnu.pojo.UsersRole;
import com.dlnu.service.SystemService;
import com.dlnu.vo.Vo;

@Controller
public class StaffManagerAction extends BaseAction {
	private Vo vo;
	private List<Users> list;
	private List<Department> depart;
	private List<Postion> postion;
	private String rolename;
	@Autowired
	private SystemService systemService;

	public List<Postion> getPostion() {
		return postion;
	}

	public String getRolename() {
		return rolename;
	}

	public void setRolename(String rolename) {
		this.rolename = rolename;
	}

	public void setPostion(List<Postion> postion) {
		this.postion = postion;
	}

	public List<Department> getDepart() {
		return depart;
	}

	public void setDepart(List<Department> depart) {
		this.depart = depart;
	}

	public Vo getVo() {
		return vo;
	}

	public void setVo(Vo vo) {
		this.vo = vo;
	}

	public List<Users> getList() {
		return list;
	}

	public void setList(List<Users> list) {
		this.list = list;
	}

	public SystemService getSystemService() {
		return systemService;
	}

	public void setSystemService(SystemService systemService) {
		this.systemService = systemService;
	}

	public String showStaff() {
		vo.setParam("");
		vo.setPostionid(0);
		vo.setXhname("");
		depart = systemService.getDepartments();
		this.vo.setTotal(systemService.getTotalPage(vo.getPagesize(),
				vo.getParam()));
		list = systemService.get(vo.getCur(), vo.getPagesize(), vo.getParam());

		return SUCCESS;
	}

	public String deleteStaff() {
		Users u = this.systemService.get(vo.getUserid());
		System.out.println("userid====================" + vo.getUserid());
		System.out.println("user=======================" + u);
		this.systemService.delete(u);
		return SUCCESS;
	}

	public String toUpdateStaff() {
		postion = systemService.getPositions();
		depart = systemService.getDepartments();
		Users u = systemService.get(vo.getUserid());
		vo.setUserid(u.getUserid());
		vo.setUpass(u.getUpass());
		vo.setName(u.getName());
		vo.setSex(u.getSex());
		vo.setAge(u.getAge());
		vo.setDepartment(u.getDepartment());
		vo.setPostion(u.getPostion());
		vo.setInterest(u.getInterest());
		vo.setIntroduce(u.getIntroduce());
		vo.setPhone(u.getPhone());
		vo.setTel(u.getTel());
		vo.setEmail(u.getEmail());
		vo.setAddress(u.getAddress());
		Set<UsersRole> sets = u.getUsersRoles();
		vo.getRoles().removeAll(vo.getRoles());
		for (UsersRole ur : sets) {
			vo.getRoles().add(ur.getRole());
		}

		return SUCCESS;
	}

	public String updateStaff() {
		/* vo.setRoles(null); */
		Users u = systemService.get(vo.getUserid());
		u.setUserid(vo.getUserid());
		u.setUpass(vo.getUpass());
		u.setName(vo.getName());
		u.setSex(vo.getSex());
		u.setAge(vo.getAge());
		u.setDepartment(systemService.getd(vo.getDid()));
		u.setPostion(systemService.getp(vo.getPostionid()));
		u.setInterest(vo.getInterest());
		u.setIntroduce(vo.getIntroduce());
		u.setPhone(vo.getPhone());
		u.setTel(vo.getTel());
		u.setEmail(vo.getEmail());
		u.setAddress(vo.getAddress());

		List<Role> rl = vo.getRoles();
		String name;
		u.setUsersRoles(null);

		systemService.deleteUr(u);

		try {
			name = rolename.replaceAll(" ", "");
		} catch (Exception e) {
			// TODO: handle exception
			name = "";
		}
		String[] temp = name.split(",");
		for (int i = 0; i < temp.length; i++) {
			System.out.println(temp[i] + "=========");
			UsersRole ur = new UsersRole();
			ur.setUsers(u);
			ur.setRole(systemService.getr(temp[i]));
			systemService.save(ur);
		}
		for (Role r : rl) {
			System.out.println("role11========= " + r.getRname());
		}
		this.systemService.update(u);
		return SUCCESS;
	}

	public String toAddStaff() {
		postion = systemService.getPositions();
		depart = systemService.getDepartments();
		return SUCCESS;
	}

	public String addStaff() {
		Users u = new Users();
		u.setUpass(vo.getUpass());
		u.setName(vo.getName());
		u.setUname(vo.getUname());
		u.setSex(vo.getSex());
		u.setAge(vo.getAge());
		u.setDepartment(systemService.getd(vo.getDid()));
		u.setPostion(systemService.getp(vo.getPostionid()));
		u.setInterest(vo.getInterest());
		u.setIntroduce(vo.getIntroduce());
		u.setPhone(vo.getPhone());
		u.setTel(vo.getTel());
		u.setEmail(vo.getEmail());
		u.setAddress(vo.getAddress());
		this.systemService.save(u);
		return SUCCESS;
	}

	public String searchStaff() {
		depart = systemService.getDepartments();
		int p = vo.getPostionid();
		String n = vo.getXhname();
		String str = "";
		if (p != 0) {
			str += "and u.department.did =" + p;
		}
		if (n != "") {
			str += "and u.name like '%" + n + "%'";
		}
		vo.setParam(str);
		this.vo.setTotal(systemService.getTotalPage(vo.getPagesize(),
				vo.getParam()));
		list = systemService.get(vo.getCur(), vo.getPagesize(), vo.getParam());
		return SUCCESS;
	}
}
