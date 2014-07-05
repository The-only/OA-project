package com.dlnu.dao;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;

import com.dlnu.pojo.Message;
@Repository
public class MessageDao extends HibernateDaoSupport {
	@Autowired
	public void setSessionFacoty(SessionFactory sessionFactory) {
		super.setSessionFactory(sessionFactory);
	}
	public Message get(int messid){	//通过ID获取消息
		return this.getHibernateTemplate().get(Message.class, messid);
	}
	public void save(Message message){	//添加消息
		this.getHibernateTemplate().save(message);
	}
	public void update(Message message){	//更新消息
		this.getHibernateTemplate().update(message);
	}
	public void delete(Message message){	//删除消息
		this.getHibernateTemplate().delete(message);
	}
}
