$(function() {
	$("#insertProject").on("click", function() {
		// 정규식 검사
		if($("#pro_nm").val().trim() === "") {  // 일정 제목
			Swal({
				title: '프로젝트명을 입력하세요.',
				type: 'error',
				timer: 1500,
				showConfirmButton: false,
			});
			return; 
		}
		if(picker._endpicker.getDate() === null) { // 종료시간
			Swal({
				title: '종료시간을 선택하세요.',
				type: 'error',
				timer: 1500,
				showConfirmButton: false,
			});
			return; 
		}
		if($("select[name=leader]").val() === null) { // 종료시간
			Swal({
				title: '팀장을 선택하세요.',
				type: 'error',
				timer: 1500,
				showConfirmButton: false,
			});
			return; 
		}
		if($("select[name=member]").val() == "") { // 종료시간
			Swal({
				title: '팀원을 선택하세요.',
				type: 'error',
				timer: 1500,
				showConfirmButton: false,
			});
			return; 
		}
		
		var startDate = picker._startpicker.getDate();
		var endDate = picker._endpicker.getDate();
		var start = new Date(moment(startDate).format('YYYY-MM-DD 00:00'));
		var end = new Date(moment(endDate).format('YYYY-MM-DD 23:59'));
		$.ajax({
			url: cp + "/insertProject",
			type: "POST",
			data: $("#projectForm").serialize() + "&start=" + (+start) + "&end=" + (+end),
			success: function() {
				console.log("성공");
			}, error: function() {
				console.log("실패");
			}
		});
	});
	$("#updateProject").on("click", function() {
		
	});
	$("#deleteProject").on("click", function() {
		
	});
	
});