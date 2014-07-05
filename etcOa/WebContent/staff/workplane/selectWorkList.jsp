<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>>
<!-- header-->
<%@include file="/header.jsp"%>
<!-- main -->
<div style="width: 100%">
	<div style="float: left; width: 15%;">
		<%@include file="../../nav/staff_nav.jsp"%>
	</div>
	<div style="float: right; width: 85%;">
		<div class="container top">
			<div class="info_main" style="width: 960px; margin-top: 20px;">

				<p class="general_title">
					<span>工作安排——查询工作清单</span>
				</p>
				<div class="separator" style="height: 39px;"></div>
			</div>
			<div class="container">
				<!-- 查询 -->
				<form class="form-inline well" role="form" name="myform"
					action="/etcOa/showWork.action" method="post">
					<input type="hidden" name="vo.cur" id="cur">
					<div class="form-group">
						<label class="col-sm-5 control-label align">部门</label>
						<div class="col-sm-7">
							<select name="vo.dname" class="form-control">
								<option value="%">--请选择--</option>

								<c:forEach items="${depts}" var="dept">
									<option value="${dept}"
										<c:if test="${vo.dname==dept}">selected</c:if>>${dept}</option>
								</c:forEach>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-5 control-label align">职位</label>
						<div class="col-sm-7">
							<select name="vo.postionname" class="form-control">
								<option value="%">--请选择--</option>
								<c:forEach items="${postions}" var="ps">
									<option value="${ps}"
										<c:if test="${vo.postionname==ps}">selected</c:if>>${ps}</option>
								</c:forEach>
							</select>
						</div>

					</div>
					<div class="form-group">
						<label class="col-sm-4 control-label align">具体查询</label>

						<div class="col-sm-8">
							<input name="vo.planname" type="text" class="form-control"
								<c:if test="${vo.planname!='%'}">value="${vo.planname}"</c:if>
								placeholder="请输入姓名">
						</div>
					</div>
					<div class="form-group">
						<button type="submit" class="btn btn-default">查询</button>
					</div>
					<a href="/etcOa/excel.action" class="btn btn-default pull-right">导出Excel</a>
				</form>

				<!-- 表格展示 -->
				<table class="table table-striped table-bordered">
					<tr>
						<th>工作安排</th>
						<th>工作日期</th>
						<th>工作时间</th>
						<th>安排人</th>

					</tr>
					<c:forEach items="${us}" var="u">
						<tr>
							<td>${u.schedule.sname}</td>
							<td>${u.schedule.starttime}</td>
							<td>${u.schedule.endtime}</td>
							<td>${u.usersByPlanid.name}</td>
						</tr>
					</c:forEach>
				</table>
				<!-- 分页 -->
				<ul class="pagination">
					<li class="disabled"><a>第${vo.cur}页</a></li>
					<li class="disabled"><a>共${vo.total}页</a></li>
					<li><a href="#" onclick="first1()"> 首页</a></li>
					<c:if test="${vo.cur<=1}">
						<li class="disabled"><a>上一页</a></li>
					</c:if>
					<c:if test="${vo.cur>1}">
						<li><a href="#" onclick="up1()">上一页</a></li>
					</c:if>
					<c:if test="${vo.cur<vo.total}">
						<li><a href="#" onclick="down1()">下一页</a></li>
					</c:if>
					<c:if test="${vo.cur>=vo.total}">
						<li><a>下一页</a></li>
					</c:if>

					<li><a href="#" onclick="last1()">尾页</a></li>
					<li><a>
							<form class="form-inline" name="selectEmp"
								action="/etcOa/showWork.action" method="post">
								转至&nbsp;&nbsp;<select id="sel" class="form-control skip"
									onchange="changework()">
									<c:if test="${vo.total>0 }">
										<c:forEach begin="1" end="${vo.total}" step="1" var="curr">
											<option value="${curr}"
												<c:if test="${vo.cur==curr }">selected</c:if>>${curr}</option>
										</c:forEach>
								</select>
								</c:if>
								&nbsp;&nbsp;页
							</form>
					</a></li>
				</ul>

			</div>
		</div>
	</div>
</div>
<
<script type="text/javascript">
	function changework() {
		document.getElementById("cur").value = document.getElementById("sel").value;
		document.myform.submit();
	}
	function first1() {
		document.getElementById("cur").value = 1;
		document.myform.submit();
	}
	function last1() {
		var a = 0 + "${vo.total}";
		document.getElementById("cur").value = a;
		document.myform.submit();
	}
	function up1() {
		var a = 0 + "${vo.cur-1}";
		document.getElementById("cur").value = a;
		document.myform.submit();
	}
	function down1() {
		var a = 0 + "${vo.cur+1}";
		document.getElementById("cur").value = a;
		document.myform.submit();
	}
</script>
<!-- footer -->
<%@include file="/footer.jsp"%>