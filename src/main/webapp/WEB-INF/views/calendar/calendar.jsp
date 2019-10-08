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
		
		xmlReq.open('GET', '${cp }/getAllCalendarList');
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
			events : data.hashMapList,
			eventRender: function (info) { // 일정 hover
				var event = info.event, element = info.el, view = info.view;
			
				
// 				element.classList.add('popoverTitleCalendar');
// 				element.innerText = event.title;
// 				element.style.background = event.backgroundColor;
// 				element.style.color = event.textColor;
				
// 				return element;
				$(element).popover({
					title: $('<div />', {
						class: 'popoverTitleCalendar',
						text: event.title
					}).css({
						'background': event.backgroundColor,
						'color': event.textColor
					}),
					content: $('<div />', {
						class: 'popoverInfoCalendar'
			        }).append('<p><strong>등록자:</strong> ' + event.emp_id + '</p>')
			          .append('<p><strong>구분:</strong> ' + event.type + '</p>')
			          .append('<p><strong>시간:</strong> ' + getDisplayEventDate(event) + '</p>')
			          .append('<div class="popoverDescCalendar"><strong>설명:</strong> ' + event.description + '</div>'),
					delay: {
						show: "800",
						hide: "50"
			      	},
			      	trigger: 'hover',
			      	placement: 'top',
			      	html: true,
			      	container: 'body'
				});

				return element;
// 			    return filtering(event);
			}
		});
		
		calendar.render();
	}
	
	function getDisplayEventDate(event) {

		  var displayEventDate;

		  if (event.allDay == false) {
		    var startTimeEventInfo = moment(event.start).format('HH:mm');
		    var endTimeEventInfo = moment(event.end).format('HH:mm');
		    displayEventDate = startTimeEventInfo + " - " + endTimeEventInfo;
		  } else {
		    displayEventDate = "하루 종일";
		  }

		  return displayEventDate;
	}
	
	function filtering(event) {
		  var show_username = true;
		  var show_type = true;

		  var username = $('input:checkbox.filter:checked').map(function () {
		    return $(this).val();
		  }).get();
		  var types = $('#type_filter').val();

		  show_username = username.indexOf(event.username) >= 0;

		  if (types && types.length > 0) {
		    if (types[0] == "all") {
		      show_type = true;
		    } else {
		      show_type = types.indexOf(event.type) >= 0;
		    }
		  }

		  return show_username && show_type;
	}
	
</script>

<div class="col-12">
	<div class="card">
		<div class="card-body">
			<div id='calendar'></div>
		</div>
	</div>
</div>