<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!-- header-->
	<%@include file="/header.jsp"%>
	<!-- main -->
	<div style="width:100%">
		<div style="float:left;width:15%;">
			<%@include file="../../nav/staff_nav.jsp"%>
		</div>
		<div style="float:right;width:85%;">
		    <!-- 查出弹出层 -->    
		    <!-- Modal -->    
		    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		    	<div class="modal-dialog">
		    		<div class="modal-content">
		    			<div class="modal-header">
		    				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		    				<h4 class="modal-title" id="myModalLabel">会议详情</h4>
		    			</div>
		    		<!-- 	<div class="modal-body">
		    				<table class="table table-bordered">
		    					<tr>
		    						<th>会议编号</th>
		    						<td>101</td>
		    					</tr>
		    					<tr>
		    						<th>会议时间</th>
		    						<td>2007年4月5日 15:00</td>
		    					</tr>
		    					<tr>
		    						<th>会议名称</th>
		    						<td>关于工资发放的会议</td>
		    					</tr>
		    					<tr>
		    						<th>会议地点</th>
		    						<td>Room 206</td>
		    					</tr>
		    					<tr>
		    						<th>参与人员</th>
		    						<td>小三、张丹、武同、于德、纪施</td>
		    					</tr>
		    				</table>
		    			</div> -->
		    			</div>
		    		<!-- /.modal-content --> </div>
		    	<!-- /.modal-dialog --> </div>
		    <!-- /.modal -->    
			<div class="container top">
				<div><h4 class="text-center"><strong>会议管理</strong></h4></div>
				<!-- 表格展示 -->
				<table  class="table table-striped table-bordered">
					<tr>
						<th>会议编号</th>
						<th>会议名称</th>
						<th>会议地点</th>
						<th>会议时间</th>
						<th>会议详情</th>
					</tr>
					<c:forEach items="${meeting}" var="meeting">
					<tr>
						<td>${meeting.mid}</td>
						<td>${meeting.mname}</td>
						<td>${meeting.mroom.mraddress}</td>
						<td>${meeting.starttime}</td>
						<td><a href="lookUpMeeting.action?vo.mid=${meeting.mid}">查看</a></td>
						<td><a href="deleteMeeting.action?vo.mid=${meeting.mid}">删除</a></td>
						<td><a href="toUpdateMeeting.action?vo.mid=${meeting.mid}">修改</a></td>
					</tr>
					 </c:forEach>
					
		
				</table>
				<!-- 分页 -->
				<ul class="pagination">
					<li class="disabled"><a>第${cur}页</a></li>
					<li class="disabled"><a>共 ${total}页</a></li>
			        <li><a href="showStaffMeeting.action?cur=1">首页</a></li>
			        <c:if test="${cur!=1}">
			        		<li><a href="showStaffMeeting.action?cur=${cur-1}">上一页</a></li>
					</c:if>
					<c:if test="${cur==1}"><li class="disabled"><a>上一页</a></li></c:if>
					<c:if test="${cur==total}"><li class="disabled"><a>下一页</a></li></c:if>
			        <c:if test="${cur!=total}">
			        		<li><a href="showStaffMeeting.action?cur=${cur+1}">下一页</a></li>
					</c:if>
			        <li><a href="showStaffMeeting.action?cur=${total}">尾页</a></li>
			        <li><a> 
			          <form class="form-inline" name="selectEmp" action="selectEmp" method="post">
		           转至&nbsp;&nbsp;<select name="cur1" onchange="check()" id="mycur" class="form-control skip">
						<%-- <c:forEach begin="1" end="${total}" step="1" var="curr">
									<option value="${curr}" <c:if test="${curr==cur}">selected</c:if>>${curr}</option>
						</c:forEach> --%>
						
					</select>&nbsp;&nbsp;页
					<input type="hidden" name="cur">
				</form>
			        </a>
					</li>
		        </ul>
		
			</div>
		</div>
	</div>
	<!-- footer -->
	<%@include file="/footer.jsp"%>