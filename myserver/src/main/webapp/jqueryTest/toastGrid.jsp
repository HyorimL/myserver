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
				header : '��ȣ',
				name : 'employee_id'
			}, {
				header : '�̸�',
				name : 'last_name',
				editor : 'text'
			}, {
				header : '�޿�',
				name : 'salary',
				editor : 'text'
			}, {
				header : '�̸���',
				name : 'email',
				editor : 'text'
			}, {
				header : '���',
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
				header : '�Ի���',
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

		//ajax�� �����͸� �����ͼ� 

		//let jsonData;

		/* $.ajax({
			url : "/empSelect"
			
		}).done(function(datas){
				jsonData = datas
				console.log(datas)
			instance.resetData(datas); 
		}) */

		//���⿡ ������ �����͸� �־��ش�
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
		<button id="empInsert">���</button>
		<button id="empUpdate">����</button>
		<button id="empDelete">����</button>
	</div>
	<div id="grid"></div>
</body>
</html>