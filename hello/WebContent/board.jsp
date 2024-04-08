<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="board.BoardDAO" %>
<%@ page import="board.Board" %>
<%@ page import="java.util.ArrayList" %>
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
	int pageNumber = 1;
	if (request.getParameter("pageNumber") != null){
		pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
	}
	%>
	<%@ include file="WEB-INF/include/menu.jsp" %>
	<div class="container">
		<div class="card table-background text-white bg-secondary mb-3">
			<div class="card-header">
				<h4>게시판</h4>
			</div>
			<div class="card-body">
				<table class="table table-hover">
					<colgroup>
						<col width="10%">
						<col width="50%">
						<col width="20%">
						<col width="20%">
					</colgroup>
					<thead>
					    <tr class="table-light">
					      <th scope="col">번호</th>
					      <th scope="col">제목</th>
					      <th scope="col">작성자</th>
					      <th scope="col">작성일</th>
					    </tr>
					</thead>
					<tbody>
					<%
						BoardDAO boardDAO = new BoardDAO();
						ArrayList<Board> list = boardDAO.getList(pageNumber);
						for(int i = 0; i < list.size(); i++){
					%>
						<tr>
							<td><%= list.get(i).getBoardID() %></td>
							<td class="text-start"><a href="view.jsp?boardID=<%=list.get(i).getBoardID() %>"><%= list.get(i).getBoardTitle().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>") %></a></td>
							<td><%= list.get(i).getUserID() %></td>
							<td><%= list.get(i).getBoardDate().substring(0, 11) + list.get(i).getBoardDate().substring(11, 13) + "시" + list.get(i).getBoardDate().substring(14, 16) + "분" %></td>
						</tr>
					<%
						}
					%>
					</tbody>
				</table>
				<div class="btn-board-group justify-content-between mt-2">
					<%
						if (pageNumber != 1){
					%>
						<a href="board.jsp?pageNumber=<%=pageNumber - 1 %>" class="btn btn-secondary"><i class="bi bi-arrow-left-short"></i>이전</a>
					<%
						} if (boardDAO.nextPage(pageNumber + 1)){
					%>
						<a href="board.jsp?pageNumber=<%=pageNumber + 1 %>" class="btn btn-secondary">다음<i class="bi bi-arrow-right-short"></i></a>
					<%
						}
					%>
					<button type="button" class="btn btn-primary" cursorshover="true" onclick="location.href='insert.jsp'">글쓰기</button>
				</div>
			</div>
		</div>
	</div>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>