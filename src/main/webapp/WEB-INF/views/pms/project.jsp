<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="${cp }/plugin/dhtmlxgantt/dhtmlxgantt.js"></script>
<script src="${cp }/plugin/dhtmlxgantt/locale_kr.js"></script>
<script src="${cp }/plugin/dhtmlxgantt/dhtmlxgantt_marker.js"></script>
<script src="${cp }/plugin/dhtmlxgantt/dhtmlxgantt_api.js"></script>
<link href= "${cp }/plugin/dhtmlxgantt/dhtmlxgantt.css" rel="stylesheet"/>
<link href= "${cp }/plugin/dhtmlxgantt/dhtmlxgantt_broadway.css" rel="stylesheet"/>

<style>
/* weekend css */
.weekend {
	background: #f4f7f4 !important;
}
.gantt_selected .weekend {
	background: #FFF3A1 !important;
}

/* progress, drag */
.no_drag_progress .gantt_task_progress_drag{
	display:none !important;
}
</style>

<div class="card">
	<div class="card-body">
		<div id="ganttController" style="border: 1px solid black;">
			<button class="btn mb-1 btn-outline-dark" onclick="gantt.collapseAll()"><i class="fa fa-angle-up"></i>접기</button>
			<button class="btn mb-1 btn-outline-dark" onclick="gantt.expandAll()"><i class="fa fa-angle-down"></i>펼치기</button>
			<button class="btn mb-1 btn-outline-dark" onclick='gantt.exportToPDF()' style='margin-left:20px;'>Export to PDF</button>
			<button class="btn mb-1 btn-outline-dark" onclick='gantt.exportToPNG()' style='margin-left:20px;'>Export to PNG</button>
			<button class="btn mb-1 btn-outline-dark" onclick='gantt.exportToExcel()' style='margin-left:20px;'>Export to Excel</button>

			<button class="btn mb-1 btn-outline-dark" onclick="toggleMode(this)">Zoom to Fit</button>
			
			<select id="empFilter" class="form-control" style="width: 100px; display: inline;">
				<option>전체</option>
				<c:forEach items="${employeeList }" var="employee">
					<option value="${employee.emp_id }">${employee.emp_nm }</option>
				</c:forEach>
			</select>
			<select id="statusFilter" class="form-control" style="width: 100px; display: inline;">
				<option>전체</option>
				<option value="complete">완료된 업무</option>
				<option value="running">진행중인 업무</option>
				<option value="delay">지연된 업무</option>
				<option value="before">시작전 업무</option>
			</select>
			<button class="btn mb-1 btn-outline-dark" onclick="filtering()">적용</button>
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
// 필터링 적용
function filtering() {
	gantt.refreshData();
	gantt.collapseAll();
	gantt.expandAll();
}

// zoom to fit 시작
function toggleMode(toggle) {
	toggle.enabled = !toggle.enabled;
	if (toggle.enabled) {
		toggle.innerHTML = "Set default Scale";
		//Saving previous scale state for future restore
		saveConfig();
		zoomToFit();
	} else {

		toggle.innerHTML = "Zoom to Fit";
		//Restore previous scale state
		restoreConfig();
		gantt.render();
	}
}

var cachedSettings = {};

function saveConfig() {
	var config = gantt.config;
	cachedSettings = {};
	cachedSettings.scales = config.scales;
	cachedSettings.template = gantt.templates.date_scale;
	cachedSettings.start_date = config.start_date;
	cachedSettings.end_date = config.end_date;
}

function restoreConfig() {
	applyConfig(cachedSettings);
}

function applyConfig(config, dates) {
	if (config.scales[0].date) {
		gantt.templates.date_scale = null;
	}
	else {
		gantt.templates.date_scale = config.scales[0].template;
	}

	gantt.config.scales = config.scales;

	if (dates && dates.start_date && dates.start_date) {
		gantt.config.start_date = gantt.date.add(dates.start_date, -1, config.scales[0].subscale_unit);
		gantt.config.end_date = gantt.date.add(gantt.date[config.scales[0].subscale_unit + "_start"](dates.end_date), 2, config.scales[0].subscale_unit);
	} else {
		gantt.config.start_date = gantt.config.end_date = null;
	}
}


function zoomToFit() {
	var project = gantt.getSubtaskDates(),
		areaWidth = gantt.$task.offsetWidth;

	for (var i = 0; i < scaleConfigs.length; i++) {
		var columnCount = getUnitsBetween(project.start_date, project.end_date, scaleConfigs[i].scales[0].subscale_unit, scaleConfigs[i].scales[0].step);
		if ((columnCount + 2) * gantt.config.min_column_width <= areaWidth) {
			break;
		}
	}

	if (i == scaleConfigs.length) {
		i--;
	}

	applyConfig(scaleConfigs[i], project);
	gantt.render();
}

// get number of columns in timeline
function getUnitsBetween(from, to, unit, step) {
	var start = new Date(from),
		end = new Date(to);
	var units = 0;
	while (start.valueOf() < end.valueOf()) {
		units++;
		start = gantt.date.add(start, step, unit);
	}
	return units;
}

