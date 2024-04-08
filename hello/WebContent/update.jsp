<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="board.Board" %>
<%@ page import="board.BoardDAO" %>
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
	<%
		String userID = null;
		if (session.getAttribute("userID") != null){
			userID = (String) session.getAttribute("userID");
		}
		if (userID == null){
			PrintWriter script = response.getWriter();
			script.print("<script>");
			script.print("alert('로그인이 필요합니다.');");
			script.print("location.href='login.jsp';");
			script.print("</script>");
		}
		int boardID = 0;
		if (request.getParameter("boardID") != null){
			boardID = Integer.parseInt(request.getParameter("boardID"));
		}
		if(boardID == 0){
			PrintWriter script = response.getWriter();
			script.print("<script>");
			script.print("alert('유효하지 않은 글입니다');");
			script.print("location.href='board.jsp';");
			script.print("</script>");
		}
		Board board = new BoardDAO().getBoard(boardID);
		if (!userID.equals(board.getUserID())){
			PrintWriter script = response.getWriter();
			script.print("<script>");
			script.print("alert('권한이 없습니다.')");
			script.print("location.href = 'board.jsp");
			script.print("</script>");
		}
	%>
	<!-- header -->
	<nav class="navbar navbar-expand-lg bg-light" data-bs-theme="light">
	  <div class="container-fluid">
	    <a class="navbar-brand" href="#">JSP 게시판 웹 사이트</a>
	    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarColor01" aria-controls="navbarColor01" aria-expanded="false" aria-label="Toggle navigation">
	      <span class="navbar-toggler-icon"></span>
	    </button>
	    <div class="collapse navbar-collapse" id="navbarColor01">
	      <ul class="navbar-nav me-auto">
	        <li class="nav-item">
	          <a class="nav-link" href="main.jsp">메인
	            <span class="visually-hidden">(current)</span>
	          </a>
	        </li>
	        <li class="nav-item">
	          <a class="nav-link" href="board.jsp">게시판</a>
	        </li>
	      </ul>
	      <form>
		      <div class="search-group">
				<input class="form-control me-sm-2" type="search" placeholder="Search">
				<button class="btn btn-secondary my-2 my-sm-0" type="submit" cursorshover="true">Search</button>
		      </div>
	      </form>
	    </div>
	  </div>
	</nav>
	<!-- header -->
	<div class="container">
		<div class="card table-background text-white bg-secondary mb-3">
			<div class="card-header">
				<h4>게시판 글수정</h4>
			</div>
			<form action="updateAction.jsp?boardID=<%= boardID %>" method="post">
				<div class="card-body">
			  		<div class="form-group">
		    			<label class="form-label mt-1">제목</label>
		    			<input type="text" class="form-control" id="boardTitle" name="boardTitle" autocomplete="off" maxlength="50" value="<%= board.getBoardTitle().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>") %>">
			  		</div>
			  		<div class="text-group">
						<label for="exampleTextarea" class="form-label mt-2">내용</label>
						<textarea class="form-control" id="boardContent" name="boardContent" rows="10" maxlength="2048"><%= board.getBoardContent().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>") %></textarea>
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