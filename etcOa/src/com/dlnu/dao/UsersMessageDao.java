package com.dlnu.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;

import com.dlnu.pojo.Users;
import com.dlnu.pojo.UsersMessage;

@Repository
public class UsersMessageDao extends HibernateDaoSupport {
	@Autowired
	public void setSessionFacoty(SessionFactory sessionFactory) {
		super.setSessionFactory(sessionFactory);
	}

	public UsersMessage get(int umessid) {
		return super.getHibernateTemplate().get(UsersMessage.class, umessid);
	}

	public void save(UsersMessage umess) {
		super.getHibernateTemplate().save(umess);
	}

	public void update(UsersMessage umess) {
		super.getHibernateTemplate().update(umess);
	}

	public void delete(UsersMessage umess) {
		super.getHibernateTemplate().delete(umess);
	}

	public List getDraftMessages(Users users) { // 查询用户的 草稿箱
		return super
				.getHibernateTemplate()
				.find("from UsersMessage um where um.usersBySendid=? and um.issend=? order by um.umessid",
						users, "0");

	}

	public List getDraftMessages(Users send, Users receive) { // 查询用户指定收件人的草稿
		return super
				.getHibernateTemplate()
				.find("from UsersMessage um where um.usersBySendid=? and um.usersByReceiveid=? and um.issend=? order by um.umessid",
						send, receive, "0");
	}

	public List getUnreadMessages(Users user) { // 查询用户未读信息
		return super
				.getHibernateTemplate()
				.find("from UsersMessage um where um.usersByReceiveid=? and um.isreceive=? order by um.umessid",
						user, "0");
	}

	public List getReadMessages(Users user) { // 查询用户未读信息
		return super
				.getHibernateTemplate()
				.find("from UsersMessage um where um.usersByReceiveid=? and um.isreceive=? order by um.umessid",
						user, "1");
	}

	public List getSendMessages(Users user) { // 查询用户已发信息
		return super
				.getHibernateTemplate()
				.find("from UsersMessage um where um.usersBySendid=? and um.issend=? order by um.umessid",
						user, "1");

	}

	public List getReadMessages(Users receive, Users send) { // 查询用户指定收件人的草稿
		return super
				.getHibernateTemplate()
				.find("from UsersMessage um where um.usersBySendid=? and um.usersByReceiveid=? and um.isreceive=? order by um.umessid",
						send, receive, "1");
	}
	public List getUnreadMessages(Users receive, Users send) { // 查询用户指定收件人的草稿
		return super
				.getHibernateTemplate()
				.find("from UsersMessage um where um.usersBySendid=? and um.usersByReceiveid=? and um.isreceive=? order by um.umessid",
						send, receive, "0");
	}
	public List getSendMessages(Users send, Users receive) { // 查询用户指定收件人的信息
		return super
				.getHibernateTemplate()
				.find("from UsersMessage um where um.usersBySendid=? and um.usersByReceiveid=? and um.issend=? order by um.umessid",
						send, receive, "1");
	}
}
