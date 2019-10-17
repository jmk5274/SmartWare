$(function() {
	// 하루 종일 버튼을 클릭했을 때
	$("#allDay").on("click", changeAllDay);
	
	// 일정 INSERT
	$("#btnInsertCalendar").on("click", function() {
		// 정규식 검사
		if($("#cal_title").val().trim() === "") {  // 일정 제목
			Swal({
				title: '일정 제목을 입력하세요.',
				type: 'error',
				timer: 1500,
				showConfirmButton: false,
			});
			return null; 
		}
		if($("#categoryList").val() === null) { // 카테고리
			Swal({
				title: '카테고리를 선택하세요.',
				type: 'error',
				timer: 1500,
				showConfirmButton: false,
			});
			return null; 
		}
		
		console.log($("#calendarForm").serialize());
		var startDate = picker._startpicker.getDate();
		var endDate = picker._endpicker.getDate();
		
		$.ajax({
			url: cp + "/insertCalendar",
			type: "POST",
			data: $("#calendarForm").serialize() + "&start=" + (+startDate) + "&end=" + (+endDate),
			success: function() {
			}
		});
	});
});

// 달력의 날짜를 선택했을 때 일정추가 모달 출력
var selectDate = function(info) {
	// 모달 셋팅 변경
	$("#calendarModalTitle").html("<i class='fa fa-calendar-check-o fa-lg' style='color: black;'> </i> 일정 추가");

	// 일정 제목 초기화
	$("#cal_title").val("");
	
	// 날짜 초기화
	var startDate = moment(info.start).format("YYYY-MM-DD HH:mm"); 					// fullcalendar에서 선택한 시작 시간
	var endDate = moment(info.end).subtract(1, 'second').format("YYYY-MM-DD HH:mm");// fullcalendar에서 선택한 종료 시간
	
	picker.setStartDate(new Date(startDate)); 	// date picker start date에 선택한 시간을 입력
	picker.setEndDate(new Date(endDate));		// date picker end date에 선택한 시간을 입력
	
	// 하루 종일 초기화
	$("#allDay").prop("checked", false);
	changeAllDay();
	
	// 카테고리 초기화
	$("#categoryList").empty();
	$.getJSON(cp + "/getEmpCategoryList").done(function(datas) { // 개인 일정
		var res = "<option value='' selected disabled hidden>==선택하세요==</option>";
		res += "<optgroup label='<개인 일정>'>";
		$.each(datas.categoryList, function(idx, data) {
			res += "<option data-category_id='" + data.category_id + "'>" + data.category_nm + "</option>";
		}); 
		res += "</optgroup>";
		$("#categoryList").append(res);
	});
	
	$.getJSON(cp + "/getDepCategoryList").done(function(datas) { // 부서 일정
		var res = "<optgroup label='<부서 일정>'>";
		$.each(datas.categoryList, function(idx, data) {
			res += "<option data-category_id='" + data.category_id + "'>" + data.category_nm + "</option>";
		}); 
		res += "</optgroup>";
		$("#categoryList").append(res);
	});
	
	// 일정 내용 초기화
	$("#cal_cont").val("");
	
	// 버튼 초기화
	$("#btnUpdateCalendar").hide();
	
	// 모달 실행
	$("#calendarModal").modal("show");
}

// 하루 종일 체크박스의 상태에 따라 데이트 피커 포맷 변경
var changeAllDay = function() {
	if($("#allDay").prop("checked")) {
		// 시작날짜와 종료날짜에 시간:분을 제거
		picker._startpicker.setDateFormat("yyyy-MM-dd");
		picker._endpicker.setDateFormat("yyyy-MM-dd");
		// 타임피커 숨기기
		$(picker._startpicker._timePicker._container).hide();
		$(picker._endpicker._timePicker._container).hide();
	} else {
		// 시작날짜와 종료날짜에 시간:분을 추가
		picker._startpicker.setDateFormat("yyyy-MM-dd HH:mm");
		picker._endpicker.setDateFormat("yyyy-MM-dd HH:mm");
		// 타임피커 보이기
		$(picker._startpicker._timePicker._container).show();
		$(picker._endpicker._timePicker._container).show();
	}
}