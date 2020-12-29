<%@page import="java.util.Vector"%>
<%@page import="step3_01_boardEx.BoardDAO"%>
<%@page import="step3_01_boardEx.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 목록</title>
<link href="../css/bootstrap.css" rel="stylesheet" type="text/css"> 
</head>
<body>
	<div align="center">
		<h1 style="padding: 100px">게시글 보기</h1>
		<table class="table table-striped table-hover">
	  		<thead>
	  			<tr>
	  				<th>번호</th>
	  				<th>제목</th>
	  				<th>작성자</th>
	  				<th>작성일</th>
	  				<th>조회수</th>
	  			</tr>
	  		</thead>
	<%
		Vector<BoardDTO> vec = BoardDAO.getInstance().getAllBoard();
		for (int i = 0; i < vec.size(); i++) {
			BoardDTO bean = vec.get(i);
	%>
			<tr>
				<td><%=i+1 %></td>
				<td><a href="05_bInfo.jsp?<%=bean.getNum()%>"><%=bean.subject %></a></td>
				<td><%=bean.writer %></td>
				<td><%=bean.reg_date %></td>
				<td><%=bean.read_count %></td>
			</tr>
	<%
		}
	%>
		</table>
	</div>
	<div align="right">
		<input type="button" value="글쓰기" class="btn btn-secondary" onclick="location.href='01_main.jsp'">
	</div>

</body>
</html>