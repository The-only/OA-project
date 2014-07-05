<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!-- header-->
<%@include file="/header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
					<strong>发件箱</strong>
				</h4>
			</div>
			<!-- 搜索表单 -->
			<form class="form-inline well" role="form" action="sendMessagesByReceive_staff.action?vo.cur=1" method="post">
				<div class="form-group">
					<label class="sr-only" for="text">搜索</label> <input
						placeholder="请输入接收人姓名" name="vo.name" id="text" class="form-control">
				</div>
				<div class="form-group">
					<button type="submit" class="btn btn-default">查找</button>
				</div>
			</form>

			<!-- 表格展示 -->
			<table class="table table-striped table-bordered">
				<tr>
					<th>标题</th>
					<th>收件人</th>
					<th>发送时间</th>
					<th>操作</th>
				</tr>
				<c:forEach items="${vo.sendMessages}" var="sendMessage">
					<tr>
						<td><a
							href="getSendMessage_staff.action?vo.umessid=${sendMessage.umessid }">${sendMessage.message.title }</a></td>
						<td>${sendMessage.usersByReceiveid.name}</td>
						<td>${sendMessage.message.time}</td>
						<td><a
							href="deleteMessage_staff.action?vo.umessid=${sendMessage.umessid }">删除</a></td>
					</tr>
				</c:forEach>

			</table>
			<!-- 分页 -->
			<ul class="pagination">
				<li class="disabled"><a>第${vo.cur}页</a></li>
				<li class="disabled"><a>共${vo.total}页</a></li>
				<li><a href="readMessage_staff.action?vo.cur=1">首页</a></li>
				<c:if test="${vo.cur==1}">
					<li class="disabled"><a>上一页</a></li>
				</c:if>
				<c:if test="${vo.cur!=1}">
					<li><a href="readMessage_staff.action?vo.cur=${vo.cur-1}">上一页</a></li>
				</c:if>
				<c:if test="${vo.cur==vo.total}">
					<li class="disabled"><a>下一页</a></li>
				</c:if>
				<c:if test="${vo.cur!=vo.total}">
					<li><a href="sendMessage_staff.action?vo.cur=${vo.cur+1}">下一页</a></li>
				</c:if>
				<li><a href="sendMessage_staff.action?vo.cur=${vo.total}">尾页</a></li>



				<li><a>
						<form class="form-inline" name="draftMessageStaff"
							action="sendMessage_staff.action" method="post">
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
<!-- footer -->
<%@include file="/footer.jsp"%>