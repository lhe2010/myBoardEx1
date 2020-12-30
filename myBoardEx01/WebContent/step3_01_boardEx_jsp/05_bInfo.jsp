<%@page import="step3_01_boardEx1.BoardDAO"%>
<%@page import="step3_01_boardEx1.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 하나 띄우기</title>
<link href="../css/bootstrap.css" rel="stylesheet" type="text/css"> 
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
		<hr>글번호 <%=num %> <br>
		<hr>조회수 <%=bean.getRead_count() %><br>
		<hr>작성자 <%=bean.getWriter() %><br>
		<hr>작성일 <%=bean.getReg_date() %><br>
		<hr>이메일 <%=bean.getEmail() %><br>
		<hr>제목 <%=bean.getSubject() %><br>
		<hr>글내용 <br><%=bean.getContent() %><br>
	</div>
	<div align="center">
		<input type="button" value="수정" class="btn btn-secondary" onclick="location.href='06_bUpdate.jsp?num=<%=num%>'">
		<input type="button" value="삭제" class="btn btn-secondary" onclick="location.href='08_bDelete.jsp?num=<%=num%>'">
		<input type="button" value="리스트로" class="btn btn-secondary" onclick="location.href='04_bList.jsp'">
	</div>

</body>
</html>