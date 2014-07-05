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
				<div><h4 class="text-center"><strong>添加工作计划</strong></h4></div>
				<form class="form-horizontal addmeeting" role="form" action="" method="post">
					<div class="form-group">
						<label class="col-sm-2 control-label">活动名车</label>
						<div class="col-sm-10">
							<input class="form-control" type="text" value=""></div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">活动开始时间</label>
						<div class='col-sm-10'>
							<div class='input-group' id='meeting_start'>
								<input type='text' class="form-control" placeholder="开始时间" readonly />
								<span class="input-group-addon">
									<span class="glyphicon glyphicon-calendar"></span>
								</span>
							</div>
						</div>
		
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">活动结束时间</label>
						<div class="col-sm-10">
							<div class='input-group' id='meeting_end'>
								<input type='text' class="form-control" placeholder="结束时间" readonly />
								<span class="input-group-addon">
									<span class="glyphicon glyphicon-calendar"></span>
								</span>
							</div>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">活动人员名单</label>
						<div class="col-sm-10">
							<div class="add clearfix">
								<label class="col-sm-1 control-label">部门</label>
								<div class="col-sm-3">
									<select name="selectsearch" class="form-control">
									  	<option value="0">--请选择--</option>
										<option value="all">人事部</option>
										<option value="id">财务部</option>
										<option value="id">财务部</option>
										<option value="id">研发部</option>
									</select>
								</div>
								<label class="col-sm-2 control-label">部门人员</label>
								<div class="col-sm-2">
									<select id="apartperson" name="selectsearch" class="form-control">
									    <option value="0">--请选择--</option>
										<option value="小李">小李</option>
										<option value="小张">小张</option>
										<option value="小王">小王</option>
										<option value="小吴">小吴</option>
									</select>
								</div>
								<div class="col-sm-offset-2 col-sm-2">
									<button class="btn btn-default" id="person_add">确定添加</button> </div>
							</div>
							<textarea class="form-control" rows="3" id="handinput" placeholder="可手动输入，人名以;隔开"></textarea>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">部门职能</label>
						<div class="col-sm-10">
							<textarea class="form-control" name="vo.function" rows="3"></textarea>
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-offset-3 col-sm-2">
							<input type="submit" class="btn btn-default" value="提交"></div>
						<div class="col-sm-3">
							<a href="show.html" class="btn btn-info" role="button">返回</a>
						</div>
					</div>
				</form>
			</div>
		</div>
	<!-- footer -->
	<%@include file="/footer.jsp"%>