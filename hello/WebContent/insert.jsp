<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
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
		<div class="card table-background text-white bg-secondary mb-3">
			<div class="card-header">
				<h4>게시판 글쓰기</h4>
			</div>
			<form action="insertAction.jsp" method="post">
				<div class="card-body">
			  		<div class="form-group">
		    			<label class="form-label mt-1">제목</label>
		    			<input type="text" class="form-control" id="boardTitle" name="boardTitle" placeholder="제목을 입력해주세요" autocomplete="off" maxlength="50">
			  		</div>
			  		<div class="text-group">
						<label for="exampleTextarea" class="form-label mt-2">내용</label>
						<textarea class="form-control" id="boardContent" name="boardContent" rows="15" placeholder="내용을 입력해주세요" maxlength="2048"></textarea>
					</div>
					<div class="btn-board-group justify-content-between mt-2">
						<button type="button" class="btn btn-secondary" cursorshover="true" onclick="location.href='board.jsp'">목록</button>
						<input type="submit" class="btn btn-primary" cursorshover="true" value="등록">
					</div>
				</div>
			</form>
		</div>
	</div>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>