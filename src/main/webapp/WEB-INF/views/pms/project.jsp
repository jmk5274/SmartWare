<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="${cp }/plugin/dhtmlxgantt/dhtmlxgantt.js"></script>
<script src="${cp }/plugin/dhtmlxgantt/locale_kr.js"></script>
<script src="${cp }/plugin/dhtmlxgantt/dhtmlxgantt_marker.js"></script>
<script src="${cp }/plugin/dhtmlxgantt/dhtmlxgantt_api.js"></script>
<link href= "${cp }/plugin/dhtmlxgantt/dhtmlxgantt.css" rel="stylesheet"/>
<link href= "${cp }/plugin/dhtmlxgantt/dhtmlxgantt_broadway.css" rel="stylesheet"/>

<!-- tui-date-picker css -->
<link href= "${cp }/plugin/tui-date-picker/tui-date-picker.css" rel="stylesheet"/>

<!-- rangeSlider css -->
<link href= "${cp }/plugin/rangeSlider/ion.rangeSlider.min.css" rel="stylesheet"/>

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

/* modal css */
.col-sm-2.col-form-label {
	text-align: right;
	font-size: 20px;
}

/* ganttController */
#ganttTitle {
	padding: 10px;
	margin: 0px;
	background-color: #3d3d3d;
	color: white;
}

#ganttController {
	border-top: 1px solid #bababa;
	border-right: 1px solid #bababa;
	border-left: 1px solid #bababa;
	background-color: #f5f5f5;
	font-size: 17px;
}

#ganttController > button {
	padding: 8px;
	background: none;
	border: none;
	cursor: pointer;
}

#ganttController .form-control {
	padding: 3px 6px;
	width: 150px;
	height: 20px;
	display: inline;
}

</style>

<div class="card">
	<div class="card-body">
		<h2 id="ganttTitle"><i class="fa fa-asterisk"></i> ${pro_nm }</h2>
		<div id="ganttController">
			<button onclick="gantt.collapseAll()"><i class="fa fa-angle-up fa-lg"></i> 접기</button>
			<button onclick="gantt.expandAll()"><i class="fa fa-angle-down fa-lg"></i> 펼치기</button>
			<button onclick="toggleMode(this)"><i class="fa fa-search-minus"></i> 축소</button>
			<button type="button" data-toggle="dropdown"><i class="fa fa-download"></i> 다운로드</button>
			<div class="dropdown-menu">
				<input class="dropdown-item" onclick="gantt.exportToPDF()" type="button" value="PDF"/>
				<input class="dropdown-item" onclick="gantt.exportToPNG()" type="button" value="PNG">
				<input class="dropdown-item" onclick="gantt.exportToExcel()" type="button" value="Excel">
			</div>
		
			<span id="ganttFilter" style="float: right">
				<span>필터</span>
				<select class="form-control" id="empFilter">
					<option value="" disabled selected>담당자</option>
					<option>전체</option>
					<c:forEach items="${employeeList }" var="employee">
						<option value="${employee.emp_id }">${employee.emp_nm }</option>
					</c:forEach>
				</select>
				<select class="form-control" id="statusFilter">
					<option value="" disabled selected>업무상태</option>
					<option>전체</option>
					<option value="complete">완료된 업무</option>
					<option value="running">진행중인 업무</option>
					<option value="delay">지연된 업무</option>
					<option value="before">시작전 업무</option>
				</select>
			</span>
		</div>
		<div id="gantt_here" style='width:100%; height:90vh;'></div>
	</div>
</div>

