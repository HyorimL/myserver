<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h3>목록</h3>
${users[0] } <br>
${users[1] } <br>
page : ${param.page } <br>
keyword : ${param.keyword }<br>
<script>
if('${msg}' != '') {
	alert('${msg}')
}
</script>
</body>
</html>