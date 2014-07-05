package com.dlnu.test;

import java.util.List;

import org.junit.Test;
import org.springframework.beans.factory.BeanFactory;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.dlnu.dao.DepartmentDao;

public class DeptmentDaoTest {
	@Test
	public void getDeptnamesTest() {
		BeanFactory bean = new ClassPathXmlApplicationContext(
				"applicationContext.xml");
		DepartmentDao departmentDao = (DepartmentDao) bean
				.getBean("departmentDao");
		List<String> list = departmentDao.getDeptnames();
		for (String s : list) {
			System.out.println(s);
		}
	}

	public static void main(String[] args) {
	}
}
