$(function() {
	// 진행중인 프로젝트 리스트
	$.ajax({
		url: cp + "/getAllRunningProject",
		type: "POST",
		data: "emp_id=" + emp_id,
		success: function(datas) {
			$.each(datas.hashMap, function(idx, data) {
				$("#runningProject").append(printProject(idx, data));
			})
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
			})
		}
	});

});

function printProject(idx, data) {
	console.log(data.project.pro_nm);
	console.log(data);
	var html = "";
	html += '<hr>';
	html += '<blockquote>';
	html += '   <h3>' + data.project.pro_nm + '</h3>';
	html += '   <hr>';
	html += '   <table>';
	html += '   	<tbody>';
	html += '   		<tr>';
	html += '   			<td>';
	html += '   				<h3>전체 현황</h3>';
	html += '   		    	<div id=' + data.project.pro_id + ' class="chart"></div>';
	html += '   			</td>';
	html += '   			<td>';
	html += '   				<h3>나의 현황</h3>';
	html += '   		    	<div id=' + data.project.pro_id + '_' + emp_id + ' class="chart"></div>';
	html += '   			</td>';
	html += '   			<td>';
    html += '                   <h3>주간 업무</h3>';
    html += '                   <div class="taskList">';
	html += '                       <table class="table header-border table-hover verticle-middle">';
	html += '                           <thead>';
	html += '                               <tr>';
	html += '                                   <th scope="col"></th>';
	html += '                                   <th scope="col">업무명</th>';
	html += '                                   <th scope="col">진척도</th>';
	html += '                                   <th scope="col">현황</th>';
	html += '                               </tr>';
	html += '                           </thead>';
	html += '                           <tbody>';
	
	// 지연 업무
	$.each(data.delayTask, function(index, entry) {
		html += '<tr>';
		html += '    <th>1</th>';
		html += '    <td>' + entry.task_cont + '</td>';
		html += '    <td>';
		html += '        <div class="progress" style="height: 10px">';
		html += '            <div class="progress-bar gradient-2" style="width: ' + entry.per + '%;" role="progressbar">';
		html += '            </div>';
		html += '        </div>'; 
		html += '    </td>';
		html += '    <td><span class="label gradient-2 btn-rounded">' + entry.per + '%</span>';
		html += '    </td>';
		html += '</tr>';
	});
	
	// 주간 업무
	$.each(data.weekTask, function(index, entry) {
		html += '<tr>';
		html += '    <th>' + index + '</th>';
		html += '    <td>' + entry.task_cont + '</td>';
		html += '    <td>';
		html += '        <div class="progress" style="height: 10px">';
		html += '            <div class="progress-bar gradient-1" style="width: ' + entry.per + '%;" role="progressbar">';
		html += '            </div>';
		html += '        </div>'; 
		html += '    </td>';
		html += '    <td><span class="label gradient-1 btn-rounded">' + entry.per + '%</span>';
		html += '    </td>';
		html += '</tr>';
	});
	
	html += '                           </tbody>';
	html += '                       </table>';
    html += '                   </div>';
	html += '   			</td>';
	html += '   		</tr>';
	html += '   	</tbody>';
	html += '   </table>';
	html += '   <hr>';

	// 팀장
	html += '   <div> 팀장: ';
	$.each(data.projectEmpJob, function(index, entry) {
		if(entry.JOB_NM === "팀장") {
			html += ' <img src="/asd/employeePicture?emp_id=' + entry.EMP_ID + '" height="40" width="40" class="rounded-circle"> ' + entry.EMP_NM;
		}
	});
	html += '	</div>';
	
	// 팀원
	html += '   <div> 팀원: ';
	$.each(data.projectEmpJob, function(index, entry) {
		if(entry.JOB_NM === "팀원") {
			html += ' <img src="/asd/employeePicture?emp_id=' + entry.EMP_ID + '" height="40" width="40" class="rounded-circle"> ' + entry.EMP_NM;
		}
	});
	html += '	</div>';
	
    html += '</blockquote>';
    
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
	var colors = ["#A5DF00", "#D8D8D8", "#81BEF7", "#F78181"];
	for (var key in data[0]) {
		result.push({
			category: key, value: data[0][key], color: am4core.color(colors[index])
		});
		index++;
	}
	
	chart.data = result;
	console.log(result);
	
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