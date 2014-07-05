package com.dlnu.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;

import com.dlnu.pojo.Department;
import com.dlnu.pojo.Users;

@Repository
public class DepartmentDao extends HibernateDaoSupport {

	@Autowired
	public void setSessionFacoty(SessionFactory sessionFactory) {
		super.setSessionFactory(sessionFactory);
	}

	public List<String> getDeptnames() {
		List<String> list = new ArrayList<String>();
		List<Department> ls = this.getHibernateTemplate().find(
				"from Department");
		for (Department d : ls) {
			list.add(d.getDname());
		}
		return list;
	}

	public List<Department> get() {
		return this.getHibernateTemplate().find("from Department");
	}
	public void add(Department department) {
		this.getHibernateTemplate().save(department);
	}

	public void update(Department department) {
		this.getHibernateTemplate().update(department);
	}

	public void delete(Department department) {
		this.getHibernateTemplate().delete(department);
	}

	public int total(int pagesize) {
		int total = this.getHibernateTemplate().find("from Department d ")
				.size();
		total = total % pagesize == 0 ? total / pagesize : total / pagesize + 1;
		return total;
	}

	public List<Department> getPage(final int cur, final int pagesize) {
		@SuppressWarnings("unchecked")
		List<Department> list = this.getHibernateTemplate().executeFind(
				new HibernateCallback() {
					public Object doInHibernate(Session s)
							throws HibernateException, SQLException {
						Query query = s.createQuery("from Department d");
						query.setFirstResult((cur - 1) * pagesize);
						query.setMaxResults(pagesize);
						return query.list();
					}
				});
		return list;
	}
	public List<Users> getDeptPersons(String name) {
		return this.getHibernateTemplate().find(
				"from Users u where u.department.dname=?", name);
	}
//xh
	public Department get(int id) {
		Department department = this.getHibernateTemplate().get(Department.class, id);
		return department;
	}
	public List<Department> getDepartments(){
		return this.getHibernateTemplate().find("from Department");
	}
	
	public Department getDepartment(String name){				//通过名字获取部门
		List list = this.getHibernateTemplate().find("from Department d where d.dname=?",name);
		return (Department) list.get(0);
	}
}
