<%@page import="step3_01_boardEx1.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
// 		String nSubject = (String)request.getParameter("nSubject");
//  	String nContent = (String)request.getParameter("nContent");
	%>
	
	<jsp:useBean id="bean" class="step3_01_boardEx1.BoardDTO">
		<jsp:setProperty name="bean" property="*"/>
	</jsp:useBean>
	
	<%
 		boolean isUpdate = BoardDAO.getInstance().updateBoard(bean);
	
		if(isUpdate) {
	%>
			<script type="text/javascript">
				alert("수정되었습니다. ");
				location.href = "04_bList.jsp";
			</script>
	<%
		} else {
	%>
			<script type="text/javascript">
				alert("비밀번호불일치");
				history.go(-1);
			</script>
	<%
		}
	%>
	
</body>
</html>