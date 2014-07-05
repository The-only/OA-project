package com.dlnu.test;

import java.util.List;

import org.junit.Test;
import org.springframework.beans.factory.BeanFactory;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.dlnu.dao.WorkDao;
import com.dlnu.pojo.UserSchedule;

public class ScheduleDaoTest {
	@Test
	public void testSchedule(){
		BeanFactory bean = new ClassPathXmlApplicationContext(
				"applicationContext.xml");
		WorkDao workDao = (WorkDao) bean.getBean("workDao");
	}
	@Test
	public void testTotal(){
		BeanFactory bean = new ClassPathXmlApplicationContext(
				"applicationContext.xml");
		WorkDao workDao = (WorkDao) bean.getBean("workDao");
		System.out.println(workDao.getTotal("林志抄", 1));
	}
	@Test
	public void testPage2(){
		BeanFactory bean = new ClassPathXmlApplicationContext(
				"applicationContext.xml");
		WorkDao workDao = (WorkDao) bean.getBean("workDao");
		List<UserSchedule> us = workDao.get(1, 5, "林志抄","%","%","%");
		for(UserSchedule u :us){
			System.out.println(u.getSchedule().getSname());
			System.out.println(u.getSchedule().getStarttime());
			System.out.println(u.getSchedule().getEndtime());
			System.out.println(u.getUsersByPlanid().getName());
			System.out.println("--------------------------");
		}
	}	@Test
	public void testTotal2(){
		BeanFactory bean = new ClassPathXmlApplicationContext(
				"applicationContext.xml");
		WorkDao workDao = (WorkDao) bean.getBean("workDao");
		System.out.println(workDao.getTotal(1,"林志抄","人事部","经理","%"));
	}
}
