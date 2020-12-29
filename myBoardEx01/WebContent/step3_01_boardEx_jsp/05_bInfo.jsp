<%@page import="step3_01_boardEx.BoardDAO"%>
<%@page import="step3_01_boardEx.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 하나 띄우기</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
		int num = Integer.parseInt(request.getParameter("num"));
		BoardDTO bean = BoardDAO.getInstance().getOneBoard(num);
	%>

	<div>
		<h1 style="border-top: 50px">게시글 보기</h1>
	</div>
	<div>
		<hr>글번호 <%=num+1 %> <br>
		<hr>조회수<br>
		<hr>작성자<br>
		<hr>작성일<br>
		<hr>이메일<br>
		<hr>제목<br>
		<hr>글내용<br>
	</div>

</body>
</html>