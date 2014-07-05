package com.dlnu.test;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Set;

import org.junit.Test;
import org.springframework.beans.factory.BeanFactory;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.dlnu.dao.UsersDao;
import com.dlnu.pojo.Users;
import com.dlnu.pojo.UsersRole;

public class UserDaoTest {

	public static void main(String[] args) {
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		String str = sdf.format(date);

		System.out.println(str);
	}

	@Test
	public void testGet() {
		BeanFactory bean = new ClassPathXmlApplicationContext(
				"applicationContext.xml");
		UsersDao usersDao = (UsersDao) bean.getBean("usersDao");
		Users users = usersDao.get(1001);
		Set<UsersRole> sets = users.getUsersRoles();
		for (UsersRole r : sets) {
			System.out.println(r.getRole().getRname());
		}
	}

	@Test
	public void testLogin() {
		BeanFactory bean = new ClassPathXmlApplicationContext(
				"applicationContext.xml");
		UsersDao usersDao = (UsersDao) bean.getBean("usersDao");
		Users u = usersDao.get("dxh", "123");
		Set<UsersRole> uroles = u.getUsersRoles();
		System.out.println(uroles.size());
		for (UsersRole r : uroles) {
			System.out.println(r.getRole().getRoleid() + "    "
					+ r.getRole().getRname());
		}

	}

	/**
	 * 查询本人信息
	 * */
	@Test
	public void testInfo() {
		BeanFactory bean = new ClassPathXmlApplicationContext(
				"applicationContext.xml");
		UsersDao usersDao = (UsersDao) bean.getBean("usersDao");
		Users u = usersDao.get("dxh", "123");

		List<UsersRole> list = new ArrayList<UsersRole>();
		list.addAll(u.getUsersRoles());
		System.out.println("员工号" + u.getUserid());
		System.out.println("姓名" + u.getUname());
		System.out.println("性别" + u.getSex());
		System.out.println("所属部门" + u.getDepartment().getDname());
		System.out.println("职位" + u.getPostion().getPostname());
		System.out.println("电子邮件" + u.getEmail());
		System.out.println("办公电话" + u.getTel());
		System.out.println("移动电话" + u.getPhone());
		System.out.println("住址" + u.getAddress());
		System.out.println("系统角色" + list.get(0).getRole().getRname());
		System.out.println("兴趣爱好" + u.getInterest());
		System.out.println("个人介绍" + u.getIntroduce());
	}

	/*
	 * 个人信息查询
	 */
	@Test
	public void testSearchInfo() {
		BeanFactory bean = new ClassPathXmlApplicationContext(
				"applicationContext.xml");
		UsersDao usersDao = (UsersDao) bean.getBean("usersDao");
		// List<Users> list = usersDao.getUsers("and u.userid=1001");
		// List<Users> list = usersDao.getUsers("and u.uname='lzc'");
		// List<Users> list = usersDao.getUsers("and u.phone=201108120333");
		List<Users> list = usersDao.getUsers("and u.department.dname='人事部'");
		for (Users u : list) {
			System.out.println("员工号" + u.getUserid());
			System.out.println("姓名" + u.getUname());
			System.out.println("性别" + u.getSex());
			System.out.println("年龄" + u.getAge());
			System.out.println("所属部门" + u.getDepartment().getDname());
			System.out.println("职位" + u.getPostion().getPostname());
			System.out.println("电子邮件" + u.getEmail());
			System.out.println("办公电话" + u.getTel());
			System.out.println("移动电话" + u.getPhone());
			System.out.println("住址" + u.getAddress());
			System.out.println("---------------------------------");
		}
	}

	@Test
	public void getUsersByName() {
		BeanFactory bean = new ClassPathXmlApplicationContext(
				"applicationContext.xml");
		UsersDao usersDao = (UsersDao) bean.getBean("usersDao");
		System.out.println(usersDao.getUsersByName("林志抄").getName());
	}

}
