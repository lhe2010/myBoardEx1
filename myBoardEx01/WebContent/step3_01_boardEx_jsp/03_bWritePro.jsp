<%@page import="step3_01_boardEx1.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글쓰기처리</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
	%>
	<jsp:useBean id="bean" class="step3_01_boardEx1.BoardDTO">
		<jsp:setProperty name="bean" property="*"/>
	</jsp:useBean>
	
	<%
		BoardDAO.getInstance().insertBoard(bean);
	%>
	<script type="text/javascript">
		alert("글쓰기완료");
		location.href="04_bList.jsp";
	</script>

</body>
</html>