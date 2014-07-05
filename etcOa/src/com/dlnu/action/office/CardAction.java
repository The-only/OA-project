package com.dlnu.action.office;

import java.util.ArrayList;
import java.util.Currency;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;

import com.dlnu.base.action.BaseAction;
import com.dlnu.base.action.BaseAction;
import com.dlnu.dao.CardDao;
import com.dlnu.dao.CardFloderDao;
import com.dlnu.dao.DepartmentDao;
import com.dlnu.dao.PostionDao;
import com.dlnu.dao.UsersDao;
import com.dlnu.pojo.Card;
import com.dlnu.pojo.Cardfloder;
import com.dlnu.pojo.Users;
import com.dlnu.service.OfficeService;
import com.dlnu.vo.Vo;
import com.opensymphony.xwork2.ActionContext;

public class CardAction extends BaseAction {
	public CardAction() {
		System.out.println("------------");
	}

	private Vo vo = new Vo();
	private List<Cardfloder> list;
	@Autowired
	private OfficeService officeService;
	@Autowired
	private UsersDao usersDao;
	@Autowired
	private CardFloderDao cardFloderDao;
	@Autowired
	private CardDao cardDao;
	@Autowired
	private DepartmentDao departmentDao;
	@Autowired
	private PostionDao postionDao;
	
	public PostionDao getPostionDao() {
		return postionDao;
	}

	public void setPostionDao(PostionDao postionDao) {
		this.postionDao = postionDao;
	}

	public CardDao getCardDao() {
		return cardDao;
	}

	public void setCardDao(CardDao cardDao) {
		this.cardDao = cardDao;
	}

	public DepartmentDao getDepartmentDao() {
		return departmentDao;
	}

	public void setDepartmentDao(DepartmentDao departmentDao) {
		this.departmentDao = departmentDao;
	}

	public CardFloderDao getCardFloderDao() {
		return cardFloderDao;
	}

	public void setCardFloderDao(CardFloderDao cardFloderDao) {
		this.cardFloderDao = cardFloderDao;
	}

	public UsersDao getUsersDao() {
		return usersDao;
	}

	public void setUsersDao(UsersDao usersDao) {
		this.usersDao = usersDao;
	}

	public Vo getVo() {
		return vo;
	}

	public void setVo(Vo vo) {
		this.vo = vo;
	}

	public OfficeService getOfficeService() {
		return officeService;
	}

	public void setOfficeService(OfficeService officeService) {
		this.officeService = officeService;
	}

	public List<Cardfloder> getList() {
		return list;
	}

	public void setList(List<Cardfloder> list) {
		this.list = list;
	}

	public String sendCards() { // 发送个人名片的method
		Users user = usersDao.get(vo.getUserid());
		Card card = (Card) ActionContext.getContext().getSession().get("card");
		ActionContext.getContext().getSession().remove("card");
		System.out.println(ActionContext.getContext().getSession().get("card")==null+"------------");
		officeService.send(card, user);
		return SUCCESS;
	}

	public String getCardfloders() { // 获取用户名片夹集合的method
		Users users = (Users) ActionContext.getContext().getSession()
				.get("users");
		List list = cardFloderDao.get(users);
		vo.setTotal(officeService.getTotal(vo.getPAGESIZE(), list));
		vo.setCardfloders(officeService.getPage(vo.getCur(), vo.getPAGESIZE(),
				list));
		return SUCCESS;
	}

	public String addCardfloder() { // 添加名片夹的method
		Users users = (Users) ActionContext.getContext().getSession()
				.get("users");
		Cardfloder cf = new Cardfloder();
		cf.setUsers(users);
		cf.setCname(vo.getCname());
		cardFloderDao.save(cf);
		users.getCardfloders().add(cf);
		ActionContext.getContext().getSession().put("users", users);
		return SUCCESS;
	}

	public String deleteCardfloder() { // 删除名片夹的method
		Cardfloder cf = cardFloderDao.get(vo.getCid());
		officeService.delete(cf);
		return SUCCESS;
	}

	public String getCards() { // 获取某个名片夹的名片
		Cardfloder cf = cardFloderDao.get(vo.getCid());
		List<Card> list = new ArrayList<Card>(cf.getCards());
		vo.setCardfloder(cf);
		vo.setTotal(officeService.getTotal(vo.getPAGESIZE(), list));
		list = officeService.getPage(vo.getCur(), vo.getPAGESIZE(), list);
		vo.setCards(list);
		return SUCCESS;
	}

	public String updateCard() { // 修改名片
		Users user = (Users) ActionContext.getContext().getSession()
				.get("users");
		Card card = new Card();
		user.setName(vo.getCname());
		user.setDepartment(departmentDao.getDepartment(vo.getDept()));
		user.setEmail(vo.getEmail());
		user.setPhone(vo.getPhone());
		user.setPostion(postionDao.get(vo.getPosition()));
		user.setTel(vo.getTel());
		ActionContext.getContext().getSession().put("users", user);
		return SUCCESS;
	}

	public String getUserCard() { // 获取当前用户的个人名片
		Users users = (Users) ActionContext.getContext().getSession()
				.get("users");
		Card card = new Card();
			vo.setCname(users.getName());
			vo.setDept(users.getDepartment().getDname());
			vo.setEmail(users.getEmail());
			vo.setPhone(users.getPhone());
			vo.setPosition(users.getPostion().getPostname());
			vo.setTel(users.getTel());
			card.setCname(users.getName());
			card.setDept(users.getDepartment().getDname());
			card.setEmail(users.getEmail());
			card.setPhone(users.getPhone());
			card.setPosition(users.getPostion().getPostname());
			card.setTel(users.getTel());
			vo.setCard(card);
			ActionContext.getContext().getSession().put("card", card);
		return SUCCESS;
	}

	public String getCard() { // 获取名片
		Card card = cardDao.get(vo.getCid());
		Cardfloder cf = card.getCardfloder();
		vo.setCid(cf.getCid());
		vo.setCname(card.getCname());
		vo.setDept(card.getDept());
		vo.setEmail(card.getEmail());
		vo.setPhone(card.getPhone());
		vo.setTel(card.getTel());
		vo.setPosition(card.getPosition());
		vo.setCard(card);
		ActionContext.getContext().getSession().put("card", card);
		return SUCCESS;
	}

	public String deleteCard() { // 删除名片
		Card card = cardDao.get(vo.getCid());
		vo.setCid(card.getCardfloder().getCid());
		officeService.delete(card);
		return SUCCESS;
	}

	public String getCardsByName() {		//通过名字查找名片
		Cardfloder cardfloder = cardFloderDao.get(vo.getCid());
		vo.setCardfloder(cardfloder);
		List list = officeService.getCards(vo.getCname(), cardfloder);
		vo.setCards(list);
		vo.setTotal(officeService.getTotal(vo.getPAGESIZE(), list));
		vo.setCards(officeService.getPage(vo.getCur(), vo.getPAGESIZE(), list));
		return SUCCESS;
	}
	
	public String getIndex(){		//返回主页
		return SUCCESS;
	}
}
