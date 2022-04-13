<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="UTF-8">
	<link rel="icon" href="./images/favicon.png" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>user_jquery</title>
	
	<script src="https://code.jquery.com/jquery-3.6.0.js"
		integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
	<script src="template/js/json.min.js"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
</head>

<body>
	<div class="container">
		<form id="form1" name="frm" class="form-horizontal">
			<h2>사용자 등록 및 수정</h2>
			<div class="form-group">
				<label>아이디:</label> <input type="text" class="form-control" name="id">
			</div>
			<div class="form-group">
				<label>이름:</label> <input type="text" class="form-control" name="name">
			</div>
			<div class="form-group">
				<label>패스워드:</label> <input type="text" class="form-control" name="password">
			</div>
			<div class="form-group">
				<label>역할:</label> <select class="form-control" name="role">
					<option value="Admin">관리자</option>
					<option value="User">사용자</option>
				</select>
			</div>
			<div class="btn-group">
				<input type="button" class="btn btn-primary" value="등록" id="btnInsert" />
				<input type="button" class="btn btn-primary" value="수정" id="btnUpdate" />
				<input type="button" class="btn btn-primary" value="초기화" id="btnInit" />
			</div>
		</form>
	</div>
	<hr />
	<div class="container">
		<h2>사용자 목록</h2>
		<table class="table text-center">
			
			<thead>
				<tr>
					<th class="text-center">아이디</th>
					<th class="text-center">패스워드</th>
					<th class="text-center">이름</th>
					<th class="text-center">롤</th>
					<th class="text-center"></th>
				</tr>
			</thead>

			<tbody>
				

			</tbody>

		</table>
	</div>

	<script>

		const url = "http://localhost/myserver/users";
		
		//등록버튼 : 직접이벤트
		function userInsert() {
			
			$("#btnInsert").on("click", function() {
				
				$.ajax(url, {
					method : 'POST',
					data : JSON.stringify($("#form1").serializeObject()),
					contentType : "application/json"
				}) 
				.done(function(res) {
					
					$("tbody").prepend(makeTr(res))
				});			
			})
		} 

		//수정버튼 : 직접이벤트
		function userUpdate() {
			//버튼 클릭이벤트 -> ajax
			$("#btnUpdate").on("click", function() {
				
				$.ajax(url, {
					method : 'PUT',
					data : JSON.stringify($("#form1").serializeObject()),
					contentType : "application/json"
				})
				.done(function(res) {
					const newTr = makeTr(res);
					const oldTr = $('[data-id='+res.id+']');
					$(oldTr).replaceWith(newTr);
				})
			})
		
		}

		//조회버튼 : 그룹이벤트
		function userSelect() {
			$("table").on("click", ".btnUpd", function() {
				
				const userid = $(this).closest("tr").data("id")
				
				$.ajax(url + "/" + userid)
					.done(function(res) {
						form1.id.value = res.id;
						form1.name.value = res.name;
						form1.password.value = res.password;
						form1.role.value = res.role;
						 
				}) 
			})
		}

		//삭제버튼 : 그룹이베튼
		function userDelete() {
			$("table").on("click", ".btnDel", function() {
				
				const userid = $(this).closest("tr").data("id");
				const tr = $(this).closest("tr");
				
				$.ajax(url + "/" + userid, {
					method : 'DELETE'
				})
				
				.done(function() {
					tr.remove();
				})
			})
		}

		function list() {
			$.ajax(url)
			.done(function(res){
				for (user of res) {
					$('tbody').append(makeTr(user));	
				}
			})
		}

		function makeTr(user) {
			
			const tr = `<tr data-id=\${user.id}>
					<td class="text-center">\${user.id}</td>
					<td class="text-center">\${user.password}</td>
					<td class="text-center">\${user.name}</td>
					<td class="text-center">\${user.role}</td>
					<td class="text-center">
						<button class="btnUpd">조회</button>
						<button class="btnDel">삭제</button>
					</td></tr>`;
					
		 	return tr;
		}
		
		$(function(){
			userInsert();
			userUpdate();
			userSelect();
			userDelete();
		})
		
		list();
	</script>
</body>

</html>