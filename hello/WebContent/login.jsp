<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="resources/css/bootstrap.css" rel="stylesheet">
<link href="resources/css/bootstrap.min.css" rel="stylesheet">
<link href="resources/css/style.css" rel="stylesheet">
<title>JSP Board Web site</title>
</head>
<body>
	<%@ include file="WEB-INF/include/menu.jsp" %>
	<div class="container">
		<form action="loginAction.jsp" method="post">
			<div class="card text-white bg-secondary mb-3">
				<div class="card-header">
					<h4>로그인 화면</h4>
				</div>
				<div class="card-body">
				    <div class="form-group">
						<label for="exampleInputEmail1" class="form-label">Id</label>
		      			<input type="text" class="form-control" id="userID" name="userID" placeholder="아이디를 입력해주세요">
		    		</div>
		    		<div class="form-group">
		      			<label for="exampleInputPassword1" class="form-label mt-3">Password</label>
		      			<input type="password" class="form-control" id="userPassword" name="userPassword" placeholder="비밀번호를 입력해주세요" autocomplete="off">
		    		</div>
		    		<div class="d-grid gap-2 mt-3">
		  				<input class="btn btn-lg btn-primary" type="submit" cursorshover="true" value="login">
		  				<button type="button" class="btn btn-lg btn-secondary btn-join" cursorshover="true" onclick="location.href='join.jsp'">Join</button>
					</div>
				</div>
			</div>
		</form>
	</div>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>