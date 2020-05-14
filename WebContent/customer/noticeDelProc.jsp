<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8"); %>	
<%
String seq=request.getParameter("c"); //c=글번호를 받는 변수

//Connect db
String sql="DELETE FROM notices WHERE seq=?";

//드라이버로드
Class.forName("oracle.jdbc.driver.OracleDriver");

//접속
String url="jdbc:oracle:thin:@localhost:1521:orcl";
String user="scott";
String password="123456";
Connection con=DriverManager.getConnection(url, user, password);

//실행
PreparedStatement pstmt=con.prepareStatement(sql);
pstmt.setString(1, seq);
int af=pstmt.executeUpdate(); //return int
if(af>0){ //1이 나오면 삭제성공. 1,seq하나만 삭제했으니.. 만약 2개를 삭제한다면 2가 나온다.
	response.sendRedirect("notice.jsp"); //삭제성공하면 바로 목록화면으로 이동
}else{
	out.print("삭제오류");
}

%>


<!DOCTYPE>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>noticeDelProc.jsp</title>
</head>
<body>

</body>
</html>