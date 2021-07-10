<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>comment</title>
</head>
<body>
	
	<h1>comment 목록</h1>
	<table border="1" style="width:500px">
		<tr>
			<th>번호</th>
			<th>아이디</th>
			<th>내용</th>
			<th>등록일</th>
		</tr>
		<c:if test="${empty list }">
			<tr>
				<td colspan="4" style="text-align:center">등록된 데이터가 없습니다.</td>
			</tr>
		</c:if>
		<c:if test="${!empty list }">
			<c:forEach var="vo" items="${list }">
			<tr>
				<td>${vo.commentNo }</td>
				<td><a href="<c:url value='detail.do?no=${vo.commentNo}' /> ">${vo.userId }</a></td>
				<td>${vo.commentContent }</td>
				<td>  <fmt:formatDate value="${vo.regDate}" pattern="yyyy-MM-dd"/></td>
			</tr>
			</c:forEach>
		</c:if>
	</table>
	
	<br>
	<a href='<c:url value="/test/write"/>'>Comment2 등록</a>
</body>
</html>