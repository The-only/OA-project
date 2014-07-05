<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!-- header-->
<%@include file="/header.jsp"%>
<!-- main -->
<div style="width: 100%">
	<div style="float: left; width: 15%;">
		<jsp:include page="../../nav/admin_nav.jsp"></jsp:include>
	</div>
	<div style="float: right; width: 85%;">
		<div class="container top">
			<!-- 会议室修改 -->
			<form class="form-horizontal" role="form" action="/etcOa/system/updateStaff.action" method="post">
				<div class="form-group">
					<label class="col-sm-2 control-label">员工编号</label>
					<div class="col-sm-10">
						<input class="form-control" name="vo.userid" type="text" value="${vo.userid}" readonly>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">默认密码</label>
					<div class="col-sm-10">
						<input type="password" name="vo.upass" class="form-control" value="${vo.upass}"
							readonly>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">员工姓名</label>
					<div class="col-sm-10">
						<input type="text" name="vo.name" class="form-control" value="${vo.name}">
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">员工性别</label> 
					<label class="radio-inline"> 
					    <input type="radio" name="vo.sex" value="男" <c:if test="${vo.sex=='男'}">checked</c:if>>男
					</label> 
					<label class="radio-inline"> 
					    <input type="radio" name="vo.sex" value="女" <c:if test="${vo.sex=='女'}">checked</c:if>>女
					</label>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">员工年龄</label>
					<div class="col-sm-10">
						<input type="text" name="vo.age" class="form-control" value="${vo.age}">
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">所属部门</label>
					<div class="col-sm-10">
						<select name="vo.did" class="form-control" >
							<c:forEach items="${depart}" var="d">
								<option value="${d.did}" <c:if test="${d.dname==vo.department.dname}">selected</c:if>>${d.dname}</option>
							</c:forEach>
						</select>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">职务</label>
					<div class="col-sm-10">
						<select name="vo.postionid" class="form-control" >
							<c:forEach items="${postion}" var="p">
								<option value="${p.postid}" <c:if test="${d.dname==vo.postion.postname}">selected</c:if>>${p.postname}</option>
							</c:forEach>
						</select>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">个人爱好</label>
					<div class="col-sm-10">
						<input type="text" name="vo.interest" class="form-control" value="${vo.interest}">
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">个人介绍</label>
					<div class="col-sm-10">
						<textarea class="form-control" name="vo.introduce" rows="3">${vo.introduce}</textarea>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">办公电话</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" name="vo.tel" value="${vo.tel}">
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">移动电话</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" name="vo.phone" value="${vo.phone}">
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">电子邮箱</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" name="vo.email" value="${vo.email}">
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">个人地址</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" name="vo.address" value="${vo.address}">
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">系统角色</label>
					   <div class="col-sm-10" id="fshowrole">
					   </div> 
				</div>
				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-2">
						<input type="submit" class="btn btn-default" value="确定修改">
					</div>
					<div class="col-sm-3">
						<a href="/etcOa/system/showStaff.action?vo.cur=1" class="btn btn-info" role="button">返回</a>
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
