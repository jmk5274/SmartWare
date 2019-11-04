<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>

<link href="${cp }/css/weather/style.css" rel="stylesheet" type="text/css" media="all" />
<link href="${cp }/css/weather/owl.carousel.css" rel="stylesheet" type="text/css" media="all">
<link href="${cp }/bootstrap/icons/weather-icons/css/weather-icons.min.css" rel="stylesheet">
<link href="//fonts.googleapis.com/css?family=Lato:100,100i,300,300i,400,400i,700,700i,900,900i&amp;subset=latin-ext" rel="stylesheet">

<style>
	.weekDiv{
 		height: 380px; 
	}
	.todayDiv{
 		height: 350px;
	}
	.apprDiv{
		height: 250px;
	}
	
	img{
		margin-bottom : 20px;
	}
	
	.card .card-body {
    	padding: 1.25rem;
	}
	
	.progress{
		margin-top: 0.3rem;
		margin-bottom: 0.7rem;
	}
</style>
	<img src="${cp }/img/mainimg/smartware.png">
	<!-- 게시판 -->
    <div class="row">
        <div class="col-4">
			<div class="card weekDiv">
				<div class="social-graph-wrapper widget-facebook">
               		<span class="s-icon"><i class="fa fa-clock-o"></i> &nbsp;주간 일정</span>
                </div>
				<div class="card-body" style="overflow:auto;">
					<div id="weekCal">
					</div>
				</div>
			</div>
			
			<!-- 오늘 일정 -->
			<div class="card card-widget todayDiv">
				<div class="social-graph-wrapper widget-facebook">
               		<span class="s-icon"><i class="fa fa-clock-o" aria-hidden="true"></i> &nbsp;일간 일정</span>
                </div>
				<div class="card-body" style="overflow:auto;">
					<div id="todayCal">
	                    
	                </div>
				</div>
			</div>
        </div>
		<div class="col-4">
			<div class="card weekDiv">
				<div class="social-graph-wrapper widget-facebook">
               		<span class="s-icon"><i class="fa fa-tasks"></i> &nbsp;주간 업무</span>
                </div>
				<div class="card-body" style="overflow:auto;">
					<div id="weekTask">
					</div>
				</div>
			</div>

			<!-- 오늘 업무 -->
			<div  class="card todayDiv">
				<div class="social-graph-wrapper widget-facebook">
               		<span class="s-icon"><i class="fa fa-tasks"></i> &nbsp;일간 업무</span>
                </div>
				<div class="card-body" style="overflow:auto;">
					<div id="todayTask">
					</div>
				</div>
			</div>
		</div>
		 <div class="col-4">
			<!-- 결재 현황 -->
			<div class="card card-widget apprDiv">
				<div class="social-graph-wrapper widget-facebook">
               		<span class="s-icon"><i class="fa fa-file-archive-o" aria-hidden="true"></i> &nbsp;결재현황</span>
                </div>
				<div class="row">
                    <div class="col-6 border-right">
                        <div class="pt-4 pb-4 pl-0 pr-0 text-center border-bottom">
                            <h4 class="m-1"><c:if test="${sendApplCnt == null}">0</c:if>${sendApplCnt}</h4>
                            <p class="m-0">결재문서</p>
                        </div>
                        <div class="pt-4 pb-4 pl-0 pr-0 text-center">
                            <h4 class="m-1"><c:if test="${sendApplCompleCnt == null}">0</c:if>${sendApplCompleCnt}</h4>
                            <p class="m-0">완료문서</p>
                        </div>
                    </div>
                    <div class="col-6">
                        <div class="pt-4 pb-4 pl-0 pr-0 text-center border-bottom">
                            <h4 class="m-1"><c:if test="${confirmApplCnt == null}">0</c:if>${confirmApplCnt}</h4>
                            <p class="m-0">수신문서</p>
                        </div>
                        <div class="pt-4 pb-4 pl-0 pr-0 text-center">
                            <h4 class="m-1"><c:if test="${sendApplReferCnt == null}">0</c:if>${sendApplReferCnt}</h4>
                            <p class="m-0">반려문서</p>
                        </div>
                    </div>
                </div>
			</div>
			
			<!-- 날씨 -->
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
		</div>
    </div>
