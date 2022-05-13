<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h3>등록</h3>
userVO : ${userVO.id}
<hr>
user : ${user.id }
<hr>
param : ${param.id }
<hr>
<%= request.getParameter("id") %>
<hr>
profile : ${profile.id }
<hr>
<form method="post" action="insert">
	<button>등록</button>
</form>
</body>
</html>