//Setting available scales
var scaleConfigs = [
	// minutes
	{
		scales: [
			{subscale_unit: "minute", unit: "hour", step: 1, format: "%H"},
			{unit: "minute", step: 1, format: "%H:%i"}
		]
	},
	// hours
	{
		scales: [
			{subscale_unit: "hour", unit: "day", step: 1, format: "%j %M"},
			{unit: "hour", step: 1, format: "%H:%i"}

		]
	},
	// days
	{
		scales: [
			{subscale_unit: "day", unit: "month", step: 1, format: "%F"},
			{unit: "day", step: 1, format: "%j"}
		]
	},
	// weeks
	{
		scales: [
			{subscale_unit: "week", unit: "month", step: 1, date: "%F"},
			{
				unit: "week", step: 1, template: function (date) {
					var dateToStr = gantt.date.date_to_str("%d %M");
					var endDate = gantt.date.add(gantt.date.add(date, 1, "week"), -1, "day");
					return dateToStr(date) + " - " + dateToStr(endDate);
				}
			}
		]
	},
	// months
	{
		scales: [
			{subscale_unit: "month", unit: "year", step: 1, format: "%Y"},
			{unit: "month", step: 1, format: "%M"}
		]
	},
	// quarters
	{
		scales: [
			{subscale_unit: "month", unit: "year", step: 3, format: "%Y"},
			{
				unit: "month", step: 3, template: function (date) {
					var dateToStr = gantt.date.date_to_str("%M");
					var endDate = gantt.date.add(gantt.date.add(date, 3, "month"), -1, "day");
					return dateToStr(date) + " - " + dateToStr(endDate);
				}
			}
		]
	},
	// years
	{
		scales: [
			{subscale_unit: "year", unit: "year", step: 1, date: "%Y"},
			{
				unit: "year", step: 5, template: function (date) {
					var dateToStr = gantt.date.date_to_str("%Y");
					var endDate = gantt.date.add(gantt.date.add(date, 5, "year"), -1, "day");
					return dateToStr(date) + " - " + dateToStr(endDate);
				}
			}
		]
	},
	// decades
	{
		scales: [
			{
				subscale_unit: "year", unit: "year", step: 10, template: function (date) {
					var dateToStr = gantt.date.date_to_str("%Y");
					var endDate = gantt.date.add(gantt.date.add(date, 10, "year"), -1, "day");
					return dateToStr(date) + " - " + dateToStr(endDate);
				}
			},
			{
				unit: "year", step: 100, template: function (date) {
					var dateToStr = gantt.date.date_to_str("%Y");
					var endDate = gantt.date.add(gantt.date.add(date, 100, "year"), -1, "day");
					return dateToStr(date) + " - " + dateToStr(endDate);
				}
			}
		]
	}
];
//zoom to fit 끝

// ajax
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
					type: gantt.config.types.project,
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
			console.log(a[0]);
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
gantt.config.show_progress = true;
var date_to_str = gantt.date.date_to_str(gantt.config.task_date);

gantt.attachEvent("onTemplatesReady", function () {
	var toggle = document.createElement("i");
	toggle.className = "fa fa-expand gantt-fullscreen";
	gantt.toggleIcon = toggle;
	gantt.$container.appendChild(toggle);
	toggle.onclick = function () {
		if (!gantt.getState().fullscreen) {
			gantt.expand();
		}
		else {
			gantt.collapse();
		}
	};
});
gantt.attachEvent("onExpand", function () {
	var icon = gantt.toggleIcon;
	if (icon) {
		icon.className = icon.className.replace("fa-expand", "fa-compress");
	}

});
gantt.attachEvent("onCollapse", function () {
	var icon = gantt.toggleIcon;
	if (icon) {
		icon.className = icon.className.replace("fa-compress", "fa-expand");
	}
});

gantt.templates.task_class = function(start, end, task){
	var css = [];
    css.push("no_drag_progress");
	return css.join(" ");
}
	
// 닫기
gantt.collapseAll = function(){
	gantt.eachTask(function(task){
		task.$open = false;
	});
	gantt.render();
}

// 펼치기
gantt.expandAll = function(){
	gantt.eachTask(function(task){
		task.$open = true;
	});
	gantt.render();
}

// https://docs.dhtmlx.com/gantt/api__refs__gantt_events.html
// task insert
gantt.attachEvent("onAfterTaskAdd", function(id,item){
	console.log(+item.start_date);
	var _item = Object.assign({}, item);
	_item.start_date = (+item.start_date);
	_item.end_date = (+item.end_date - 6000);
	_item.pro_id = pro_id;
    $.post(cp + "/insertTask", _item, function( data ) {
    	  console.log(data);
   	});
});

// task update
gantt.attachEvent("onAfterTaskUpdate", function(id,item){
    //any custom logic here
});

// task delete
gantt.attachEvent("onAfterTaskDelete", function(id,item){
    //any custom logic here
});
	
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
	{name: "wbs", label: "#", width: 40, template: gantt.getWBSCode},
	{name: "text", tree: true, width: 300},
	{name: "start_date", align: "center", width: 90},
	{name: "end_date", align: "center", width: 90},
	{name: "add", width: 40}
];
gantt.init("gantt_here");
getAllGantt(pro_id);
</script>
