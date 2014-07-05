<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!-- 员工导航栏 -->
<div class="row-fluid top">
	<ul id="left-nav" class="nav nav-pills nav-stacked">
		<li class="title"><a>个人信息</a></li>
		<div class="child-ul">
			<ul class="nav nav-pills nav-stacked">
				<li><a href="/etcOa/personalInfoSelf_staff.action">本人信息</a></li>
				<li><a href="/etcOa/personalInfoOthersAll_staff.action?vo.cur=1&vo.did=0&vo.name=">他人信息</a></li>
				<br />
				<br />
				<br />
				<br />
				<br />
				<br />
			</ul>
		</div>
		<li class="title"><a>工作安排</a></li>
		<div class="child-ul">
			<ul class="nav nav-pills nav-stacked">
				<li><a href="#">权限设置</a></li>
				<li><a href="/etcOa/staff/workplane/workPlan.jsp">日程安排</a></li>
				<li><a href="/etcOa/showWork.action">综合查询</a></li>
				<li><a href="#">日历查询</a></li>
				<br />
				<br />
			</ul>
		</div>
		<li class="title"><a>名片夹</a></li>
		<div class="child-ul">
			<ul class="nav nav-pills nav-stacked">
				<li><a href="/etcOa/getCardfloders_staff.action?vo.cur=1">名片夹管理</a></li>
				<li><a href="/etcOa/getUserCard_staff.action">个人名片</a></li>
				<br />
				<br />
				<br />
				<br />
				<br />
				<br />
			</ul>
		</div>
		<li class="title"><a>待办事项</a></li>
		<div class="child-ul">
			<ul class="nav nav-pills nav-stacked">
				<li><a href="/etcOa/undolistwork.action">待办事项</a></li>
				<li><a href="/etcOa/listwork.action">工作清单</a></li>
				<br />
				<br />
				<br />
				<br />
				<br />
				<br />
			</ul>
		</div>
		<li class="title"><a>在线信息</a></li>
		<div class="child-ul">
			<ul class="nav nav-pills nav-stacked">
				<li><a href="/etcOa/nMessage_staff.action">新建留言</a></li>
				<li><a href="/etcOa/unreadMessage_staff.action?vo.cur=1">未读留言</a></li>
				<li><a href="/etcOa/readMessage_staff.action?vo.cur=1">收件箱</a></li>
				<li><a href="/etcOa/sendMessage_staff.action?vo.cur=1">已发送</a></li>
				<li><a href="/etcOa/draftMessage_staff.action?vo.cur=1">草稿箱</a></li>
			</ul>
		</div>
		<li class="title"><a>个人文件夹</a></li>
		<div class="child-ul">
			<ul class="nav nav-pills nav-stacked">
				<li><a href="/etcOa/showfile.action">个人文件夹</a></li>
				<li><a href="/etcOa/staff/personalDocument/shareDocument.jsp">共享文件夹</a></li>
				<br />
				<br />
				<br />
				<br />
				<br />
				<br />
			</ul>
		</div>
		<li class="title"><a>公司通讯录</a></li>
		<div class="child-ul">
			<ul class="nav nav-pills nav-stacked">
				<li><a href="/etcOa/getCAList_staff.action?vo.cur=1&vo.did=0">公司通讯录</a></li>
				<br />
				<br />
				<br />
				<br />
				<br />
				<br />
				<br />
				<br />
			</ul>
		</div>
		<li class="title"><a>会议管理</a></li>
		<div class="child-ul">
			<ul class="nav nav-pills nav-stacked">
				<li><a href="/etcOa/showStaffMeeting.action">会议管理</a></li>
				<br />
				<br />
				<br />
				<br />
				<br />
				<br />
				<br />
				<br />
			</ul>
		</div>
	</ul>
</div>