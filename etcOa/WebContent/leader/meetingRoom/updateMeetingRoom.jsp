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
			<div><h4 class="text-center"><strong>修改会议</strong></h4></div>
				<!-- 会议室修改 -->
				<form class="form-horizontal" role="form" action="showUpdateMroom.action" method="post">
					<div class="form-group">
						<label class="col-sm-2 control-label">会议室编号</label>
						<div class="col-sm-10">
							<input class="form-control" type="text" name="vo.mrid" value="${vo.mrid}" readonly>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">会议室名称</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" name="vo.mname" value="${vo.mname}"></div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">会议室地点</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" name="vo.mraddress" value="${vo.mraddress}"></div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">容纳人数</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" name="vo.mrpeople" value="${vo.mrpeople}"></div>
					</div>
					<div class="form-group">
							<label class="col-sm-2 control-label">空调</label>
							<div class="col-sm-10">
								<select name="vo.mracondition" class="form-control">
									<option value="1" <c:if test="${vo.mracondition =='1' }">selected</c:if>>有</option>
									<option value="0" <c:if test="${vo.mracondition =='0' }">selected</c:if>>无</option>
								</select>
							</div>
					</div>
					<div class="form-group">
							<label class="col-sm-2 control-label">投影仪</label>
							<div class="col-sm-10">
								<select name="vo.mrprojector" class="form-control">
									<option value="1" <c:if test="${vo.mrprojector =='1' }">selected</c:if>>有</option>
									<option value="0" <c:if test="${vo.mrprojector =='0' }">selected</c:if>>无</option>
								</select>
							</div>
					</div>
					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-2">
							<input type="submit" class="btn btn-default" value="确定修改">
						</div>
						<div class="col-sm-3">
						<a href="showMroom.action" class="btn btn-info" role="button">返回</a>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	<!-- footer -->
	<%@include file="/footer.jsp"%>	