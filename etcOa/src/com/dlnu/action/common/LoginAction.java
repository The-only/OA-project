package com.dlnu.action.common;

import java.util.List;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.dlnu.base.action.BaseAction;
import com.dlnu.pojo.Users;
import com.dlnu.service.LoginService;
import com.dlnu.vo.Vo;
import com.opensymphony.xwork2.ActionContext;

public class LoginAction extends BaseAction {
	private Vo vo;
	@Autowired
	private LoginService loginService;

	public Vo getVo() {
		return vo;
	}

	public void setVo(Vo vo) {
		this.vo = vo;
	}

	public LoginService getLoginService() {
		return loginService;
	}

	public void setLoginService(LoginService loginService) {
		this.loginService = loginService;
	}

	public String login() {// 处理页面登陆请求
		int roleid = vo.getRoleid();
		Users u = new Users();
		u.setUname(vo.getUname());
		u.setUpass(vo.getUpass());
		// 查询是否有该用户
		u = loginService.get(u);
		if (u == null) {
			System.out.println("找不到该用户");
			return "fail";
		}
		//ActionContext.getContext().getSession().put("users", u);
		ServletActionContext.getRequest().getSession().setAttribute("users", u);
		List<Integer> id = loginService.getRoleid(u);
		System.out.println("==========" + id.get(0));
		switch (vo.getRoleid()) {
		case 1:
			if (id.contains(1001)) {
				return "staff";
			}
			break;
		case 2:
			if (id.contains(1002)) {
				return "leader";
			}
			break;
		case 3:
			if (id.contains(1003)) {
				return "system";
			}
			break;
		}

		return "fail";
	}
	public String exit(){
		ServletActionContext.getRequest().getSession().invalidate();
		return SUCCESS;
	}
}
