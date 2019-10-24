<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<script src="${cp }/js/jquery-3.4.1.min.js"></script>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
body {
  color: #bfc1c8;
  font-family: "Roboto", "Open Sans", sans-serif;
  font-size: 14px;
  font-weight: 300;
  line-height: 1.5;
  background: #1e202b; }
  
.forecast-container {
  width: 100%;
  background: #323544;
  display: table;
  table-layout: fixed;
  width: 100%;
  overflow: hidden;
  border-radius: 10px;
  margin-top: -150px;
  margin-bottom: 50px; }
  .forecast-container .forecast {
    display: table-cell;
    vertical-align: top; }
    .forecast-container .forecast:nth-child(even) {
      background-color: #262936; }
    @media screen and (max-width: 990px) {
      .forecast-container .forecast {
        display: block;
        width: 16.6667%;
        float: left; } }
    .forecast-container .forecast.today {
      width: 420px; }
      .forecast-container .forecast.today .forecast-header {
        *zoom: 1; }
        .forecast-container .forecast.today .forecast-header:after {
          content: " ";
          clear: both;
          display: block;
          overflow: hidden;
          height: 0; }
        .forecast-container .forecast.today .forecast-header .day {
          float: left; }
        .forecast-container .forecast.today .forecast-header .date {
          float: right; }
      .forecast-container .forecast.today .forecast-content {
        text-align: left;
        padding-top: 30px;
        padding-bottom: 30px; }
      .forecast-container .forecast.today .location {
        font-size: 18px;
        font-size: 1.2857142857em;
        font-weight: 400; }
      .forecast-container .forecast.today .degree .num, .forecast-container .forecast.today .degree .forecast-icon {
        display: inline-block;
        vertical-align: middle; }
      .forecast-container .forecast.today .degree .num {
        font-size: 90px;
        font-size: 6.4285714286rem;
        margin-right: 30px; }
      .forecast-container .forecast.today span {
        margin-right: 20px; }
        .forecast-container .forecast.today span img {
          margin-right: 5px;
          vertical-align: middle; }
      @media screen and (max-width: 990px) {
        .forecast-container .forecast.today {
          display: block;
          width: 100%; } }
    .forecast-container .forecast .forecast-header {
      background: rgba(0, 0, 0, 0.1);
      padding: 10px;
      text-align: center;
      font-weight: 400; }
    .forecast-container .forecast .forecast-icon {
      height: 50px; }
    .forecast-container .forecast .forecast-content {
      padding: 50px 20px 10px;
      text-align: center; }
      .forecast-container .forecast .forecast-content .forecast-icon {
        margin-bottom: 20px; }
      .forecast-container .forecast .forecast-content .degree {
        font-size: 24px;
        font-size: 1.7142857143em;
        color: white;
        font-weight: 700; }
      .forecast-container .forecast .forecast-content small {
        font-size: 16px;
        font-size: 1.1428571429em; }
</style>
<script>

function parseWeather() 
{ 
      loadJSON(function(data) 
      {
          var jsonData = JSON.parse(data);
          console.log(data);
          var date = new Date();
          var list = jsonData.list;
          list.forEach(function(info){
			console.log(info);        	  
          });
          
      });
}

function loadJSON(callback) //url의 json 데이터 불러오는 함수
{   
   var url = "http://api.openweathermap.org/data/2.5/forecast?q=Daejeon, KR&appid=8d2599dd27086ad9803defbf929421dd";
   var request = new XMLHttpRequest();
   request.overrideMimeType("application/json");
   request.open('GET', url, true);
   request.onreadystatechange = function () 
   {
     if (request.readyState == 4 && request.status == "200") 
     {
       callback(request.responseText);
     }
   };
   request.send(null);  
} 



window.onload = function()
{
  parseWeather();
}
</script>
</head>
<body>
<div class="forecast-table" style="margin-top: 200px;">
	<div class="container">
		<div class="forecast-container">
			<div class="today forecast">
				<div class="forecast-header">
					<div class="day">월요일</div>
					<div class="date">6 Oct</div>
				</div> <!-- .forecast-header -->
				<div class="forecast-content">
					<div class="location">New York</div>
					<div class="degree">
						<div class="num">23<sup>o</sup>C</div>
						<div class="forecast-icon">
							<img src="${cp}/img/weather/icons/icon-1.svg" alt="" width="90">
						</div>	
					</div>
					<span><img src="${cp}/img/weather/icon-umberella.png" alt="">20%</span>
					<span><img src="${cp}/img/weather/icon-wind.png" alt="">18km/h</span>
					<span><img src="${cp}/img/weather/icon-compass.png" alt="">East</span>
				</div>
			</div>
			<div class="forecast">
				<div class="forecast-header">
					<div class="day">화요일</div>
				</div> <!-- .forecast-header -->
				<div class="forecast-content">
					<div class="forecast-icon">
						<img src="${cp}/img/weather/icons/icon-3.svg" alt="" width="48">
					</div>
					<div class="degree">23<sup>o</sup>C</div>
					<small>18<sup>o</sup></small>
				</div>
			</div>
			<div class="forecast">
				<div class="forecast-header">
					<div class="day">수요일</div>
				</div> <!-- .forecast-header -->
				<div class="forecast-content">
					<div class="forecast-icon">
						<img src="${cp}/img/weather/icons/icon-5.svg" alt="" width="48">
					</div>
					<div class="degree">23<sup>o</sup>C</div>
					<small>18<sup>o</sup></small>
				</div>
			</div>
			<div class="forecast">
				<div class="forecast-header">
					<div class="day">목요일</div>
				</div> <!-- .forecast-header -->
				<div class="forecast-content">
					<div class="forecast-icon">
						<img src="${cp}/img/weather/icons/icon-7.svg" alt="" width="48">
					</div>
					<div class="degree">23<sup>o</sup>C</div>
					<small>18<sup>o</sup></small>
				</div>
			</div>
			<div class="forecast">
				<div class="forecast-header">
					<div class="day">금요일</div>
				</div> <!-- .forecast-header -->
				<div class="forecast-content">
					<div class="forecast-icon">
						<img src="${cp}/img/weather/icons/icon-12.svg" alt="" width="48">
					</div>
					<div class="degree">23<sup>o</sup>C</div>
					<small>18<sup>o</sup></small>
				</div>
			</div>
			<div class="forecast">
				<div class="forecast-header">
					<div class="day">토요일</div>
				</div> <!-- .forecast-header -->
				<div class="forecast-content">
					<div class="forecast-icon">
						<img src="${cp}/img/weather/icons/icon-13.svg" alt="" width="48">
					</div>
					<div class="degree">23<sup>o</sup>C</div>
					<small>18<sup>o</sup></small>
				</div>
			</div>
			<div class="forecast">
				<div class="forecast-header">
					<div class="day">일요일</div>
				</div> <!-- .forecast-header -->
				<div class="forecast-content">
					<div class="forecast-icon">
						<img src="${cp}/img/weather/icons/icon-14.svg" alt="" width="48">
					</div>
					<div class="degree">23<sup>o</sup>C</div>
					<small>18<sup>o</sup></small>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>