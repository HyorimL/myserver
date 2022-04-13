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
	<script type="text/javascript">
		
		const url1 = "http://kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?key=f5eef3421c602c6cb7ea224104795888&targetDt=20220412";
		$.ajax(url1)
		 	.done(function(data){
		 		
		 		//첫번째 영화의 제목만 출력
		 		const mn = data.boxOfficeResult.dailyBoxOfficeList[0].movieNm;
		 		const cd = data.boxOfficeResult.dailyBoxOfficeList[0].movieCd;
		 		console.log("제목: " + mn + "(" + cd + ")"  );
		 	})
		 	
		const url2 = "http://www.kobis.or.kr/kobisopenapi/webservice/rest/movie/searchMovieInfo.json?key=f5eef3421c602c6cb7ea224104795888&movieCd=20204431"
		$.ajax(url2)
		 	.done(function(data) {
		 		const dr = data.movieInfoResult.movieInfo.directors[0].peopleNm;
		 		console.log("감독: " + dr);
		 	})
		
	</script>
</body>
</html>