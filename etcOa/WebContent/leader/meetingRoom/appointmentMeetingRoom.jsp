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
				<div><h4 class="text-center"><strong>预约查询</strong></h4></div>
				<!-- 查询 -->
				<div class="well clearfix">
					<form class="form-inline" role="form" action="selectEmp" method="post">
					<div class="form-group">
							<label class="col-sm-5 control-label align">最大容纳数</label>
							<div class="col-sm-7">
								<select name="selectsearch" class="form-control">
									<option value="0">--请选择--</option>
									<option value="all">50之内</option>
									<option value="id">50-100之内</option>
									<option value="dept">100-150之内</option>
									<option value="connact">150以上</option>
								</select>
						    </div>
					</div>
					<div class="form-group">
						<label class="col-sm-5 control-label align">空调</label>
						<div class="col-sm-7">
							<select name="selectsearch" class="form-control">
								<option value="0">--请选择--</option>
								<option value="all">有</option>
								<option value="id">无</option>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-5 control-label align">投影仪</label>
						<div class="col-sm-7">
							<select name="selectsearch" class="form-control">
								<option value="0">--请选择--</option>
								<option value="all">有</option>
								<option value="id">无</option>
							</select>
						</div>
					</div>
					<div class="form-group col-sm-8 time">
						<label class="control-label col-sm-4 align">预约时间</label>
						<div class='col-sm-4'>
							<div class='input-group date' id='appoint_start'>
								<input type='text' class="form-control" placeholder="开始时间" disabled/>
								<span class="input-group-addon">
									<span class="glyphicon glyphicon-calendar"></span>
								</span>
							</div>
						</div>
		
						<div class="col-sm-4">
							<div class='input-group date' id='appoint_end'>
								<input type='text' class="form-control" placeholder="结束时间" disabled/>
								<span class="input-group-addon">
									<span class="glyphicon glyphicon-calendar"></span>
								</span>
							</div>
						</div>
					</div>
					<div class="form-group">
					<div class="col-sm-offset-2 col-sm-2">
						<input type="submit" class="btn btn-default" value="查询">
					</div>
					</div>
				</form>
			</div>
			<!-- 表格展示 -->
			<table  class="table table-striped table-bordered">
				<tr>
					<th>会议室编号</th>
					<th>名称</th>
					<th>地点</th>
					<th>容纳人数</th>
					<th>空调</th>
					<th>投影仪</th>
					<th colspan="2">操作</th>
				</tr>
				<tr>
					<td>101</td>
					<td>第一会议室</td>
					<td>公司总部</td>
					<td>106</td>
					<td>有</td>
					<td>有</td>
					<td>
						<a href="#">预约</a>
					</td>
				</tr>
				<tr>
					<td>101</td>
					<td>第一会议室</td>
					<td>公司总部</td>
					<td>106</td>
					<td>有</td>
					<td>有</td>
					<td>
						<a href="#">预约</a>
					</td>
				</tr>
				<tr>
					<td>101</td>
					<td>第一会议室</td>
					<td>公司总部</td>
					<td>106</td>
					<td>有</td>
					<td>有</td>
					<td>
						<a href="#">预约</a>
					</td>
				</tr>
				<tr>
					<td>101</td>
					<td>第一会议室</td>
					<td>公司总部</td>
					<td>106</td>
					<td>有</td>
					<td>有</td>
					<td>
						<a href="#">预约</a>
					</td>
				</tr>
				<tr>
					<td>101</td>
					<td>第一会议室</td>
					<td>公司总部</td>
					<td>106</td>
					<td>有</td>
					<td>有</td>
					<td>
						<a href="#">预约</a>
					</td>
				</tr>
				<tr>
					<td>101</td>
					<td>第一会议室</td>
					<td>公司总部</td>
					<td>106</td>
					<td>有</td>
					<td>有</td>
					<td>
						<a href="#">预约</a>
					</td>
				</tr>
			</table>
			<!-- 分页 -->
			<ul class="pagination">
				<li class="disabled">
					<a>第1页</a>
				</li>
				<li class="disabled">
					<a>共3页</a>
				</li>
				<li class="disabled">
					<a href="#">首页</a>
				</li>
				<li>
					<a href="#">上一页</a>
				</li>
				<li>
					<a href="#">下一页</a>
				</li>
				<li>
					<a href="#">尾页</a>
				</li>
				<li>
					<a>
						<form class="form-inline" name="selectEmp" action="selectEmp" method="post">
							转至&nbsp;&nbsp;
							<select class="form-control skip">
								<option>1</option>
								<option>2</option>
								<option>3</option>
								<option>4</option>
								<option>5</option>
							</select>
							&nbsp;&nbsp;页
							<input type="hidden" name="cur"></form>
					</a>
				</li>
			</ul>
		
		</div>
	</div>
</div>
	<!-- footer -->
	<%@include file="/footer.jsp"%>