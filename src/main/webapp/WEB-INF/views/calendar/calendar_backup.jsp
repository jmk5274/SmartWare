<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<link href= "${cp }/fullcalendar-4.3.1/core.min.css" rel="stylesheet" />
<link href= "${cp }/fullcalendar-4.3.1/daygrid.min.css" rel="stylesheet" />
<link href= "${cp }/fullcalendar-4.3.1/timegrid.min.css" rel="stylesheet" />
<link href= "${cp }/fullcalendar-4.3.1/list.min.css" rel="stylesheet" />

<link href= "${cp }/css/bootstrap-colorselector.min.css" rel="stylesheet" />

<script src="${cp }/fullcalendar-4.3.1/core.min.js"></script>
<script src="${cp }/fullcalendar-4.3.1/interaction.min.js"></script>
<script src="${cp }/fullcalendar-4.3.1/daygrid.min.js"></script>
<script src="${cp }/fullcalendar-4.3.1/timegrid.min.js"></script>
<script src="${cp }/fullcalendar-4.3.1/list.min.js"></script>

<script src="${cp }/fullcalendar-4.3.1/ko.js"></script>

<script src="${cp }/js/bootstrap-colorselector.min.js"></script>

<script src="${cp }/js/moment.js"></script>



<style>

.popoverTitleCalendar {
  width: 250px;
  height: 100%;
  padding: 15px 15px;
  font-size: 13px;
  border-radius: 5px 5px 0 0;
}

.popoverInfoCalendar i {
  font-size: 14px;
  margin-right: 10px;
  line-height: inherit;
  color: #d3d4da;
}

.popoverInfoCalendar p {
  margin-bottom: 1px;
}

.popoverDescCalendar {
  margin-top: 12px;
  padding-top: 12px;
  border-top: 1px solid #E3E3E3;
  overflow: hidden;
  display: -webkit-box;
  -webkit-line-clamp: 3;
  -webkit-box-orient: vertical;
}

.popover-title {
  background: transparent;
  font-weight: 600;
  padding: 0 !important;
  border: none;
}

.popover-content {
  padding: 15px 15px;
  font-size: 13px;
}

.popover {
  background: #fff !important;
  color: #2E2F34;
  border: none;
  margin-bottom: 10px;
}
.popover-header {
	padding: 0px !important;
}
.popover-title {
  background: #F7F7FC;
  font-weight: 600;
  padding: 15px 15px 11px;
  border: none;
}

/*popover arrows*/
.popover.top .arrow:after {
  border-top-color: #fff;
}

.popover.right .arrow:after {
  border-right-color: #fff;
}

.popover.bottom .arrow:after {
  border-bottom-color: #fff;
}

.popover.left .arrow:after {
  border-left-color: #fff;
}

.popover.bottom .arrow:after {
  border-bottom-color: #fff;
}
.fa-check-square-o:hover {
	cursor: pointer;
}
</style>
<div class="card">
	<div class="card-body">
		<div id="calendar"></div>
	</div>
</div>
<div class="row">
	<div class="col">
		<div class="card">
			<div class="card-body" id="empCategory">
				<p>개인 일정</p>
			</div>
		</div>
	</div>
	<div class="col">
		<div class="card">
			<div class="card-body" id="depCategory">
				<p>부서 일정</p>
			</div>
		</div>
	</div>
</div>
<select class="colorselector">
    
</select>
 
