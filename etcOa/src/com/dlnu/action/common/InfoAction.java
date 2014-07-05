package com.dlnu.action.common;

import org.springframework.stereotype.Controller;

import com.dlnu.base.action.BaseAction;
import com.opensymphony.xwork2.ActionSupport;

/*
 * 个人信息查询模块
 * */
@Controller
public class InfoAction extends BaseAction {
	public String searchInfo() {

		return SUCCESS;
	}
}
