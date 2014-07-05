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
				<div><h4 class="text-center"><strong>部门修改</strong></h4></div>
				<!-- 部门修改 -->
				<form class="form-horizontal" role="form" action="updateDepartments.action" method="post">
					<div class="form-group">
						<label class="col-sm-2 control-label">部门编号</label>
						<div class="col-sm-10">
							<input class="form-control" type="text" name="vo.did" value="${vo.department.did }" readonly></div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">部门姓名</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" name="vo.dname" value="${vo.department.dname }"></div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">部门电话</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" name="vo.phone" value="${vo.department.phone }"></div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">部门职能</label>
						<div class="col-sm-10">
							<textarea class="form-control" name="vo.function">${vo.department.function }</textarea>
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-2">
							<input type="submit" class="btn btn-default" value="确定修改"></div>
						<div class="col-sm-3">
							<a href="show.html" class="btn btn-info" role="button">返回</a>
						</div>
					</div> 
				</form>
			</div>
		</div>
	</div>
	<!-- footer -->
	<%@include file="/footer.jsp"%>	