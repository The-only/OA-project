<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
	<!-- header-->
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@include file="/header.jsp"%>
	
	<!-- main -->
	<div style="width:100%">
		<div style="float:left;width:15%;">
			<jsp:include page="../../nav/admin_nav.jsp"></jsp:include>
		</div>
		<div style="float:right;width:85%;">
			<div class="container top">
				<!-- 会议室修改 -->
				<form class="form-horizontal" role="form" action="setRole.action" method="post">
					<div class="form-group">
						<label class="col-sm-2 control-label">员工ID号</label>
						<div class="col-sm-10">
							<input class="form-control" type="text" value="${vo.userid}" readonly>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">会员工名称</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" value="${vo.name}" readonly></div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">所属部门</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" value="${vo.department.dname}" readonly></div>
					</div>
					<div class="form-group">
							<label class="col-sm-2 control-label">系统角色</label>
							<div class="col-sm-10" id="fshowrole">
							</div>
					</div>
					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-2">
							<input type="submit" class="btn btn-default"  value="确定修改">
						</div>
						<div class="col-sm-3">
						<a href="getRole.action" class="btn btn-info" role="button">返回</a>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	
	<script>
	(function() {
		var obj = {
			"职员" : false,
			"领导" : false,
			"系统管理员" : false
		};
debugger;
		<c:forEach items="${vo.roles}" var="a">
		if (!obj['${a.rname}']) {
			obj['${a.rname}'] = true;
		}
		</c:forEach>

		var b = "";
		for ( var i in obj) {
			if (obj[i]) {
				b += "<input type='checkbox' name='rolename' value='"+i+"' checked> <label class='control-label'>"
						+ i + "</label>";
			} else {
				b += "<input type='checkbox' name='rolename' value='"+i+"'> <label class='control-label'>"
						+ i + "</label>";
			}
		}
		document.getElementById('fshowrole').innerHTML = b;
	})();
</script>
	
	<!-- footer -->
	<%@include file="/footer.jsp"%>	