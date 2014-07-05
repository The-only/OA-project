package com.dlnu.action.office;

import java.io.InputStream;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.cxf.binding.corba.wsdl.Array;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;

import com.dlnu.base.action.BaseAction;
import com.dlnu.pojo.Schedule;
import com.dlnu.pojo.UserSchedule;
import com.dlnu.pojo.Users;
import com.dlnu.service.DepartmentService;
import com.dlnu.service.PostionService;
import com.dlnu.service.UsersService;
import com.dlnu.service.WorkService;
import com.dlnu.util.ExcelUtils;
import com.dlnu.vo.Schedules;
import com.dlnu.vo.Vo;

/*
 * 日程安排
 * */
public class WorkPlanAction extends BaseAction {
	private Vo vo;
	private  List<UserSchedule> us;
	private List<String> depts;
	private List<String> postions;
	@Autowired
	private WorkService workService;
	@Autowired
	private DepartmentService departmentService;
	@Autowired
	private UsersService usersService;
	@Autowired
	private PostionService postionService;
	private InputStream excelStream;
	private String fileName;
	private static List<Schedules> sches = new ArrayList<Schedules>();

	public InputStream getExcelStream() {
		return excelStream;
	}

	public void setExcelStream(InputStream excelStream) {
		this.excelStream = excelStream;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public Vo getVo() {
		return vo;
	}

	public void setVo(Vo vo) {
		this.vo = vo;
	}



	public List<UserSchedule> getUs() {
		return us;
	}

	public void setUs(List<UserSchedule> us) {
		this.us = us;
	}


	

	public static List<Schedules> getSches() {
		return sches;
	}

	public static void setSches(List<Schedules> sches) {
		WorkPlanAction.sches = sches;
	}

	public WorkService getWorkService() {
		return workService;
	}

	public void setWorkService(WorkService workService) {
		this.workService = workService;
	}

	public UsersService getUsersService() {
		return usersService;
	}

	public void setUsersService(UsersService usersService) {
		this.usersService = usersService;
	}

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

	/*
	 * 添加安排
	 */
	public String addWork() {
		// 取得session范围用户
		Users users = (Users) (Users) ServletActionContext.getRequest()
				.getSession().getAttribute("users");
		// 取得活动信息 装载成Schedule对象
		String workname = vo.getWorkname();
		System.out.println(vo.getWorkstarttime());
		System.out.println(vo.getWorkendtime());
		Date start = vo.getWorkstarttime();
		Date end = vo.getWorkendtime();
		String content = vo.getWorkcontent();
		String persons = vo.getWorkActions();
		String name = users.getName();
		Schedule s = new Schedule(workname, start, end, content);
		workService.save(s);
		String[] names = persons.split(";");
		List<Users> list = usersService.getUsers(names);
		for (Users uactor : list) {
			System.out.println(uactor.getName());
			workService.save(s, users, uactor);
		}
		return SUCCESS;
	}

	// 分页展示日程安排
	public String showWork() {
		if (vo == null) {
			vo = new Vo();
		}
		Users users = (Users) ServletActionContext.getRequest().getSession()
				.getAttribute("users");
		String dname = vo.getDname(), postionname = vo.getPostionname(), planname = vo
				.getPlanname();
		if (dname == null || "".equals(dname)) {
			dname = "%";
		}
		if (postionname == null || "".equals(postionname)) {
			postionname = "%";
		}
		if (planname == null || "".equals(planname)) {
			planname = "%";
		} else {
			planname = "%" + vo.getPlanname() + "%";
		}
		// 列表
		us = workService.getPage(vo.getCur(), vo.getPagesize(),
				users.getName(), dname, postionname, planname);
		// 设置总页数
		int total = workService.getTotal(vo.getPagesize(), users.getName(),
				dname, postionname, planname);
		total = total == 0 ? 1 : total;
		vo.setTotal(total);
		// 查询的部门名称
		depts = departmentService.getDeptnames();
		// 查询的职位名称
		postions = postionService.getPostions();
		System.out.println("us=============="+us.size());
		// excel
		for (UserSchedule temp : us) {
			Schedules s = new Schedules(temp.getSchedule().getSname(), temp
					.getSchedule().getStarttime(), temp.getSchedule()
					.getEndtime(), temp.getUsersByPlanid().getName());
			sches.add(s);
		}
		return SUCCESS;
	}

	public String excel() {
		fileName = "work.xls";
		try {
			System.out.println("sches=================="+sches.size());
			excelStream = ExcelUtils.writeExcel(sches);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return SUCCESS;
	}
}
