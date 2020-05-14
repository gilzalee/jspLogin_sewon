<%@page import="java.sql.*"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8"); %>	
<%
String title=request.getParameter("title");
String content=request.getParameter("content");
String seq=request.getParameter("c");
//sql문은 db연결 맨 앞에 두는 것이 좋다.
String sql="UPDATE notices SET title=?, content=? WHERE seq=?";
//db connect
//드라이버로드
Class.forName("oracle.jdbc.driver.OracleDriver");
//접속
String url="jdbc:oracle:thin:@localhost:1521:orcl";
String user="scott";
String password="123456";
Connection con=DriverManager.getConnection(url, user, password);
//실행
PreparedStatement pstmt=con.prepareStatement(sql);
pstmt.setString(1, title);
pstmt.setString(2, content);
pstmt.setString(3, seq);
//결과
pstmt.executeUpdate();

response.sendRedirect("noticeDetail.jsp?c="+seq);
%>

<!DOCTYPE>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>noticeEditProc.jsp</title>
</head>
<body>
	<h2>수정완료</h2>
</body>
</html>