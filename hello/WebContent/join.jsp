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
		<form action="joinAction.jsp" method="post">
			<div class="card text-white bg-secondary mb-3">
				<div class="card-header">
					<h4>회원가입 화면</h4>
				</div>
				<div class="card-body">
				    <div class="form-group">
						<label for="exampleInputEmail1" class="form-label">Id</label>
				    			<input type="text" class="form-control" id="userID" name="userID" placeholder="아이디를 입력해주세요">
				  		</div>
				  		<div class="form-group">
				    			<label for="exampleInputPassword1" class="form-label mt-1">Password</label>
				    			<input type="password" class="form-control" id="userPassword" name="userPassword" placeholder="비밀번호를 입력해주세요" autocomplete="off">
				  		</div>
				  		<div class="form-group">
				    			<label for="exampleInputPassword1" class="form-label mt-1">Name</label>
				    			<input type="text" class="form-control" id="userName" name="userName" placeholder="이름을 입력해주세요" autocomplete="off">
				  		</div>
				  		<div class="form-group">
				    			<label for="exampleInputPassword1" class="form-label mt-1">Gender</label>
				    			<div class="d-flex gap-3">
				     			<div class="form-check">
								<input class="form-check-input" type="radio" name="userGender" id="male" autocomplete="off" value="남" checked>
								<label class="form-check-label" for="male">
									남성
								</label>
							</div>
							<div class="form-check">
								<input class="form-check-input" type="radio" name="userGender" id="female" autocomplete="off" value="여">
								<label class="form-check-label" for="female">
									여성
								</label>
							</div>
				    			</div>
				  		</div>
				  		<div class="form-group">
			    			<label for="exampleInputPassword1" class="form-label mt-1">E-mail</label>
			    			<input type="email" class="form-control" id="userEmail" name="userEmail" placeholder="이메일을 입력해주세요" autocomplete="off">
				  		</div>
				  		<div class="d-grid gap-2 mt-3">
							<input class="btn btn-lg btn-primary" type="submit" cursorshover="true" value="Join">
					</div>
				</div>
			</div>
		</form>
	</div>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>