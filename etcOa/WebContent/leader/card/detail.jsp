<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!-- header-->
<%@include file="/header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- main -->
<div style="width: 100%">
	<div style="float: left; width: 15%;">
		<%@include file="../../nav/leader_nav.jsp"%>
	</div>
	<div style="float: right; width: 85%;">
		<div class="top">
			<div class="info_main" style="width: 960px;">

				<p class="general_title">
					<span>名片夹---${vo.cardfloder.cname }</span>
				</p>
				<div class="separator" style="height: 39px;"></div>
			</div>


			<div class="container">
				<!-- 查询 -->
				<form class="form-inline well" role="form"
					action="getCardsByName_leader.action?vo.cid=${vo.cardfloder.cid }&vo.cur=1"
					method="post">
					<div class="form-group">
						<label class="col-sm-4 control-label align">具体查询</label>
						<div class="col-sm-8">
							<input name="vo.cname" type="text" class="form-control"
								placeholder="请输入名片夹名">
						</div>
					</div>
					<div class="form-group">
						<button type="submit" class="btn btn-default">查询</button>
					</div>
					<!-- <button type="button" class="btn btn-default pull-right">导出Excel</button> -->
				</form>

				<!-- 表格展示 -->
				<table class="table table-striped">
					<tr>
						<th>名字</th>
						<th>查看</th>
						<th>删除</th>
					</tr>
					<c:forEach items="${vo.cards}" var="card">
						<tr>
							<td>${card.cname }</td>
							<td><a href="getCard_leader.action?vo.cid=${card.cardid }">详细信息</a></td>
							<td><a href="deleteCard_leader.action?vo.cid=${card.cardid}"
								onclick="return confirm('确认删除吗？')">删除</a></td>
						</tr>
					</c:forEach>
				</table>
				<!-- 分页 -->
				<ul class="pagination">
					<li class="disabled"><a>第${vo.cur }页</a></li>
					<li class="disabled"><a>共${vo.total }页</a></li>
					<li><a
						href="getCards_leader.action?vo.cid=${vo.cardfloder.cid }&vo.cur=1">首页</a></li>
					<c:if test="${vo.cur==1}">
						<li class="disabled"><a>上一页</a></li>
					</c:if>
					<c:if test="${vo.cur!=1}">
						<li><a
							href="getCards_leader.action?vo.cid=${vo.cardfloder.cid }&vo.cur=${vo.cur-1}">上一页</a></li>
					</c:if>
					<c:if test="${vo.cur==vo.total}">
						<li class="disabled"><a>下一页</a></li>
					</c:if>
					<c:if test="${vo.cur!=vo.total}">
						<li><a
							href="getCards_leader.action?vo.cid=${vo.cardfloder.cid }&vo.cur=${vo.cur+1}">下一页</a></li>
					</c:if>
					<li><a
						href="getCards_leader.action?vo.cid=${vo.cardfloder.cid }&vo.cur=${vo.total}">尾页</a></li>
					<li><a>
							<form class="form-inline" name="fenyeStaff"
								action="getCards_leader.action?vo.cid=${vo.cardfloder.cid }" method="post">
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
<!-- footer -->
<%@include file="/footer.jsp"%>