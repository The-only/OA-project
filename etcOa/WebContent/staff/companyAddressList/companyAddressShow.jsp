<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!-- header-->
<%@include file="/header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- main -->
<div style="width: 100%">
	<div style="float: left; width: 15%;">
		<%@include file="../../nav/staff_nav.jsp"%>
	</div>
	<div style="float: right; width: 85%;">
		<div class="container top">
			<div>
				<h4 class="text-center">
					<strong>公司通讯录</strong>
				</h4>
			</div>
			<!-- 查询 -->
			<form id="select_output" class="form-inline well" role="form"
				method="post">
				<div class="form-group">
					<label class="col-sm-5 control-label align">选择查询</label>
					<div class="col-sm-7">
						<select name="vo.did" class="form-control">
							<option value="0">--请选择--</option>
							<c:forEach items="${vo.departments}" var="dept">
								<option value="${dept.did}">${dept.dname }</option>
							</c:forEach>
						</select>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-4 control-label align">具体查询</label>
					<div class="col-sm-8">
						<input type="text" name="vo.name" class="form-control"
							value="${vo.name}" placeholder="请输入姓名">
					</div>
				</div>
				<div class="form-group">
					<button class="btn btn-default" onclick="change_select()">查询</button>
				</div>
				<button class="btn btn-default pull-right" onclick="change_output()">导出Excel</button>
			</form>

			<!-- 表格展示 -->
			<table class="table table-striped table-bordered">
				<tr>
					<th>员工编号</th>
					<th>姓名</th>
					<th>性别</th>
					<th>年龄</th>
					<th>所属部门</th>
					<th>职位</th>
					<th>E-mail</th>
					<th>办公电话</th>
					<th>移动电话</th>
					<th>住址</th>
				</tr>
				<c:forEach items="${vo.users}" var="users">
					<tr>
						<td>${users.userid }</td>
						<td>${users.name }</td>
						<td>${users.sex }</td>
						<td>${users.age }</td>
						<td>${users.department.dname }</td>
						<td>${users.postion.postname }</td>
						<td>${users.email }</td>
						<td>${users.tel }</td>
						<td>${users.phone }</td>
						<td>${users.address }</td>
					</tr>
				</c:forEach>

			</table>
			<!-- 分页 -->
			<ul class="pagination">
				<li class="disabled"><a>第${vo.cur }页</a></li>
				<li class="disabled"><a>共${vo.total }页</a></li>
				<li><a href="getCAList_staff.action?vo.cur=1">首页</a></li>
				<c:if test="${vo.cur==1}">
					<li class="disabled"><a>上一页</a></li>
				</c:if>
				<c:if test="${vo.cur!=1}">
					<li><a href="getCAList_staff.action?vo.cur=${vo.cur-1}">上一页</a></li>
				</c:if>
				<c:if test="${vo.cur==vo.total}">
					<li class="disabled"><a>下一页</a></li>
				</c:if>
				<c:if test="${vo.cur!=vo.total}">
					<li><a href="getCAList_staff.action?vo.cur=${vo.cur+1}">下一页</a></li>
				</c:if>
				<li><a href="getCAList_staff.action?vo.cur=${vo.total}">尾页</a></li>
				<li><a>
						<form class="form-inline" name="fenyeStaff"
							action="getCAList_staff.action" method="post">
							转至&nbsp;&nbsp;<select class="form-control skip fenyeEvent"
								name="vo.cur">
								<c:forEach begin="1" end="${vo.total}" step="1" var="c">
									<option value="${c}" <c:if test="${c==vo.cur}">selected</c:if>>${c}</option>
								</c:forEach>
							</select>&nbsp;&nbsp;页
						</form>
				</a></li>
			</ul>

		</div>
	</div>
</div>
<script>
	function change_select() {
		var a = window.document.getElementById("select_output");
		a.action = "searchCAList_staff.action?cur=1";
	}
	function change_output() {
		var a = window.document.getElementById("select_output");
		a.action = "excel.action";
	}
</script>
<!-- footer -->
<%@include file="/footer.jsp"%>