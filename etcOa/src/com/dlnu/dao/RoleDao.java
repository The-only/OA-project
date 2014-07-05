package com.dlnu.dao;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;

import com.dlnu.pojo.Role;


/*
 * 角色
 * */
//xh
@Repository
public class RoleDao extends HibernateDaoSupport{
	@Autowired
	public void setSessionFacoty(SessionFactory sessionFactory) {
		super.setSessionFactory(sessionFactory);
	}
	public Role get(String name) {
		Role role = null;
		role = (Role)this.getHibernateTemplate().find("from Role r where r.rname=?", name).get(0);
		return role;
	}
}
