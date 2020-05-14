<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8"); %>	

<%
//ctrl + Shift + x : 소문자       ctrl + Shift + y : 대문자
String title=request.getParameter("title");
String content=request.getParameter("content");

//db connect
String sql="INSERT INTO notices VALUES((SELECT max(to_number(seq))+1 FROM NOTICES),"
		+"?,'cj',?,sysdate,0)"; //?에 제발 ''붙이지마^^...
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
//결과
pstmt.executeUpdate(); //insert 실행

//목록으로 이동
response.sendRedirect("notice.jsp");

%>

<%
pstmt.close();
con.close();
%>
