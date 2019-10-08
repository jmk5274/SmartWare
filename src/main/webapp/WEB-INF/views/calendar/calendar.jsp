<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<link href= "${cp }/fullcalendar-4.3.1/core.min.css" rel="stylesheet" />
<link href= "${cp }/fullcalendar-4.3.1/daygrid.min.css" rel="stylesheet" />
<link href= "${cp }/fullcalendar-4.3.1/timegrid.min.css" rel="stylesheet" />
<link href= "${cp }/fullcalendar-4.3.1/list.min.css" rel="stylesheet" />

<script src="${cp }/fullcalendar-4.3.1/core.min.js"></script>
<script src="${cp }/fullcalendar-4.3.1/interaction.min.js"></script>
<script src="${cp }/fullcalendar-4.3.1/daygrid.min.js"></script>
<script src="${cp }/fullcalendar-4.3.1/timegrid.min.js"></script>
<script src="${cp }/fullcalendar-4.3.1/list.min.js"></script>

<script src="${cp }/fullcalendar-4.3.1/ko.js"></script>

<script>
	document.addEventListener("DOMContentLoaded", function() {
		var xmlReq = new XMLHttpRequest();
		xmlReq.addEventListener('readystatechange', calendarInitializer);
		
		xmlReq.open('GET', '${cp }/getDepCalendarList');
		xmlReq.send();
	});
	
	function calendarInitializer() {
		if (this.readyState !== 4 || this.status !== 200) return;
		
		var data = JSON.parse(this.response);
		
		var calendarEl = document.getElementById("calendar");

		var calendar = new FullCalendar.Calendar(calendarEl, {
			plugins : [ "dayGrid", "timeGrid", "list", "interaction" ],
			header : {
				left : "prev,next today",
				center : "title",
				right : "dayGridMonth,timeGridWeek,timeGridDay,listWeek"
			},
			locale: 'ko',
			height: "auto",
			navLinks : true, // can click day/week names to navigate views
			editable : true,
			eventLimit : true, // allow "more" link when too many events
			events : data.hashMapList
//				events : [ {
//					title : "Birthday Party",
//					start : "2019-08-13T07:00:00"
//				}, {
//					title : "Click for Google",
//					url : "http://google.com/",
//					start : "2019-08-28"
//				} ]
		});
		
//			console.log(data.hashMapList)

		calendar.render();
		
	}
</script>

<div class="col-12">
	<div class="card">
		<div class="card-body">
			<div id='calendar'></div>
		</div>
	</div>
</div>