<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
	<!-- header-->
	<%@include file="/header.jsp"%>
	<!-- main -->
	<div style="width:100%">
		<div style="float:left;width:15%;">
			<%@include file="../../nav/leader_nav.jsp"%>
		</div>
		<div style="float:right;width:85%;">
			<div class="container top">
				<!-- 表头 -->
				<div><h4 class="text-center"><strong>查看他人共享文件夹</strong></h4></div>
		
				<!-- 表格展示 -->
				<table  class="table table-striped table-bordered">
					<tr>
						<th>员工编号</th>
						<th>姓名</th>
						<th>所属部门</th>
						<th>操作</th>
					</tr>
					<tr>
						<td>101</td>
						<td>小麦</td>
						<td>人事部</td>
						<td><a id="delete" href="">查看</a></td>
				</tr>
					<tr>
						<td>101</td>
						<td>小麦</td>
						<td>人事部</td>
						<td><a href="">查看</a></td>
					</tr>
					<tr>
						<td>101</td>
						<td>小麦</td>
						<td>人事部</td>
						<td><a href="">查看</a></td>
					</tr>
					<tr>
						<td>101</td>
						<td>小麦</td>
						<td>人事部</td>
						<td><a href="">查看</a></td>
						</tr>
					<tr>
						<td>101</td>
						<td>小麦</td>
						<td>人事部</td>
						<td><a href="">查看</a></td>
					</tr>
		
				</table>
				<!-- 分页 -->
				<ul class="pagination">
					<li class="disabled"><a>第1页</a></li>
					<li class="disabled"><a>共3页</a></li>
			        <li class="disabled"><a href="#">首页</a></li>
			        <li><a href="#">上一页</a></li>
			        <li><a href="#">下一页</a></li>
			        <li><a href="#">尾页</a></li>
			        <li><a> 
			         <form class="form-inline" name="selectEmp" action="selectEmp" method="post">
		           转至&nbsp;&nbsp;<select class="form-control skip">
						<option>1</option>
						<option>2</option>
						<option>3</option>
						<option>4</option>
						<option>5</option>
					</select>&nbsp;&nbsp;页
					<input type="hidden" name="cur">
				</form>
			        </a>
					</li>
		        </ul>
			</div>
		</div>
	</div>
	<!-- footer -->
	<%@include file="/footer.jsp"%>