<%@page import="step3_01_boardEx1.BoardDTO"%>
<%@page import="step3_01_boardEx1.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수정페이지</title>
<link href="../css/bootstrap.css" rel="stylesheet" type="text/css"> 
</head>
<body>
	<%
		int num = Integer.parseInt(request.getParameter("num"));
		BoardDTO bean = BoardDAO.getInstance().getOneUpdateBoard(num);
	%>
	<div style="padding-top: 50" align="center">
		<h2>글 수정 페이지</h2>
	</div>	
	<form action="07_bUpdatePro.jsp" method="post">
		<hr>글번호 <%=num %> <br>
		<hr>조회수 <%=bean.getRead_count() %><br>
		<hr>작성자 <%=bean.getWriter() %><br>
		<hr>작성일 <%=bean.getReg_date() %><br>
		<hr>이메일 <%=bean.getEmail() %><br>
		<hr>비밀번호 <input type="password" name="password" id="password"> <br>
		<hr>제목 <input type="text" name="subject" id="subject" value="<%=bean.getSubject()%>"> <br>
		<hr>글내용 <br><textarea cols="70" rows="6" name="content" id="content"><%=bean.getContent() %></textarea> <br>
		<input type="hidden" name="num" value="<%=bean.getNum() %>">
		<input type="submit" value="수정" class="btn btn-secondary">
		<input type="button" value="뒤로가기" class="btn btn-secondary" onClick="04_bList.jsp">
	</form>
	<div>
	</div>

</body>
</html>