package com.dlnu.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dlnu.dao.WorkDao;
import com.dlnu.pojo.Schedule;
import com.dlnu.pojo.UserSchedule;
import com.dlnu.pojo.Users;

@Service
public class WorkService {
	@Autowired
	private WorkDao workDao;

	public WorkDao getWorkDao() {
		return workDao;
	}

	public void setWorkDao(WorkDao workDao) {
		this.workDao = workDao;
	}

	public void save(Schedule s) {
		workDao.save(s);
	}

	public void save(Schedule s, Users uplan, Users uactor) {
		UserSchedule us = new UserSchedule();
		us.setSchedule(s);
		us.setUsersByPlanid(uplan);
		us.setUsersByActorid(uactor);
		workDao.save(s, us);
	}

	public List<UserSchedule> getUndoPage(int cur, int pagesize, String actorname,Date date) {
		return workDao.getUndo(cur, pagesize, actorname,date);
	}
	public List<UserSchedule> getAllPage(int cur, int pagesize, String actorname) {
		return workDao.getAll(cur, pagesize, actorname);
	}
	public int getTotal(String name, int pagesize) {
		return workDao.getTotal(name, pagesize);
	}

	public List<UserSchedule> getPage(int cur, int pagesize, String actorname,
			String deptname, String postionname, String name) {
		return workDao.get(cur, pagesize, actorname, deptname, postionname,
				name);
	}

	public int getTotal(int pagesize, String actorname, String dname,
			String postionname, String planname) {
		return workDao.getTotal(pagesize, actorname, dname, postionname,
				planname);
	}

	public void deleteUs(UserSchedule us) {
		workDao.delete(us);
	}

	public UserSchedule getUs(int usid) {
		return workDao.getUs(usid);
	}

	public void deleteUsAndSche(int usid) {
		UserSchedule us = getUs(usid);
		Schedule s = us.getSchedule();
		deleteUs(us);
		deleteSche(s);

	}

	public void deleteSche(Schedule s) {
		workDao.delete(s);
	}

	public int getUndoTotal(String name, int pagesize,Date date) {

		return workDao.getUndoTotal(name, pagesize,date);
	}
}
