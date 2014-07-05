package com.dlnu.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;

import com.dlnu.pojo.Meeting;
import com.dlnu.pojo.UserMeeting;
import com.dlnu.pojo.Users;

@Repository
public class UserMeetingDao extends HibernateDaoSupport{
	@Autowired
	public void setSessionFacoty(SessionFactory sessionFactory) {
		super.setSessionFactory(sessionFactory);
	}
	
	public void saveU_M(Users u,Meeting m){
		UserMeeting um=new UserMeeting();
		um.setUsers(u);
		um.setMeeting(m);
		this.getHibernateTemplate().save(um);
	}
	
	public void updateU_M(Users u,Meeting m){
		UserMeeting um=new UserMeeting();
		um.setUsers(u);
		um.setMeeting(m);
		this.getHibernateTemplate().update(um);
	}
	public List<Users> getUsers(int mid){
		List<Users> ls = new ArrayList<Users>();
		List<UserMeeting> list=this.getHibernateTemplate().find("from UserMeeting um where um.meeting.mid=?", mid);
		for(UserMeeting um:list){
			ls.add(um.getUsers());
		}
		return ls;
	}
	
	public List<UserMeeting> getUserMeeting(int mid){
		List<UserMeeting> list=this.getHibernateTemplate().find("from UserMeeting um where um.meeting.mid=?", mid);
		
		return list;
	}
	
	
	public void delete(UserMeeting m){
		this.getHibernateTemplate().delete(m);
	}
//	public UserMeeting getU_M(int userid,int mid){
//		this.getHibernateTemplate().find("from UserMeeting um where um.meeting.mid=? and um.", mid)
//	}
}
