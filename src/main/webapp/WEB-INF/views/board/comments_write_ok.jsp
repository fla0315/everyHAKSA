<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>comments_write_ok.jsp</title>
</head>
<body>
<jsp:useBean id="vo" class="com.mymvc.comment.model.CommentVO" scope="page"></jsp:useBean>
<jsp:useBean id="commentService" class="com.mymvc.comment.model.CommentService" scope="session"></jsp:useBean>
<%
	request.setCharacterEncoding("utf-8");
	String name=request.getParameter("name");
	String pwd=request.getParameter("pwd");
	String content=request.getParameter("content");
	String bdNo=request.getParameter("bdNo");
	
	vo.setName(name);
	vo.setPwd(pwd);
	vo.setContent(content);
	vo.setBdNo(Integer.parseInt(bdNo));
	
	String msg = "답변 등록 실패", url = "/board/list.jsp";
	try {
		int cnt = commentService.insertComment(vo);
		
		if(cnt>0){
			msg = "답변 등록 성공!";
			url = "/board/detail.jsp?no="+bdNo;
		}
	}catch(SQLException e){
		e.printStackTrace();
	}
	
	request.setAttribute("msg", msg);
	request.setAttribute("url", url);
%>

	<jsp:forward page="../common/message.jsp"></jsp:forward>
</body>
</html>