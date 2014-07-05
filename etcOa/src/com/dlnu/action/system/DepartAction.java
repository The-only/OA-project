package com.dlnu.action.system;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.dlnu.base.action.BaseAction;
import com.dlnu.pojo.Department;
import com.dlnu.service.DepartmentService;
import com.dlnu.vo.Vo;

@Controller
public class DepartAction extends BaseAction {
	@Autowired
	private DepartmentService departmentService;
	private List<Department> list;
	private String result;
	private Vo vo;
	private String dname;

	public Vo getVo() {
		return vo;
	}

	public void setVo(Vo vo) {
		this.vo = vo;
	}

	public DepartmentService getDepartmentService() {
		return departmentService;
	}

	public void setDepartmentService(DepartmentService departmentService) {
		this.departmentService = departmentService;
	}

	public List<Department> getList() {
		return list;
	}

	public void setList(List<Department> list) {
		this.list = list;
	}

	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}

	public String getDname() {
		return dname;
	}

	public void setDname(String dname) {
		this.dname = dname;
	}

	// 部门下拉框
	public String showDept() {
		System.out.println("doing ===============");
		JSONArray array = new JSONArray();
		array.addAll(departmentService.getDeptnames());
		result = array.toString();
		return SUCCESS;
	}

	public String showDepartments() {
		if (null == vo) {
			vo = new Vo();
		}
		list = departmentService.getPage(vo.getCur(), vo.getPagesize());
		vo.setTotal(departmentService.total(vo.getPagesize()));
		return SUCCESS;
	}

	public String addDepartments() {
		Department department = new Department();
		department.setDname(vo.getDname());
		department.setPhone(vo.getPhone());
		department.setFunction(vo.getFunction());
		departmentService.add(department);

		return SUCCESS;
	}

	public String toUpdateDepartments() {
		vo.setDepartment(departmentService.get(vo.getDid()));
		return SUCCESS;
	}

	public String updateDepartments() {
		Department department = new Department(vo.getDid(), vo.getDname(),
				vo.getPhone(), vo.getFunction());

		departmentService.update(department);
		return SUCCESS;
	}

	public String deleteDeptment() {
		Department department = departmentService.get(vo.getDid());
		departmentService.delete(department);
		return SUCCESS;
	}

	public String getdepts() {

		return SUCCESS;
	}

	// 部门对应的人员下拉框
	public String getDeptPersons() {
		JSONArray array = new JSONArray();
		array.addAll(departmentService.getDeptPersons(dname));
		result = array.toString();
		return SUCCESS;
	}
}
