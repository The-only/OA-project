<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!doctype html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="renderer" content="webkit">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="xh">

<!-- Bootstrap core CSS -->
<link href="/etcOa/util/lib/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Bootstrap theme -->
<link href="/etcOa/util/lib/bootstrap/css/bootstrap-theme.min.css"
	rel="stylesheet">

<!--[if lte IE 6]>
	<link rel="stylesheet" type="text/css" href="./lib/bootstrap/css/bootstrap-ie6.css?1">
	<![endif]-->
<!--[if lte IE 7]>
	<link rel="stylesheet" type="text/css" href="./lib/bootstrap/css/ie.css">
	<![endif]-->

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
	<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
	<script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
	<![endif]-->
<!-- build:css(.tmp) styles/main.css -->
<link rel="stylesheet" href="/etcOa/util/css/self.css">

<!-- endbuild -->
<title>协同办公系统</title>
</head>
<body>
	<!-- 图片轮播 -->
	<div id="myCarousel" class="carousel slide" data-ride="carousel">
		<!-- Indicators -->
		<ol class="carousel-indicators">
			<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
			<li data-target="#myCarousel" data-slide-to="1" class=""></li>
			<li data-target="#myCarousel" data-slide-to="2" class=""></li>
			<li data-target="#myCarousel" data-slide-to="3" class=""></li>
		</ol>
		<div class="carousel-inner">
			<div class="item active">
				<img src="/etcOa/util/images/1.jpg" alt="">
				<div class="container">
					<div class="carousel-caption">
						<!-- <h1>Example headline.</h1>
				<p>
					Note: If you're viewing this page via a
					<code>file://</code>
					URL, the "next" and "previous" Glyphicon buttons on the left and right might not load/display properly due to web browser security rules.
				</p>
				-->
					</div>
				</div>
			</div>
			<div class="item">
				<img src="/etcOa/util/images/2.jpg" alt="">
				<div class="container">
					<div class="carousel-caption">
						<!--  <h1>Another example headline.</h1>
	    		<p>
	    			Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.
	    		</p>
	    		-->
					</div>
				</div>
			</div>
			<div class="item">
				<img src="/etcOa/util/images/3.jpg" alt="">
				<div class="container">
					<div class="carousel-caption">
						<!--  <h1>One more for good measure.</h1>
	    		<p>
	    			Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.
	    		</p>
	    		-->
					</div>
				</div>
			</div>
			<div class="item">
				<img src="/etcOa/util/images/4.jpg" alt="">
				<div class="container">
					<div class="carousel-caption">
						<!--  <h1>One more for good measure.</h1>
	    		<p>
	    			Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.
	    		</p>
	    		-->
					</div>
				</div>
			</div>
		</div>
		<a class="left carousel-control" href="#myCarousel" data-slide="prev">
			<span class="glyphicon glyphicon-chevron-left"></span>
		</a> <a class="right carousel-control" href="#myCarousel"
			data-slide="next"> <span
			class="glyphicon glyphicon-chevron-right"></span>
		</a>
	</div>
	<!-- 登陆 -->
	<div class="container content">
		<form class="form-inline xlogin" role="form" action="login.action"
			method="post">
			<div class="radio">
				<label class="radio-inline"> <input type="radio"
					name="vo.roleid" value="1" checked>职员
				</label> <label class="radio-inline"> <input type="radio"
					name="vo.roleid" value="2">领导
				</label> <label class="radio-inline"> <input type="radio"
					name="vo.roleid" value="3">管理员
				</label>
			</div>
			<div class="form-group">
				<label class="sr-only" for="Username">Username</label> <input
					type="text" class="form-control" name="vo.uname" id="Username"
					placeholder="用户名">
			</div>
			<div class="form-group">
				<label class="sr-only" for="password">Password</label> <input
					type="password" class="form-control" name="vo.upass" id="password"
					placeholder="密码">
			</div>
			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">
					<input type="submit" class="btn btn-default" value="登陆" />
				</div>
			</div>
		</form>
	</div>
	<!-- 底部 -->
	<div class="footer text-center">
		<ul class="footer-links">
			<li><span class="glyphicon glyphicon-heart"></span> Coding
				by&nbsp;&nbsp; 邓小红 康&nbsp;健 林&nbsp;雯 林志抄 柳星海 罗雪婧 吴&nbsp;凯</li>
			<li class="muted">·</li>
			<li><a href="#">关于</a></li>
			<li class="muted">·</li>
			<li><a href="#">联系</a></li>
			<li class="muted">·</li>
			<li><a href="#">问题</a></li>
			<li class="muted">·</li>
			<li><a href="#">版本 @2014 v1.0.0</a></li>
		</ul>
	</div>
	<!-- build:js scripts/vendor.js -->
	<script src="/etcOa/util/lib/jquery/jquery.min.js"></script>
	<!-- endbuild -->

	<!-- build:js scripts/plugins.js -->
	<script src="/etcOa/util/lib/bootstrap/js/bootstrap.min.js"></script>
	<!-- endbuild -->

	<!-- build:js({app,.tmp}) scripts/user-defined -->
	<script src="/etcOa/util/js/self.js"></script>

	<!-- endbuild -->
</body>
</html>