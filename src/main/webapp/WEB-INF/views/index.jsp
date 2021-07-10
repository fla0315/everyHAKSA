<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="inc/top.jsp" %>


<article id = "centerCon">
	<img src = "${pageContext.request.contextPath}/resources/images/herb.JPG">
</article>
<article id = "rightCon">
	<!-- <h2>공지사항</h2> -->
	<c:import url="/board/mainNotice"></c:import> <!-- 실행결과가 들어옴 노 소스  -->

</article>	
<article id = "listCon">
	<!-- <h2>상품 목록</h2> -->
	<%@ include file="shop/product/productCatalog.jsp" %>
</article>
	
<%@ include file="inc/bottom.jsp" %>