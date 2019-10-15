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

.categoryList, #addEmpCategory, #addDepCategory, 
#empCategoryOn, #empCategoryOff, #depCategoryOn, #depCategoryOff {
	cursor: pointer;
}

.filter > h3 {
	display: inline;
}

.filter .categoryAll {
	float: right;
	margin-left: 10px;
}

.col-sm-3.col-form-label {
	text-align: right;
}

.form-group.row {
	align-items: center;
}

.btn-colorselector {
	width: 50px;
	height: 35px;
}

.btnCateModify {
	background: none;
	border: none;
	float: right;
	vertical-align: middle;
	text-align: center;
	width: 40px;
	cursor: pointer;
 	visibility: hidden;
}

button:focus {
	outline: 0;
}

</style>


<div class="card">
	<div class="card-body">
		<div id="calendar"></div>
	</div>
</div>
<div class="row" style='user-select:none;'>
	<div class="col">
		<div class="card">
			<div class="card-body filter" id="empCategory">
				<i class="fa fa-calendar-check-o fa-2x" style="color: black;"> </i>
				<h3>개인 일정</h3>
				<span id="empCategoryOff" class="categoryAll">전체 해제</span>
				<span class="categoryAll"> / </span>
				<span id="empCategoryOn" class="categoryAll">전체 선택</span>
			</div>
		</div>
	</div>
	<div class="col">
		<div class="card">
			<div class="card-body filter" id="depCategory">
				<i class="fa fa-calendar-check-o fa-2x" style="color: black;"> </i>
				<h3>부서 일정(${depart_nm })</h3>
				<span id="depCategoryOff" class="categoryAll">전체 해제</span>
				<span class="categoryAll"> / </span>
				<span id="depCategoryOn" class="categoryAll">전체 선택</span>
			</div>
		</div>
	</div>
</div>

<!-- Modal -->
<div class="bootstrap-modal">
    <div class="modal fade" id="categoryModal">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h3 class="modal-title" id="addCategoryTitle">카테고리 생성</h3>
                </div>
                <div class="modal-body basic-form">
                	<form id="insertCategory">
                		<div class="form-group row">
		                    <label class="col-sm-3 col-form-label">카테고리 이름</label>
		                    <div class="col-sm-9">
		                    	<input type="text" class="form-control" name="category_nm" id="category_nm">
		                    </div>
	                    </div>
	                    <div class="form-group row">
		                    <label class="col-sm-3 col-form-label">카테고리 색상</label>
		                    <div class="col-sm-9">
		                    	<select class="colorselector" name="color" id="color"></select>
		                    </div>
	                    </div>
	                    <div class="form-group row" id="divDepartmentNm">
		                    <label class="col-sm-3 col-form-label">부서명</label>
		                    <div class="col-sm-9">
		                    	<input type="hidden" id="depart_id" name="depart_id" value="${S_EMPLOYEE.depart_id }">
		                    	<input type="text" class="form-control" value="${depart_nm }" readonly>
		                    </div>
	                    </div>
	                    <div class="form-group row">
		                    <label class="col-sm-3 col-form-label">생성자</label>
		                    <div class="col-sm-9">
		                    	<input type="hidden" name="emp_id" value="${S_EMPLOYEE.emp_id }">
		                    	<input type="text" class="form-control" value="${S_EMPLOYEE.emp_nm }" readonly>
		                    </div>
	                    </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
                    <button type="button" class="btn btn-primary" id="btnInsertCategory">생성</button>
                </div>
            </div>
        </div>
    </div>
