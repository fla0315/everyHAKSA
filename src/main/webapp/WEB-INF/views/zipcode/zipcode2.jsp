<%@page import="java.time.ZoneId"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>zipcode.jsp</title>
<link rel="stylesheet" type="text/css"
	href="<c:url value="/resources/css/mainstyle.css"/> " />
<script type="text/javascript"
	src="<c:url value="/resources/js/jquery-3.6.0.min.js"/> "></script>
<script type="text/javascript">
	$(function() {
		$("#dong").focus();
		$("#submit").click(function() {
			if ($('#dong').val().length < 1) {
				alert("동을 입력하세요");
				$('#dong').focus();
				return false;
			}
		});
	})
	
	function pageProc(curPage){
		$('input[name=currentPage]').val(curPage);
		$('form[name=frmPage]').submit();	
	}

	function setZipcode(address, zipcode) { //부모창(회원가입 창)에 우편번호, 주소 셋팅하기
		$(opener.document).find("#zipcode").val(address);
		$(opener.document).find("#address").val(zipcode);
		self.close();
	}
</script>
</head>
<body>
	<form action="<c:url value='/zipcode/zipcode2'/>" 
	   name="frmPage" method="post">
	   <input type="hidden" name="currentPage">
	   <input type="hidden" name="dong" value="${param.dong }">
	</form>

	<h2>우편번호 검색</h2>
	<br>
	<p>찾고 싶으신 주소의 동(읍/면)을 입력하세요</p>
	<form name="frmZipcode" method="post"
		action="<c:url value="/zipcode/zipcode2"/> ">
		<label for="dong">지역명 : </label> <input type="text" name="dong"
			id="dong" style="ime-mode: active" value="${param.dong }"> <input
			type="submit" id="submit" value="찾기">
	</form>
	<br>
	<c:if test="${list != null }">
		<table style="width: 470px" class="box2"
			summary="우편번호 검색 결과에 관한 표로써, 우편번호, 주소에 대한 정보를 제공합니다.">
			<colgroup>
				<col style="width: 20%" />
				<col style="width: *" />
			</colgroup>
			<thead>
				<tr>
					<th scope="col">우편번호</th>
					<th scope="col">주소</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${empty list}">
					<tr>
						<td colspan="2" style="text-align: center">해당하는 주소가 없습니다</td>
					</tr>
				</c:if>
				<c:if test="${!empty list}">
					<c:forEach var="vo" items="${list}">
						<c:set var="address" value="${vo.sido } ${vo.gugun } ${vo.dong }" />
						<tr>
							<td>${vo.zipcode}</td>
							<td><a href="#"
								onclick="setZipcode('${vo.zipcode}', '${address}')">
									${address} ${vo.startbunji} <c:if test="${!empty vo.endbunji}">
									 ~ ${vo.endbunji}
								</c:if>
							</a></td>
						</tr>
					</c:forEach>
				</c:if>
			</tbody>
		</table>
	</c:if>


	<div class="divPage">
		<c:if test="${pagingInfo.firstPage>1 }">
			<a href="#" onclick="pageProc(${pagingInfo.firstPage-1})"> 
			<img alt="이전으로" src="<c:url value="/resources/images/first.JPG"/> ">
			</a>
		</c:if>



		<c:forEach var="i" begin="${pagingInfo.firstPage }"	end="${pagingInfo.lastPage }">
		
			<c:if test="${i==pagingInfo.currentPage }">
				<span style="color: blue; font-weight: bold">[${i}]</span>
			</c:if>
			
			<c:if test="${i!=pagingInfo.currentPage }">
				<a href="#" onclick="pageProc(${i})">[${i }]</a>
			</c:if>

		</c:forEach>



		<c:if test="${pagingInfo.lastPage < pagingInfo.totalPage }">
			<a href="#" onclick="pageProc(${pagingInfo.lastPage+1})"> 
			<img alt="다음으로" src="<c:url value="/resources/images/last.JPG"/> ">
			</a>
		</c:if>

	</div> 


</body>
</html>