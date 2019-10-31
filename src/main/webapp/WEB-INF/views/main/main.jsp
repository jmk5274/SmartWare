<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>

<link href="${cp }/css/weather/style.css" rel="stylesheet" type="text/css" media="all" />
<link href="${cp }/css/weather/owl.carousel.css" rel="stylesheet" type="text/css" media="all">
<link href="${cp }/bootstrap/icons/weather-icons/css/weather-icons.min.css" rel="stylesheet">
<link href="//fonts.googleapis.com/css?family=Lato:100,100i,300,300i,400,400i,700,700i,900,900i&amp;subset=latin-ext" rel="stylesheet">
<%--<div class="container-fluid">--%>
    <div class="row">
        <div class="col-4">
			<h1>공지사항</h1>
            <div class="card">
                <div class="card-body">
                    <p>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Asperiores repellendus molestiae exercitationem voluptatem tempora quo dolore nostrum dolor consequuntur itaque, alias fugit. Architecto rerum animi velit, beatae corrupti quos nam saepe asperiores aliquid quae culpa ea reiciendis ipsam numquam laborum aperiam. Id tempore consequuntur velit vitae corporis, aspernatur praesentium ratione!</p>
                </div>
            </div>

			<div class="card">
				<div class="card-body">
					<p>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Asperiores repellendus molestiae exercitationem voluptatem tempora quo dolore nostrum dolor consequuntur itaque, alias fugit. Architecto rerum animi velit, beatae corrupti quos nam saepe asperiores aliquid quae culpa ea reiciendis ipsam numquam laborum aperiam. Id tempore consequuntur velit vitae corporis, aspernatur praesentium ratione!</p>
				</div>
			</div>
        </div>
		<div class="col-4">
			<h1>사내게시글</h1>
			<div class="card">
				<div class="card-body">
					<p>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Asperiores repellendus molestiae exercitationem voluptatem tempora quo dolore nostrum dolor consequuntur itaque, alias fugit. Architecto rerum animi velit, beatae corrupti quos nam saepe asperiores aliquid quae culpa ea reiciendis ipsam numquam laborum aperiam. Id tempore consequuntur velit vitae corporis, aspernatur praesentium ratione!</p>
				</div>
			</div>

			<div class="card">
				<div class="card-body">
					<p>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Asperiores repellendus molestiae exercitationem voluptatem tempora quo dolore nostrum dolor consequuntur itaque, alias fugit. Architecto rerum animi velit, beatae corrupti quos nam saepe asperiores aliquid quae culpa ea reiciendis ipsam numquam laborum aperiam. Id tempore consequuntur velit vitae corporis, aspernatur praesentium ratione!</p>
				</div>
			</div>
		</div>
        <div class="col-4">
			<div id="bg" class="wthree_main_grid agileinfo_main_grid">
				<div class="w3ls_main_grid">
					<div class="agileits_main_grid_left">
						<div class="agileits_main_grid_leftl">
						</div>
						<div class="agileits_main_grid_leftr">
						</div>
						<div class="clear"> </div>
					</div>
					<div class="agileits_main_grid_right">
					</div>
					<div class="clear"> </div>
				</div>
				<div class="w3l_main_grid_list">
					<ul id="owl-demo" class="owl-carousel owl-theme">
						<li class="li">
						</li>
						<li class="li">
						</li>
						<li class="li">
						</li>
						<li class="li">
						</li>
						<li class="li">
						</li>
					</ul>
				</div>
			</div>

			<div class="card card-widget">
				<div id="todayCal" class="card-body">
                    <h4 class="card-title">오늘 할 일</h4>
                </div>
			</div>
		</div>
    </div>
