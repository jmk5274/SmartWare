<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="${cp }/plugin/dhtmlxgantt/dhtmlxgantt.js"></script>
<script src="${cp }/plugin/dhtmlxgantt/locale_kr.js"></script>
<script src="${cp }/plugin/dhtmlxgantt/dhtmlxgantt_marker.js"></script>
<link href= "${cp }/plugin/dhtmlxgantt/dhtmlxgantt.css" rel="stylesheet"/>
<link href= "${cp }/plugin/dhtmlxgantt/dhtmlxgantt_broadway.css" rel="stylesheet"/>

<style>
.weekend {
	background: #f4f7f4 !important;
}

.gantt_selected .weekend {
	background: #FFF3A1 !important;
}
</style>

<div class="card">
	<div class="card-body">
		<div id="ganttController" style="border: 1px solid black;">
			<button type="button" class="btn mb-1 btn-outline-dark" onclick="gantt.collapseAll()"><i class="fa fa-angle-up"></i>접기</button>
			<button type="button" class="btn mb-1 btn-outline-dark" onclick="gantt.expandAll()"><i class="fa fa-angle-down"></i>펼치기</button>
			<button type="button" class="">export</button>
			<button type="button" class="">zoom in</button>
			<button type="button" class="">zoom out</button>
			<button type="button" class="">zoom to fit</button>
			<button type="button" class="">fullscreen</button>
			<select id="empFilter">
				<option>전체</option>
				<c:forEach items="${employeeList }" var="employee">
					<option value="${employee.emp_id }">${employee.emp_nm }</option>
				</c:forEach>
			</select>
			<select id="statusFilter">
				<option>전체</option>
				<option value="complete">완료된 업무</option>
				<option value="running">진행중인 업무</option>
				<option value="delay">지연된 업무</option>
				<option value="before">시작전 업무</option>
			</select>
			<button type="button" onclick="filtering()">적용</button>
		</div>
		<br>
		<div id="gantt_here" style='width:100%; height:90vh;'></div>
	</div>
</div>

<script>
	var cp = "${cp}";
	var pro_id = "${pro_id}"
</script>

<script>
function filtering() {
	gantt.refreshData();
	gantt.collapseAll();
	gantt.expandAll();
}
$(function() {
	
});
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
// 					taskColor = "black";
				}
				rtnData.push({
					id: value.TASK_ID,
					text: value.TASK_CONT,
					start_date: new Date(value.ST_DT),
					end_date: new Date(value.END_DT),
					parent: value.PA_TASK_ID,
					progress: value.PER / 100,
					emp_id: value.EMP_ID,
					emp_nm: value.EMP_NM,
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

var daysStyle = function(date){
	var dateToStr = gantt.date.date_to_str("%D");
	if (dateToStr(date) == "일")  return "weekend";
	return "";
};
gantt.templates.timeline_cell_class = function (item, date) {
	if (date.getDay() == 0) {
		return "weekend";
	}
};

gantt.attachEvent("onBeforeTaskDisplay", function(id, task){
	var empFilterValue = $("#empFilter").val();
	var statusFilterValue = $("#statusFilter").val();
	// 담당자 비교
    if ( !(empFilterValue === task.emp_id || empFilterValue === "전체") ){
        return false;
    } 

	// 상태 비교
	if(statusFilterValue === "complete") {
		if(task.progress === 1) return true;
		return false;
	} else if (statusFilterValue === "running") {
		if(task.start_date < new Date() && task.end_date > new Date() && task.progress !== 1) return true;
		return false;
	} else if (statusFilterValue === "delay") {
		if(task.end_date < new Date() && task.progress !== 1) return true;
		return false;
	} else if (statusFilterValue === "before") {
		if(task.start_date > new Date()) return true;
		return false;
	} else { // 전체인 경우
		return true;
	}
});

var date_to_str = gantt.date.date_to_str(gantt.config.task_date);

gantt.collapseAll = function(){
	gantt.eachTask(function(task){
		task.$open = false;
	});
	gantt.render();
}

gantt.expandAll = function(){
	gantt.eachTask(function(task){
		task.$open = true;
	});
	gantt.render();
}
	
var today = new Date(moment(new Date()).format("YYYY,MM,DD"));
gantt.addMarker({
	start_date: today,
	css: "today",
	text: "Today",
	title: "Today: " + moment(today).format("YYYY-MM-DD")
});

gantt.config.scales = [
	{unit: "month", step: 1, format: "%Y년 %F"},
	{unit: "day", step:1, format: "%j", css:daysStyle },
	{unit: "day", step:1, format: "%D", css:daysStyle }
];
gantt.config.date_format = "%Y-%m-%d %H:%i";
gantt.config.columns = [
// 	{name: "wbs", label: "WBS", width: 40, template: gantt.getWBSCode},
	{name: "text", tree: true, width: 300},
	{name: "start_date", align: "center", width: 90},
	{name: "end_date", align: "center", width: 90},
	{name: "add", width: 40}
];
gantt.init("gantt_here");
getAllGantt(pro_id);
</script>
