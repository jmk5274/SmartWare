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
		if(picker._endpicker.getDate() === null) { // 종료시간
			Swal({
				title: '종료시간을 선택하세요.',
				type: 'error',
				timer: 1500,
				showConfirmButton: false,
			});
			return null; 
		}
		
		var startDate = picker._startpicker.getDate();
		var endDate = picker._endpicker.getDate();
		
		$("")
		
		$.ajax({
			url: cp + "/insertCalendar",
			type: "POST",
			data: $("#calendarForm").serialize() + "&start=" + (+startDate) + "&end=" + (+endDate),
			success: function(data) {
				$("#calendarModal").modal("hide");
				Swal({
					title: '생성되었습니다.',
					type: 'success',
					timer: 1500,
					showConfirmButton: false,
				});
				
				// 캘린더 업데이트
				calendar.prev();
				calendar.next();
			}
		});
	});
	
	// 일정 UPDATE
	$("#btnUpdateCalendar").on("click", function() {
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
		if(picker._endpicker.getDate() === null) { // 종료시간
			Swal({
				title: '종료시간을 선택하세요.',
				type: 'error',
				timer: 1500,
				showConfirmButton: false,
			});
			return null; 
		}
		
		var startDate = picker._startpicker.getDate();
		var endDate = picker._endpicker.getDate();
		
		$("#calendarModal input[name=depart_id]").val("${S_EMPLOYEE.depart_id }");
		$("#calendarModal input[name=emp_id]").val("${S_EMPLOYEE.emp_id }");
		
		$.ajax({
			url: cp + "/updateCalendar",
			type: "POST",
			data: $("#calendarForm").serialize() + "&start=" + (+startDate) + "&end=" + (+endDate),
			success: function(data) {
				$("#calendarModal").modal("hide");
				
				Swal({
					title: '수정되었습니다.',
					type: 'success',
					timer: 1500,
					showConfirmButton: false,
				});
				
				// 캘린더 업데이트
				calendar.prev();
				calendar.next();
			}
		});
	});
	
	// 일정 DELETE
	$("#btnDeleteCalendar").on("click", function() {
		Swal({
			title: '정말 삭제하시겠습니까?',
//			html: "<span class='text-danger'>\"" + category_nm + "\"</span> 카테고리와 해당 카테고리의 일정이 삭제됩니다.",
			type: 'warning',
			showCancelButton: true,
			focusConfirm: false,
			confirmButtonColor: '#3085d6',
			cancelButtonColor: '#d33',
			confirmButtonText: '네',
			cancelButtonText: '아니오'
		}).then(function(result) {
			if (result.value) {
				$.ajax({
					url: cp + "/deleteCalendar",
					data: "cal_id=" + $("#cal_id").val(),
					type: "post",
					success: function(data) {
						$("#calendarModal").modal("hide");
						
						Swal({
							title: '삭제되었습니다.',
							type: 'success',
							timer: 1500,
							showConfirmButton: false,
						});
						
						calendar.prev();
						calendar.next();
					}
				});
			}
		});
	});
});

// 달력의 날짜를 선택했을 때 일정 추가 모달 출력
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
			res += "<option value='" + data.category_id + "'>" + data.category_nm + "</option>";
		}); 
		res += "</optgroup>";
		$("#categoryList").append(res);
	});
	
	$.getJSON(cp + "/getDepCategoryList").done(function(datas) { // 부서 일정
		var res = "<optgroup label='<부서 일정>'>";
		$.each(datas.categoryList, function(idx, data) {
			res += "<option value='" + data.category_id + "'>" + data.category_nm + "</option>";
		}); 
		res += "</optgroup>";
		$("#categoryList").append(res);
	});
	
	// 일정 내용 초기화
	$("#cal_cont").val("");
	
	// 버튼 초기화
	$("#btnInsertCalendar").show();
	$("#btnDeleteCalendar").hide();
	$("#btnUpdateCalendar").hide();
	
	// 모달 실행
	$("#calendarModal").modal("show");
}

// 달력의 일정을 클릭했을 때 일정 수정 모달 출력
var selectEvent = function(info) {
	// 모달 셋팅 변경
	$("#calendarModalTitle").html("<i class='fa fa-calendar-check-o fa-lg' style='color: black;'> </i> 일정 수정");

	// 일정 아이디 초기화(hidden 요소)
	$("#cal_id").val(info.event.id);
	
	// 일정 제목 초기화
	$("#cal_title").val(info.event.title);
	
	// 날짜 초기화
	var startDate = moment(info.event.start).format("YYYY-MM-DD HH:mm"); 					// fullcalendar에서 선택한 시작 시간
	var endDate = moment(info.event.end).subtract(1, 'second').format("YYYY-MM-DD HH:mm");// fullcalendar에서 선택한 종료 시간
	
	picker.setStartDate(new Date(startDate)); 	// date picker start date에 선택한 시간을 입력
	picker.setEndDate(new Date(endDate));		// date picker end date에 선택한 시간을 입력
	
	// 하루 종일 초기화
	$("#allDay").prop("checked", info.event.allDay);
	changeAllDay();
	
	// 카테고리 초기화
	$("#categoryList").empty();
	$.getJSON(cp + "/getEmpCategoryList").done(function(datas) { // 개인 일정
		var res = "<option value='' selected disabled hidden>==선택하세요==</option>";
		res += "<optgroup label='<개인 일정>'>";
		$.each(datas.categoryList, function(idx, data) {
			if(data.category_id === info.event.extendedProps.category_id) 
				res += "<option selected ";
			else 
				res += "<option ";
			res += "value='" + data.category_id + "'>" + data.category_nm + "</option>";
		}); 
		res += "</optgroup>";
		$("#categoryList").append(res);
	});
	
	$.getJSON(cp + "/getDepCategoryList").done(function(datas) { // 부서 일정
		var res = "<optgroup label='<부서 일정>'>";
		$.each(datas.categoryList, function(idx, data) {
			if(data.category_id === info.event.extendedProps.category_id) 
				res += "<option selected ";
			else 
				res += "<option ";
			res += "value='" + data.category_id + "'>" + data.category_nm + "</option>";
		}); 
		res += "</optgroup>";
		$("#categoryList").append(res);
	});
	
	
	// 일정 내용 초기화
	$("#cal_cont").val(info.event.extendedProps.description);
	
	// 버튼 초기화
	$("#btnInsertCalendar").hide();
	$("#btnDeleteCalendar").show();
	$("#btnUpdateCalendar").show();
	
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