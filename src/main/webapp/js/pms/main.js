$(function() {
	// 진행중인 프로젝트 리스트
	$.ajax({
		url: cp + "/getAllRunningProject",
		type: "POST",
		data: "emp_id=" + emp_id,
		success: function(datas) {
			$.each(datas.hashMap, function(idx, data) {
				$("#runningProject").append(printProject(idx, data));
				printChart(idx, data.allProjectChart, data.project.pro_id); // 전체 현황
				printChart(idx, data.empProjectChart, data.project.pro_id + '_' + emp_id); // 나의 현황 
			});
		}
	});
	
	// 지난 프로젝트 리스트
	$.ajax({
		url: cp + "/getAllPastProject",
		type: "POST",
		data: "emp_id=" + emp_id,
		success: function(datas) {
			$.each(datas.hashMap, function(idx, data) {
				$("#pastProject").append(printProject(idx, data));
				printChart(idx, data.allProjectChart, data.project.pro_id); // 전체 현황
				printChart(idx, data.empProjectChart, data.project.pro_id + '_' + emp_id); // 나의 현황 
			});
		}
	});
	
	// 부서의 사원 리스트
	$.ajax({
		url: cp + "/getAllDepartEmpList",
		type: "POST",
		success: function(datas) {
			$.each(datas.departmentList, function(idx, data) {
				var html = "<optgroup label='" + data.depart_nm + "' class='empList_" + data.depart_id + "'></optgroup>";
				$(".empList").append(html);
				
			});
			$.each(datas.allDepartEmpList, function(idx, empList) {
				var html = "";
				$.each(empList, function(idx2, data) {
					html += "<option value='" + data.emp_id + "'>" + data.emp_nm + "</option>";
				});
				$(".empList_" + idx).append(html);
			});
		}
	});
	
	// 신규 프로젝트 생성 버튼 클릭
	$("#btnInsertProject").on("click", function() {
		$("#projectModal").modal("show");
	});
	
});

function printProject(idx, data) {
	var html = "";
	html += '<hr>';
	html += '<div class="projectContent">';
	html += '   <h2><i class="fa fa-angle-right"></i> ' + data.project.pro_nm + '</h2>';
	html += '   <hr>';
	html += '   <table>';
	html += '   	<tbody>';
	html += '   		<tr>';
	html += '   			<td>';
	html += '   				<h2><i class="fa fa-pie-chart"></i> 전체 현황</h2>';
	html += '   		    	<div id=' + data.project.pro_id + ' class="chart"></div>';
	html += '   			</td>';
	html += '   			<td>';
	html += '   				<h2><i class="fa fa-pie-chart"></i> 나의 현황</h2>';
	html += '   		    	<div id=' + data.project.pro_id + '_' + emp_id + ' class="chart"></div>';
	html += '   			</td>';
	html += '   			<td>';
	html += '                   <h2><i class="fa fa-tasks"></i> 주간 업무</h2>';
    html += '                   <div class="taskList">';
    
	// 지연 업무
	$.each(data.delayTask, function(index, entry) {
		html += '<h5 class="mt-3">' + entry.task_cont + '<span class="float-right">' + entry.per + '%</span></h5>';
		html += '<div class="progress" style="height: 15px">';
		html += '   <div class="progress-bar bg-danger wow  progress-" style="width: ' + entry.per + '%;" role="progressbar">';
		html += '   </div>';
		html += '</div>';
	});
	
	// 주간 업무
	$.each(data.weekTask, function(index, entry) {
		html += '<h5 class="mt-3">' + entry.task_cont + '<span class="float-right">' + entry.per + '%</span></h5>';
		html += '<div class="progress" style="height: 15px">';
		html += '   <div class="progress-bar ';
		if(entry.per === 100)
			html += 'bg-success';
		else if(entry.end_dt < new Date() && entry.per < 100)
			html += 'bg-danger';
		else
			html += 'bg-info';
		html += ' wow  progress-" style="width: ' + entry.per + '%;" role="progressbar">';
		html += '   </div>';
		html += '</div>';
	});
	
    html += '                   </div>';
	html += '   			</td>';
	html += '   		</tr>';
	html += '   	</tbody>';
	html += '   </table>';
	html += '   <hr>';

	// 팀장
	html += '   <div class="projectGroup"> <span class="groupTitle"> <i class="fa fa-user"></i>팀장:</span> ';
	$.each(data.projectEmpJob, function(index, entry) {
		if(entry.JOB_NM === "팀장") {
			html += ' <span class="groupContent"><img src="' + cp + '/employeePicture?emp_id=' + entry.EMP_ID + '" height="80" width="80" class="rounded-circle"> ' + entry.EMP_NM + '<span>';
		}
	});
	html += '	</div>';
	
	// 팀원
	html += '   <div class="projectGroup"> <span class="groupTitle"><i class="fa fa-users"></i>팀원:</span> ';
	$.each(data.projectEmpJob, function(index, entry) {
		if(entry.JOB_NM === "팀원") {
			html += ' <span class="groupContent"><img src="' + cp + '/employeePicture?emp_id=' + entry.EMP_ID + '" height="80" width="80" class="rounded-circle"> ' + entry.EMP_NM + '<span>';
		}
	});
	html += '	</div>';
	
    html += '</div>';
    
    return html;
}

function printChart(idx, data, id) {
	// Themes begin
	am4core.useTheme(am4themes_animated);
	// Themes end
	
	// Create chart instance
	var chart = am4core.create(id, am4charts.PieChart);
	
	// Add data
	var result = [];
	var index = 0;
	// complete , before, running, delay
	var colors = ["#6fd96f", "#e9ecef", "#4d7cff", "#ff5e5e"];
	for (var key in data[0]) {
		var name;
		if(key === "COMPLETE") name = "완료";
		else if(key === "DELAY") name = "지연";
		else if(key === "RUNNING") name = "진행 중";
		else name = "시작 전";
		
		result.push({
			category: name, value: data[0][key], color: am4core.color(colors[index])
		});
		index++;
	}
	chart.data = result;
	
	// Add and configure Series
	var pieSeries = chart.series.push(new am4charts.PieSeries());
	pieSeries.dataFields.value = "value";
	pieSeries.dataFields.category = "category";
	
	// 영역 색상
	pieSeries.slices.template.propertyFields.fill = "color";
	
	// 테두리
	pieSeries.slices.template.stroke = am4core.color("#fff");
	pieSeries.slices.template.strokeWidth = 2;
	pieSeries.slices.template.strokeOpacity = 1;
	
	// This creates initial animation
	pieSeries.hiddenState.properties.opacity = 1;
	pieSeries.hiddenState.properties.endAngle = -90;
	pieSeries.hiddenState.properties.startAngle = -90;
	
	// Disable ticks and labels
	pieSeries.labels.template.disabled = true;
	pieSeries.ticks.template.disabled = true;
}

//tui.date-picker
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

// select2
$('.empList').select2();