<%--</div>--%>
<script src="${cp }/js/weather/owl.carousel.js"></script>
<script src="${cp }/js/moment.js"></script>
<script>
	$(document).ready(function() { 
		currParseWeather();
		parseWeather();
		popupView();
		getTodayCalendar();
	}); 
	
	$("#owl-demo,#owl-demo1,#owl-demo3,#owl-demo4").owlCarousel({ 
		autoPlay: 3000, //Set AutoPlay to 3 seconds
 
		items : 4,
		itemsDesktop : [768,3],
		itemsDesktopSmall : [414,2]
	});
	
	moment.lang('ko', {
	    weekdays: ["Sun","Mon","Tue","Wed","Thu","Fri","Sat"],
	});

	function parseWeather() 
	{ 
	      loadJSON(function(data) 
	      {
	          var jsonData = JSON.parse(data);
	          var date = moment(new Date()).format('YYYYMMDD ddd');
	          var list = jsonData.list;
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
			          $(".li:eq("+(i)+")").html('<h4>'+week+'</h4><div class="w3layouts_icon"><i style="font-size:30px; color:white;" class="wi '+icon+'"></i></div><h5>'+Math.round(maxTemp)+'° <span>'+Math.round(minTemp)+'°</span></h5>');
	        	  }else{
			          $(".li:eq("+(i)+")").html('<h4>'+week+'</h4><div class="w3layouts_icon"></div><h5>'+Math.round(maxTemp)+'° <span>'+Math.round(minTemp)+'°</span></h5>');
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
	          var bgIcon = jsonData.weather[0].icon;
	          
			  if(bgIcon=="01d" || bgIcon=="01n" || bgIcon=="02d" || bgIcon=="02n"){
			  	  $("#bg").attr('class','wthree_main_grid agileinfo_main_grid');
			  }else if(bgIcon=="03d" || bgIcon=="03n" || bgIcon=="04d" || bgIcon=="04n"){
				  $("#bg").attr('class','wthree_main_grid agileinfo_main_grid1');
			  }else if(bgIcon=="09d" || bgIcon=="09n" || bgIcon=="10d" || bgIcon=="10n"){
				  $("#bg").attr('class','wthree_main_grid agileinfo_main_grid2');
			  }else if(bgIcon=="11d" || bgIcon=="11n" || bgIcon=="13d" || bgIcon=="13n"){
				  $("#bg").attr('class','wthree_main_grid agileinfo_main_grid3');
			  }
	          
	          $(".agileits_main_grid_leftr:eq(0)").html("<h4>"+condition+"</h4><p>Today, "+location+"</p>");
	          $(".agileits_main_grid_right:eq(0)").html("<i style='font-size:80px; color:white;' class='wi "+icon+"'></i>");
	          $(".agileits_main_grid_leftl:eq(0)").html("<h3>"+temp+"<span>°</span></h3>");
	          $(".w3layouts_icon:eq(0)").html("<i style='font-size:30px; color:white;' class='wi "+icon+"'></i>");
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
	
	function popupView(){
		var date = moment(new Date()).format('YYYYMMDD');
		
		$.ajax({
			url : "${cp}/getAllPopupList",
			dataType : "json",
			method : "post",
			success : function(data){
				var popupList = data.popupList;
				var popupNolookList = data.popupNolookList;
				
				popupList.forEach(function(popup){
					var stDate = moment(new Date(popup.pop_st_dt)).format('YYYYMMDD');
					var endDate = moment(new Date(popup.pop_end_dt)).format('YYYYMMDD');
					
					popupNolookList.forEach(function(nolook){
						console.log(popup.pop_id);
						console.log(nolook.POP_ID);
						if(popup.pop_id===nolook.POP_ID){
							stDate = moment(new Date(nolook.NL_DT)).format('YYYYMMDD');
						}
					});
					
					if(stDate <= date && date <= endDate){
						var popupX = (popup.pop_left);
						var popupY= (popup.pop_top);
						
						window.open('${cp }/popupView?pop_id='+popup.pop_id, '팝업창', 'width=500px, height=650px, left='+ popupX + ', top='+ popupY);
					}
				});
			}
		});
	}
	
	function getTodayCalendar(){
		$.ajax({
			url : "${cp}/getTodayCalendar",
			contentType : "application/json",
			dataType : "json",
			method : "post",
			success : function(data){
				var html = "";
				data.calList.forEach(function(cal){
                    html += '<div class="media border-bottom-1 pt-3 pb-3">';
	                html +=     '<img width="35" src="${cp }/employeePicture?emp_id=${S_EMPLOYEE.emp_id}" class="mr-3 rounded-circle">';
	                html +=     '<div class="media-body">';
	                html +=         '<h5>'+cal.cal_title+'</h5>';
	                html +=         '<p class="mb-0">'+moment(new Date(cal.st_dt)).format('YYYY-MM-DD')+' ~ '+moment(new Date(cal.end_dt)).format('YYYY-MM-DD')+'</p>';
	                html +=     '</div>';
	                html += '</div>';
				})
				$("#todayCal").append(html);
			}
		});
	}
</script>  