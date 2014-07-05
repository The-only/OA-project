package com.dlnu.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;

import com.dlnu.pojo.Postion;

@Repository
public class PostionDao extends HibernateDaoSupport {
	@Autowired
	public void setSessionFacoty(SessionFactory sessionFactory) {
		super.setSessionFactory(sessionFactory);
	}

	public List<String> getPositions() {
		List<String> list = new ArrayList<String>();
		List<Postion> ps = this.getHibernateTemplate().find("from Postion ");
		for (Postion p : ps) {
			list.add(p.getPostname());
		}
		return list;
	}
	//xh
	public Postion get(int id) {
		Postion postion = this.getHibernateTemplate().get(Postion.class, id);
		return postion;
	}
	public List<Postion> getPostions(){
		return this.getHibernateTemplate().find("from Postion");
	}
	public Postion get(String name){		//通过名字查找
		return (Postion) super.getHibernateTemplate()
				.find("from Postion p where p.postname=?", name).get(0);
	}
}
