$(function() {
	$("#insertProject").on("click", function() {
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