<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="UTF-8">
	<link rel="icon" href="./images/favicon.png" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Document</title>
	<script src="https://code.jquery.com/jquery-3.6.0.js"
		integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
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
		const tb = document.getElementsByTagName("table")[0];
		tb.addEventListener("click", function () {
			//삭제버튼
			if (event.target.classList.contains("btnDel")) {
				userDelete(event.target);
			}
			//조회버튼
			else if (event.target.classList.contains("btnUpd")) {
				userSelect(event.target);
			}
		});

		//등록버튼 이벤트
		btnInsert.addEventListener("click", insert);

		//수정버튼 이벤트
		btnUpdate.addEventListener("click", userUpdate);

		//수정 ajax 요청
		function userUpdate() {
			//등록과 동일 : post -> put, prepend -> replace
			const ajax = new XMLHttpRequest();
			const url = "http://localhost/myserver/users";
			ajax.onload = function () {
				let user = JSON.parse(ajax.response);
				let newTr = makeTr(user);
				let oldTr = document.querySelector('[data-id='+user.id+']');
				document.getElementsByTagName("tbody")[0].replaceChild(newTr, oldTr);

			};
			ajax.open("PUT", url);
			
			ajax.setRequestHeader("Content-type", "application/json"); //서버에 보낼 데이터가 json구조
			let id = frm.id.value
			let name = frm.name.value
			let password = frm.password.value
			let role = frm.role.value
			let obj = {
				id,
				name,
				password,
				role
			}
			ajax.send(JSON.stringify(obj));
		}

		//단건조회 ajax 요청
		function userSelect(tg) {
			const ajax = new XMLHttpRequest();
			const userid = tg.closest("tr").children[0].innerHTML;
			const url = "http://localhost/myserver/users/" + userid;
			ajax.onload = function () {
				let user = JSON.parse(ajax.response);
				frm.id.value = user.id;
				frm.name.value = user.name;
				frm.password.value = user.password;
				frm.role.value = user.role;

			}
			ajax.open("GET", url);
			ajax.send();
		}

		//삭제 ajax 요청
		function userDelete(tg) {
			//debugger
			const ajax = new XMLHttpRequest();
			const userid = tg.closest("tr").children[0].innerHTML;
			const url = "http://localhost/myserver/users/" + userid;
			ajax.onload = function () {
				tg.closest("tr").remove();
			}
			ajax.open("DELETE", url);
			ajax.send();
		}

		function insert() {
			const ajax = new XMLHttpRequest();
			const url = "http://localhost/myserver/users";
			ajax.onload = function () {
				let user = JSON.parse(ajax.response);
				document.getElementsByTagName("tbody")[0].prepend(makeTr(user));

			};
			ajax.open("POST", url);
			//ajax.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
			// const qs = $('[name=frm]').serialize();
			//const qs5 = new URLSearchParams(new FormData(frm)).toString();

			ajax.setRequestHeader("Content-type", "application/json"); //서버에 보낼 데이터가 json구조
			let id = frm.id.value
			let name = frm.name.value
			let password = frm.password.value
			let role = frm.role.value
			let obj = {
				id,
				name,
				password,
				role
			}
			ajax.send(JSON.stringify(obj));
			//ajax.send(qs5);
		}

		function list() {
			const ajax = new XMLHttpRequest();
			const url = "http://localhost/myserver/users";
			ajax.onload = function () {
				//listCallback(ajax.response);
				console.log(typeof ajax.response);
				let obj = JSON.parse(ajax.response);
				for (user of obj) {
					document.getElementsByTagName("tbody")[0].append(makeTr(user));
				}
			};
			ajax.open("GET", url);
			ajax.send();
		}
		list();

		function makeTr(user) {
			let tr = document.createElement("tr");
			tr.setAttribute("data-id", user.id)
			tr.innerHTML = `<td class="text-center">\${user.id}</td>
					<td class="text-center">\${user.password}</td>
					<td class="text-center">\${user.name}</td>
					<td class="text-center">\${user.role}</td>
					<td class="text-center">
						<button class="btnUpd">조회</button>
						<button class="btnDel">삭제</button>
					</td>`
			return tr;
		}
	</script>
</body>

</html>