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
					<strong>添加工作计划</strong>
				</h4>
			</div>
			<form class="form-horizontal addmeeting" role="form"
				action="/etcOa/addWork.action" method="post">
				<div class="form-group">
					<label class="col-sm-2 control-label">活动名称</label>
					<div class="col-sm-10">
						<input class="form-control" name="vo.workname" type="text"
							value="">
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">活动开始时间</label>
					<div class='col-sm-10'>
						<div class='input-group' id='meeting_start'>
							<input name="vo.workstarttime" type='text' class="form-control"
								placeholder="开始时间" readonly /> <span class="input-group-addon">
								<span class="glyphicon glyphicon-calendar"></span>
							</span>
						</div>
					</div>

				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">活动结束时间</label>
					<div class="col-sm-10">
						<div class='input-group' id='meeting_end'>
							<input name="vo.workendtime" type='text' class="form-control"
								placeholder="结束时间" readonly /> <span class="input-group-addon">
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
								<select id="selectdept" name="selectdept" class="form-control" onchange="checkselectdept()">
									<option value="">--请选择--</option>
								</select>
							</div>
							<label class="col-sm-2 control-label">部门人员</label>
							<div class="col-sm-2">
								<select id="apartperson" name="selectsearch"
									class="form-control">
									<option value="">--请选择--</option>
								</select>
							</div>
							<div class="col-sm-offset-2 col-sm-2">
								<button class="btn btn-default" id="person_add">确定添加</button>
							</div>
						</div>
						<textarea name="vo.workActions" class="form-control" rows="3"
							id="handinput" placeholder="可手动输入，人名以;隔开"></textarea>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">会议内容</label>
					<div class="col-sm-10">
						<textarea name="vo.workcontent" class="form-control"
							name="vo.function" rows="3"></textarea>
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-offset-3 col-sm-2">
						<input type="submit" class="btn btn-default" value="提交">
					</div>
					<div class="col-sm-3">
						<a href="show.html" class="btn btn-info" role="button">返回</a>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>
<script type="text/javascript" src="/etcOa/util/lib/jquery/jquery.js"></script>
<script type="text/javascript">
//(function(){
	$(document).ready(function() {
			htmlobj = $.ajax({
				url : "http://localhost:8080/etcOa/showDept.action",
				dateType : "json",
				success : function(json) {
					var arr = $.parseJSON(json);
					$.map(arr, function(item) {
						document.getElementById("selectdept").options.add(new Option(item,item));
					});
				}
			});
	});
	
	function checkselectdept(){
		var vo = {
				dname: $('#selectdept').val()
		}
		//console.log(vo);
		htmlobj = $.ajax({
			url : "http://localhost:8080/etcOa/getDeptPersons.action",
			dateType : "json",
			type:"POST",
			data:vo,
			 success : function(json) {
				var arr = $.parseJSON(json);
				document.getElementById("apartperson").options.length=1;
				//document.getElementById("apartperson").options.add(new Option(item,item));
				$.map(arr, function(item) {
					document.getElementById("apartperson").options.add(new Option(item,item));
				});
			} 
		});
	}
//})();

</script>
	<!-- footer -->
	<%@include file="/footer.jsp"%>