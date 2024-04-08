<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>

	<%
		String userID = null;
		if (session.getAttribute("userID") != null){
			userID = (String) session.getAttribute("userID");
		}
	%>
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
	        <!-- 로그인이 안 돼있을때  -->
	        <% if(userID == null) { %>
	        <li class="nav-item dropdown">
	          <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">Dropdown</a>
	          <div class="dropdown-menu">
	            <a class="dropdown-item" href="login.jsp">로그인</a>
	            <a class="dropdown-item" href="join.jsp">회원가입</a>
	          </div>
	        </li>
	        <% } else{ %>
	        <!-- 로그인 돼있을때 로그아웃만 보이게  -->
	        <li class="nav-item dropdown">
	          <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">Dropdown</a>
	          <div class="dropdown-menu">
	            <a class="dropdown-item" href="logoutAction.jsp">로그아웃</a>
	          </div>
	        </li>
	        <p class="loginText"><span>${userID}&nbsp;</span>님,&nbsp;환영합니다.</p>
	        <% } %>
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
