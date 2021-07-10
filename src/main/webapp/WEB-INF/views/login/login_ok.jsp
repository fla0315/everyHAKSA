<%@page import="com.mystudy.member.model.MemberVO"%>
<%@page import="com.mystudy.member.model.MemberService"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="memberService" class="com.mystudy.member.model.MemberService" scope="session"></jsp:useBean>
<%
	//1
	request.setCharacterEncoding("utf-8");
	String userid = request.getParameter("userid");
	String pwd = request.getParameter("pwd");
	String chkSave = request.getParameter("chkSave");
	
	//2
	String msg = "로그인 처리 실패", url = "/login/login.jsp";
	try {
		int result = memberService.loginProc(userid, pwd);
		if(result==MemberService.LOGIN_OK){
			//회원 정보 조회
			MemberVO memberVo = memberService.selectByUserid(userid);
			
			//[1] 세션에 아이디 저장
			session.setAttribute("userid", userid);
			session.setAttribute("userName", memberVo.getName());
			
			//[2] 아이디 저장하기 체크한 경우 쿠키에 저장
			Cookie ck = new Cookie("ck_userid", userid);
			ck.setPath("/");
			if(chkSave!=null){ //체크한 경우
				ck.setMaxAge(1000*24*60*60);	//1000일
				response.addCookie(ck);
			}else{
				ck.setMaxAge(0);	//쿠키 삭제
				response.addCookie(ck);
			}
			
			msg = memberVo.getName()+"님, 로그인되었습니다.";
			url = "/index.jsp";
		}else if(result==MemberService.PWD_DISAGREE){
			msg = "비밀번호가 일치하지 않습니다.";
		}else if(result==MemberService.ID_NONE){
			msg = "해당 아이디는 존재하지 않습니다.";
		}
	}catch(SQLException e) {
		e.printStackTrace();
	}
	
	//3
	request.setAttribute("msg", msg);
	request.setAttribute("url", url);
%>
<jsp:forward page="../common/message.jsp"></jsp:forward>
</body>
</html>