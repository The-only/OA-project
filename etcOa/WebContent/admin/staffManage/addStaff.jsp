<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
	<!-- header-->
	<%@include file="/header.jsp"%>
	<!-- main -->
	<div style="width:100%">
		<div style="float:left;width:15%;">
			<jsp:include page="../../nav/admin_nav.jsp"></jsp:include>
		</div>
		<div style="float:right;width:85%;">
			<div class="container top">
				<!-- 会议室修改 -->
				<form class="form-horizontal" role="form" action="/etcOa/system/addStaff.action" method="post">
					<!-- <div class="form-group">
						<label class="col-sm-2 control-label">员工编号</label>
						<div class="col-sm-10">
							<input class="form-control" name="vo.userid" type="text" value="111" readonly></div>
					</div> -->
					<div class="form-group">
						<label class="col-sm-2 control-label">默认密码</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" name="vo.upass"  value="111111" readonly></div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">帐号</label>
						<div class="col-sm-10">
							<input type="text" name="vo.uname" class="form-control"></div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">员工姓名</label>
						<div class="col-sm-10">
							<input type="text" name="vo.name" class="form-control"></div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">员工性别</label>
						<label class="radio-inline">
							<input type="radio" name="vo.sex"  value="男" checked>男</label>
						<label class="radio-inline">
							<input type="radio" name="vo.sex"  value="女" >女</label>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">员工年龄</label>
						<div class="col-sm-10">
							<input type="text" name="vo.age" class="form-control"></div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">所属部门</label>
						<div class="col-sm-10">
							<select name="vo.did" class="form-control">
							   <option value="0">--请选择--</option>
							<c:forEach items="${depart}" var="d">
								<option value="${d.did}" >${d.dname}</option>
							</c:forEach>
						</select>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">职务</label>
						<div class="col-sm-10">
						<select name="vo.postionid" class="form-control">
						   <option value="0">--请选择--</option>
							<c:forEach items="${postion}" var="p">
								<option value="${p.postid}" >${p.postname }</option>
							</c:forEach>
						</select>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">个人爱好</label>
						<div class="col-sm-10">
							<input type="text" name="vo.interest" class="form-control"></div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">个人介绍</label>
						<div class="col-sm-10">
							<textarea class="form-control" name="vo.introduce" rows="3"></textarea>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">办公电话</label>
						<div class="col-sm-10">
							<input type="text" name="vo.tel" class="form-control"></div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">移动电话</label>
						<div class="col-sm-10">
							<input type="text" name="vo.phone" class="form-control"></div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">电子邮箱</label>
						<div class="col-sm-10">
							<input type="text" name="vo.email" class="form-control"></div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">个人地址</label>
						<div class="col-sm-10">
							<input type="text" name="vo.address" class="form-control"></div>
					</div>
					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-2">
							<input type="submit" class="btn btn-default" value="确定添加"></div>
						<div class="col-sm-3">
							<a href="/etcOa/system/showStaff.action?vo.cur=1" class="btn btn-info" role="button">返回</a>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	<!-- footer -->
	<%@include file="/footer.jsp"%>	