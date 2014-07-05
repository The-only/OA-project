package com.dlnu.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.BeanFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;

import com.dlnu.pojo.Meeting;
import com.dlnu.pojo.Mroom;

@Repository
public class MroomDao extends HibernateDaoSupport {
	@Autowired
	public void setSessionFacoty(SessionFactory sessionFactory) {
		super.setSessionFactory(sessionFactory);
	}

	public void save(Mroom d) {
		this.getHibernateTemplate().save(d);
	}

	public void update(Mroom d) {
		this.getHibernateTemplate().update(d);
	}

	public void delete(Mroom d) {
		this.getHibernateTemplate().delete(d);
	}

	public Mroom getMroom(int DId) {
		return this.getHibernateTemplate().get(Mroom.class, DId);
	}

	public List<Mroom> getMroom() {
		return this.getHibernateTemplate().find("from Mroom");

	}

	// 获取页面总数
	public int getTotal(int pagesize) {
		int t = this.getHibernateTemplate().find("from Mroom d").size();
		int total = (int) t % pagesize == 0 ? t / pagesize : t / pagesize + 1;
		return total;
	}

	// lxh

	public Mroom getMrid(int mrid) {
		Mroom mroom = null;
		List<Mroom> mr = this.getHibernateTemplate().find(
				"from Mroom mr where mr.mrid=?", mrid);
		if (mr.size() > 0) {
			mroom = mr.get(0);
		}
		return mroom;
	}

	public List<Meeting> getMeeting() {
		return this.getHibernateTemplate().find("from Meeting");
	}

	// 修改单条会议信息
	public void update(int mrid, String mname, String mraddress,
			Integer mrpeople, Integer mracondition, Integer mrprojector) {
		Mroom upmroom = null;
		Mroom upmr = this.getHibernateTemplate().get(Mroom.class, mrid);
		upmr.setMname(mname);
		upmr.setMraddress(mraddress);
		upmr.setMrpeople(mrpeople);
		upmr.setMracondition(mracondition);
		upmr.setMrprojector(mrprojector);
		// Mroom upmr=this.getHibernateTemplate().get(Mroom.class,
		// mrid).setMraddress(mraddress);
		this.getHibernateTemplate().update(upmr);

	}

	// 查询所有会议室信息分页
	public List<Mroom> getMroom(int cur, int pagesize) {
		BeanFactory bean = new ClassPathXmlApplicationContext(
				"applicationContext.xml");
		SessionFactory sessionFactory = (SessionFactory) bean
				.getBean("sessionFactory");
		Session session = sessionFactory.openSession();
		Query q = session.createQuery("from Mroom ");
		int start = (cur - 1) * pagesize;
		q.setFirstResult(start);
		q.setMaxResults(pagesize);
		List<Mroom> list = q.list();
		return list;
	}

	public Mroom get(int mrid) {
		return this.getHibernateTemplate().get(Mroom.class, mrid);
	}

}
