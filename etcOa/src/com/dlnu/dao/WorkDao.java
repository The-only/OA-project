package com.dlnu.dao;

import java.sql.SQLException;
import java.util.Date;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;

import com.dlnu.pojo.Schedule;
import com.dlnu.pojo.UserSchedule;

@Repository
public class WorkDao extends HibernateDaoSupport {
	@Autowired
	public void setSessionFacoty(SessionFactory sessionFactory) {
		super.setSessionFactory(sessionFactory);
	}

	public void save(Schedule s) {
		this.getHibernateTemplate().save(s);
	}

	public Schedule get(int id) {
		return this.getHibernateTemplate().get(Schedule.class, id);
	}

	public void delete(Schedule s) {
		this.getHibernateTemplate().delete(s);
	}

	public void update(Schedule s) {
		this.getHibernateTemplate().update(s);
	}

	/*
	 * 添加日程安排
	 */
	public void save(Schedule s, UserSchedule us) {
		this.getHibernateTemplate().saveOrUpdate(s);
		this.getHibernateTemplate().save(us);
	}

	// 查询是活动人的条数
	public int getTotal(String name, int pagesize) {
		int total = this
				.getHibernateTemplate()
				.find("from UserSchedule us where us.usersByActorid.name=?",
						name).size();
		return total % pagesize == 0 ? total / pagesize : total / pagesize + 1;
	}

	public int getUndoTotal(String name, int pagesize, Date date) {
		int total = this
				.getHibernateTemplate()
				.find("from UserSchedule us where us.usersByActorid.name=? and us.schedule.endtime > ? ",
						name, date).size();
		return total % pagesize == 0 ? total / pagesize : total / pagesize + 1;
	}

	// 查询是活动人的条数
	public int getTotal(int pagesize, final String actorname,
			final String deptname, final String postionname,
			final String planname) {
		int total = this
				.getHibernateTemplate()
				.find("from UserSchedule us where us.usersByActorid.name like ? and us.usersByPlanid.name like ? and us.usersByPlanid.department.dname like ? and us.usersByPlanid.postion.postname like ?",
						actorname, planname, deptname, postionname).size();
		return total % pagesize == 0 ? total / pagesize : total / pagesize + 1;
	}

	public List<UserSchedule> getUndo(final int cur, final int pagesize,
			final String name, final Date date) {
		@SuppressWarnings({ "unchecked", "rawtypes" })
		List<UserSchedule> list = this.getHibernateTemplate().executeFind(
				new HibernateCallback() {
					public Object doInHibernate(Session s)
							throws HibernateException, SQLException {
						Query query = s
								.createQuery("from UserSchedule us where us.usersByActorid.name=:name and us.schedule.endtime > :date");
						query.setString("name", name);
						query.setDate("date", date);
						query.setFirstResult((cur - 1) * pagesize);
						query.setMaxResults(pagesize);
						return query.list();
					}
				});
		return list;
	}

	public List<UserSchedule> getAll(final int cur, final int pagesize,
			final String name) {
		@SuppressWarnings({ "unchecked", "rawtypes" })
		List<UserSchedule> list = this.getHibernateTemplate().executeFind(
				new HibernateCallback() {
					public Object doInHibernate(Session s)
							throws HibernateException, SQLException {
						Query query = s
								.createQuery("from UserSchedule us where us.usersByActorid.name=:name");
						query.setString("name", name);
						query.setFirstResult((cur - 1) * pagesize);
						query.setMaxResults(pagesize);
						return query.list();
					}
				});
		return list;
	}

	public List<UserSchedule> get(final int cur, final int pagesize,
			final String actorname, final String deptname,
			final String postionname, final String planname) {
		@SuppressWarnings("unchecked")
		List<UserSchedule> list = this.getHibernateTemplate().executeFind(
				new HibernateCallback() {
					public Object doInHibernate(Session s)
							throws HibernateException, SQLException {
						Query query = s
								.createQuery("from UserSchedule us where us.usersByActorid.name like :actorname and us.usersByPlanid.name like :planname and us.usersByPlanid.department.dname like :deptname and us.usersByPlanid.postion.postname like :postionname");
						query.setString("actorname", actorname);
						query.setString("deptname", deptname);
						query.setString("postionname", postionname);
						query.setString("planname", planname);
						query.setFirstResult((cur - 1) * pagesize);
						query.setMaxResults(pagesize);
						return query.list();
					}
				});
		return list;
	}

	public void delete(UserSchedule us) {
		this.getHibernateTemplate().delete(us);
	}

	public UserSchedule getUs(int usid) {
		return this.getHibernateTemplate().get(UserSchedule.class, usid);
	}
}
