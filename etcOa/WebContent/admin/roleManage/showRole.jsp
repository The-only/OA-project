<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!-- header-->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="/header.jsp"%>

<!-- main -->
<div style="width: 100%">
	<div style="float: left; width: 15%;">
		<%@include file="../../nav/admin_nav.jsp"%>
	</div>
	<div style="float: right; width: 85%;">
		<div class="container top">
			<!-- 表格展示 -->
			<table class="table table-striped table-bordered">
				<tr>
					<th>员工号</th>
					<th>员工名称</th>
					<th>所属部门</th>
					<th>系统角色</th>
					<th>设置角色</th>
				</tr>
				<c:forEach items="${list}" var="us">
					<tr>
						<td>${us.userid}</td>
						<td>${us.name}</td>
						<td>${us.department.dname}</td>
						<td>
						<c:forEach items="${us.usersRoles }" var="ur">
							${ur.role.rname}&nbsp;
						</c:forEach>
						</td>
						<td><a href="toSetRole.action?vo.userid=${us.userid}">设置</a></td>
					</tr>
				</c:forEach>
			
				

			</table>
			<!-- 分页 -->
			<ul class="pagination">
				<li class="disabled"><a>第${cur}页</a></li>
				<li class="disabled"><a>共${total}页</a></li>
				<li class="disabled"><a href="getRole.action?cur=1">首页</a></li>
				<c:if test="${cur==1}"><li class="disabled"><a href="#">上一页</a></li></c:if>
			    <c:if test="${cur!=1}">
				<li><a href="getRole.action?cur=${cur-1}">上一页</a></li>
			    </c:if>
			    <c:if test="${cur!=total}">
				<li><a href="getRole.action?cur=${cur+1}">下一页</a></li>
			    </c:if>
			    <c:if test="${cur==total}">
				<li class="disabled"><a >下一页</a></li>
			    </c:if>
			    <li><a href="getRole.action?cur=${total}">尾页</a></li>
				
				<li><a>
						<form class="form-inline" name="selectEmp" action="getRole.action"
							method="post">
							转至&nbsp;&nbsp; <select class="form-control skip" class="fenyeEvent" name="cur" onchange="change()">
								<c:forEach begin="1" end="${total}" step="1" var="curr">
							    	<option value="${curr}" <c:if test="${curr==cur}">selected</c:if> >${curr}</option>
								</c:forEach>
							</select> &nbsp;&nbsp;页 
						</form>
				</a></li>
			</ul>
		</div>
	</div>
</div>
<<script type="text/javascript">
function change(){
	document.selectEmp.submit();
}
<!--

//-->
</script>
<!-- footer -->
<%@include file="/footer.jsp"%>
