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
			<div class="info_main">

				<p class="general_title">
					<span>个人信息查询——本人信息</span>
				</p>
				<div class="separator" style="height: 39px;"></div>

				<div class="block_Info">
					<form>
						<div class="col_1">
							<div class="info_name">
								<p>员工号：</p>
							</div>
							<div class="info">${vo.userid }</div>
							<div class="separator" style="height: 14px;"></div>
							<div class="info_name">
								<p>姓名：</p>
							</div>
							<div class="info">${vo.name }</div>
							<div class="separator" style="height: 14px;"></div>
							<div class="info_name">
								<p>所属部门：</p>
							</div>
							<div class="info">${vo.dept }</div>
							<div class="separator" style="height: 14px;"></div>
							<div class="info_name">
								<p>电子邮件：</p>
							</div>
							<div class="info">${vo.email }</div>
							<div class="separator" style="height: 14px;"></div>
							<div class="info_name">
								<p>办公电话：</p>
							</div>
							<div class="info">${vo.tel }</div>
							<div class="separator" style="height: 14px;"></div>
							<div class="info_name">
								<p>住址：</p>
							</div>
							<div class="info">${vo.address }</div>
							<div class="separator" style="height: 14px;"></div>
							<div class="info_name">
								<p>兴趣爱好：</p>
							</div>
							<div class="info">${vo.interest }</div>
							<div class="separator" style="height: 14px;"></div>
							<div class="info_name">
								<p>个人介绍：</p>
							</div>
							<div class="info">${vo.introduce }</div>
							<div class="separator" style="height: 32px;"></div>

							<!-- 确认按钮 -->
							<button type="button" class="btn btn-primary" data-toggle="modal"
								data-target="#myModal">修改</button>
						</div>
						<!-- col_2 -->
						<div class="col_2">
							<div class="info_name">
								<p>性别：</p>
							</div>
							<div class="info">${vo.sex }</div>
							<div class="separator" style="height: 14px;"></div>
							<div class="info_name">
								<p>年龄：</p>
							</div>
							<div class="info">${vo.age }</div>
							<div class="separator" style="height: 14px;"></div>
							<div class="info_name">
								<p>职位：</p>
							</div>
							<div class="info">${vo.position }</div>
							<div class="separator" style="height: 14px;"></div>
							<div class="info_name">
								<p>移动电话：</p>
							</div>
							<div class="info">${vo.phone }</div>
							<div class="separator" style="height: 14px;"></div>

						</div>


					</form>
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
						<h4 class="modal-title" id="myModalLabel">个人信息修改</h4>
					</div>
					<div class="modal-body">

						<div class="block_Info">
							<form action="updatePersonalInfoSelf_leader.action" method="post">
								<div class="col_1">
									<div class="info_name">
										<p>姓名：</p>
									</div>
									<div class="info">${vo.name }</div>
									<div class="separator" style="height: 14px;"></div>
									<div class="info_name">
										<p>员工号：</p>
									</div>
									<div class="info">${vo.userid }</div>


									<div class="separator" style="height: 14px;"></div>
									<div class="info_name">
										<p>所属部门：</p>
									</div>
									<div class="info">
										<input name="vo.dept" type="text" value="${vo.dept }">
									</div>
									<div class="separator" style="height: 14px;"></div>
									<div class="info_name">
										<p>电子邮件：</p>
									</div>
									<div class="info">
										<input name="vo.email" type="text" value="${vo.email }">
									</div>
									<div class="separator" style="height: 14px;"></div>
									<div class="info_name">
										<p>办公电话：</p>
									</div>
									<div class="info">
										<input name="vo.tel" type="text" value="${vo.tel }">
									</div>
									<div class="separator" style="height: 14px;"></div>
									<div class="info_name">
										<p>住址：</p>
									</div>
									<div class="info">
										<input name="vo.address" type="text" value="${vo.address }">
									</div>
									<div class="separator" style="height: 14px;"></div>

									<div class="info_name">
										<p>性别：</p>
									</div>
									<div class="info">${vo.sex }</div>
									<div class="separator" style="height: 14px;"></div>
									<div class="info_name">
										<p>年龄：</p>
									</div>
									<div class="info">
										<input name="vo.age" type="text" value="${vo.age }">
									</div>
									<div class="separator" style="height: 14px;"></div>
									<div class="info_name">
										<p>职位：：</p>
									</div>
									<div class="info">
										<input name="vo.position" type="text" value="${vo.position }">
									</div>
									<div class="separator" style="height: 14px;"></div>
									<div class="info_name">
										<p>移动电话：</p>
									</div>
									<div class="info">
										<input name="vo.phone" type="text" value="${vo.phone}">
									</div>
									<div class="separator" style="height: 14px;"></div>
									<div class="info_name">
										<p>兴趣爱好：</p>
									</div>
									<div class="info">
										<textarea name="vo.interest" type="text"
											tyle="border:0 solid #00000;cols: 90;height: 39px;
			                width: 248px;">${vo.interest }</textarea>
									</div>
									<div class="separator" style="height: 14px;"></div>
									<div class="info_name">
										<p>个人介绍：</p>
									</div>
									<div class="info">
										<textarea name="vo.introduce"
											style="border: 0 solid #00000; cols: 90; height: 192px; width: 248px;">${vo.introduce }</textarea>
									</div>
									<div class="separator" style="height: 32px;"></div>

									<!-- <button type="button" class="btn btn-danger" onclick="window.location.replace('personalInfo_SelfEditResult.htm')">确定</button>  -->
								</div>

								<div class="modal-footer">
									<button type="submit" class="btn btn-primary">保存</button>
									<button type="button" class="btn btn-default"
										data-dismiss="modal">关闭</button>
								</div>

							</form>


						</div>
					</div>
				</div>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal-dialog -->
		</div>
	</div>
	<!-- footer -->
	<%@include file="/footer.jsp"%>