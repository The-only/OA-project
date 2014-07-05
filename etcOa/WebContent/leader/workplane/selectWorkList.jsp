<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!-- header-->
	<%@include file="/header.jsp"%>
	<!-- main -->
	<div style="width:100%">
		<div style="float:left;width:15%;">
			<%@include file="../../nav/leader_nav.jsp"%>
		</div>
		<div style="float:right;width:85%;margin-top:20px;">
		<div class="container">
		 <div class="info_main" style="width: 960px;">
		
		    <p class="general_title">
		      <span>工作安排——查询工作清单</span>
		    </p>
		    <div class="separator" style="height:39px;">
		    </div>
		  </div>
		  <div class="container">
		    <!-- 查询 -->
		    <form class="form-inline well" role="form" action="selectEmp" method="post">
		      <div class="form-group">
		        <label class="col-sm-5 control-label align">部门</label>
		        <div class="col-sm-7">
		          <select name="selectsearch" class="form-control">
		            <option value="all">人事部</option>
		            <option value="id">后勤部</option>
		            <option value="dept">组织部</option>
		          </select>
		        </div>
		      </div>
		      <div class="form-group">
		        <label class="col-sm-5 control-label align">职位</label>
		        <div class="col-sm-7">
		          <select name="selectsearch" class="form-control">
		            <option value="all">部门经理</option>
		          </select>
		        </div>
		        
		        
		      </div>
		      <div class="form-group">
		        <label class="col-sm-4 control-label align">具体查询</label>
		        <div class="col-sm-8">
		          <input type="text" class="form-control" placeholder="请输入姓名或编号">
		        </div>
		      </div>
		      <div class="form-group">
		        <button type="submit" class="btn btn-default">查询</button>
		      </div>
		      <button type="button" class="btn btn-default pull-right">导出Excel</button>
		    </form>
		
		    <!-- 表格展示 -->
		    <table  class="table table-striped table-bordered">
		      <tr>
		        <th>工作安排</th>
		        <th>工作日期</th>
		        <th>工作时间</th>
		        <th>安排人</th>
		
		      </tr>
		      <tr>
		        <td>三楼会议室会议</td>
		        <td>2007/3/2</td>
		        <td> 8:30-9:30</td>
		        <td>本人</td>
		      </tr>
		      <tr>
		        <td>三楼会议室会议</td>
		        <td>2007/3/2</td>
		        <td> 8:30-9:30</td>
		        <td>本人</td>
		      </tr>
		      <tr>
		        <td>三楼会议室会议</td>
		        <td>2007/3/2</td>
		        <td> 8:30-9:30</td>
		        <td>本人</td>
		      </tr>
		      <tr>
		        <td>三楼会议室会议</td>
		        <td>2007/3/2</td>
		        <td> 8:30-9:30</td>
		        <td>本人</td>
		      </tr>
		    </table>
		    <!-- 分页 -->
		    <ul class="pagination">
		      <li class="disabled"><a>第1页</a></li>
		      <li class="disabled"><a>共3页</a></li>
		      <li class="disabled"><a href="#">首页</a></li>
		      <li><a href="#">上一页</a></li>
		      <li><a href="#">下一页</a></li>
		      <li><a href="#">尾页</a></li>
		      <li><a> 
		       <form class="form-inline" name="selectEmp" action="selectEmp" method="post">
		         转至&nbsp;&nbsp;<select class="form-control skip">
		         <option>1</option>
		         <option>2</option>
		         <option>3</option>
		         <option>4</option>
		         <option>5</option>
		       </select>&nbsp;&nbsp;页
		       <input type="hidden" name="cur">
		     </form>
		   </a>
		 </li>
		</ul>
		
		</div>
		</div>
	</div>
</div>
	<!-- footer -->
	<%@include file="/footer.jsp"%>