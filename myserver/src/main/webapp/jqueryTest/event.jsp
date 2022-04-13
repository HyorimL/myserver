<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"
	integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
	crossorigin="anonymous"></script>
<style>
.active {
	background-color: green;
	color: white;
}
</style>
</head>
<body>
	<input id="book">
	<ul>
		<li data-isbn="102" data-price="10000"><span>스프링</span>
		<li data-isbn="103" data-price="20000"><span>자바</span>
		<li data-isbn="104" data-price="15000"><span>자바스크립트</span>
	</ul>
	<script>


		//그룹이벤트(부모에 위임) : 동적으로 추가도리 태그에도 이벤트가 적용됨
		$("ul").on("mouseover mouseout", "span", function() {
			let isbn = $(this).parent().data("isbn");
			console.log(isbn);
			$(this).toggleClass("active");
		})
		

		
		$("#book").on("keypress", function() {
			if (event.keyCode == 13)
		
			$("<li>").append($("<span>").html($(this).val())).data("isbn", "101").appendTo($("ul"));
		
			$(this).val("");
			$(this).focus();

		});
		
	</script>
</body>
</html>