<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>toast grid</title>

<link rel="stylesheet"
	href="https://uicdn.toast.com/grid/latest/tui-grid.css" />
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://uicdn.toast.com/grid/latest/tui-grid.js"></script>

<script>

	$(function() {

		const Grid = tui.Grid;
		
		const instance = new Grid({
			
			el : document.getElementById('grid'), // Container element
			columns : [ {
				header : '번호',
				name : 'employee_id'
			}, {
				header : '이름',
				name : 'last_name',
				editor : 'text'
			}, {
				header : '급여',
				name : 'salary',
				editor : 'text'
			}, {
				header : '이메일',
				name : 'email',
				editor : 'text'
			}, {
				header : '담당',
				name : 'job_id',
				editor : {
					type : 'select',
					options : {

						listItems : [ {
							text : 'Administration',
							value : 'AD_PRES'
						}, {
							text : 'Accounting',
							value : 'AC_ACCOUNT'
						}, {
							text : 'IT',
							value : 'IT_PROG'
						}, {
							text : 'Marketing',
							value : 'MK_MAN'
						}, {
							text : 'Sales',
							value : 'SA_REP'
						}, {
							text : 'Shipping',
							value : 'ST_CLERK'
						} ]
					}
				}
			}, {
				header : '입사일',
				name : 'hire_date',
				editor : 'text'
			}

			],

			data : {
					api : {
						readData : {
							url : '/readEmp',
							method : 'GET'
						},
						 modifyData : {
							url : '/modifyEmp',
							method : 'POST'
						} 
					}
			},
			
			contentType : 'application/json'

		});

		//ajax로 데이터를 가져와서 

		//let jsonData;

		/* $.ajax({
			url : "/empSelect"
			
		}).done(function(datas){
				jsonData = datas
				console.log(datas)
			instance.resetData(datas); 
		}) */

		//여기에 가져온 데이터를 넣어준다
		Grid.applyTheme('striped'); // Call API of static method
		
		
		$("#empInsert").on("click", function(){
			instance.appendRos(1);
		})
		$("#empUpdate").on("click", function(){
			instance.request('modifyData');
		})
		$("#empDelete").on("click", function(){
			if(instance.getFocusedCell())
			instance.removeRow(instance.getFocusedCell().rowKey);
		})
		
	});
	
	
	

</script>

</head>
<body>
	<div>
		<button id="empInsert">등록</button>
		<button id="empUpdate">저장</button>
		<button id="empDelete">삭제</button>
	</div>
	<div id="grid"></div>
</body>
</html>