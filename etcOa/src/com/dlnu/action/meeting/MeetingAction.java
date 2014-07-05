package com.dlnu.action.meeting;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.dlnu.base.action.BaseAction;
import com.dlnu.dao.DepartmentDao;
import com.dlnu.dao.MeetingDao;
import com.dlnu.dao.MroomDao;
import com.dlnu.dao.UserMeetingDao;
import com.dlnu.dao.UsersDao;
import com.dlnu.pojo.Department;
import com.dlnu.pojo.Meeting;
import com.dlnu.pojo.Mroom;
import com.dlnu.pojo.UserMeeting;
import com.dlnu.pojo.Users;
import com.dlnu.service.MeetingService;
import com.dlnu.vo.Vo;

public class MeetingAction extends BaseAction {
	private List<Meeting> meeting;
	private List<Department> dept;
	private List<Users> meetingUsers;
	private List<UserMeeting> um;
	private List<Users> us;
	private List<Mroom> mr;
	@Autowired
	private MeetingDao meetingDao;
	@Autowired
	private DepartmentDao departmentDao;
	@Autowired
	private MroomDao mroomDao;
	@Autowired
	private UsersDao usersDao;
	@Autowired
	private UserMeetingDao userMeetingDao;
	@Autowired
	private MeetingService meetingService;
	

	private Vo vo;
	private int cur = 1;
	private int total;

	public List<Meeting> getMeeting() {
		return meeting;
	}

	public void setMeeting(List<Meeting> meeting) {
		this.meeting = meeting;
	}

	public MeetingDao getMeetingDao() {
		return meetingDao;
	}

	public void setMeetingDao(MeetingDao meetingDao) {
		this.meetingDao = meetingDao;

	}



	public UserMeetingDao getUserMeetingDao() {
		return userMeetingDao;
	}

	public void setUserMeetingDao(UserMeetingDao userMeetingDao) {
		this.userMeetingDao = userMeetingDao;
	}
	public Vo getVo() {
		return vo;
	}

	public void setVo(Vo vo) {
		this.vo = vo;
	}

	public int getCur() {
		return cur;
	}

	public void setCur(int cur) {
		this.cur = cur;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public List<Department> getDept() {
		return dept;
	}

	public void setDept(List<Department> dept) {
		this.dept = dept;
	}

	public MeetingService getMeetingService() {
		return meetingService;
	}

	public void setMeetingService(MeetingService meetingService) {
		this.meetingService = meetingService;
	}

	public DepartmentDao getDepartmentDao() {
		return departmentDao;
	}
	public List<Mroom> getMr() {
		return mr;
	}

	public List<Users> getMeetingUsers() {
		return meetingUsers;
	}

	public void setMeetingUsers(List<Users> meetingUsers) {
		this.meetingUsers = meetingUsers;
	}

	public void setMr(List<Mroom> mr) {
		this.mr = mr;
	}

	public MroomDao getMroomDao() {
		return mroomDao;
	}
	public List<Users> getUs() {
		return us;
	}

	public void setUs(List<Users> us) {
		this.us = us;
	}

	public UsersDao getUsersDao() {
		return usersDao;
	}

	public void setUsersDao(UsersDao usersDao) {
		this.usersDao = usersDao;
	}
	public void setMroomDao(MroomDao mroomDao) {
		this.mroomDao = mroomDao;
	}
	public void setDepartmentDao(DepartmentDao departmentDao) {
		this.departmentDao = departmentDao;
	}

	public String showMeeting() {
		System.out.println("==============");
		int pagesize = 3;
		total = meetingDao.getTotal(pagesize);
		meeting = meetingDao.getMeeting(cur, pagesize);
		System.out.println("size==========" + meeting.size());
		return SUCCESS;
	}

	public String addMeeting() {
		Meeting m=new Meeting();
		Mroom mr=new Mroom();
//		m.setMid(vo.getMid());
		
		m.setMname(vo.getMname());
		m.setStarttime(vo.getStarttime());
		m.setMroom(mroomDao.getMroom(vo.getMrid()));
		m.setEndtime(vo.getEndtime());
		// Mroom mroom = vo.getMroom();
		meetingService.addM(m);
		 String str =vo.getMeetingPerson();
		 String s[] = str.split(";");
		 Meeting meet=meetingDao.findMeeting(vo.getMname());
		 for(String a:s){
			 Users u=usersDao.findUser(a);
			 userMeetingDao.saveU_M(u,meet);
		 }
		return SUCCESS;
	}

	public String getInfo() {
		dept = departmentDao.get();
		mr= mroomDao.getMroom();
		us=usersDao.getUsers();
		return SUCCESS;
	}
	
	
	public String toUpdateMeeting(){
		dept = departmentDao.get();
		mr= mroomDao.getMroom();
		us=usersDao.getUsers();
		System.out.println(vo.getMid()+"=============");
		Meeting m=meetingDao.getMeeting(vo.getMid());
		vo.setMid(m.getMid());
		vo.setMname(m.getMname());
		vo.setStarttime(m.getStarttime());
		vo.setEndtime(m.getEndtime());
		vo.setMroom(m.getMroom());
		meetingUsers=userMeetingDao.getUsers(m.getMid());
		return SUCCESS;
	}
	
	
	public String updateMeeting(){
		Meeting m=meetingDao.getMeeting(vo.getMid());
		m.setMname(vo.getMname());
		m.setStarttime(vo.getStarttime());
		m.setMroom(mroomDao.getMroom(vo.getMrid()));
		m.setEndtime(vo.getEndtime());
		meetingService.updateM(m);
		
		um=userMeetingDao.getUserMeeting(vo.getMid());
		for(UserMeeting s: um){
			userMeetingDao.delete(s);
		}
		String str =vo.getMeetingPerson();
		 String s[] = str.split(";");
		 Meeting meet=meetingDao.findMeeting(vo.getMname());
		 for(String a:s){
			 Users u=usersDao.findUser(a);
			 userMeetingDao.saveU_M(u,meet);
		 }
		return SUCCESS;
	}
	
	
	public String deleteMeeting(){
		um=userMeetingDao.getUserMeeting(vo.getMid());
		for(UserMeeting s: um){
			userMeetingDao.delete(s);
		}
		Meeting m=meetingDao.getMeeting(vo.getMid());
		meetingDao.delete(m);
		return SUCCESS;
	}
	
	
	public String lookUpMeeting(){
		Meeting m=meetingDao.getMeeting(vo.getMid());
		vo.setMid(m.getMid());
		vo.setMname(m.getMname());
		vo.setStarttime(m.getStarttime());
		vo.setEndtime(m.getEndtime());
		vo.setMroom(m.getMroom());
		meetingUsers=userMeetingDao.getUsers(m.getMid());
		return SUCCESS;
	}
	
	public String showStaffMeeting(){
		int pagesize = 3;
		total = meetingDao.getTotal(pagesize);
		meeting = meetingDao.getMeeting(cur, pagesize);
		return SUCCESS;
	}

}
