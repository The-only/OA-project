package com.dlnu.dao;

import java.util.ArrayList;
import java.util.List;

import java.util.Iterator;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;

import com.dlnu.pojo.Card;
import com.dlnu.pojo.Cardfloder;

/*
 * 名片
 * */
@Repository
public class CardDao extends HibernateDaoSupport {
	@Autowired
	public void setSessionFacoty(SessionFactory sessionFactory) {
		super.setSessionFactory(sessionFactory);
	}

	public Card get(int id) { // 通过名片ID获取名片
		return super.getHibernateTemplate().get(Card.class, id);
	}

	public Card get(String cname) { // 通过名字获取名片
		return (Card) super.getHibernateTemplate()
				.find("from CARD c where c.cname=?", cname).get(0);
	}

	public void update(Card card) { // 修改名片信息
		super.getHibernateTemplate().update(card);
	}

	public void delete(Card card) { // 删除名片信息
		super.getHibernateTemplate().delete(card);
	}

	public void save(Card card) { // 添加明片信息
		super.getHibernateTemplate().save(card);
	}

	public List getCards(String cname, Cardfloder cardfloder) { // 通过名字和所在名片夹查询名片
		if (cname.equals("") || cname == null) {
			return super.getHibernateTemplate().find(
					"from Card c where c.cardfloder=? order by c.cardid",
					cardfloder);
		} else {
			return super
					.getHibernateTemplate()
					.find("from Card c where c.cardfloder=? and c.cname=? order by c.cardid",
							cardfloder, cname);
		}
	}
}
