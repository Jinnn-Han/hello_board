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
	%>
	<%@ include file="WEB-INF/include/menu.jsp" %>
	<div class="container">
		<div class="card table-background text-white bg-secondary mb-3">
			<div class="card-header">
				<h4>게시판 글보기</h4>
			</div>
				<div class="card-body">
					<div class="row">
						<div class="col">
				  			<label class="form-label">작성자</label>
				  			<%-- <p><%= board.getUserID() %></p> --%>
				  			<input type="text" class="form-control" value="<%= board.getUserID() %>" readonly>
				  		</div>
				  		<div class="col">
				  			<label class="form-label">작성일자</label>
				  			<%-- <p><%= board.getBoardDate() %></p> --%>
				  			<input type="text" class="form-control" value="<%= board.getBoardDate() %>" readonly>
				  		</div>
				  		<div class="col"></div>
					</div>
			  		<div class="form-group">
		    			<label class="form-label mt-2">제목</label>
		    			<input type="text" class="form-control" id="boardTitle" name="boardTitle" autocomplete="off" maxlength="50" value="<%= board.getBoardTitle().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>") %>" readonly>
			  		</div>
			  		<div class="text-group">
						<label for="exampleTextarea" class="form-label mt-2">내용</label>
						<textarea class="form-control" id="boardContent" name="boardContent" rows="10" maxlength="2048" readonly><%= board.getBoardContent() %></textarea>
					</div>
					<div class="btn-board-group justify-content-between mt-2">
						<button type="button" class="btn btn-secondary" cursorshover="true" onclick="location.href='board.jsp'">목록</button>
						<div class="d-flex gap-1">
							<button type="button" class="btn btn-primary" cursorshover="true" onclick="location.href='update.jsp?boardID=<%= boardID %>'">수정</button>
							<button type="button" class="btn btn-outline-light" cursorshover="true" onclick="location.href='deleteAction.jsp?boardID=<%= boardID %>'">삭제</button>
						</div>
					</div>
				</div>
		</div>
	</div>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>