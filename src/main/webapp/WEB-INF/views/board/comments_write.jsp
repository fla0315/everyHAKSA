<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div id="c_write">
	<h3>댓글</h3>
	<form name="frmComment" method="post" action="<%=request.getContextPath() %>/board/comments_write.do">
		<input type="hidden" id="bdNo" name="bdNo" value="<%=no%>">
		<label>이름</label> <input type="text" id="name" name="name" class="infobox">
		<label>비밀번호</label> <input type="password" id="pwd" name="pwd" class="infobox">
		<br><br>
		<textarea id="content" name="content" rows="4" cols="65"></textarea>
		<br><br>
		<input type="submit" value="확인" id="btComment" />
	</form>
</div>