<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8"); %>	

<%
String sql="SELECT * FROM notices ORDER BY to_number(seq) DESC";
//db connect
//드라이버로드
Class.forName("oracle.jdbc.driver.OracleDriver");
//접속
String url="jdbc:oracle:thin:@localhost:1521:orcl";
String user="scott";
String password="123456";
Connection con=DriverManager.getConnection(url, user, password);
//실행
Statement st=con.createStatement();
//결과값 가져오기
ResultSet rs=st.executeQuery(sql);
%>

<!DOCTYPE>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>notice.jsp</title>
</head>
<body>
	<table width="500" border="1">
		<tr>
			<td>번호</td>
			<td>제목</td>
			<td>작성자</td>
			<td>작성일</td>
			<td>조회수</td>
		</tr>
		
		<%
		while(rs.next()) {
		%>
		
		<tr>
			<td><%=rs.getString("seq") %></td>
			<td><a href="noticeDetail.jsp?c=<%=rs.getString("seq") %>"><%=rs.getString("title") %></a></td>
			<td><%=rs.getString("writer") %></td>
			<%-- <td><%=rs.getTimestamp("regdate") %></td> --%> <!-- 밀리세컨드초까지 나옴 -->
			<td><%=rs.getDate("regdate") %></td> <!-- getDate : 날짜만 나옴 -->
			<td><%=rs.getInt("hit") %></td>
		</tr>
		
		<%
		}
		%>
		
	</table>
	<a href="noticeReg.jsp">Write</a>
	
</body>
</html>

<%
rs.close();
st.close();
con.close();
%>
