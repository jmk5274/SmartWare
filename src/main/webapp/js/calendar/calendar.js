$(function() {
	// 하루 종일 버튼을 클릭했을 때
	$("#allDay").on("click", function() {
		if(this.checked) {
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
	});
});

var selectDate = function(info) {
	// 모달 셋팅 변경
	$("#calendarModalTitle").html("<i class='fa fa-calendar-check-o fa-lg' style='color: black;'> </i> 일정 추가");
	
	// fullcalendar에서 선택한 시간
	var startDate = moment(info.start).format("YYYY-MM-DD HH:mm");
	var endDate = moment(info.end).subtract(1, 'second').format("YYYY-MM-DD HH:mm");
	
	// date picker에 선택한 시간을 입력
	picker.setStartDate(new Date(startDate));
	picker.setEndDate(new Date(endDate));
	
	// 모달 실행
	$("#calendarModal").modal("show");
}