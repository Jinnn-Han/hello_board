<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<jsp:useBean id="user" class="user.User" scope="page"/>
<jsp:setProperty name="user" property="userID"/>
<jsp:setProperty name="user" property="userPassword"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="resources/css/bootstrap.css" rel="stylesheet">
<link href="resources/css/bootstrap.min.css" rel="stylesheet">
<link href="resources/css/style.css" rel="stylesheet">
<title>JSP Board Web site</title>
<style>
	body{
		overflow-y: hidden;
	}
</style>
</head>
<body>
	<%@ include file="WEB-INF/include/menu.jsp" %>
	<div class="container">
		<div class="alert alert-dismissible alert-secondary">
			<h1>웹 사이트 소개</h1>
			<p>부트스트랩 jsp 웹 사이트 입니다. 최소한의 간단한 로직만을 이용해서 개발했습니다.</p>
			<button type="button" class="btn btn-primary btn-large" data-role="button">자세히 알아보기</button>
		</div>
	</div>
	<div class="container">
		<div id="carouselExampleAutoplaying" class="carousel slide" data-bs-ride="carousel">
			<div class="carousel-inner">
				<div class="carousel-item active">
					<img src="resources/img/image1.jpg" class="d-block w-100" alt="image1">
				</div>
				<div class="carousel-item">
					<img src="resources/img/image2.jpg" class="d-block w-100" alt="image2">
				</div>
				<div class="carousel-item">
					<img src="resources/img/image3.png" class="d-block w-100" alt="image3">
				</div>
			</div>
			<button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleAutoplaying" data-bs-slide="prev">
				<span class="carousel-control-prev-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Previous</span>
			</button>
			<button class="carousel-control-next" type="button" data-bs-target="#carouselExampleAutoplaying" data-bs-slide="next">
				<span class="carousel-control-next-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Next</span>
			</button>
		</div>
	</div>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>