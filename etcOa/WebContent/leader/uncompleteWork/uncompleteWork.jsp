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
				<div><h4 class="text-center"><strong>待办工作列表</strong></h4></div>		<!-- 表格展示 -->
				<table  class="table table-striped table-bordered">
					<tr>
						<th>工作安排</th>
						<th>工作日期</th>
						<th>工作时间</th>
						<th>安排人</th>
						<th>操作</th>
						<th>完成状况</th>
					</tr>
					<tr>
						<td>三楼会议室会议</td>
						<td>2007/3/2</td>
						<td>8:30-9:30</td>
						<td>本人</td>
						<td><a id="delete" href="">删除</a></td>
						<td>完成</td>
				</tr>
					<tr>
						<td>接待某公司代表</td>
						<td>2007/3/2</td>
						<td>8:30-9:30</td>
						<td>本人</td>
						<td><a href="">删除</a></td>
						<td>完成</td>
					</tr>
					<tr>
						<td>召开部门会议</td>
						<td>2007/3/2</td>
						<td>8:30-9:30</td>
						<td>本人</td>
						<td><a href="">删除</a></td>
						<td>完成</td>
					</tr>
					<tr>
						<td>接待某公司代表</td>
						<td>2007/3/2</td>
						<td>8:30-9:30</td>
						<td>本人</td>
						<td><a href="">删除</a></td>
						<td>完成</td>
					</tr>
					<tr>
						<td>接待某公司代表</td>
						<td>2007/3/2</td>
						<td>8:30-9:30</td>
						<td>本人</td>
						<td><a href="">删除</a></td>
						<td>完成</td>
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
					<button type="button" class="btn btn-default pull-right addwork" data-toggle="modal" data-target="#myModal">添加工作安排</button>
		        </ul>
		
			</div>
		</div>
	</div>


	<!-- 模态框内容 -->
	<form class="form-horizontal" role="form">
		<div class="modal fade" id="myModal">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		        <h4 class="modal-title">添加工作计划</h4>
		      </div>
		      <div class="modal-body">
		      	<div class="form-group">
			        <label for="activeName">活动名称</label>
			        <input type="text" class="form-control" id="activeName" placeholder="活动名称">
		        </div>

		        <div class="form-group">
		        	<label class="control-label">活动开始时间</label>
					<div class='input-group' id='meeting_start'>
						<input type='text' class="form-control" placeholder="开始时间" readonly />
						<span class="input-group-addon">
							<span class="glyphicon glyphicon-calendar"></span>
						</span>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label">活动结束时间</label>
						<div class='input-group' id='meeting_end'>
							<input type='text' class="form-control" placeholder="结束时间" readonly />
							<span class="input-group-addon">
								<span class="glyphicon glyphicon-calendar"></span>
							</span>
						</div>
				</div>
				<div class="form-group">
					<label for="activePerson">活动人</label>
		        	<!--<input type="text" class="form-control" id="activePerson" placeholder="本人">-->
		        	<div class="">
			       		<div class="add clearfix">
								<label class="control-label">部门</label>
								<div class="">
									<select name="selectsearch" class="form-control">
									  	<option value="0">--请选择--</option>
										<option value="all">人事部</option>
										<option value="id">财务部</option>
										<option value="id">财务部</option>
										<option value="id">研发部</option>
									</select>
								</div>
								<label class="control-label">部门人员</label>
								<div class="">
									<select id="apartperson" name="selectsearch" class="form-control">
									    <option value="0">--请选择--</option>
										<option value="小李">小李</option>
										<option value="小张">小张</option>
										<option value="小王">小王</option>
										<option value="小吴">小吴</option>
									</select>
								</div>
								<div class="text-right">
									<button class="btn btn-default" id="person_add">确定添加</button> 
								</div>
						</div>
						<textarea class="form-control" rows="3" id="handinput" placeholder="可手动输入，人名以;隔开"></textarea>
					</div>
				</div>
				<div class="form-group">
				        <label for="activeContant">活动内容</label>
				        <textarea class="form-control" rows="3"></textarea>
		        </div>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-default" data-dismiss="modal">重置</button>
		        <button type="button" class="btn btn-primary">提交</button>
		      </div>
		    </div><!-- /.modal-content -->
		  </div><!-- /.modal-dialog -->
		</div><!-- /.modal -->
	</form>
	<!-- footer -->
	<%@include file="/footer.jsp"%>