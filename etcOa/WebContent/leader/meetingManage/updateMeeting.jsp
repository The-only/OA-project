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
				<div><h4 class="text-center"><strong>会议修改</strong></h4></div>
				<!-- 会议修改 -->
				<form class="form-horizontal" role="form" action="updateMeeting.action?vo.mid=${vo.mid}" method="post">
					<div class="form-group">
						<label class="col-sm-2 control-label">会议编号</label>
						<div class="col-sm-10">
							<input class="form-control" type="text" value="${vo.mid}" readonly>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">会议名称</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" value="${vo.mname}" name="vo.mname"></div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">会议开始时间</label>
						<div class='col-sm-10'>
							<div class='input-group' id='meeting_start'>
								<input type='text' class="form-control" value="${vo.starttime}" name="vo.starttime" placeholder="开始时间" readonly />
								<span class="input-group-addon">
									<span class="glyphicon glyphicon-calendar"></span>
								</span>
							</div>
						</div>
		
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">会议结束时间</label>
						<div class="col-sm-10">
							<div class='input-group' id='meeting_end'>
								<input type='text' class="form-control" value="${vo.endtime}" name="vo.endtime" placeholder="结束时间" readonly />
								<span class="input-group-addon">
									<span class="glyphicon glyphicon-calendar"></span>
								</span>
							</div>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">会议地点</label>
						<div class="col-sm-10">
							 <select onchange="checkdept()" name="vo.mrid" class="form-control">
							
				                             <c:forEach items="${mr}" var="mroom">
					                              <option value="${mroom.mrid}" <c:if test="${mroom.mname==vo.mroom.mname}">selected</c:if>>${mroom.mname}</option>
				                             </c:forEach>
	                                  </select>
                        </div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">会议人员名单</label>
						<div class="col-sm-10">
							<div class="add clearfix">
								<label class="col-sm-1 control-label">部门</label>
								<div class="col-sm-3">
									 <select onchange="checkdept()" id="s_deptname" class="form-control">
									      <option value="">--请选择--</option>
				                             <c:forEach items="${dept}" var="dept">
					                              <option value="${dept.did}">${dept.dname}</option>
				                             </c:forEach>
	                                  </select>
								</div>
								<label class="col-sm-2 control-label">部门人员</label>
								<div class="col-sm-2">
									<select onchange="checkdept()" id="apartperson" class="form-control">
									      <option value="">--请选择--</option>
				                             <c:forEach items="${us}" var="users">
					                              <option value="${users.name}">${users.name}</option>
				                             </c:forEach>
	                                  </select>
								</div>
								<div class="col-sm-offset-2 col-sm-2">
									<button class="btn btn-default" id="person_add">确定添加</button> </div>
							</div>
							<textarea class="form-control" rows="3" name="vo.meetingPerson" id="handinput" placeholder="可手动输入，人名以;隔开"><c:forEach items="${meetingUsers}" var="mu">${mu.name};</c:forEach></textarea>
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-2">
							<input type="submit" class="btn btn-default" value="确定修改">
						</div>
						<div class="col-sm-3">
						<a href="showMeeting.action" class="btn btn-info" role="button">返回</a>
						</div>
					</div>
				</form>
		
				<!-- 表格展示 -->
			</div>
		</div>
	</div>
	<!-- footer -->
	<%@include file="/footer.jsp"%>