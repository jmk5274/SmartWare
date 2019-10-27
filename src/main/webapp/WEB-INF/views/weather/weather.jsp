<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<link href="${cp }/bootstrap/icons/weather-icons/css/weather-icons.min.css" rel="stylesheet">
<script src="${cp }/js/jquery-3.4.1.min.js"></script>
<script src="${cp }/js/moment.js"></script>
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
        font-size: 20px;
        margin-right: 20px; }
        .forecast-container .forecast.today span i {
          font-size: 20px;
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
      height: 90px; }
    .forecast-container .forecast .forecast-content {
      padding: 50px 20px 10px;
      text-align: center; }
      .forecast-container .forecast .forecast-content .forecast-icon {
        margin-bottom: 20px; }
      .forecast-container .forecast .forecast-content .forecast-icon i{
        font-size: 80px;
        color: white; }
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
moment.lang('ko', {
    weekdays: ["일요일","월요일","화요일","수요일","목요일","금요일","토요일"],
});

function parseWeather() 
{ 
      loadJSON(function(data) 
      {
          var jsonData = JSON.parse(data);
          var date = moment(new Date()).format('YYYYMMDD ddd');
          var list = jsonData.list;
          console.log(list)
          var tempDate;
          
          for(var i=0; i<5; i++){
       	  	  var maxTemp = 0;
       	  	  var minTemp = 100;
       	  	  var icon = "";
       	 	  var week = moment(list[i * 8].dt_txt).format('dddd');
	          for(var j=0; j<8; j++){
	        	  var nowTemp = list[i * 8 + j].main.temp-273.15;
	        	  if(j==4){
	        		  icon = list[i * 8 + j].weather[0].icon;
	        	  }
	        	  if(maxTemp < nowTemp) maxTemp = nowTemp ;
	        	  if(minTemp > nowTemp) minTemp = nowTemp ;
	          }
        	  if(i!=0){
		          icon = iconView(icon);
		          $(".forecast-icon:eq("+i+")").html("<i class='wi "+icon+"'></i>");
		          $(".week:eq("+i+")").html(week);
		          $(".degree:eq("+i+")").html("<i class='wi wi-thermometer'></i> "+Math.round(maxTemp)+"<sup>o</sup>C");
		          $(".forecast-content:eq("+(i)+")").append("<i class='wi wi-thermometer-exterior'></i><small> "+Math.round(minTemp)+"<sup>o</sup></small>");
        	  }else{
                  $("#todayMaxTemp").html("<i class='wi wi-thermometer'></i> "+Math.round(maxTemp)+"<sup>o</sup>");
                  $("#todayMinTemp").html("<i class='wi wi-thermometer-exterior'></i> "+Math.round(minTemp)+"<sup>o</sup>");
        	  }
          }
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
  currParseWeather();
  parseWeather();
}

function currParseWeather() 
{ 
      currLoadJSON(function(data) 
      {
          var jsonData = JSON.parse(data);
          var date = moment(new Date()).format('YYYY-MM-DD');
          var weekDay = moment(new Date()).format('dddd');
          var location = jsonData.name;
          var temp = Math.round(jsonData.main.temp-273.15);
          var condition = jsonData.weather[0].main
          var icon = iconView(jsonData.weather[0].icon);
          
          $(".forecast-icon:eq(0)").html("<i class='wi "+icon+"'></i>")
          $("#todayWeek").text(weekDay);
          $("#todayDate").text(date);
          $(".location").text(location);
          $(".num").html(temp+"<sup>o</sup>C");
      });
}

function currLoadJSON(callback) //url의 json 데이터 불러오는 함수
{   
   var url = "http://api.openweathermap.org/data/2.5/weather?q=Daejeon, KR&appid=8d2599dd27086ad9803defbf929421dd";
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

function iconView(icon){
	var i = "";
	if(icon=="01d" || icon=="01n"){
		i = "wi-day-sunny";	
	}else if(icon=="02d" || icon=="02n"){
		i = "wi-day-cloudy";
	}else if(icon=="03d" || icon=="03n"){
		i = "wi-cloud";
	}else if(icon=="04d" || icon=="04n"){
		i = "wi-cloudy";
	}else if(icon=="09d" || icon=="09n"){
		i = "wi-rain";
	}else if(icon=="10d" || icon=="10n"){
		i = "wi-day-rain";
	}else if(icon=="11d" || icon=="11n"){
		i = "wi-thunderstorm";
	}else if(icon=="13d" || icon=="13n"){
		i = "wi-snow";
	}
	return i;
}
</script>
</head>
<body>
<div class="forecast-table">
	<div class="container">
		<div class="forecast-container">
			<div class="today forecast">
				<div class="forecast-header">
					<div id="todayWeek" class="day week"></div>
					<div id="todayDate" class="date"></div>
				</div> <!-- .forecast-header -->
				<div class="forecast-content">
					<div class="location"></div>
					<div class="degree">
						<div class="num"></div>
						<div id="todayIcon" class="forecast-icon">
						</div>	
					</div>
					<span id="todayMaxTemp"></span>
					<span id="todayMinTemp"></span>
				</div>
			</div>
			<div class="forecast">
				<div class="forecast-header">
					<div class="day week"></div>
				</div> <!-- .forecast-header -->
				<div class="forecast-content">
					<div class="forecast-icon">
					</div>
					<div class="degree"></div>
				</div>
			</div>
			<div class="forecast">
				<div class="forecast-header">
					<div class="day week"></div>
				</div> <!-- .forecast-header -->
				<div class="forecast-content">
					<div class="forecast-icon">
					</div>
					<div class="degree"></div>
				</div>
			</div>
			<div class="forecast">
				<div class="forecast-header">
					<div class="day week"></div>
				</div> <!-- .forecast-header -->
				<div class="forecast-content">
					<div class="forecast-icon">
					</div>
					<div class="degree"></div>
				</div>
			</div>
			<div class="forecast">
				<div class="forecast-header">
					<div class="day week"></div>
				</div> <!-- .forecast-header -->
				<div class="forecast-content">
					<div class="forecast-icon">
					</div>
					<div class="degree"></div>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>