<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>write.jsp</title>
</head>
<body>

<h1>Comment2 등록</h1>

<form name="frm" method="post" action="<c:url value='/test/write'/>" >
	<p>아이디 : <input type="text" name="userId"> </p>
	<p>내용 : <input type="text" name="commentContent"> </p>

	<p> <input type="submit" value="등록"> </p>
<br>
	<a href="<c:url value='/test/list'/>">comments 목록</a>
</form>


</body>
</html>