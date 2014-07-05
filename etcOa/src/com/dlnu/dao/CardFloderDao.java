package com.dlnu.dao;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.Iterator;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;

import com.dlnu.pojo.Card;
import com.dlnu.pojo.Cardfloder;
import com.dlnu.pojo.Users;

/*
 * 名片夹
 * */
@Repository
public class CardFloderDao extends HibernateDaoSupport {

	@Autowired
	public void setSessionFacoty(SessionFactory sessionFactory) {
		super.setSessionFactory(sessionFactory);
	}

	public Cardfloder get(int cid) { // 通过ID获取名片夹
		return this.getHibernateTemplate().get(Cardfloder.class, cid);
	}

	public Set getCards(Cardfloder cf) { // 通过名片夹获取名片
		return cf.getCards();
	}

	public void save(Cardfloder cf) { // 添加名片夹
		this.getHibernateTemplate().save(cf);
	}

	public void delete(Cardfloder cf) { // 删除名片夹
		this.getHibernateTemplate().delete(cf);
	}

	public void update(Cardfloder cf) { // 更新名片夹
		this.getHibernateTemplate().update(cf);
	}
	public int getTotal(int pagesize, Collection col) { // 获取名片夹页面总数
		int record = col.size();
		int total = (record % pagesize == 0) ? (record / pagesize) : (record
				/ pagesize + 1);
		return total < 1 ? 1 : total;
	}

	public List getPage(int cur, int pagesize, // 按分页获取名片夹
			Collection col) {
		int start = (cur - 1) * pagesize; // 获取第一个
		int end = cur * pagesize; // 获取最后一个
		end = end > col.size() ? col.size() : end < pagesize ? pagesize : end; // 若最后一个超过集合数量，则将最后一个改为集合大小
		List list = new ArrayList(col); // 截取集合
		return list.subList(start, end);
	}
	public List get(Users u){	//通过用户获取名片夹
		return super.getHibernateTemplate().find("from Cardfloder cf where cf.users=? order by cf.cid",u);
	}
}
