<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="//cdn.datatables.net/1.11.5/css/jquery.dataTables.min.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>


<script>
$(function(){
	
	//데이터 테이블
	var dataTalbe = $('#table_id').DataTable({
					ajax: {
						url: '../empSelect',
						dataSrc: ''
					},
					columns: [ 
								{data : 'employee_id'},
								{data : 'first_name'},
								{data : 'job_id'},
								{data : 'salary'},
								{data : 'hire_date'}
							]
					});
	
	//등록 버튼 클릭 이벤트
	$("#btn").on("click", function() {
		dataTalbe.row.add( {
			"employee_id" : "001",
			"first_name" : "이효림",
			"job_id" : "IT_PROG",
			"salary" : "5000",
			"hire_date" : "20200615"
		}).draw();
	})
	
})//end of $(function())

</script>
</head>
<body>
<button id="btn">등록</button>
<table id="table_id" class="display">

    <thead>
        <tr>
            <th>사원번호</th>
            <th>이름</th>
            <th>job_id</th>
            <th>급여</th>
            <th>채용일</th>
        </tr>
    </thead>
    
    <tbody>
        
        
    </tbody>
    
</table>
</body>
</html>