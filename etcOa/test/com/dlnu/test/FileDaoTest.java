package com.dlnu.test;

import java.io.File;
import java.util.List;

import org.junit.Test;
import org.springframework.beans.factory.BeanFactory;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.dlnu.dao.FileDao;

public class FileDaoTest {
	@Test
	public void showfileTest() {
		BeanFactory bean = new ClassPathXmlApplicationContext(
				"applicationContext.xml");
		FileDao fileDao = (FileDao) bean.getBean("fileDao");
		List<String> list = fileDao.showfiles("j:\\OA\\", 1004);
		for (String s : list) {
			System.out.println(s);
		}
	}

	public static void main(String[] args) {
		new File("J:\\OA\\小抄文件夹\\a.txt").deleteOnExit();;
	} 
}
