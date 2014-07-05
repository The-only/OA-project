package com.dlnu.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dlnu.dao.MessageDao;
import com.dlnu.dao.UsersDao;
import com.dlnu.dao.UsersMessageDao;
import com.dlnu.pojo.Message;
import com.dlnu.pojo.Users;
import com.dlnu.pojo.UsersMessage;

@Service
public class MessageService {
	@Autowired
	private UsersDao usersDao;
	@Autowired
	private MessageDao messageDao;
	@Autowired
	private UsersMessageDao usersMessageDao;

	public UsersDao getUsersDao() {
		return usersDao;
	}

	public void setUsersDao(UsersDao usersDao) {
		this.usersDao = usersDao;
	}

	public MessageDao getMessageDao() {
		return messageDao;
	}

	public void setMessageDao(MessageDao messageDao) {
		this.messageDao = messageDao;
	}

	public UsersMessageDao getUsersMessageDao() {
		return usersMessageDao;
	}

	public void setUsersMessageDao(UsersMessageDao usersMessageDao) {
		this.usersMessageDao = usersMessageDao;
	}

	public Users getUsers(int id) {
		return usersDao.get(id);
	}

	public void save(Message message) {
		messageDao.save(message);
	}

	public void save(UsersMessage usersmessage) {
		usersMessageDao.save(usersmessage);
	}

	public void update(Message message) {
		messageDao.save(message);
	}

	public void update(UsersMessage usermessage) {
		usersMessageDao.update(usermessage);
	}

	public Message getMessage(int messid) {
		return messageDao.get(messid);
	}

	public UsersMessage getUsersMessage(int umessid) {
		return usersMessageDao.get(umessid);
	}

	public void delete(Message message) {
		messageDao.delete(message);
	}

	public void delete(UsersMessage usermessage) {
		usersMessageDao.delete(usermessage);
	}

	public void save(Message message, Users send, Users receive, String issend) { // 通过消息和发送人收件人保存消息
		UsersMessage um = new UsersMessage();
		um.setIsdelete("0");
		um.setIsreceive("0");
		um.setIssend(issend);
		um.setMessage(message);
		um.setUsersByReceiveid(receive);
		um.setUsersBySendid(send);
		save(um);
	}

	public List getDraftMessages(Users user) { // 获取某个用户的草稿箱
		return usersMessageDao.getDraftMessages(user);
	}

	public List getDraftMessages(Users send, String name) { // 获取指定收件人的草稿箱
		Users receive = usersDao.getUsersByName(name);
		if (receive == null) {
			return getDraftMessages(send);
		} else {
			return usersMessageDao.getDraftMessages(send, receive);
		}
	}
	public List getSendMessages(Users send, String name) { // 获取指定收件人的信息
		Users receive = usersDao.getUsersByName(name);
		if (receive == null) {
			return getSendMessages(send);
		} else {
			return usersMessageDao.getSendMessages(send, receive);
		}
	}
	public List getUnreadMessages(Users user){	//获取用户的未读信息 
		return usersMessageDao.getUnreadMessages(user);
	}
	public List getReadMessages(Users user){	//获取用户的已读信息
		return usersMessageDao.getReadMessages(user);
	}
	public List getSendMessages(Users user){	//获取用户的已发信息
		return usersMessageDao.getSendMessages(user);
	}

	public List getReadMessages(Users receive, String name) { // 获取指定发件人的已读消息
		Users send = usersDao.getUsersByName(name);
		if (send == null) {
			return getReadMessages(receive);
		} else {
			return usersMessageDao.getReadMessages(receive, send);
		}
	}
	public List getUnreadMessages(Users receive, String name) { // 获取指定发件人的未读消息
		Users send = usersDao.getUsersByName(name);
		if (send == null) {
			return getUnreadMessages(receive);
		} else {
			return usersMessageDao.getUnreadMessages(receive, send);
		}
	}
}
