<%@page import="java.util.Date"%>
<%@page import="java.util.Arrays"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

	<c:set var="cp" value="${pageContext.request.contextPath}"/>
	<c:set var="list" value="<%=Arrays.asList(\"mon\", \"tue\", \"sat\") %>"/>
	<c:set var="hobby" value="read,ski,golf,degine"/>
	<h3>jstl 테스트</h3>
	<a href="${cp}">홈으로</a> <br>
	<a href="<c:url value="/empList"/>">사원목록</a> <br>
	
	<c:url value= "/empList" var="linkEmp">
		<c:param name="page" value="1"/>
		<c:param name="search" value="111"/>
	</c:url>
	
	<a href="${linkEmp}">사원</a> <br>
	<hr>
	총 갯수 : ${fn:length(list) } <br>
	<c:forEach items="${list }" var="week">
		${week }<br>
	</c:forEach>
	<hr>
	
	<ul>
	<c:forTokens items="${hobby }" var="hb" delims=",">
		<li>${hb }
	</c:forTokens>
	</ul>
	<hr>
	
	<select class="<c:if test="">ddd</c:if><c:if test="">ddd</c:if>">
	<c:forEach items="${fn:split(hobby, ',') }" var="hb">
		<option <c:if test="${hb=='degine'}"> selected="selected"</c:if> >${st.count%2==0} ${hb }</option> 
	</c:forEach>
	</select>
	<br>
	<c:set var="hobbylist" value="${fn:split(hobby, ',') }"/>
		총 갯수 : ${fn:length(hobbylist) } <br>
	
	<hr>	
	<c:set var="wdate" value="<%=new Date() %>"/>
		<fmt:formatDate value="${wdate}" pattern="yyyy-MM-dd"/> 
	<br>	
	<c:set var="sdate" value="2022-11-28 06:30"/>
	<fmt:parseDate var="psdate" value="${sdate}" pattern="yyyy-MM-dd hh:mm"/>
	<fmt:formatDate value="${psdate}" pattern="MM월 dd일"/> 
	
		
</body>
</html>