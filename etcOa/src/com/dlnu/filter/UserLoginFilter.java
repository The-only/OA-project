package com.dlnu.filter;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dlnu.pojo.Users;
import com.dlnu.pojo.UsersRole;

public class UserLoginFilter implements Filter {

	public void destroy() {
	}

	// 规定 1001 职员 1002 领导 1003 管理员
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse resp = (HttpServletResponse) response;
		HttpSession session = req.getSession();
		String uri = req.getRequestURI();
		if (!uri.endsWith("/index.jsp") && !uri.endsWith("/login.action")) {
			if (session.getAttribute("users") == null) {
				resp.sendRedirect(req.getContextPath() + "/index.jsp");
			} else {
				Users u = (Users) session.getAttribute("users");
				List<Integer> list = new ArrayList<Integer>();
				Set<UsersRole> s = u.getUsersRoles();
				for (UsersRole ur : s) {
					System.out.println(ur.getRole().getRoleid());
					list.add(ur.getRole().getRoleid());
				}
				if (uri.contains("/staff") && list.contains(1001)) {
					chain.doFilter(request, response);
				} else if (uri.contains("/leader") && list.contains(1002)) {
					chain.doFilter(request, response);
				} else if (uri.contains("/admin") && list.contains(1003)) {
					chain.doFilter(request, response);
				} else if (uri.contains(".action")) {
					chain.doFilter(request, response);
				} else {
					resp.sendRedirect(req.getContextPath() + "/index.jsp");
				}
			}
		} else {
			chain.doFilter(request, response);
		}
	}

	public void init(FilterConfig config) throws ServletException {
	}

}