</div>


 
<script>
	var calendar;
	var calendarList = []; // 일정이 저장될 공간
	
	document.addEventListener('DOMContentLoaded', function() {
		var calendarEl = document.getElementById('calendar');
	    calendar = new FullCalendar.Calendar(calendarEl, {
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
			eventSources: [{ // 이벤트(일정) 추가
				events: function(info, successCallback, failureCallback) {
					$.ajax({
						url: "${cp}/getAllCalendarList",
						type: "GET",
						dataType: "json",
						success: function(data) {
							successCallback(data.calendarList);
						}
					});
				}
			}],
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
						show: "300",
						hide: "50"
			      	},
			      	trigger: 'hover',
			      	placement: 'top',
			      	html: true,
			      	container: 'body'
				});
				return filtering(event);
			}
	    });
	    calendar.render();
	});
	
	$(function() {
		// 개인 일정 카테고리 불러오기
		$.getJSON("${cp}/getEmpCategoryList")
			.done(function(data) {
				getDisplayCategory(data.categoryList, $("#empCategory"));
			});
		
		// 부서 일정 카테고리 불러오기
		$.getJSON("${cp}/getDepCategoryList")
			.done(function(data) {
				getDisplayCategory(data.categoryList, $("#depCategory"));
			});
		
		// 카테고리 체크박스 클릭
		$(document).delegate(".categoryList", "click", function() {
			var iTag = $(this).children("i");
			
			if(iTag.hasClass("on")) { // 체크되어 있을 때
				$(this).children("i").removeClass("fa-check-square-o on");
				$(this).children("i").addClass("fa-square-o off");	
			} else if(iTag.hasClass("off")) { // 체크되지 않았을 때
				$(this).children("i").removeClass("fa-square-o off");
				$(this).children("i").addClass("fa-check-square-o on");
			}
			
			calendar.rerenderEvents();
		});
		
		// 카테고리 체크박스 전체 선택
		$(".categoryAll").on("click", function() {
			var selectedId = $(this).attr("id")
			
			if(selectedId === "empCategoryOn") {			// 개인 일정 전체 선택
				$("#empCategory div.categoryList > i").addClass("fa-check-square-o on");
				$("#empCategory div.categoryList > i").removeClass("fa-square-o off");
			} else if(selectedId  === "empCategoryOff") {	// 개인 일정 전체 해제
				$("#empCategory div.categoryList > i").addClass("fa-square-o off");
				$("#empCategory div.categoryList > i").removeClass("fa-check-square-o on");
			} else if(selectedId  === "depCategoryOn") {		// 부서 일정 전체 선택
				$("#depCategory div.categoryList > i").addClass("fa-check-square-o on");
				$("#depCategory div.categoryList > i").removeClass("fa-square-o off");
			} else if(selectedId  === "depCategoryOff") {	// 부서 일정 전체 해제
				$("#depCategory div.categoryList > i").addClass("fa-square-o off");
				$("#depCategory div.categoryList > i").removeClass("fa-check-square-o on");
			}
			
			calendar.rerenderEvents();
		});
		
		// 카테고리를 호버할 때 delete, modify 버튼 보이기/숨기기
		$(document).on("mouseenter", ".categoryList", function() {
			$(".btnCateModify", this).css("visibility", "visible");
		}).on("mouseleave", ".categoryList", function() {
			$(".btnCateModify", this).css("visibility", "hidden");
		});
		
		// 카테고리 delete button
		$("body").on("click", ".btnCateDelete", function(event) {
			alert("delete");
			event.stopPropagation();
		});
		
		// 카테고리 update button
		$("body").on("click", ".btnCateUpdate", function(event) {
			alert("update");
			event.stopPropagation();
		});
		
		// 카테고리 add button(개인 일정)
		$("body").on("click", "#addEmpCategory", function() {
			$("#addCategoryTitle").html("<i class='fa fa-calendar-check-o fa-lg' style='color: black;'> </i> 카테고리 추가 - 개인 일정");
			$("#category_nm").val("");
			$("#depart_id").val("");
			$("#divDepartmentNm").hide();
		});
		
		// 카테고리 add button(부서 일정)
		$("body").on("click", "#addDepCategory", function() {
			$("#addCategoryTitle").html("<i class='fa fa-calendar-check-o fa-lg' style='color: black;'> </i> 카테고리 추가 - 부서 일정");
			$("#category_nm").val("");
			$("#depart_id").val("${S_EMPLOYEE.depart_id }");
			$("#divDepartmentNm").show();
		});
		
		$("#btnInsertCategory").on("click", function() {
			if($("#category_nm").val().trim() === "") {
				alert("카테고리 이름을 입력하세요.");
				return;				
			} 
			$.ajax({
				url: "${cp}/insertCategory",
				data: $("#insertCategory").serializeArray(),
				type: "post",
				success: function(data) {
					res = "<hr>";
					res += "<div id=" + data.category_id + " class='categoryList'>"
					res += "<i class='fa fa-lg fa-check-square-o on' style='color: " + $("#color").val() + "; width: 20px;'></i>";
					res += "<span> " + $("#category_nm").val() + "</span>";
					res += "<button class='btnCateModify btnCateUpdate'>"
					res += "<i class='fa fa-lg fa-wrench cateModify'></i>";
					res += "</button>";
					res += "<button class='btnCateModify btnCateDelete'>"
					res += "<i class='fa fa-lg fa-times'></i>";
					res += "</button>";
					res += "</div>";
					
					if($("#depart_id").val() === "") {
						$("#addEmpCategory").prev().before(res);
					} else {
						$("#addDepCategory").prev().before(res);
					}
					
					$("#categoryModal").modal("hide");
				}
			});
		});
	});
	
	function getDisplayCategory(data, loc) {
		var res = "";
		
		// 카테고리 리스트 출력
		$.each(data, function(index, entry) {
			res += "<hr>";
			res += "<div id=" + entry.category_id + " class='categoryList'>"
			res += "<i class='fa fa-lg fa-check-square-o on' style='color: " + entry.color + "; width: 20px;'></i>";
			res += "<span> " + entry.category_nm + "</span>";
			res += "<button class='btnCateModify btnCateUpdate'>"
			res += "<i class='fa fa-lg fa-wrench cateModify'></i>";
			res += "</button>";
			res += "<button class='btnCateModify btnCateDelete'>"
			res += "<i class='fa fa-lg fa-times'></i>";
			res += "</button>";
			res += "</div>";
		});
		// 카테고리 추가 버튼 출력
		res += "<hr>";
		if(loc.attr("id") === "empCategory")
			res += "<span id='addEmpCategory'>";
		else if(loc.attr("id") === "depCategory")
			res += "<span id='addDepCategory'>";
		res += "<i class='fa fa-lg fa-plus-circle' style='width: 20px;'></i>";
		res += "<span data-toggle='modal' data-target='#categoryModal'> 새로운 카테고리</span>";
		// 위에서 저장한 HTML태그를 document에 출력
		loc.append(res);
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
	
    $('.colorselector').append('<option value="#000000" data-color="#000000" selected="selected">#000000</option>')
					   .append('<option value="#372A50" data-color="#372A50">#372A50</option>')
					   .append('<option value="#C36A8A" data-color="#C36A8A">#C36A8A</option>')
					   .append('<option value="#FC4BFC" data-color="#FC4BFC">#FC4BFC</option>')
					   .append('<option value="#8D5C83" data-color="#8D5C83">#8D5C83</option>')
					   .append('<option value="#9ACDEC" data-color="#9ACDEC">#9ACDEC</option>')
					   .append('<option value="#00C0EF" data-color="#00C0EF">#00C0EF</option>')
					   .append('<option value="#0D9A00" data-color="#0D9A00">#0D9A00</option>')
					   .append('<option value="#00EFA7" data-color="#00EFA7">#00EFA7</option>')
					   .append('<option value="#FFBF00" data-color="#FFBF00">#FFBF00</option>')
					   .append('<option value="#CDA85C" data-color="#CDA85C">#CDA85C</option>')
					   .append('<option value="#FFF800" data-color="#FFF800">#FFF800</option>')
					   .append('<option value="#FF7F50" data-color="#FF7F50">#FF7F50</option>')
					   .append('<option value="#FB2E01" data-color="#FB2E01">#FB2E01</option>')
					   .append('<option value="#C80141" data-color="#C80141">#C80141</option>')
					   .colorselector();
	
	function filtering(event) {
		// 선택되어 있는 필터의 카테고리아이디들을 맵객체로 저장
		var checkedCategory = $(".on").map(function () {
			return $(this).parent().attr("id");
		}).get();
		
		// 맵객체에서 이벤트의 카테고리아이디가 일치하는지를 반환
		return checkedCategory.indexOf(event.extendedProps.category_id) >= 0;
	}
	
</script>