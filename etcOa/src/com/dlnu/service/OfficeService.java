package com.dlnu.service;

import java.util.Collection;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dlnu.dao.CardDao;
import com.dlnu.dao.CardFloderDao;
import com.dlnu.dao.UsersDao;
import com.dlnu.pojo.Card;
import com.dlnu.pojo.Cardfloder;
import com.dlnu.pojo.Users;
import com.opensymphony.xwork2.ActionContext;

@Service
public class OfficeService {
	@Autowired
	private CardFloderDao cardFloderDao;
	@Autowired
	private CardDao cardDao;
	@Autowired
	private UsersDao usersDao;

	public CardFloderDao getCardFloderDao() {
		return cardFloderDao;
	}

	public void setCardFloderDao(CardFloderDao cardFloderDao) {
		this.cardFloderDao = cardFloderDao;
	}

	public CardDao getCardDao() {
		return cardDao;
	}

	public void setCardDao(CardDao cardDao) {
		this.cardDao = cardDao;
	}

	public UsersDao getUsersDao() {
		return usersDao;
	}

	public void setUsersDao(UsersDao usersDao) {
		this.usersDao = usersDao;
	}

	public void delete(Cardfloder cf) { // 删除名片夹
		Iterator<Card> it = cf.getCards().iterator();
		while (it.hasNext()) { // 先删除名片夹内的名片
			Card card = it.next();
			cardDao.delete(card);
		}
		cardFloderDao.delete(cf); // 再删除名片夹
		Users users = cf.getUsers();
		users.getCardfloders().remove(cf);
		ActionContext.getContext().getSession().put("users", users);
	}

	public void delete(Card card) { // 删除名片
		Cardfloder cf = card.getCardfloder();
		Users users = cf.getUsers();
		users.getCardfloders().remove(cf);
		cf.getCards().remove(card);
		users.getCardfloders().add(cf);
		cardDao.delete(card);
		ActionContext.getContext().getSession().put("users", users);
	}

	public void send(Card card, Users user) { // 发送名片到指定用户
		Cardfloder cf = (Cardfloder) user.getCardfloders().iterator().next(); // 获取该用户第一个名片夹
		card.setCardfloder(cf); // 更改名片所属名片夹
		card.setCardid(null); // 将ID改为自增
		cardDao.save(card); // 保存该名片
	}

	public List getCards(String cname,Cardfloder cardfloder){
		return cardDao.getCards(cname, cardfloder);
	}
	public int getTotal(int pagesize, Collection col) { // 获取最大页数
		return cardFloderDao.getTotal(pagesize, col);
	}

	public List getPage(int cur, int pagesize, // 获取指定的名片夹集合
			Collection col) {
		return cardFloderDao.getPage(cur,pagesize,col);
	}

}
