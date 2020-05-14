<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8"); %>	
<%
String id=request.getParameter("id");
String pwd=request.getParameter("pwd");
String pwd2=request.getParameter("pwd2");
String name=request.getParameter("name");
String gender=request.getParameter("gender");

String year=request.getParameter("year");
String month=request.getParameter("month");
String day=request.getParameter("day");
String birth=String.format("%s-%s-%s", year, month, day); //format("형식",값)

String IsLunar=request.getParameter("IsLunar");
String cphone=request.getParameter("cphone");
String email=request.getParameter("email");

//String habit=request.getParameter("habit"); //배열로 받아야함. 안그러면 on/off로만 출력됨
String[] habits=request.getParameterValues("habit");
	String habit="";
	if(habits!=null) {
		for(int i=0; i<habits.length; i++) {
			if(i==habits.length-1) 
				habit+=habits[i];
			else
				habit+=habits[i]+", "; //누적 : habit=habit+habits[i]			
		}
		/* for(int i){
			habit+=habits[i];
			if(habits.length>i+1)
				habit+=",";
		}	 */
	/* }else{
		out.print("null"); */
	}	
	//out.println(habit+"<br />");
	
	
List<String> errors=new ArrayList();
if(id==null || id.equals(""))
	errors.add("아이디 없음");
if(!pwd.equals(pwd2))
	errors.add("비밀번호 불일치");
if(errors.size()>0) { //에러가 있다면...
	request.setAttribute("errors", errors); //session이랑 비슷.
	//특정 URL이나 페이지로 이동하는 2가지 방법 - Redirect, Dispatcher
	//Redirect 방식 --> sendRedirect() : 새로운 페이지로 완전 이동해 기존 데이터를 하나도 사용할 수 없다.
	//Dispatcher 방식 --> forward() : 클라이언트가 요청하면서 전송한 데이터를 그대로 유지한다.
	
	//response.sendRedirect("join.jsp");
	request.getRequestDispatcher("join.jsp").forward(request, response);
	//-->설정된 Dispatcher로 요청과 응답 권한을 넘기는 작업
}else{ //에러가 없다면...
	//db연결
	String sql="INSERT INTO member"
	+"(id, pwd, name, gender, birth, is_lunar, cphone, email, habit, regdate)"
	+" VALUES(?,?,?,?,?,?,?,?,?,sysdate)";
	//드라이버로드
	Class.forName("oracle.jdbc.driver.OracleDriver");
	//접속
	String url="jdbc:oracle:thin:@localhost:1521:orcl";
	Connection con=DriverManager.getConnection(url, "scott", "123456");
	//실행
	PreparedStatement pstmt=con.prepareStatement(sql);
	pstmt.setString(1, id);
	pstmt.setString(2, pwd);
	pstmt.setString(3, name);
	pstmt.setString(4, gender);
	pstmt.setString(5, birth);
	pstmt.setString(6, IsLunar);
	pstmt.setString(7, cphone);
	pstmt.setString(8, email);
	pstmt.setString(9, habit);
	//insert 실행
	pstmt.executeUpdate();
	
	//메인페이지로 이동
	response.sendRedirect("../index.jsp");

}
%>


<!DOCTYPE>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>joinProc.jsp</title>
</head>
<body>
	<h2>joinProc.jsp</h2>
</body>
</html>