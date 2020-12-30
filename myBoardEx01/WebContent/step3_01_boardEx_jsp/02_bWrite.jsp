<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글쓰기창</title>
<link href="../css/bootstrap.css" rel="stylesheet" type="text/css"> 
</head>
<body>
	<div>
		<h1 style="border-top: 50px">게시글 쓰기</h1>
	</div>
	<form method="post" action="03_bWritePro.jsp">
		<hr>작성자 <input type="text" id="writer" name="writer"><br>
		<hr>비밀번호 <input type="password" id="password" name="password"><br>
		<hr>이메일 <input type="email" id="email" name="email"><br>
		<hr>제목 <input type="text" id="subject" name="subject"><br>
		<hr>글내용 <br><textarea rows="7" cols="70" name="content"></textarea><br>
		<input type="submit" value="글쓰기" class="btn btn-secondary" >
		<input type="reset" value="다시쓰기" class="btn btn-secondary" >
		<input type="button" value="리스트로" class="btn btn-secondary" onclick="location.href='04_bList.jsp'">
	</form>

</body>
</html>