<!-- task modal -->
<div class="bootstrap-modal">
    <div class="modal fade" id="taskModal" data-backdrop="static">
        <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h3 class="modal-title"><i class='fa fa-file-text fa-lg' style='color: black;'> </i> 일감</h3>
                </div>
                <div class="modal-body basic-form">
                	<form id="taskForm">
                		<input type="hidden" id="task_id" name="task_id" value=""/>
                		<input type="hidden" id="pa_task_id" name="pa_task_id" value=""/>
                		<div class="form-group row">
                			<div class="col-sm-1"></div>
		                    <label class="col-sm-2 col-form-label">일감 명</label>
		                    <div class="col-sm-8">
		                    	<input type="text" class="form-control" id="task_cont" name="task_cont">
		                    </div>
	                    </div>
	                    
	                    <div class="form-group row">
	                     	<div class="col-sm-1"></div>
		                    <label class="col-sm-2 col-form-label">시작일</label>
		                    <div class="col-sm-3">
								<div class="form-control tui-datepicker-input tui-datetime-input tui-has-focus">
									<input id="startpicker-input" type="text" aria-label="Date">
									<span class="tui-ico-date"></span>
									<div id="startpicker-container" style="margin-left: -1px;"></div>
								</div>
		                    </div>
		                    <label class="col-sm-2 col-form-label">종료일</label>
		                    <div class="col-sm-3">
								<div class="form-control tui-datepicker-input tui-datetime-input tui-has-focus">
									<input id="endpicker-input" type="text" aria-label="Date">
									<span class="tui-ico-date"></span>
									<div id="endpicker-container" style="margin-left: -1px;"></div>
								</div>
		                    </div>
		                </div>
						
	                    <div class="form-group row">
	                    	<div class="col-sm-1"></div>
		                    <label class="col-sm-2 col-form-label">담당자</label>
		                    <div class="col-sm-8">
		                    	<select class="form-control" id="emp_id" style="width: 100%" name="emp_id">
		                    		<c:forEach items="${employeeList }" var="employee">
										<option value="${employee.emp_id }">${employee.emp_nm }</option>
									</c:forEach>
		                    	</select>
		                    </div>
	                    </div>
	                    
	                    <div class="form-group row">
                			<div class="col-sm-1"></div>
		                    <label class="col-sm-2 col-form-label" style="line-height: 3.2;">진척도</label>
		                    <div class="col-sm-8">
		                    	<input type="text" id="per">
		                    </div>
	                    </div>
                    </form>
                </div>
                <div class="modal-footer" style="display: inline-block;">
                    <button type="button" class="btn mb-1 btn-dark" id="cancelTask" style="float: right;">취소</button>
                    <button type="button" class="btn mb-1 btn-dark" id="updateTask" style="float: right;">수정</button>
                    <button type="button" class="btn mb-1 btn-dark" id="insertTask" style="float: right;">생성</button>
                    <button type="button" class="btn mb-1 btn-danger" id="deleteTask" style="float: left;">삭제</button>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- tui-date-picker 관련 js -->
<script src="${cp }/plugin/tui-date-picker/tui-code-snippet.js"></script>
<script src="${cp }/plugin/tui-date-picker/tui-dom.js"></script>
<script src="${cp }/plugin/tui-date-picker/tui-date-picker.js"></script>

<!-- rangeSlider js -->
<script src="${cp }/plugin/rangeSlider/ion.rangeSlider.min.js"></script>

<script>
	var cp = "${cp}";
	var pro_id = "${pro_id}"
</script>

<script>

$(function() {
	// 필터링 적용
	$("#empFilter, #statusFilter").on("change", function() {
		gantt.refreshData();
		gantt.collapseAll();
		gantt.expandAll();
	});
});

