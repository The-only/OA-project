<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
	<!-- header-->
	<%@include file="/header.jsp"%>
	<!-- main -->
	<div style="width:100%">
		<div style="float:left;width:15%;">
			<jsp:include page="../../nav/admin_nav.jsp"></jsp:include>
		</div>
		<div style="float:right;width:85%;">
			<div class="container top">
				<!-- 查询 -->
				<form class="form-inline well" role="form" action="searchStaff.action?vo.cur=1" method="post">
				    <a href="toAddStaff.action" class="btn btn-default" role="button">新建员工</a>
					<div class="form-group">
						<label class="col-sm-5 control-label align">选择部门</label>
						<div class="col-sm-7">
							<select name="vo.postionid" class="form-control">
								<option value="0">--请选择--</option>
								<c:forEach items="${depart}" var="d">
								   <option value="${d.did}" <c:if test="${d.did==vo.postionid}">selected</c:if>>${d.dname}</option>
							    </c:forEach>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-4 control-label align">具体查询</label>
						<div class="col-sm-8">
							<input type="text" name="vo.xhname" value="${vo.xhname}" class="form-control" placeholder="请输入姓名或编号"></div>
					</div>
					<div class="form-group">
						<button type="submit" class="btn btn-default">查询</button>
					</div>
				</form>
		
				<!-- 表格展示 -->
				<table  class="table table-striped table-bordered">
					<tr>
						<th>员工编号</th>
						<th>姓名</th>
						<th>性别</th>
						<th>年龄</th>
						<th>所属部门</th>
						<th>自我介绍</th>
						<th>兴趣爱好</th>
						<th>办公电话</th>
						<th>移动电话</th>
						<th>E-mail</th>
						<th colspan="2">操作</th>
					</tr>
			     <c:forEach items="${list}" var="u">
					<tr>
					 	<td>${u.userid}</td>
						<td>${u.name}</td>
						<td>${u.sex}</td>
						<td>${u.age}</td>
						<td>${u.department.dname}</td>
						<td>${u.introduce}</td>
						<td>${u.interest}</td>
						<td>${u.tel}</td>
						<td>${u.phone}</td>
						<td>${u.email}</td> 
						<td><a href="toUpdateStaff.action?vo.userid=${u.userid}">修改</a></td>
						<td><a href="deleteStaff.action?vo.userid=${u.userid}" onclick="return confirm('确认删除吗？')">删除</a></td> 
					</tr>
	            </c:forEach>
		
				</table>
				<!-- 分页 -->
		    	<ul class="pagination">
					<li class="disabled"><a>第 ${vo.cur} 页 </a></li>
					<li class="disabled"><a>共${vo.total}页 </a></li>
	
					<li><a href="searchStaff.action?vo.cur=1">首页</a></li>
					<c:if test="${vo.cur==1}">
						<li class="disabled"><a>上一页</a></li>
					</c:if>
					<c:if test="${vo.cur!=1}">
						<li><a href="searchStaff.action?vo.cur=${vo.cur-1}">上一页 </a></li>
					</c:if>
					<c:if test="${vo.cur==vo.total}">
						<li class="disabled"><a>下一页</a></li>
					</c:if>
					<c:if test="${vo.cur!=vo.total}">
						<li><a href="searchStaff.action?vo.cur=${vo.cur+1}">下一页 </a></li>
					</c:if>
					<li><a href="searchStaff.action?vo.cur=${vo.total}">尾页</a></li>
					<li><a>
							<form class="form-inline" name="fenyeStaff" action="searchStaff.action" method="post">
								转至&nbsp;&nbsp;<select class="form-control skip fenyeEvent" name="vo.cur">
								    <c:forEach begin="1" end="${vo.total}" step="1" var="curr">
										<option value="${curr}" <c:if test="${curr==vo.cur}">selected</c:if>>${curr}</option>
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