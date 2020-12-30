<%@page import="step3_01_boardEx1.BoardDAO"%>
<%@page import="step3_01_boardEx1.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<jsp:useBean id="boardDTO" class="step3_01_boardEx1.BoardDTO">
		<jsp:setProperty name="boardDTO" property="*"/>
	</jsp:useBean>
	
	<%
		boolean isDelete = BoardDAO.getInstance().deleteBoard(boardDTO);
		
		if(isDelete) {
	%>
			<script>
				alert("삭제되었습니다.");
				location.href="04_bList.jsp";
			</script>
	<%
		} else {
	%>
			<script>
				alert("비밀번호오류.");
				history.go(-1);
			</script>
	<%
			
		}
	%>

</body>
</html>