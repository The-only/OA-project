<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<!-- header-->
	<%@include file="/header.jsp"%>
	<!-- main -->
	<div style="width:100%">
		<div style="float:left;width:15%;">
			<jsp:include page="../../nav/admin_nav.jsp"></jsp:include>
		</div>
		<div style="float:right;width:85%;">
			<div class="container top">
				<div><h4 class="text-center"><strong>部门管理</strong></h4></div>
				<!-- 查询 -->
				<form class="form-inline well" role="form" action="selectEmp" method="post">
				    <a href="/etcOa/admin/deptManage/addDept.jsp" class="btn btn-default" role="button">新建部门</a>
				</form>
		
				<!-- 表格展示 -->
				<table  class="table table-striped table-bordered">
					 <tr>
						<th>部门编号</th>
						<th>部门名</th>
						<th>部门职能</th>
						<th>部门电话</th>
						<th colspan="2">操作</th>
					</tr>
					<c:forEach items="${list}" var="dept">
						<tr>
							<td>${dept.did }</td>
							<td>${dept.dname }</td>
							<td>${dept.function }</td>
							<td>${dept.phone }</td>
							<td><a href="toUpdateDepartments.action?vo.did=${dept.did }">修改</a></td>
							<td><a href="deleteDeptment.action?vo.did=${dept.did }" onclick="return confirm('确认删除吗？')">删除</a></td>
						</tr>
					</c:forEach>
		
				</table>
				<!-- 分页 -->
				<ul class="pagination">
					<li class="disabled"><a>第${vo.cur}页</a></li>
					<li class="disabled"><a>共${vo.total}页</a></li>
			        <li><a href="showDepartments.action?vo.cur=1">首页</a></li>
			        <c:if test="${vo.cur==1}">
			        	<li class="disabled"><a href="#">上一页</a></li>
			        </c:if>
			        <c:if test="${vo.cur!=1}">
			        	<li><a href="showDepartments.action?vo.cur=${vo.cur-1}">上一页</a></li>
			        </c:if>
			        
			        <c:if test="${vo.cur==vo.total}">
			        	<li class="disabled"><a href="#">下一页</a></li>
			        </c:if>
			        <c:if test="${vo.cur!=vo.total}">
			        	<li><a href="showDepartments.action?vo.cur=${vo.cur+1}">下一页</a></li>
			        </c:if>
			        
			        <li><a href="showDepartments.action?vo.cur=${vo.total}">尾页</a></li>
			        <li><a> 
			         <form class="form-inline" name="selectEmp" action="showDepartments.action" method="post">
		           转至&nbsp;&nbsp;<select class="form-control skip"  onchange="check()" id="sel">
						<c:forEach begin="1" end="${vo.total}" step="1" var="curr">
						 	<option value="${curr}" <c:if test="${curr==vo.cur}">selected</c:if>>${curr}</option>
						</c:forEach>
					</select>&nbsp;&nbsp;页
					<input type="hidden" name="vo.cur" id="current">
				</form>
			        </a>
					</li>
		        </ul>
		
			</div>
		</div>
		</div>
		<script type="text/javascript">
			function check(){
				document.getElementById("current").value = document.getElementById("sel").value;
				document.selectEmp.submit();
			}
		</script>
	<!-- footer -->
	<%@include file="/footer.jsp"%>	