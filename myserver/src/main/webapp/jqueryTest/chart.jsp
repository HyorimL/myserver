<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
  <head>
  	<script src="https://code.jquery.com/jquery-3.6.0.js"
		integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>

    <!--Load the AJAX API-->
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">

      // Load the Visualization API and the corechart package.
      google.charts.load('current', {'packages':'corechart'});

      // Set a callback to run when the Google Visualization API is loaded.
      google.charts.setOnLoadCallback(drawChart);

      // Callback that creates and populates a data table,
      // instantiates the pie chart, passes in the data and
      // draws it.
      function drawChart() {
    	  drawChart1();
    	  drawChart2();
      }
      
      function drawChart2() {
    	  
    	// Set chart options
    	 var options = {'title':'부서별 급여평균',
                  'width':500,
                  'height':300,
                  'color' : '#e0440e',
                  'is3D' : true
                  };
    	  
    	// Create the data table.
          var data = new google.visualization.DataTable();
          data.addColumn('string', '부서');
          data.addColumn('number', '급여평균');
          
          let jsonData;
          $.ajax({
        	  url : "../avgSalary"
          }).done(function(salary) {
        	  jsonData = [];
        	  for(s of salary) {
        		  jsonData.push([s.departmentName, s.avg])
        	  }
        	  data.addRows(jsonData);
          	  var chart = new google.visualization.BarChart(document.getElementById('chart_div2'));
              chart.draw(data, options);
          })
      }
      
       
      function drawChart1() {
    	  
    	// Set chart options
        var options = {'title':'부서별 인원수',
                         'width':500,
                         'height':300,
                         'vAxis' : { gridlines: { count: 4 }, 
                        	 	   format: 'currency' }
    	};

        // Create the data table.
        var data = new google.visualization.DataTable();
        data.addColumn('string', '부서');
        data.addColumn('number', '인원수');
        
        //ajax 호출해서 addRows에 넣기
        let jsonData;
        $.ajax({
        	url : "../findStat"       	
        }).done(function(datas){
        	//chart data
        	jsonData = [];
        	for(d of datas) {
        		
        		jsonData.push([d.departmentName, d.cnt])
        	}
        	
        	data.addRows(jsonData);
        	
        	//chart draw
        	var chart = new google.visualization.LineChart(document.getElementById('chart_div1'));
            chart.draw(data, options);
            
            //chart event
            google.visualization.events.addListener(chart, 'select', function() {
            	var col = chart.getSelection()[0].column
            	var row = chart.getSelection()[0].row
            	console.log(jsonData[row][col], jsonData[row][0]);
            	});
            
        })
      }
    </script>
  </head>

  <body>
    <!--Div that will hold the pie chart-->
    <div id="chart_div1"></div>
    <div id="chart_div2"></div>
  </body>
</html>