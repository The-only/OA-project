<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
	<!-- header-->
	<%@include file="/header.jsp"%>
	<!-- main -->
	<div style="width:100%">
		<div style="float:left;width:15%;">
			<%@include file="../../nav/admin_nav.jsp"%>
		</div>
		<div style="float:right;width:85%;">
			<!-- 	全局样式-->
			<div class="container top">
				<form class="form-horizontal addmeeting" role="form" action="addDepartments.action" method="post">
					<!-- <div class="form-group">
						<label class="col-sm-2 control-label">部门ID号</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" placeholder="部门ID号">
						</div>
					</div> -->
					<div class="form-group">
						<label class="col-sm-2 control-label">部门名</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" name="vo.dname" placeholder="">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">部门电话</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" name="vo.phone" placeholder="">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">部门职能</label>
						<div class="col-sm-10">
							<textarea class="form-control" name="vo.function" rows="3"></textarea>
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-2">
							<input type="submit" class="btn btn-default" value="提交">
						</div>
						<div class="col-sm-3">
						<a href="" class="btn btn-info" role="button">重置</a>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	<!-- footer -->
	<%@include file="/footer.jsp"%>