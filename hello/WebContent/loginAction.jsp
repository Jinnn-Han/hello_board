<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="user" class="user.User" scope="page"/>
<jsp:setProperty name="user" property="userID"/>
<jsp:setProperty name="user" property="userPassword"/>
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
		if (userID != null){
			PrintWriter script = response.getWriter();
			script.print("<script>");
			script.print("alert('이미 로그인이 되어있습니다.');");
			script.print("location.href='main.jsp';");
			script.print("</script>");
		}
		UserDAO userDAO = new UserDAO();
		int result = userDAO.login(user.getUserID(), user.getUserPassword());
		if (result == 1){
			session.setAttribute("userID", user.getUserID());
			PrintWriter script = response.getWriter();
			script.print("<script>");
			script.print("location.href = 'main.jsp';");
			script.print("</script>");
		}
		else if (result == 0) {
			PrintWriter script = response.getWriter();
			script.print("<script>");
			script.print("alert('비밀번호가 틀립니다.');");
			script.print("history.back();");
			script.print("</script>");
		}
		else if (result == -1) {
			PrintWriter script = response.getWriter();
			script.print("<script>");
			script.print("alert('존재하지 않는 아이디입니다.');");
			script.print("history.back();");
			script.print("</script>");
		}
		else if (result == -2) {
			PrintWriter script = response.getWriter();
			script.print("<script>");
			script.print("alert('데이터베이스 오류가 발생했습니다.');");
			script.print("history.back();");
			script.print("</script>");
		}
	%>
</body>
</html>