<%@page import="java.sql.*"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8"); %>
<%
//데이터베이스에서 seq로 select 조건이 필요
//c : notice.jsp에서 행 46번.. c=rs.getString("seq"); 즉, c=글번호
String seq=request.getParameter("c");

//db connect
String sql="SELECT * FROM notices WHERE seq="+seq;
//드라이버로드
Class.forName("oracle.jdbc.driver.OracleDriver");
//접속
String url="jdbc:oracle:thin:@localhost:1521:orcl";
String user="scott";
String password="123456";
Connection con=DriverManager.getConnection(url, user, password);
//실행
Statement st=con.createStatement();

//결과
ResultSet rs=st.executeQuery(sql); //select 실행
rs.next(); //while문 안써도 됨. rs가 한 줄이기 때문..
%>


<!DOCTYPE>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>noticeDetail.jsp</title>
	
	<link rel="stylesheet" href="../css/nstyle.css" />
</head>
<body>
	<h2>noticeDetail.jsp</h2>
	<table class="twidth">
		<colgroup>
			<col width="15%" />
			<col width="35%"/>
			<col width="15%"/>
			<col width="35%"/>
		</colgroup>
		<caption>Detail</caption>
		<tbody>
			<tr>
				<th class="Left">글번호</th>
				<td><%=rs.getString("seq") %></td>
				<th class="Left">조회수</th>
				<td><%=rs.getInt("hit") %></td>
			</tr>
			<tr>
				<th class="Left">작성자</th>
				<td><%=rs.getString("writer") %></td>
				<th class="Left">작성시간</th>
				<td><%=rs.getDate("regdate") %></td>
			</tr>
			<tr>
				<th class="Left">제목</th>
				<td colspan="3"><%=rs.getString("title") %></td>
			</tr>
			<tr>
				<th class="Left">내용</th>
				<td colspan="3" id="content"><%=rs.getString("content") %></td>
			</tr>
			<tr>
				<th class="Left">첨부</th>
				<td colspan="3" id="addfile">첨부</td>
			</tr>
		</tbody>
	</table>
	
	<div>
		<a href="noticeEdit.jsp?c=<%=rs.getString("seq") %>">수정</a>
		<a href="noticeDelProc.jsp?c=<%=rs.getString("seq") %>">삭제</a> <!-- 삭제는 눈에 보일 필요X Proc -->
		<a href="notice.jsp">목록</a>
	</div>
</body>
</html>

<%
rs.close();
st.close();
con.close();
%>