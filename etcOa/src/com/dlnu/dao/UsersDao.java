package com.dlnu.dao;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.BeanFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;

import com.dlnu.pojo.Department;
import com.dlnu.pojo.Users;

@Repository
public class UsersDao extends HibernateDaoSupport {

	@Autowired
	public void setSessionFacoty(SessionFactory sessionFactory) {
		super.setSessionFactory(sessionFactory);
	}

	public Users get(int id) {
		Users users = this.getHibernateTemplate().get(Users.class, id);
		return users;
	}

	public Users get(String uname, String upass) {
		Users u = null;
		@SuppressWarnings("unchecked")
		List<Users> us = this.getHibernateTemplate().find(
				"from Users u where u.uname=? and u.upass=?", uname, upass);
		if (us.size() > 0) {
			u = us.get(0);
		}
		return u;
	}

	

	public void save(Users users) {
		this.getHibernateTemplate().save(users);
	}

	public void delete(Users user) {
		this.getHibernateTemplate().delete(user);
	}

	public void update(Users user) {
		this.getHibernateTemplate().update(user);
	}

	/*
	 * 查询他人信息 条件
	 */
	@SuppressWarnings("unchecked")
	public List<Users> getUsers(String condition) {
		StringBuffer sb = new StringBuffer("from Users u where 1=1 ");
		sb.append(condition);
		return this.getHibernateTemplate().find(sb.toString());
	}

	public Users getUsersByName(String name) {
		return (Users) this.getHibernateTemplate()
				.find("from Users u where u.name =?", name).get(0);
	}
	//xh
	public int getTotalPage(int pagesize, String condition) {
		int total = this.getHibernateTemplate().find("from Users u where 1=1 " + condition).size();
		return total % pagesize == 0 ? total / pagesize : total / pagesize + 1;
	}

	// condition 'and 条件=？
	public List<Users> get(int cur, int pagesize, String condition) {
		int start = (cur - 1) * pagesize;
		BeanFactory bean = new ClassPathXmlApplicationContext(
				"applicationContext.xml");
		SessionFactory sessionFactory = (SessionFactory) bean
				.getBean("sessionFactory");
		Session session = sessionFactory.openSession();
		Query q = session.createQuery("from Users u where 1 = 1 " + condition);
		q.setFirstResult(start);
		q.setMaxResults(pagesize);
		return q.list();

	}
	
	
	//wk
	public Users findUser(String name){
		Users user=(Users)this.getHibernateTemplate().find("from Users u where u.name=?", name).get(0);
		return user;
	}
	public List<Users> getUsers(){
		return this.getHibernateTemplate().find("from Users u order by u.userid");
		
	}
	public List getUsers(String name,Department dept){	//通过部门和名字获取用户
		List l = getUsers();
		List list = new ArrayList();
		if(dept==null){
			for(Object o :l){
				Users u = (Users)o;
				if(u.getName().indexOf(name)!=-1){
					list.add(u);
				}
			}
		}else{
			for(Object o : l){
				Users u = (Users)o;
				if(u.getName().indexOf(name)!=-1&&u.getDepartment().getDname().equals(dept.getDname())){
					list.add(u);
				}
			}
		}
		return list;
	}
	
//	lxj
	
	/*
	 * 查询员工角色信息分页
	 */
	public List<Users> getUsers(int cur, int pagesize) {
		BeanFactory bean = new ClassPathXmlApplicationContext(
				"applicationContext.xml");
		SessionFactory sessionFactory = (SessionFactory) bean
				.getBean("sessionFactory");
		Session session = sessionFactory.openSession();
		Query q = session.createQuery("from Users ");
		int start = (cur - 1) * pagesize;
		q.setFirstResult(start);
		q.setMaxResults(pagesize);
		List<Users> list = q.list();
		return list;
	}

	// 获取页面总数
	public int getTotal(int pagesize) {
		int record = this.getHibernateTemplate().find("from Users").size();
		int total = (record % pagesize == 0) ? (record / pagesize) : (record
				/ pagesize + 1);
		return total;
	}
	
	public InputStream writeExcel(List<Users> list) throws Exception {		//excel导出
		Workbook workbook = new HSSFWorkbook();
		Sheet sheet = workbook.createSheet("sheet");
		sheet.setAutobreaks(true);
		CellStyle cellStyle = workbook.createCellStyle();
		cellStyle.setAlignment(CellStyle.ALIGN_RIGHT);
		for(int i=0;i<list.size()+1;i++){
			Row row = sheet.createRow(i);
			for(int j=0;j<10;j++){
				Cell cell = row.createCell(j);
				cell.setCellType(Cell.CELL_TYPE_STRING);
			}
			for(Cell cell : row){
				cell.setCellStyle(cellStyle);
			}
			if(i==0){
				row.getCell(0).setCellValue("员工编号");
				row.getCell(1).setCellValue("姓名");
				row.getCell(2).setCellValue("性别");
				row.getCell(3).setCellValue("年龄");
				row.getCell(4).setCellValue("所属部门");
				row.getCell(5).setCellValue("职位");
				row.getCell(6).setCellValue("E-mail");
				row.getCell(7).setCellValue("办公电话");
				row.getCell(8).setCellValue("移动电话");
				row.getCell(9).setCellValue("住址");
			}else{
				Users user = list.get(i-1);
				row.getCell(0).setCellValue(user.getUserid());
				row.getCell(1).setCellValue(user.getName());
				row.getCell(2).setCellValue(user.getSex());
				row.getCell(3).setCellValue(user.getAge());
				row.getCell(4).setCellValue(user.getDepartment().getDname());
				row.getCell(5).setCellValue(user.getPostion().getPostname());
				row.getCell(6).setCellValue(user.getEmail());
				row.getCell(7).setCellValue(user.getTel());
				row.getCell(8).setCellValue(user.getPhone());
				row.getCell(9).setCellValue(user.getAddress());
			}
			sheet.autoSizeColumn(6);
			sheet.autoSizeColumn(7);
			sheet.autoSizeColumn(8);
		}
		ByteArrayOutputStream os = new ByteArrayOutputStream();
		workbook.write(os);
		os.flush();
		return new ByteArrayInputStream(os.toByteArray(),0,os.toByteArray().length);
	}
}
