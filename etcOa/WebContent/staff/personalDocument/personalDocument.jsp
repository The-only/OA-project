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
			<div>
				<h4 class="text-center">
					<strong>个人文件夹</strong>
				</h4>
			</div>
			<!-- 表格展示 -->
			<table class="table table-striped table-bordered">
				<tr>
					<th>文件名</th>
					<th>下载</th>
					<th>操作</th>
				</tr>
				<c:forEach items="${files}" var="filename">
					<tr>
						<td>${filename}</td>
						<td><a href="/etcOa/download.action?filename=${filename}"
							onclick="">下载</a></td>
						<td><a href="/etcOa/deletefile.action?filename=${filename }">删除</a></td>
					</tr>
				</c:forEach>
			</table>
			<!-- 分页 -->
			<ul class="pagination">
				<li class="disabled"><a>第1页</a></li>
				<li class="disabled"><a>共1页</a></li>
				<li class="disabled"><a href="#">首页</a></li>
				<li><a href="#">上一页</a></li>
				<li><a href="#">下一页</a></li>
				<li><a href="#">尾页</a></li>
				<li><a>
						<form class="form-inline" name="selectEmp" action="selectEmp"
							method="post">
							转至&nbsp;&nbsp;<select class="form-control skip">
								<option>1</option>
								<option>2</option>
								<option>3</option>
								<option>4</option>
								<option>5</option>
							</select>&nbsp;&nbsp;页 <input type="hidden" name="cur">
						</form>
				</a></li>
				<!-- 上传 共享 -->
				<form action="/etcOa/uploadfile.action"
					enctype="multipart/form-data" method="post">
					<div class="col-sm-offset-2 col-sm-2"
						style="margin-top: -2.9em; margin-left: 37em;">
						<input type="file" class="btn btn-default" name="file">
					</div>
					<div class="col-sm-3"
						style="margin-top: -2.9em; margin-left: 61em;">
						<input type="submit" class="btn btn-default" value="提交">
					</div>
				</form>
			</ul>
		</div>
	</div>
</div>
<!-- footer -->
<%@include file="/footer.jsp"%>