<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8"); %>	
<!DOCTYPE>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>MainForm.jsp</title>
	<script>
		function logoutProc(){
			location.href="login/logoutProc.jsp";
		}
	
	</script>	
</head>

<body>
	<h2>MainForm.jsp</h2>
	<b> <font size="3" color="skyblue">메인화면입니다.</font> </b> <br />
	
	<%
	//sessionId가 null이라면 로그인이 안된 상태(로그인이 되었다면 sessionID에 id가 들어감)
	//loginProc.jsp의 40~41행 참고!
	
	//MainForm.jsp에서 바로 실행하면 sessionID값이 없기때문에 loginForm.jsp창이 나온다!
	if(session.getAttribute("sessionID")==null) {
		//로그인 화면으로 이동
		response.sendRedirect("login/loginForm.jsp");
	}else{
	%>
	
	<h3>
		<font color="red"> <%=session.getAttribute("sessionID") %></font>님 로그인 되었습니다.
	</h3>
	<br /><br />
	<input type="button" value="logout" onclick="logoutProc();"/>
	
  <%}	
	
	%>

</body>
</html>