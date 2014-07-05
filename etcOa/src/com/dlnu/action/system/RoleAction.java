package com.dlnu.action.system;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;

import com.dlnu.base.action.BaseAction;
import com.dlnu.dao.UsersDao;
import com.dlnu.pojo.Role;
import com.dlnu.pojo.Users;
import com.dlnu.pojo.UsersRole;
import com.dlnu.service.SystemService;
import com.dlnu.vo.Vo;

public class RoleAction extends BaseAction {

		private int cur=1;
		private int total;
		private Vo vo;
		@Autowired
	    private UsersDao ud;
		@Autowired
		private SystemService systemService;
		private List<Users> list;
	    private String rolename;
	    
	    public SystemService getSystemService() {
			return systemService;
		}
		public void setSystemService(SystemService systemService) {
			this.systemService = systemService;
		}
	    public String getRolename() {
			return rolename;
		}
		public void setRolename(String rolename) {
			this.rolename = rolename;
		}
		public int getCur() {
			return cur;
		}
		public void setCur(int cur) {
			this.cur = cur;
		}
		public int getTotal() {
			return total;
		}
		public void setTotal(int total) {
			this.total = total;
		}
		public Vo getVo() {
			return vo;
		}
		public void setVo(Vo vo) {
			this.vo = vo;
		}
		public UsersDao getUdao() {
			return ud;
		}
		public void setUdao(UsersDao udao) {
			this.ud = udao;
		}
		
		public UsersDao getUd() {
			return ud;
		}
		public void setUd(UsersDao ud) {
			this.ud = ud;
		}
		public List<Users> getList() {
			return list;
		}
		public void setList(List<Users> list) {
			this.list = list;
		}
		/*获取职员角色数据*/
	    public String getRole(){
			int pagesize = 4;
			total = ud.getTotal(pagesize);
			list = ud.getUsers(cur, pagesize);
	    	return SUCCESS;
	    }
	    /*跳转到设置职员角色*/
	    public String toSetRole(){
	    	int userid = vo.getUserid();
	    	Users u = systemService.get(vo.getUserid());
//	    	Users u = ud.get(userid);
	    	vo.setName(u.getName());
	    	vo.setDepartment(u.getDepartment());
	    	vo.setUserid(u.getUserid());
	    	Set<UsersRole> sets = u.getUsersRoles();
	    	vo.getRoles().removeAll(vo.getRoles());
	        for (UsersRole ur : sets) {
	        	System.out.println(ur.getRole().getRname());
				vo.getRoles().add(ur.getRole());
			}
	    	return SUCCESS;
	    }
	    /*设置职员角色*/
	    public String setRole(){
	    	int userid = vo.getUserid();
	    	Users u = ud.get(userid);
	        String name;
	        //删除原来的
			u.setUsersRoles(null);
			
			systemService.deleteUr(u);
	    	//获取复选框的值
	    	try {
			    name = rolename.replaceAll(" ", "");
			} catch (Exception e) {
				// TODO: handle exception
				name="";
			}
			String[] temp = name.split(",");
			
			//添加新修改的值
	        for(int i=0; i<temp.length; i++){
				UsersRole ur = new UsersRole();
				ur.setUsers(u);
				ur.setRole(systemService.getr(temp[i]));
				systemService.save(ur);
			}
			this.systemService.update(u);
			
	    	return SUCCESS;
	    }
}
