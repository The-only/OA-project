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
			  <div class="info_main">
			
			    <p class="general_title">
			      <span>他人信息查询——${vo.name }</span>
			    </p>
			    <div class="separator" style=" height: 39px; ">
			    </div>
			
			    <div class="block_Info">
			      <form action="personalInfoOthersAll_staff.action?vo.cur=${vo.cur }&vo.did=0&vo.name=" method="post">
			        <div class="col_1">
			          <div class="info_name">
			           <p>员工号：</p>
			         </div>
			         <div class="info">${vo.userid }</div>
			         <div class="separator" style="height:14px;"></div>
			         <div class="info_name">
			           <p>姓名：</p>
			         </div>
			         <div class="info">${vo.name }</div>
			         <div class="separator" style="height:14px;"></div>
			         <div class="info_name">
			           <p>所属部门：</p>
			         </div>
			         <div class="info">${vo.dept }</div>
			         <div class="separator" style="height:14px;"></div>
			         <div class="info_name">
			           <p>电子邮件：</p>
			         </div>
			         <div class="info">${vo.email }</div>
			         <div class="separator" style="height:14px;"></div>
			         <div class="info_name">
			           <p>办公电话：</p>
			         </div>
			         <div class="info">${vo.tel }</div>
			         <div class="separator" style="height:14px;"></div>
			         <div class="info_name">
			           <p>住址：</p>
			         </div>
			         <div class="info">${vo.address }</div>
			         <div class="separator" style="height:14px;"></div>
			         <div class="info_name">
			           <p>兴趣爱好：</p>
			         </div>
			         <div class="info">${vo.interest }</div>
			         <div class="separator" style="height:14px;"></div>
			         <div class="info_name">
			           <p>个人介绍：</p>
			         </div>
			         <div class="info">${vo.introduce }</div>
			         <div class="separator" style="height:32px;"></div>
			  <!-- 修改按钮 -->
			        <button type="submit" class="btn btn-primary">确定</button>
			
			       </div>
			       <!-- col_2 -->
			       <div class="col_2">
			        <div class="info_name">
			         <p> 性别：</p>
			       </div>
			       <div class="info">${vo.sex }</div>
			       <div class="separator" style="height:14px;"></div>
			       <div class="info_name">
			         <p> 年龄：</p>
			       </div>
			       <div class="info">${vo.age }</div>
			       <div class="separator" style="height:14px;"></div>
			       <div class="info_name">
			         <p>职位：：</p>
			       </div>
			       <div class="info">${vo.position }</div>
			       <div class="separator" style="height:14px;"></div>
			       <div class="info_name">
			         <p>移动电话：</p>
			       </div>
			       <div class="info">${vo.phone }</div>
			       <div class="separator" style="height:14px;"></div>
			       <div class="info_name">
			       
			     </div>
			    
			    
			   
			   </form>
			 </div>
			
			</div>
		</div>
	</div>
</div>
	<!-- footer -->
	<%@include file="/footer.jsp"%>