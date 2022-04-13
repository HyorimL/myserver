<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"
	integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
	crossorigin="anonymous"></script>
</head>
<body>
	<h3>todo list</h3>
	<input id="title">&nbsp;<button id="btn">등록</button>
	<div id="list">
		<div data-id="1">test1 true</div>
	</div>
	
	<script>
		
	const url = "https://jsonplaceholder.typicode.com/todos";

		$("#btn").on("click", function() {
			$.ajax(url, {
				method : 'POST',
			 	data :	JSON.stringify({title: $("#title").val(), userId : "Lee", completed: false}),
			 	contentType : "application/json"
			}).done(function(res){
				console.log(res)
			});		
		})
		
		
		
		$.ajax(url)
			.done(function(data) {
				console.log(data)
			
			for(todo of data) {
				
				const no = todo.id;
				const title = todo.title; 
				const c = todo.completed;
			
				if(c == true) {
					red = "style='color:red'";
					let div2 = `<div \${red} data-id=\${no}>\${title} \${c}</div>`
					$("#list").append(div2)
				} else {
					let div1 = `<div data-id=\${no}>\${title} \${c}</div>`
					$("#list").append(div1)
				}
			}
		})
	</script>
</body>
</html>