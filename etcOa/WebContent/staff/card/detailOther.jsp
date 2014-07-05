<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
	<!-- header-->
	<%@include file="/header.jsp"%>
	<!-- main -->
	<div style="width:100%">
		<div style="float:left;width:15%;">
			<%@include file="../../nav/staff_nav.jsp"%>
		</div>
		<div style="float:right;width:85%;">
			<div class="top">
			   <div class="info_main" style="width: 960px;">
			
			    <p class="general_title">
			      <span>${vo.card.cname } 的名片</span>
			    </p>
			    <div class="separator" style="height:39px;">
			    </div>
			  <form class="form-inline well" role="form" action="sendCard_staff.action" method="post">
			      
			      <div class="form-group">
			        <label class="col-sm-4 control-label align">员工号</label>
			        <div class="col-sm-8">
			          <input name="vo.userid" type="text" class="form-control" placeholder="请输入员工号"></div>
			      </div>
			      <div class="form-group">
			        <button type="submit" class="btn btn-default">发送</button>
			      </div>
			    </form>
			  
			  <table  class="table table-striped" style="width: 960px;text-align: center;">
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
			        <button type="submit" class="btn btn-default"onclick="window.location.replace('getCards_staff.action?vo.cid=${vo.cid}');">返回</button>
			    </div>
			  </div>
			 </div>
			</div>
		</div>
	<!-- footer -->
	<%@include file="/footer.jsp"%>			