<script>
	var calendarList = []; // 일정이 저장될 공간
	document.addEventListener('DOMContentLoaded', function() {
	    var calendarEl = document.getElementById('calendar');

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
// 			events : calendarList,
			events : {
				url: "${cp}/getAllCalendarList"
			},
			eventRender: function(info) { // 일정 hover
				var event = info.event;
				var element = info.el;
				var view = info.view;
				$(element).popover({
					title: $('<div />', {
						'class': 'popoverTitleCalendar',
						'text': event.title
					}).css({
						'background': event.backgroundColor,
						'color': event.textColor
					}),
					content: $('<div />', {
						'class': 'popoverInfoCalendar'
			        }).append('<p><strong>카테고리:</strong> ' + event.extendedProps.category_nm + '</p>')
			          .append('<p><strong>등록자:</strong> ' + event.extendedProps.emp_nm + '</p>')
			          .append('<p><strong>시간:</strong> ' + getDisplayDate(event) + '</p>')
			          .append(getDisplayContent(event)),
			          delay: {
						show: "800",
						hide: "50"
			      	},
			      	trigger: 'hover',
			      	placement: 'top',
			      	html: true,
			      	container: 'body'
				});
			}
		});

	    calendar.render();
	});
	
	$(function() {
		// 모든 일정 불러오기
		$.getJSON("${cp}/getAllCalendarList").done(function(data) { calendarList = data.calendarList;  });
		console.log("calist:" + calendarList);
		
		// 개인 일정 불러오기
		$.getJSON("${cp}/getEmpCategoryList")
			.done(function(data) {
				getDisplayCategory(data.categoryList, $("#empCategory"));
			});
		
		// 부서 일정 불러오기
		$.getJSON("${cp}/getDepCategoryList")
			.done(function(data) {
				getDisplayCategory(data.categoryList, $("#depCategory"));
			});
		
		// 체크박스 클릭(체크된 상태)
		$(document).delegate(".fa.fa-check-square-o.fa-lg", "click", function(event) {
			console.log($(event.target).data("id"));
			$(event.target).attr("class", "fa fa-square-o fa-lg");
		});
		
		// 체크박스 클릭(체크풀린 상태)
		$(document).delegate(".fa.fa-square-o.fa-lg", "click", function(event) {
			console.log($(event.target).data("id"));
			$(event.target).attr("class", "fa fa-check-square-o fa-lg");
		});
		
// 		var calendar = new FullCalendar.Calendar($("#calendar"), {
// 			plugins : [ "dayGrid", "timeGrid", "list", "interaction" ],
// 			header : {
// 				left : "prev,next today",
// 				center : "title", 
// 				right : "dayGridMonth,timeGridWeek,timeGridDay,listWeek"
// 			},
// 			locale: 'ko',
// 			height: "auto",
// 			navLinks : true, // can click day/week names to navigate views
// 			editable : true,
// 			eventLimit : true, // allow "more" link when too many events
// // 			events : calendarList,
// 			events : {
// 				url: "${cp}/getAllCalendarList",
// 			},
// 			eventRender: function(info) { // 일정 hover
// 				var event = info.event;
// 				var element = info.el;
// 				var view = info.view;
// 				$(element).popover({
// 					title: $('<div />', {
// 						'class': 'popoverTitleCalendar',
// 						'text': event.title
// 					}).css({
// 						'background': event.backgroundColor,
// 						'color': event.textColor
// 					}),
// 					content: $('<div />', {
// 						'class': 'popoverInfoCalendar'
// 			        }).append('<p><strong>카테고리:</strong> ' + event.extendedProps.category_nm + '</p>')
// 			          .append('<p><strong>등록자:</strong> ' + event.extendedProps.emp_nm + '</p>')
// 			          .append('<p><strong>시간:</strong> ' + getDisplayDate(event) + '</p>')
// 			          .append(getDisplayContent(event)),
// 			          delay: {
// 						show: "800",
// 						hide: "50"
// 			      	},
// 			      	trigger: 'hover',
// 			      	placement: 'top',
// 			      	html: true,
// 			      	container: 'body'
// 				});
// 			}
// 		});
		
// 		calendar.render();
	});
	
	function getDisplayCategory(data, loc) {
		$.each(data, function(index, entry) {
// 			loc.append("<i class='fa fa-square-o fa-lg' style='color: " + entry.color + "'></i>");
			loc.append("<hr>");
			loc.append("<i class='fa fa-check-square-o fa-lg' style='color: " + entry.color + "; width: 20px;' data-id=" + entry.category_id + "></i>");
			loc.append("<span style='user-select:none;'> " + entry.category_nm + "</span>");
// 			loc.append("<p>ID: " + entry.category_id + "</p>");
// 			loc.append("<p>색상: <span style='background: " + entry.color + "; border-radius: 50%; width: 15px; height: 15px;'>　</span></p>");
// 			loc.append("<p>부서명: " + entry.depart_id + "</p>");
// 			loc.append("<p>등록자: " + entry.emp_id + "</p>");
		});
	}
	
	// 받아온 시간을 moment.js를 이용하여 포맷에 정의된 형태로 반환
	function getDisplayDate(event) {

		// 반환 될 데이터가 저장됨
		var displayEventDate;

		if(event.allDay == false) {
			var startDate = moment(event.start).format('HH:mm');
			var endDate = moment(event.end).format('HH:mm');
			if(event.end == null) 
				displayDate = startDate	
			else 
				displayDate = startDate + " - " + endDate;
			
		} else {
			displayDate = "하루 종일";
		}

		return displayDate;
	}
	
	function getDisplayContent(event) {
		var content = event.extendedProps.description;
		
		if(content != null) {
			return '<div class="popoverDescCalendar"><strong>설명:</strong> ' + content + '</div>';
		} else {
			return '';
		}
		
	}
	
    $('.colorselector').append('<option value="1" data-color="#000000" selected="selected">#000000</option>')
	   .append('<option value="2" data-color="#372A50">#372A50</option>')
	   .append('<option value="3" data-color="#C36A8A">#C36A8A</option>')
	   .append('<option value="4" data-color="#FC4BFC">#FC4BFC</option>')
	   .append('<option value="5" data-color="#8D5C83">#8D5C83</option>')
	   .append('<option value="6" data-color="#9ACDEC">#9ACDEC</option>')
	   .append('<option value="7" data-color="#00C0EF">#00C0EF</option>')
	   .append('<option value="8" data-color="#0D9A00">#0D9A00</option>')
	   .append('<option value="9" data-color="#00EFA7">#00EFA7</option>')
	   .append('<option value="10" data-color="#FFBF00">#FFBF00</option>')
	   .append('<option value="11" data-color="#CDA85C">#CDA85C</option>')
	   .append('<option value="12" data-color="#FFF800">#FFF800</option>')
	   .append('<option value="13" data-color="#FF7F50">#FF7F50</option>')
	   .append('<option value="14" data-color="#FB2E01">#FB2E01</option>')
	   .append('<option value="15" data-color="#C80141">#C80141</option>')
	$('.colorselector').colorselector();
	
// 	function filtering(event) {
// 		  var show_username = true;
// 		  var show_type = true;

// 		  var username = $('input:checkbox.filter:checked').map(function () {
// 		    return $(this).val();
// 		  }).get();
// 		  var types = $('#type_filter').val();

// 		  show_username = username.indexOf(event.username) >= 0;

// 		  if (types && types.length > 0) {
// 		    if (types[0] == "all") {
// 		      show_type = true;
// 		    } else {
// 		      show_type = types.indexOf(event.type) >= 0;
// 		    }
// 		  }

// 		  return show_username && show_type;
// 	}
	
</script>