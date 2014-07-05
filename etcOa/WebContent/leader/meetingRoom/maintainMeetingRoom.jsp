<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
	<!-- header-->
	<%@include file="/header.jsp"%>
	<!-- main -->
	<div style="width:100%">
		<div style="float:left;width:15%;">
			<%@include file="../../nav/leader_nav.jsp"%>
		</div>
		<div style="float:right;width:85%;">
			<div class="container meetingc top">
				<div><h4 class="text-center"><strong>会议室维护</strong></h4></div>
				<!-- 新建会议室 -->
				<div class="well">
					<!-- 查询 -->
					<form class="form-inline" role="form" action="selectEmp" method="post">
					<a href="/etcOa/leader/meetingRoom/addMeetingRoom.jsp" class="btn btn-default" role="button">新建会议室</a>
						<div class="form-group">
							<label class="col-sm-5 control-label align">最大容纳数</label>
							<div class="col-sm-7">
								<select name="selectsearch" class="form-control">
								  <option value="0">--请选择--</option>
									<option value="all">50之内</option>
									<option value="id">50-100之内</option>
									<option value="dept">100-150之内</option>
									<option value="connact">150以上</option>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-5 control-label align">空调</label>
							<div class="col-sm-7">
								<select name="selectsearch" class="form-control">
								  <option value="0">--请选择--</option>
									<option value="all">有</option>
									<option value="id">无</option>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-6 control-label align">投影仪</label>
							<div class="col-sm-6">
								<select name="selectsearch" class="form-control">
								  <option value="0">--请选择--</option>
									<option value="all">有</option>
									<option value="id">无</option>
								</select>
							</div>
						</div>
						<div class="form-group">
						    <div class="col-sm-offset-4 col-sm-8">
							    <input type="submit" class="btn btn-default" value="查询" />
						    </div>
						</div>

					</form>
				</div>
				<!-- 表格展示 -->
				<table  class="table table-striped table-bordered">
					<tr>
						<th>会议室编号</th>
						<th>名称</th>
						<th>地点</th>
						<th>容纳人数</th>
						<th>空调</th>
						<th>投影仪</th>
						<th colspan="2">操作</th>
					</tr>
					<c:forEach items="${mroom}" var="mr">
					<tr>
						<td>${mr.mrid}</td>
						<td>${mr.mname}</td>
						<td>${mr.mraddress}</td>
						<td>${mr.mrpeople}</td>
						
						<c:if test="${mr.mracondition=='1'}"><td>是</td></c:if>
					    <c:if test="${mr.mracondition=='0'}"><td>否</td></c:if>
					
						<c:if test="${mr.mrprojector=='1'}"><td>是</td></c:if>
						<c:if test="${mr.mrprojector=='0'}"><td>否</td></c:if> 
						
						<td>
							<a href="showToUpdateMroom.action?vo.mrid=${mr.mrid} ">修改</a>
						</td>
						<td>
							<a href="showDeleteMroom.action?vo.mrid=${mr.mrid}">删除</a>
						</td>
					</tr>
				</c:forEach>
		
				</table>
				<!-- 分页 -->
					<ul class="pagination">
					<li class="disabled"><a>第${cur}页</a></li>
					<li class="disabled"><a>共 ${total}页</a></li>
			        <li><a href="showMroom.action?cur=1">首页</a></li>
			        <c:if test="${cur!=1}">
			        		<li><a href="showMroom.action?cur=${cur-1}">上一页</a></li>
					</c:if>
					<c:if test="${cur==1}"><li class="disabled"><a>上一页</a></li></c:if>
					<c:if test="${cur==total}"><li class="disabled"><a>下一页</a></li></c:if>
			        <c:if test="${cur!=total}">
			        		<li><a href="showMroom.action?cur=${cur+1}">下一页</a></li>
					</c:if>
			        <li><a href="showMroom.action?cur=${total}">尾页</a></li>
			        <li><a> 
			          <form class="form-inline fenyeEvent" action="showMroom.action" method="post">
		           转至&nbsp;&nbsp;<select name="cur"  id="mycur" class="form-control skip">
						 <c:forEach begin="1" end="${total}" step="1" var="curr">
									<option value="${curr}" <c:if test="${curr==cur}">selected</c:if>>${curr}</option>
						</c:forEach> 
						
					</select>&nbsp;&nbsp;页
				
				</form> 
			        </a>
					</li>
		        </ul>
			</div>
		</div>
	</div>
	<!-- footer -->
	<%@include file="/footer.jsp"%>