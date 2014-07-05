package com.dlnu.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.BeanFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.orm.hibernate3.HibernateAccessor;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;

import com.dlnu.pojo.Mroom;
import com.dlnu.pojo.UsersRoom;


@Repository
public class UsersRoomDao extends HibernateDaoSupport{
	@Autowired
	public void setSessionFacoty(SessionFactory sessionFactory) {
		super.setSessionFactory(sessionFactory);
	}
	public void delete(UsersRoom s){
		this.getHibernateTemplate().delete(s);
	}
	
	
	public Mroom getMroom(int MId){
		return this.getHibernateTemplate().get(Mroom.class, MId);
	}
	
	public List<Mroom> getMroom(int cur,int pagesize){
		BeanFactory bean = new ClassPathXmlApplicationContext("applicationContext.xml");
		SessionFactory sf = (SessionFactory) bean.getBean("sessionFactory");
		Session session =sf.openSession();
		

		Query q = session.createQuery("from Mroom m");
    	int start = (cur-1)*pagesize;
    	q.setFirstResult(start);
    	q.setMaxResults(pagesize);
		return q.list();
		
	}
	public List<UsersRoom> getUsersRoom(int mrid) {
		// TODO Auto-generated method stub
		List<UsersRoom> list=this.getHibernateTemplate().find("from UsersRoom ur where ur.mroom.mrid=?", mrid);
		return list;
	}
	
}
