<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!-- header-->
<%@include file="/header.jsp"%>
<!-- main -->
<div style="width: 100%">
	<div style="float: left; width: 15%;">
		<%@include file="../../nav/staff_nav.jsp"%>
	</div>
	<div style="float: right; width: 85%;">
		<div class="container top">
			<!-- 表头 -->
			<div>
				<h4 class="text-center">
					<strong>查看留言</strong></small>
				</h4>
			</div>
			<!-- 表单  -->
			<form id="select_output" class="form-horizontal addmeeting"
				role="form" method="post">
				<div class="form-group">
					<label class="col-sm-2 control-label">发件人员工号</label>
					<div class="col-sm-10">
						<input name="vo.userid" type="text" class="form-control"
							value="${vo.userid }">
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">发件人姓名</label>
					<div class="col-sm-10">
						<input name="vo.name" type="text" class="form-control"
							value="${vo.name }">
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">标题</label>
					<div class="col-sm-10">
						<input name="vo.title" type="text" class="form-control"
							id="message-title" value="${vo.title}">
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">活动内容</label>
					<div class="col-sm-10">
						<textarea name="vo.content" class="form-control" rows="3">${vo.content }</textarea>
					</div>
				</div>
				<div class="from-group text-center">
					<button onclick="change_select()"
						class="btn btn-success message-button">返回</button>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<button onclick="change_output()"
						class="btn btn-default message-button">删除</button>
				</div>
			</form>
		</div>
	</div>
</div>
<script>
	function change_select() {
		var a = window.document.getElementById("select_output");
		a.action = "readMessage_staff.action?vo.cur=1";
	}
	function change_output() {
		var a = window.document.getElementById("select_output");
		a.action = "deleteMessage_staff.action";
	}
</script>
<!-- footer -->
<%@include file="/footer.jsp"%>