<script src="${cp }/js/weather/owl.carousel.js"></script>
<script src="${cp }/js/moment.js"></script>
<script>
	$(document).ready(function() { 
		parseWeather();
		popupView();
		
		$.ajax({
			url : "${cp}/getMainTask",
			dataType : "json",
			method : "post",
			success : function(data){
				todayTask(data);
				weekTask(data);
				weekCal(data);
				var html = "";
				data.calList.forEach(function(cal, idx){
					if(idx!=0){
		            	html += '<div class="media border-top-1 pt-3 pb-3">';
					}else{
						html += '<div class="media pt-1 pb-3">';
					}
	                html += 	'<i style="font-size:1.3em;" class="fa fa-calendar menu-icon"></i>'
	                html +=     '<div class="media-body">';
	                html +=         '<h5>&nbsp;&nbsp;'+cal.cal_title;
	                html +=         	'<span class="float-right" style="color:gray;">'+moment(new Date(cal.st_dt)).format('YYYY-MM-DD')+' ~ '+moment(new Date(cal.end_dt)).format('YYYY-MM-DD')+'</span>';
	                html += 		'</h5>';
	                html +=     '</div>';
	                html += '</div>';
				})
				$("#todayCal").html(html);
			}
		});
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

	//주간 일정
	function weekCal(data){
		var html = "";
		data.weekCalList.forEach(function(cal, idx){
			if(idx!=0){
            	html += '<div class="media border-top-1 pt-3 pb-3">';
			}else{
				html += '<div class="media pt-1 pb-3">';
			}
            html += 	'<i style="font-size:1.3em;" class="fa fa-calendar menu-icon"></i>'
            html +=     '<div class="media-body">';
            html +=         '<h5>&nbsp;&nbsp;'+cal.cal_title;
            html +=         	'<span class="float-right" style="color:gray;">'+moment(new Date(cal.st_dt)).format('YYYY-MM-DD')+' ~ '+moment(new Date(cal.end_dt)).format('YYYY-MM-DD')+'</span>';
            html += 		'</h5>';
            html +=     '</div>';
            html += '</div>';
		})
		$("#weekCal").html(html);
	}
	
	function weekTask(data){
		var html = "";
		html += '<div class="taskList">';
		
		//지연업무
		$.each(data.weekDelayList, function(idx, delay) {
			html += '<h5>' + delay.task_cont + ' / <span class="mt-3" style="font-weight: bold;">'+ delay.pro_nm.pro_nm + '</span><span class="float-right">' + delay.per + '%</span></h5>';
			html += '<div class="progress" style="height: 15px">';
			html += '   <div class="progress-bar bg-danger wow  progress-" style="width: ' + delay.per + '%;" role="progressbar">';
			html += '   </div>';
			html += '</div>';
		});
		
		// 주간 업무
		$.each(data.weekList, function(index, week) {
			html += '<h5>' + week.task_cont + ' / <span class="mt-3" style="font-weight: bold;">'+ week.pro_nm.pro_nm + '</span><span class="float-right">' + week.per + '%</span></h5>';
			html += '<div class="progress" style="height: 15px">';
			html += '   <div class="progress-bar ';
			if(week.per === 100)
				html += 'bg-success';
			else if(week.end_dt < new Date() && week.per < 100)
				html += 'bg-danger';
			else
				html += 'bg-info';
			html += ' wow  progress-" style="width: ' + week.per + '%;" role="progressbar">';
			html += '   </div>';
			html += '</div>';
		});
		
		html += '</div>';
		$("#weekTask").html(html);
	}
	
	function todayTask(data){
		var html = "";
		
	    html += '<div class="taskList">';
		
		//지연업무
		$.each(data.todayDelayList, function(idx, delay) {
			html += '<h5>' + delay.task_cont + ' / <span class="mt-3" style="font-weight: bold;">'+ delay.pro_nm.pro_nm + '</span><span class="float-right">' + delay.per + '%</span></h5>';
			html += '<div class="progress" style="height: 15px">';
			html += '   <div class="progress-bar bg-danger wow  progress-" style="width: ' + delay.per + '%;" role="progressbar">';
			html += '   </div>';
			html += '</div>';
		});
		
		//일간업무
		$.each(data.todayList, function(idx, today) {
			html += '<h5>' + today.task_cont + ' / <span class="mt-3" style="font-weight: bold;">'+ today.pro_nm.pro_nm + '</span><span class="float-right">' + today.per + '%</span></h5>';
			html += '<div class="progress" style="height: 15px">';
			html += '   <div class="progress-bar ';
			if(today.per === 100)
				html += 'bg-success';
			else if(today.end_dt < new Date() && today.per < 100)
				html += 'bg-danger';
			else
				html += 'bg-info';
			html += ' wow  progress-" style="width: ' + today.per + '%;" role="progressbar">';
			html += '   </div>';
			html += '</div>';
		});
		
		html +=	'</div>';
		$("#todayTask").html(html);
	}
	
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
	          currParseWeather();
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
	          temp = Math.round(jsonData.main.temp-273.15);
	          condition = jsonData.weather[0].main
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
		}else if(icon=="50d"){
			i = "wi-fog";
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
</script>  