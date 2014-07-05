<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!-- header-->
<%@include file="/header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script type="text/javascript">
	
</script>
<!-- main -->
<div style="width: 100%">
	<div style="float: left; width: 15%;">
		<%@include file="../../nav/staff_nav.jsp"%>
	</div>
	<div style="float: right; width: 85%;">
		<div class="top">
			<div class="info_main">

				<p class="general_title">
					<span>名片夹——名片夹管理</span>
				</p>
				<div class="separator" style="height: 39px;"></div>
			</div>


			<div class="container">
				<!-- 新增 -->
				<form class="form-inline well" role="form" action="selectEmp"
					method="post">
					<div class="form-group">
						<button type="submit" class="btn btn-default" data-toggle="modal"
							data-target="#myModal">新增名片夹</button>
					</div>
					<!-- <button type="button" class="btn btn-default pull-right">导出Excel</button> -->
				</form>

				<!-- 表格展示 -->
				<table class="table table-striped">
					<tr>
						<th>名片夹名称</th>
						<th>详细</th>
						<th>操作</th>
					</tr>
					<c:forEach items="${vo.cardfloders}" var="cardfloder">
						<tr>
							<td id="cardid" style="display: none;"><h2>${cardfloder.cid }</h2></td>
							<td>${cardfloder.cname}</td>
							<td><a
								href="getCards_staff.action?vo.cid=${cardfloder.cid }&vo.cur=1">查看</a></td>
							<td><a
								href="deleteCardfloder_staff.action?vo.cid=${cardfloder.cid}"
								onclick="return confirm('确认删除吗？')">删除</a></td>
						</tr>
					</c:forEach>

				</table>
				<!-- 分页 -->
				<ul class="pagination">
					<li class="disabled"><a>第${vo.cur}页</a></li>
					<li class="disabled"><a>共${vo.total}页</a></li>
					<li><a href="getCardfloders_staff.action?vo.cur=1">首页</a></li>
					<c:if test="${vo.cur==1}">
						<li class="disabled"><a>上一页</a></li>
					</c:if>
					<c:if test="${vo.cur!=1}">
						<li><a href="getCardfloders_staff.action?vo.cur=${vo.cur-1}">上一页</a></li>
					</c:if>
					<c:if test="${vo.cur==vo.total}">
						<li class="disabled"><a>下一页</a></li>
					</c:if>
					<c:if test="${vo.cur!=vo.total}">
						<li><a href="getCardfloders_staff.action?vo.cur=${vo.cur+1}">下一页</a></li>
					</c:if>
					<li><a href="getCardfloders_staff.action?vo.cur=${vo.total}">尾页</a></li>



					<li><a>
							<form class="form-inline" name="CardfloderStaff"
								action="getCardfloders_staff.action" method="post">
								转至&nbsp;&nbsp;<select class="form-control skip fenyeEvent"
									name="vo.cur">
									<c:forEach begin="1" end="${vo.total}" step="1" var="curr">
										<option value="${curr}"
											<c:if test="${curr==vo.cur}">selected</c:if>>${curr}</option>
									</c:forEach>
								</select>&nbsp;&nbsp;页
							</form>
					</a></li>
				</ul>

			</div>
		</div>
	</div>
</div>
<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">&times;</button>
				<h4 class="modal-title" id="myModalLabel">新增名片夹</h4>
			</div>
			<form action="addCardfloder_staff.action" method="post">
				<div class="modal-body">

					新增名片夹名称：<input type="text" name="vo.cname">

				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
					<button type="submit" class="btn btn-primary">保存</button>
				</div>
			</form>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>
<!-- /.modal -->
<!-- footer -->

<!-- 获取Confirm的值 -->

<%@include file="/footer.jsp"%>
