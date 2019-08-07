<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<!DOCTYPE html>
<html lang="en">
<head>

<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<!-- Google Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700"
	rel="stylesheet">

<!-- Bootstrap CSS File -->
<link
	href="${pageContext.request.contextPath}/assets/lib/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Libraries CSS Files -->
<link
	href="${pageContext.request.contextPath}/assets/lib/font-awesome/css/font-awesome.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/assets/lib/animate/animate.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/assets/lib/ionicons/css/ionicons.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/assets/lib/owlcarousel/assets/owl.carousel.min.css"
	rel="stylesheet">
<!-- Main Stylesheet File -->
<link href="${pageContext.request.contextPath}/assets/css/style.css"
	rel="stylesheet">
	
	
<style type="text/css">
	
	.login-div{
	
		margin-top: 180px;
		
	}
	.text-info{
		color: #2ECA6A;
		
	}
	.btn-md{
		
		background-color: #2ECA6A;
		width : 120px;
		height: 40px;
		text-align:center;
		
	}
	
	.login-oper-group{
		text-align: center;
	}

</style>

<script type="text/javascript">

	
</script>
</head>

<body>
	<c:import url="/WEB-INF/views/includes/navigation.jsp" />
	<div class="login-div" id="login">
		<h3 class="text-center text-white pt-5">Login form</h3>
		<div class="container"></div>
		<div class="container">
			<div id="login-row"
				class="row justify-content-center align-items-center">
				<div id="login-column" class="col-md-6">
					<div id="login-box" class="col-md-12">
						<form id="login-form" class="form" action="" method="post">
							<h3 class="text-center title-2">Login</h3>
							<div class="form-group">
								<label for="username" class="title-2">ID:</label><br>
								<input type="text" name="username" id="username"
									class="form-control">
							</div>
							<div class="form-group">
								<label for="password" class="title-2">Password:</label><br>
								<input type="text" name="password" id="password"
									class="form-control">
							</div>
							<div class="form-group login-oper-group">
								<div class="form-group remember-me-group">
								<label for="remember-me" class="text-info">
								<span>자동로그인</span>
								<span>
								<input id="remember-me" name="remember-me"
										type="checkbox"></span></label>
							</div>
										<br> 
								<input type="submit" name="submit" class="btn btn-info btn-md" value="Ok">
							</div>
							<div id="register-link" class="text-right">
								<a href="#" class="title-2">가입하기</a>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>