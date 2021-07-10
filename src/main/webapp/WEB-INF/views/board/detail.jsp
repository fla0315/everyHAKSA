<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>



<!DOCTYPE HTML>
<html lang="ko">
<head>
<meta charset="utf-8">
<title>자유게시판 상세보기 - 허브몰</title>
<link rel="stylesheet" type="text/css" 
   href="<c:url value='/resources/css/mainstyle.css'/>" />
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/clear.css'/>" />
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/formLayout.css'/>" />
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/mystyle.css'/>" />
<script type="text/javascript" 
   src="<c:url value='/resources/js/jquery-3.6.0.min.js'/>"></script>
<script type="text/javascript">
	$(function(){
		$('#btComment').click(function(){
			$('.infobox').each(function(idx,item){
				if($(this).val().length<1){
					alert($(this).prev().text()+"을(를) 입력하세요");
					$(item).focus();
					event.preventDefault();
					return false;
				}
			});
		});
	});
</script>
<style type="text/css">
	body{
		padding:5px;
		margin:5px;
	 }
	.divForm {
		width: 500px;
	}
	
	#c_write{
		width: 500px;
		text-align:center;
	}
	
	#c_write h3 {
		text-align:left;
		margin-left:5px;
	}
	
	table {
		margin-left:5px;
		width:500px;
		border:1px solid lightGray;
	}
	
	table td {
		border:1px solid lightGray;
	}
</style>  
</head>
<body>

	<h2>글 상세보기</h2>
	<div class="divForm">
		<div class="firstDiv">
			<span class="sp1">제목</span> <span>${vo.title}</span>
		</div>
		<div>
			<span class="sp1">작성자</span> <span>${vo.name}</span>
		</div>
		<div>
			<span class="sp1">등록일</span> <span>${vo.regdate}</span>
		</div>
		<div>
			<span class="sp1">조회수</span> <span>${vo.readcount}</span>
		</div>
		<div class="lastDiv">	
			<% pageContext.setAttribute("newLine", "\r\n"); %>
			
			<p class="content">${fn:replace(vo.content, newLine,"<br>")  }</p>
		</div>
		<div class="center">
			<a href="<c:url value ='/board/edit.do?no=${param.no}'/>">수정</a> |
        	<a href="<c:url value ='/board/delete.do?no=${param.no}'/>">삭제</a> |
        	<a href="<c:url value ='/board/list.do'/>">목록</a>
		</div>
	</div>
	
	
	
	
</body>
</html>