<%@page import="step3_01_boardEx1.BoardDAO"%>
<%@page import="step3_01_boardEx1.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>삭제페이지</title>
<link href="../css/bootstrap.css" rel="stylesheet" type="text/css"> 
</head>
<body>
	<%
// 		request.setCharacterEncoding("utf-8");
		int num = Integer.parseInt(request.getParameter("num"));
		BoardDTO bean = BoardDAO.getInstance().getOneUpdateBoard(num);
	%>
	<div style="padding-top: 50" align="center">
		<h2>글 수정 페이지</h2>
	</div>	
	<form action="09_bDeletePro.jsp" method="post">
		<hr>글번호 <%=num %> <br>
		<hr>조회수 <%=bean.getRead_count() %><br>
		<hr>작성자 <%=bean.getWriter() %><br>
		<hr>작성일 <%=bean.getReg_date() %><br>
		<hr>이메일 <%=bean.getEmail() %><br>
		<hr>비밀번호 <input type="password" name="password" id="password"> <br>
		<hr>제목 <%=bean.getSubject()%><br>
		<hr>글내용 <%=bean.getContent() %> <br>
		<input type="hidden" name="num" value="<%=bean.getNum() %>">
		<input type="submit" value="삭제" class="btn btn-secondary">
		<input type="button" value="뒤로가기" class="btn btn-secondary" onClick="04_bList.jsp">
	</form>
	<div>
	</div>
	

</body>
</html>