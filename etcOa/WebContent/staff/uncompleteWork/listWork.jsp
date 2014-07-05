<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
					<strong>全部工作列表</strong>
				</h4>
			</div>
			<!-- 表格展示 -->
			<table class="table table-striped table-bordered">
				<tr>
					<th>工作安排</th>
					<th>开始时间</th>
					<th>结束时间</th>
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
				<li><a href="/etcOa/listwork.action?vo.cur=1">首页</a></li>
				<c:if test="${vo.cur<=1}">
					<li><a>上一页</a></li>
				</c:if>
				<c:if test="${vo.cur>1}">
					<li><a href="/etcOa/listwork.action?vo.cur=${vo.cur-1 }">上一页</a></li>
				</c:if>
				<c:if test="${vo.cur<vo.total}">
					<li><a href="/etcOa/listwork.action?vo.cur=${vo.cur+1 }">下一页</a></li>
				</c:if>
				<c:if test="${vo.cur>=vo.total}">
					<li><a>下一页</a></li>
				</c:if>
				<li><a href="/etcOa/listwork.action?vo.cur=${vo.total}">尾页</a></li>
				<li><a>
						<form class="form-inline" name="selectEmp"
							action="/etcOa/listwork.action" method="post">
							转至&nbsp;&nbsp; <select id="sel" class="form-control skip"
								name="vo.cur" onchange="changework()">
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
				<button type="button" class="btn btn-default pull-right addwork">
					<a href="/etcOa/staff/workplane/workPlan.jsp">添加工作安排</a>
				</button>
			</ul>

		</div>
		</form>
	</div>
</div>
<script type="text/javascript">
	function changework() {
		document.selectEmp.submit();
	}
</script>
<!-- footer -->
<%@include file="/footer.jsp"%>