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
</head>
<body>

	<input id="userid">
	<input id="username">
	<input id="sal">
	<button type="button" id="btn">등록</button>
	
	<table>
		<thead>
			<tr><td>이름</td><td>급여</td></tr>
		</thead>
		<tbody>
			<tr data-userid="101"><td>고길동</td><td>1000</td></tr>
		</tbody>
	</table>
	
	
	<script>
		//버튼에 클릭 이벤트
		$("#btn").on("click", insert);
		
		//테이블에 추가
		function insert() {
			let userid = $("#userid").val()
			let username = $("#username").val()
			let sal = $("#sal").val()
			let tr = `<tr data-userid=\${userid}>
						<td>\${username}</td>
						<td>\${sal}</td></tr>`;
			
			$("tbody").append(tr);
						
			$("<tr>").data("userid", userid)
					 .append( $("<td>").html(username))
					 .append( $("<td>").html(sal))
					 .appendTo($("tbody"))
			
		}
		
		$("tbody").on("mouseover", "tr", function() {
			let id = $(this).data("userid");
			console.log(id);
		});
		
	</script>
</body>
</html>