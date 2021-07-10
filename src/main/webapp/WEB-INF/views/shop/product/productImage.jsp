<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" 
	src="<c:url value='/resources/js/jquery-3.6.0.min.js'/>"></script>
	
<script type="text/javascript">

	$(function(){
		$('#btClose').click(function(){
			self.close();
		});
	});

</script>

</head>
<body>
	<p> 
   <img src="<c:url value='/pd_images/${param.imageUrl}'/>" width="300">
	</p>
	<button id="btClose" > 닫기 </button>   
</body>
</html>