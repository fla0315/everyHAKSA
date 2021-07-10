<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/mainstyle.css"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/clear.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/layout.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/mystyle.css"/>
<script type="text/javascript" 
	src="<c:url value='/resources/js/jquery-3.6.0.min.js'/>"></script>
	
	
	
<c:forEach var="vo" items="${list}">
	<dd>
	<a href='<c:url value="/shop/product/productByCategory?categoryNo=${vo.categoryNo}&categoryName=${vo.categoryName}"/>'> 
		${vo.categoryName } 
	</a>
	</dd>
</c:forEach>
