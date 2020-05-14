<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8"); %>	
<!DOCTYPE>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>noticeReg.jsp</title>
</head>
<body>
	<form action="noticeRegProc.jsp" method="post">
		<dl>
			<dt>제목</dt>
			<dt>
				<input type="text" name="title" />
			</dt>
		</dl>
		<dl>
			<dt>첨부파일</dt>
			<dt>
				<input type="file" name="txtFile" />
			</dt>
		</dl>
		<div>
			<textarea name="content" id="txtcontent" class="txtcontent">aaa</textarea>
		</div>
		<input type="submit" value="save" />
		<input type="button" value="cancel" class="cancel" />
		
	</form>
</body>
</html>