// zoom to fit 시작
function toggleMode(toggle) {
	toggle.enabled = !toggle.enabled;
	if (toggle.enabled) {
		toggle.innerHTML = "<i class='fa fa-search-plus'></i> 확대";
		//Saving previous scale state for future restore
		saveConfig();
		zoomToFit();
	} else {

		toggle.innerHTML = "<i class='fa fa-search-minus'></i> 축소";
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
function getAllTask(pro_id) {
	$.ajax({
		url : cp + "/getAllTask",
		type : "post",
		async: false,
		data : "pro_id=" + pro_id,
		dataType : "JSON",
		success: function(datas) {
			var rtnData = [];
			$.each(datas.taskList, function(idx, value) {
				var taskColor;
				if(value.PER !== 100 && value.END_DT < new Date()) { // 지연
					taskColor = "#ff5e5e"; // red
				} else if(value.PER === 100) { // 완료
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
    if ( !(empFilterValue === task.emp_id || empFilterValue === "전체" || empFilterValue === null) ){
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

// lightbox
var taskId = null;
gantt.showLightbox = function(id) {
    taskId = id;
    var task = gantt.getTask(id);
    $("#task_id").val(taskId);
    $("#task_cont").val(task.text);
 	picker._startpicker.setDate(task.start_date);
 	picker._endpicker.setDate(task.end_date);
 	slider.update({from: task.progress * 100});
 	$("#emp_id").val(task.emp_id);
 	$("#pa_task_id").val(task.parent);
 	
 	if(gantt.getTask(taskId).$new) {
 		$("#insertTask").show();
 		$("#deleteTask").hide();
 		$("#updateTask").hide();
 	} else {
 		$("#insertTask").hide();
 		$("#deleteTask").show();
 		$("#updateTask").show();
 	}
 	
 	$("#taskModal").modal("show");
};

$(function() {
	// insert
	$("#insertTask").on("click", function() {
		if($("#task_cont").val() === null) {
			Swal({
				title: '일감 명을 입력하세요.',
				type: 'error',
				timer: 1500,
				showConfirmButton: false,
			});
			return; 
		} else if(picker._endpicker.getDate() === null) {
			Swal({
				title: '종료일을 선택하세요.',
				type: 'error',
				timer: 1500,
				showConfirmButton: false,
			});
			return; 
		} else if($("#emp_id").val() === null) {
			Swal({
				title: '담당자를 선택하세요.',
				type: 'error',
				timer: 1500,
				showConfirmButton: false,
			});
			return; 
		}
	    
		start = +picker._startpicker.getDate();
		end = +picker._endpicker.getDate() + 86340000; // 23시 59분 더해줌
		$.ajax({
			url: cp + "/insertTask",
			type: "post",
			async: false,
			data: $("#taskForm").serialize() + "&per=" + slider.old_from + "&pro_id=" + pro_id
				  + "&start=" + start + "&end=" + end,
			success: function(data) {
				Swal({
					title: '일감이 추가되었습니다.',
					type: 'success',
					timer: 1500,
					showConfirmButton: false,
				});
				$.ajax({
					url: cp + "/getTask",
					type: "post",
					async: false,
					data: "task_id=" + data.task_id,
					success: function(data) {
						$("#task_id").val(data.task.TASK_ID);
		 				gantt.changeTaskId(taskId, data.task.TASK_ID); // 자동생성된 id를 db에 생성한 id로 교체
		 				gantt.getTask(data.task.TASK_ID).$new = false;
		 				gantt.getTask(data.task.TASK_ID).text = data.task.TASK_CONT;
		 				gantt.getTask(data.task.TASK_ID).start_date = new Date(data.task.ST_DT);
		 				gantt.getTask(data.task.TASK_ID).end_date = new Date(data.task.END_DT);
		 				gantt.getTask(data.task.TASK_ID).progress = data.task.PER / 100;
		 				gantt.getTask(data.task.TASK_ID).parent = data.task.PA_TASK_ID;
		 				gantt.getTask(data.task.TASK_ID).emp_id = data.task.EMP_ID;
		 				gantt.getTask(data.task.TASK_ID).emp_nm = data.task.EMP_NM;
		 				
		 				if(data.task.PER !== 100 && new Date(data.task.END_DT) < new Date()) { // 지연
		 					gantt.getTask(data.task.TASK_ID).color = "#ff5e5e"; // red
		 				} else if(data.task.PER === 100) { // 완료
		 					gantt.getTask(data.task.TASK_ID).color = "#6fd96f"; // green
		 				} else if(new Date(data.task.ST_DT) > new Date()) { // 시작전
		 					gantt.getTask(data.task.TASK_ID).color = "#b6b8ba"; // gray
		 				} else { // 진행중
		 					gantt.getTask(data.task.TASK_ID).color = "#4d7cff"; // blue
		 				}
		 				console.log(gantt.getTask(data.task.TASK_ID));
						$("#taskModal").modal("hide");
						taskId = null;
					}
				})
			}
		});
	});
	
	// update
	$("#updateTask").on("click", function() {
		if($("#task_cont").val() === null) {
			Swal({
				title: '일감 명을 입력하세요.',
				type: 'error',
				timer: 1500,
				showConfirmButton: false,
			});
			return; 
		} else if(picker._endpicker.getDate() === null) {
			Swal({
				title: '종료일을 선택하세요.',
				type: 'error',
				timer: 1500,
				showConfirmButton: false,
			});
			return; 
		} else if($("#emp_id").val() === null) {
			Swal({
				title: '담당자를 선택하세요.',
				type: 'error',
				timer: 1500,
				showConfirmButton: false,
			});
			return; 
		}
	    
		start = +picker._startpicker.getDate();
		end = +picker._endpicker.getDate(); // 23시 59분 더해줌
		$.ajax({
			url: cp + "/updateTask",
			type: "post",
			data: $("#taskForm").serialize() + "&per=" + slider.old_from + "&pro_id=" + pro_id
				  + "&start=" + start + "&end=" + end,
			success: function(data) {
				Swal({
					title: '일감이 수정되었습니다.',
					type: 'success',
					timer: 1500,
					showConfirmButton: false,
				});
				$.ajax({
					url: cp + "/getTask",
					type: "post",
					data: "task_id=" + data.task_id,
					success: function(data) {
						console.log(data.task.TASK_ID);
						$("#task_id").val(data.task.TASK_ID);
		 				gantt.getTask(data.task.TASK_ID).$new = false;
		 				gantt.getTask(data.task.TASK_ID).text = data.task.TASK_CONT;
		 				gantt.getTask(data.task.TASK_ID).start_date = new Date(data.task.ST_DT);
		 				gantt.getTask(data.task.TASK_ID).end_date = new Date(data.task.END_DT);
		 				gantt.getTask(data.task.TASK_ID).progress = data.task.PER / 100;
		 				gantt.getTask(data.task.TASK_ID).parent = data.task.PA_TASK_ID;
		 				gantt.getTask(data.task.TASK_ID).emp_id = data.task.EMP_ID;
		 				gantt.getTask(data.task.TASK_ID).emp_nm = data.task.EMP_NM;
		 				
		 				if(data.task.PER === 100) { // 완료
		 					gantt.getTask(data.task.TASK_ID).color = "#6fd96f"; // green
		 				} else if(data.task.PER !== 100 && new Date(data.task.END_DT) < new Date()) { // 지연
			 				gantt.getTask(data.task.TASK_ID).color = "#ff5e5e"; // red
			 			} else if(new Date(data.task.ST_DT) > new Date()) { // 시작전
		 					gantt.getTask(data.task.TASK_ID).color = "#b6b8ba"; // gray
		 				} else { // 진행중
		 					gantt.getTask(data.task.TASK_ID).color = "#4d7cff"; // blue
		 				}
		 				
						$("#taskModal").modal("hide");
					}
				})
			}
		});
	});
	
	// delete
	$("#deleteTask").on("click", function() {
		$.ajax({
			url: cp + "/deleteTask",
			type: "post",
			data: "task_id=" + taskId,
			success: function() {
				gantt.deleteTask(taskId);
				taskId = null;
			    $("#taskModal").modal("hide");
			    Swal({
					title: '삭제되었습니다.',
					type: 'success',
					timer: 1500,
					showConfirmButton: false,
				});
			}
		});
		
	});
	
	// cancel
	$("#cancelTask").on("click", function(event){
	    var task = gantt.getTask(taskId);
	    if(task.$new)
	    	gantt.deleteTask(task.id);
	    taskId = null;
		$("#taskModal").modal("hide");
	});
})
//

gantt.config.lightbox.sections = [
	{name: "description", height: 80, map_to: "text", type: "textarea", focus: true},
	{name: "time", type: "dhx_calendar", map_to: "auto", skin: '', date_format: '%d %M %Y'}
];
	
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
getAllTask(pro_id);

var picker = tui.DatePicker.createRangePicker({
	language: 'ko',
    startpicker: {
        date: new Date(),
        input: '#startpicker-input',
        container: '#startpicker-container'
    },
    endpicker: {
        date: new Date(),
        input: '#endpicker-input',
        container: '#endpicker-container'
    },
    type: 'date',
    format: 'yyyy-MM-dd'
});

$("#per").ionRangeSlider({
	min: 0,
	max: 100,
	step: 5,
	grid: true,
    skin: "round",
    hide_min_max: true
});

var slider = $("#per").data("ionRangeSlider");

</script>
