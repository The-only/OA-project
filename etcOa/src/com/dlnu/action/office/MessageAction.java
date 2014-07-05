package com.dlnu.action.office;

import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;

import com.dlnu.base.action.BaseAction;
import com.dlnu.dao.CardFloderDao;
import com.dlnu.dao.UsersDao;
import com.dlnu.pojo.Message;
import com.dlnu.pojo.Users;
import com.dlnu.pojo.UsersMessage;
import com.dlnu.service.MessageService;
import com.dlnu.vo.Vo;
import com.opensymphony.xwork2.ActionContext;

public class MessageAction extends BaseAction {
	private Vo vo;
	@Autowired
	private MessageService messageService;
	@Autowired
	private CardFloderDao cardFloderDao;

	public CardFloderDao getCardFloderDao() {
		return cardFloderDao;
	}

	public void setCardFloderDao(CardFloderDao cardFloderDao) {
		this.cardFloderDao = cardFloderDao;
	}

	public MessageService getMessageService() {
		return messageService;
	}

	public void setMessageService(MessageService messageService) {
		this.messageService = messageService;
	}

	public Vo getVo() {
		return vo;
	}

	public void setVo(Vo vo) {
		this.vo = vo;
	}

	public String nMessage() { // 发送消息界面
		return SUCCESS;
	}

	public String newMessage() { // 发送新消息
		Message msg = new Message();
		msg.setTitle(vo.getTitle());
		msg.setContent(vo.getContent());
		msg.setTime(new Date());
		Users senduser = (Users) ActionContext.getContext().getSession()
				.get("users");
		int userid = vo.getUserid();
		Users receiveuser = messageService.getUsers(userid);
		messageService.save(msg);
		messageService.save(msg, senduser, receiveuser, vo.getIssend());
		return SUCCESS;
	}

	public String draftMessages() { // 获取草稿箱
		Users user = (Users) ActionContext.getContext().getSession()
				.get("users");
		List list = messageService.getDraftMessages(user);
		vo.setTotal(cardFloderDao.getTotal(vo.getPAGESIZE(), list));
		vo.setDraftMessages(cardFloderDao.getPage(vo.getCur(),
				vo.getPAGESIZE(), list));
		return SUCCESS;
	}

	public String draftMessagesByReceive() { // 获取指定收件人的草稿
		Users user = (Users) ActionContext.getContext().getSession()
				.get("users");
		String name = vo.getName();
		List list = messageService.getDraftMessages(user, name);
		vo.setTotal(cardFloderDao.getTotal(vo.getPAGESIZE(), list));
		vo.setDraftMessages(cardFloderDao.getPage(vo.getCur(),
				vo.getPAGESIZE(), list));
		return SUCCESS;
	}

	public String editMessage() { // 编辑草稿
		UsersMessage um = messageService.getUsersMessage(vo.getUmessid());
		Message msg = um.getMessage();
		vo.setUmessid(um.getUmessid());
		vo.setTitle(msg.getTitle());
		vo.setContent(msg.getContent());
		vo.setUserid(um.getUsersByReceiveid().getUserid());
		vo.setName(um.getUsersByReceiveid().getName());
		return SUCCESS;
	}

	public String updateMessage() { // 更新草稿
		UsersMessage um = messageService.getUsersMessage(vo.getUmessid());
		Message msg = messageService.getMessage(um.getMessage().getMessid());
		msg.setContent(vo.getContent());
		msg.setTime(new Date());
		msg.setTitle(vo.getTitle());
		Users u = messageService.getUsers(vo.getUserid());
		um.setUsersByReceiveid(u);
		um.setIssend(vo.getIssend());
		messageService.update(msg);
		messageService.update(um);
		return SUCCESS;
	}

	public String deleteMessage() {// 删除草稿
		UsersMessage um = messageService.getUsersMessage(vo.getUmessid());
		Message msg = messageService.getMessage(um.getMessage().getMessid());
		messageService.delete(um);
		messageService.delete(msg);
		return SUCCESS;
	}

	public String unreadMessage() { // 查看未读信息
		Users user = (Users) ActionContext.getContext().getSession()
				.get("users");
		List list = messageService.getUnreadMessages(user);
		vo.setTotal(cardFloderDao.getTotal(vo.getPAGESIZE(), list));
		vo.setUnreadMessages(cardFloderDao.getPage(vo.getCur(),
				vo.getPAGESIZE(), list));
		return SUCCESS;
	}

	public String getMessage() { // 查看信息
		UsersMessage um = messageService.getUsersMessage(vo.getUmessid());
		Message msg = messageService.getMessage(um.getMessage().getMessid());
		um.setIsreceive("1");
		messageService.update(um);
		vo.setTitle(msg.getTitle());
		vo.setContent(msg.getContent());
		vo.setUserid(um.getUsersBySendid().getUserid());
		vo.setName(um.getUsersBySendid().getName());
		vo.setUmessid(vo.getUmessid());
		return SUCCESS;
	}

	public String readMessage() { // 获取已读消息
		Users user = (Users) ActionContext.getContext().getSession()
				.get("users");
		List list = messageService.getReadMessages(user);
		vo.setTotal(cardFloderDao.getTotal(vo.getPAGESIZE(), list));
		vo.setReadMessages(cardFloderDao.getPage(vo.getCur(), vo.getPAGESIZE(),
				list));
		return SUCCESS;
	}

	public String sendMessage() { // 获取发件箱
		Users user = (Users) ActionContext.getContext().getSession()
				.get("users");
		List list = messageService.getSendMessages(user);
		vo.setTotal(cardFloderDao.getTotal(vo.getPAGESIZE(), list));
		vo.setSendMessages(cardFloderDao.getPage(vo.getCur(), vo.getPAGESIZE(),
				list));
		return SUCCESS;
	}

	public String readMessagesBySend() { // 获取指定发件人的已读信息
		Users user = (Users) ActionContext.getContext().getSession()
				.get("users");
		String name = vo.getName();
		List list = messageService.getReadMessages(user, name);
		vo.setTotal(cardFloderDao.getTotal(vo.getPAGESIZE(), list));
		vo.setReadMessages(cardFloderDao.getPage(vo.getCur(), vo.getPAGESIZE(),
				list));
		return SUCCESS;
	}

	public String unreadMessagesBySend() { // 获取指定发件人的未读信息
		Users user = (Users) ActionContext.getContext().getSession()
				.get("users");
		String name = vo.getName();
		List list = messageService.getUnreadMessages(user, name);
		vo.setTotal(cardFloderDao.getTotal(vo.getPAGESIZE(), list));
		vo.setUnreadMessages(cardFloderDao.getPage(vo.getCur(),
				vo.getPAGESIZE(), list));
		return SUCCESS;
	}

	public String sendMessagesByReceive() { // 获取指定收件人的信息
		Users user = (Users) ActionContext.getContext().getSession()
				.get("users");
		String name = vo.getName();
		List list = messageService.getSendMessages(user, name);
		vo.setTotal(cardFloderDao.getTotal(vo.getPAGESIZE(), list));
		vo.setSendMessages(cardFloderDao.getPage(vo.getCur(), vo.getPAGESIZE(),
				list));
		return SUCCESS;
	}
}
