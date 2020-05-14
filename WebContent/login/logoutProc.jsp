<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8"); %>	
<!DOCTYPE>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>logoutProc.jsp</title>
</head>
<body>
	<%
	session.invalidate(); //세션 모두 삭제 (web03 > jsp03 > logout.jsp에서 배웠던 내용!)
	response.sendRedirect("loginForm.jsp"); 
	%>
</body>
</html>