package com.dlnu.dao;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;

import com.dlnu.pojo.Users;
import com.dlnu.pojo.UsersRole;
//xh
@Repository
public class UsersRoleDao extends HibernateDaoSupport {

	@Autowired
	public void setSessionFacoty(SessionFactory sessionFactory) {
		super.setSessionFactory(sessionFactory);
	}

	public void save(UsersRole usersRole) {
		this.getHibernateTemplate().save(usersRole);
	}

	public List<UsersRole> getUsers(Users users) {
		return this.getHibernateTemplate().find(
				"from UsersRole ur where ur.users=?", users);
	}
	public void delete(UsersRole ur){
		this.getHibernateTemplate().delete(ur);
	}
}