$(function() {
	console.log(emp_id);
	// 지난 프로젝트 리스트
	$.ajax({
		url: cp + "/getAllPastProject",
		type: "POST",
		data: "emp_id=" + emp_id,
		success: function(datas) {
			$.each(datas, function(idx, data) {
				console.log(data);
			})
		}
	});
	
	// 진행중인 프로젝트 리스트
	$.ajax({
		url: cp + "/getAllRunningProject",
		type: "POST",
		data: "emp_id=" + emp_id,
		success: function(datas) {
			$.each(datas, function(idx, data) {
				console.log(data);
			})
		}
	});
});