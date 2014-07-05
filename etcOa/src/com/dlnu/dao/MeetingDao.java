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

@Repository
public class MeetingDao extends HibernateDaoSupport{
	
	
	
	@Autowired
	public void setSessionFacoty(SessionFactory sessionFactory) {
		super.setSessionFactory(sessionFactory);
	}
	
	public void save(Meeting m){
		this.getHibernateTemplate().save(m);
	}
	
	
	
	public void update(Meeting m){
		this.getHibernateTemplate().update(m);
	}
	
	
	public void delete(Meeting m){
		this.getHibernateTemplate().delete(m);
	}
	
	
	public Meeting getMeeting(int MId){
		return this.getHibernateTemplate().get(Meeting.class, MId);
	}
	public List<Meeting> getMeeting(int cur,int pagesize){
		BeanFactory bean = new ClassPathXmlApplicationContext("applicationContext.xml");
		SessionFactory sf = (SessionFactory) bean.getBean("sessionFactory");
		Session session =sf.openSession();
		

		Query q = session.createQuery("from Meeting m");
    	int start = (cur-1)*pagesize;
    	q.setFirstResult(start);
    	q.setMaxResults(pagesize);
		return q.list();
		
	}
	public int  getTotal(int pagesize){
		 int t=this.getHibernateTemplate().find("from Meeting m").size();			
		int total=(int)t%pagesize==0?t/pagesize:t/pagesize+1;
		return total;
	}
	
	public Meeting findMeeting(String mname){
		Meeting meeting=(Meeting)this.getHibernateTemplate().find("from Meeting m where m.mname=?", mname).get(0);
		return meeting;
	}
}
