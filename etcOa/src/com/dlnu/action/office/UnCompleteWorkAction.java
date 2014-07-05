package com.dlnu.action.office;

import java.util.Date;
import java.util.List;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;

import com.dlnu.base.action.BaseAction;
import com.dlnu.pojo.UserSchedule;
import com.dlnu.pojo.Users;
import com.dlnu.service.DepartmentService;
import com.dlnu.service.PostionService;
import com.dlnu.service.WorkService;
import com.dlnu.vo.Vo;

public class UnCompleteWorkAction extends BaseAction {
	private Vo vo;
	@Autowired
	private WorkService workService;
	private List<UserSchedule> us;
	private List<String> depts;
	private List<String> postions;
	@Autowired
	private DepartmentService departmentService;
	@Autowired
	private PostionService postionService;

	public List<String> getDepts() {
		return depts;
	}

	public void setDepts(List<String> depts) {
		this.depts = depts;
	}

	public List<String> getPostions() {
		return postions;
	}

	public void setPostions(List<String> postions) {
		this.postions = postions;
	}

	public DepartmentService getDepartmentService() {
		return departmentService;
	}

	public void setDepartmentService(DepartmentService departmentService) {
		this.departmentService = departmentService;
	}

	public PostionService getPostionService() {
		return postionService;
	}

	public void setPostionService(PostionService postionService) {
		this.postionService = postionService;
	}

	public Vo getVo() {
		return vo;
	}

	public void setVo(Vo vo) {
		this.vo = vo;
	}

	public WorkService getWorkService() {
		return workService;
	}

	public void setWorkService(WorkService workService) {
		this.workService = workService;
	}

	public List<UserSchedule> getUs() {
		return us;
	}

	public void setUs(List<UserSchedule> us) {
		this.us = us;
	}

	// 全部清单
	public String listwork() {
		if (vo == null) {
			vo = new Vo();
		}
		Date now = new Date();
		Users users = (Users) ServletActionContext.getRequest().getSession()
				.getAttribute("users");
		// 列表
		us = workService.getAllPage(vo.getCur(), vo.getPagesize(),
				users.getName());

		// 设置总页数
		int total = workService.getTotal(users.getName(), vo.getPagesize());
		total = total == 0 ? 1 : total;
		vo.setTotal(total);
		// 查询的部门名称
		depts = departmentService.getDeptnames();
		// 查询的职位名称
		postions = postionService.getPostions();
		System.out.println(users.getName() + "-------------us---------------"
				+ us.size() + "-----------total---------" + total);
		return SUCCESS;
	}

	// 代办事项
	public String undolistwork() {
		if (vo == null) {
			vo = new Vo();
		}
		Date now = new Date();
		Users users = (Users) ServletActionContext.getRequest().getSession()
				.getAttribute("users");
		// 列表
		us = workService.getUndoPage(vo.getCur(), vo.getPagesize(),
				users.getName(), now);

		// 设置总页数
		int total = workService.getUndoTotal(users.getName(), vo.getPagesize(),
				now);
		total = total == 0 ? 1 : total;
		vo.setTotal(total);
		// 查询的部门名称
		depts = departmentService.getDeptnames();
		// 查询的职位名称
		postions = postionService.getPostions();
		System.out.println(users.getName() + "-------------us---------------"
				+ us.size() + "-----------total---------" + total);
		return SUCCESS;
	}

	public String deleteUS() {
		workService.deleteUsAndSche(vo.getUsid());
		return SUCCESS;
	}
}
