<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8"); %>	
<%
//로그인 처리(loginProc...Proc:눈에 보이지 X)이므로, 코드블락만 사용
String id=request.getParameter("id");
String pass=request.getParameter("password");

//db연결
String sql="SELECT pwd FROM member WHERE id=?";
Class.forName("oracle.jdbc.driver.OracleDriver");

//접속
String url="jdbc:oracle:thin:@localhost:1521:orcl";
Connection con=DriverManager.getConnection(url, "scott", "123456");

//실행
PreparedStatement pstmt=con.prepareStatement(sql);
pstmt.setString(1, id);

//select 실행
ResultSet rs=pstmt.executeQuery();

String ypass="";
int x=-1; //초기값
String msg="";
if(rs.next()) {
	ypass=rs.getString("pwd"); //ypass=db의 비밀번호
	if(ypass.equals(pass))
		x=1;
	else //pass불일치
		x=0;
}else{ //아이디가 존재하지 않은 상태(db에 값이 없음)
	x=-1;
}	
System.out.println("xxxx : "+x);

if(x==1){ //db의 비밀번호 = 입력한 비밀번호
	session.setAttribute("sessionID", id); //아이디를 화면에 출력하면 보안취약.. 세션에 id로 저장
	msg="../MainForm.jsp";

}else if(x==0){ //db의 비밀번호 <> 입력한 비밀번호 ... 비밀번호 불일치
	msg="loginForm.jsp?msg=0";

}else{ //db에 입력한 아이디가 존재하지 않음
	msg="loginForm.jsp?msg=-1";
}

response.sendRedirect(msg); // "msg"라고해서 오류났음. msg는 30행에서 이미 String으로 객체 생성해놓음!

%>
