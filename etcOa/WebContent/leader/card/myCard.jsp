<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!-- header-->
<%@include file="/header.jsp"%>
<!-- main -->
<div style="width: 100%">
	<div style="float: left; width: 15%;">
		<%@include file="../../nav/leader_nav.jsp"%>
	</div>
	<div style="float: right; width: 85%;">
		<div class="top">
			<div class="info_main" style="width: 960px;">

				<p class="general_title">
					<span>我的名片夹</span>
				</p>
				<div class="separator" style="height: 39px;"></div>
				<form class="form-inline well" role="form" action="sendCard_leader.action"
					method="post">

					<div class="form-group">
						<label class="col-sm-4 control-label align">员工号</label>
						<div class="col-sm-8">
							<input type="text" name="vo.userid" class="form-control"
								placeholder="请输入员工号">
						</div>
					</div>
					<div class="form-group">
						<button type="submit" class="btn btn-default">发送</button>
					</div>
				</form>
				<form role="form" action="getIndex_leader.action" method="post">
					<table class="table table-striped"
						style="width: 960px; text-align: center;">
						<tr>
							<th></th>
							<th></th>
						</tr>
						<tr>
							<td>姓名:</td>
							<td>${vo.card.cname }</td>
						</tr>
						<tr>
							<td>所属部门:</td>
							<td>${vo.card.dept }</td>
						</tr>
						<tr>
							<td>职位:</td>
							<td>${vo.card.position }</td>
						</tr>
						<tr>
							<td>办公室电话:</td>
							<td>${vo.card.tel }</td>
						</tr>
						<tr>
							<td>手机:</td>
							<td>${vo.card.phone }</td>
						</tr>
						<tr>
							<td>电子邮件:</td>
							<td>${vo.card.email }</td>
						</tr>
					</table>
					<div align="center">
						<button type="submit" class="btn btn-default"
							style="margin: 20px;" data-toggle="modal" data-target="#myModal">编辑</button>
						<button type="submit" class="btn btn-default">返回</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>

<!-- Edit -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">&times;</button>
				<h4 class="modal-title" id="myModalLabel">名片夹信息修改</h4>
			</div>
			<div class="modal-body">
				<form action="updateCard_leader.action" method="post">
					<div class="block_Info">
						<div class="col_1">
							<div class="info_name">
								<p>姓名：</p>
							</div>
							<div class="info">
								<input type="text" name="vo.cname" value=${vo.card.cname } readonly>
							</div>
							<div class="separator" style="height: 14px;"></div>
							<div class="info_name">
								<p>所属部门：</p>
							</div>
							<div class="info">
								<input type="text" name="vo.dept"
									value=${vo.card.dept }>
							</div>
							<div class="separator" style="height: 14px;"></div>
							<div class="info_name">
								<p>职位:</p>
							</div>
							<div class="info">
								<input type="text" name="vo.position" value="${vo.card.position }">
							</div>
							<div class="separator" style="height: 14px;"></div>
							<div class="info_name">
								<p>办公电话：</p>
							</div>
							<div class="info">
								<input type="text" name="vo.tel" value="${vo.card.tel }">
							</div>
							<div class="separator" style="height: 14px;"></div>
							<div class="info_name">
								<p>手机:</p>
							</div>
							<div class="info">
								<input type="text" name="vo.phone" value="${vo.card.phone }">
							</div>
							<div class="separator" style="height: 14px;"></div>

							<div class="info_name">
								<p>电子邮件:</p>
							</div>
							<div class="info">
								<input type="text" name="vo.email" value="${vo.card.email }">
							</div>
							<div class="separator" style="height: 14px;"></div>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
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
	<%@include file="/footer.jsp"%>