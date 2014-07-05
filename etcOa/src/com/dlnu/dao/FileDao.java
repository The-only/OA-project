package com.dlnu.dao;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;

import com.dlnu.pojo.Floder;

@Repository
public class FileDao extends HibernateDaoSupport {
	@Autowired
	public void setSessionFacoty(SessionFactory sessionFactory) {
		super.setSessionFactory(sessionFactory);
	}

	public List<String> showfiles(String path, int userid) {
		List list = new ArrayList<String>();
		String name = getFloderName(userid);
		path += name;
		File f = new File(path);
		String[] fs = f.list();
		for (String s : fs) {
			list.add(s);
		}
		return list;
	}

	public String getFloderName(int userid) {
		Floder floder = (Floder) this.getHibernateTemplate()
				.find("from Floder f where f.users.userid=?", userid).get(0);
		String name = floder.getFname();
		return name;
	}
}
