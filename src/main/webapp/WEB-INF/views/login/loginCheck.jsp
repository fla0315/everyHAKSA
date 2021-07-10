<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>loginCheck</title>
</head>
<body>
<!-- 로그인을 하지 않고 회원정보 수정으로 들어왔을 때 -->
	<%
		String l_userid = (String)session.getAttribute("userid");
		if(l_userid==null || l_userid.isEmpty()){%>
			<script type="text/javascript">
				alert('먼저 로그인하세요');
				location.href="<%=request.getContextPath()%>/login/login.jsp"
			</script>
		<% return; //가장 중요!
		}
	%>
</body>
</html>