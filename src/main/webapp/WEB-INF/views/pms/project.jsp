<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script src="${cp }/plugin/dhtmlxgantt/dhtmlxgantt.js"></script>
<script src="${cp }/plugin/dhtmlxgantt/locale_kr.js"></script>
<script src="${cp }/plugin/dhtmlxgantt/dhtmlxgantt_marker.js"></script>
<link href= "${cp }/plugin/dhtmlxgantt/dhtmlxgantt.css" rel="stylesheet"/>

<style>
.weekend{
			background: #F0DFE5 !important;
		}
</style>

<div class="card">
	<div class="card-body">
		<div id="gantt_here" style='width:100%; height:100vh;'></div>
	</div>
</div>

<script>
	var cp = "${cp}";
	var pro_id = "${pro_id}"
</script>

<script>
function getAllGantt(pro_id) {
	$.ajax({
		url : cp + "/getAllGantt",
		type : "get",
		async: false,
		data : "pro_id=" + pro_id,
		dataType : "JSON",
		success: function(datas) {
			var rtnData = [];
			$.each(datas.taskList, function(idx, value) {
				var taskColor;
				if(value.PER !== 100 && value.END_DT < new Date()) { // 지연
					taskColor = "#ff5e5e"; // red
				} else if(value.PER === 100 && value.END_DT < new Date()) { // 완료
					taskColor = "#6fd96f"; // green
				} else if(value.ST_DT > new Date()) { // 시작전
					taskColor = "#b6b8ba"; // gray
				} else { // 진행중
					taskColor = "#4d7cff"; // blue
				}
				if(value.PA_TASK_ID == null) {
					taskColor = "black";
				}
				rtnData.push({
					id: value.TASK_ID,
					text: value.TASK_CONT,
					start_date: new Date(value.ST_DT),
					end_date: new Date(value.END_DT),
					parent: value.PA_TASK_ID,
					progress: value.PER / 100,
					color: taskColor,
					open: true
				});
			});
			var a = [];
			a.push({data: rtnData});
			gantt.parse(a[0]);
		}
	})
}

var weekScaleTemplate = function (date) {
	var dateToStr = gantt.date.date_to_str("%d %M");
	var endDate = gantt.date.add(gantt.date.add(date, 1, "week"), -1, "day");
	return dateToStr(date) + " - " + dateToStr(endDate);
};

var daysStyle = function(date){
	var dateToStr = gantt.date.date_to_str("%D");
	if (dateToStr(date) == "Sun"||dateToStr(date) == "Sat")  return "weekend";
	return "";
};
gantt.config.min_column_width = 50;
gantt.config.scale_height = 60;

var date_to_str = gantt.date.date_to_str(gantt.config.task_date);
var today = new Date(moment(new Date()).format("YYYY,MM,DD"));
gantt.addMarker({
	start_date: today,
	css: "today",
	text: "Today",
	title: "Today: " + date_to_str(today)
});

var start = new Date(moment(new Date()).subtract(7, 'day').format("YYYY,MM,DD"));
gantt.addMarker({
	start_date: start,
	css: "status_line",
	text: "Start project",
	title: "Start project: " + date_to_str(start)
});

gantt.config.scales = [
	{unit: "month", step: 1, format: "%Y년 %F"},
	{unit: "day", step:1, format: "%j", css:daysStyle },
	{unit: "day", step:1, format: "%D", css:daysStyle }
];
gantt.config.date_format = "%Y-%m-%d %H:%i";
gantt.config.columns = [
	{name: "wbs", label: "WBS", width: 40, template: gantt.getWBSCode},
	{name: "text", tree: true, width: 170},
	{name: "start_date", align: "center", width: 90},
	{name: "end_date", align: "center", width: 90},
	{name: "add", width: 40}
];
gantt.init("gantt_here");
getAllGantt(pro_id);
</script>
