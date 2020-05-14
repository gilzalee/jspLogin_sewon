<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8"); %>	
<!DOCTYPE>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>loginForm.jsp</title>
	<link rel="stylesheet" href="../css/join_style.css" />
	<script>
		function checkValue(){
			inputForm=eval("document.loginInfo");
			if(!inputForm.id.value){ //inputForm의 id의 value값이 없다면
				alert("아이디를 입력하세요.");
				inputForm.id.focus();
				return false;
			}
			if(!inputForm.password.value){
				alert("비밀번호를 입력하세요.");
				inputForm.password.focus();
				return false;
			}
		}
		
		function goJoinForm(){
			location.href="../joinus/join.jsp";
		}
	</script>
</head>

<body>
	<h2>loginForm.jsp</h2>
	<div id="wrap">
		<form action="loginProc.jsp" name="loginInfo" method="post"
		onsubmit="return checkValue()">
		<!--
			onsubmit 
			: form 태그 안에서 form전송을 하기 전에 입력된 데이터의 유효성을 체크하기 위해 사용하는 이벤트.
		-->
			<!--이미지 추가-->
			<img src="../img/welcome.jpg" id="wel_img" />
			<br /><br />
			<table>
				<tr>
					<td bgcolor="skyblue">아이디</td>
					<td><input type="text" name="id" maxlength="50"/></td>
				</tr>
				<tr>
					<td bgcolor="skyblue">비밀번호</td>
					<td><input type="password" name="password" maxlength="50"/></td>
				</tr>
			</table>
			<br />
			<input type="submit" value="login"/>
			<input type="button" value="join" onclick="goJoinForm()" />
		</form>
		<%
		String msg=request.getParameter("msg");
		if(msg!=null && msg.equals("0")){
			out.println("<br>");
			out.println("<font color='red' size='5'>비밀번호 확인</font>");
		}else if(msg!=null && msg.equals("-1")){
			out.println("<br>");
			out.println("<font color='red' size='5'>아이디 확인</font>");
		}
		
		%>
		
	</div>
	
</body>
</html>