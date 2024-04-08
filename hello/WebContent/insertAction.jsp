<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="board.BoardDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="board" class="board.Board" scope="page"/>
<jsp:setProperty name="board" property="boardTitle"/>
<jsp:setProperty name="board" property="boardContent"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP Board Web site</title>
</head>
<body>
	<%
		String userID = null;
		if(session.getAttribute("userID") != null){
			userID = (String) session.getAttribute("userID");
		}
		if (userID == null){
			PrintWriter script = response.getWriter();
			script.print("<script>");
			script.print("alert('로그인이 필요합니다.');");
			script.print("location.href='login.jsp';");
			script.print("</script>");
		} else{
			if (board.getBoardTitle() == null || board.getBoardContent() == null) {
				PrintWriter script = response.getWriter();
				script.print("<script>");
				script.print("alert('입력이 안된 사항이 있습니다.');");
				script.print("history.back();");
				script.print("</script>");
			} else{
				BoardDAO boardDAO = new BoardDAO();
				int result = boardDAO.insert(board.getBoardTitle(), userID, board.getBoardContent());
				if (result == -1){ //데이터베이스 오류, 이미 동일한 아이디가 존재할때
					PrintWriter script = response.getWriter();
					script.print("<script>");
					script.print("alert('글쓰기에 실패했습니다.');");
					script.print("history.back();");
					script.print("</script>");
				}
				else { //정상적으로 글쓰기 완료
					session.setAttribute("boardID", board.getBoardID());
					PrintWriter script = response.getWriter();
					script.print("<script>");
					script.print("location.href = 'board.jsp';");
					script.print("</script>");
				}
			}
		}

	%>
</body>
</html>