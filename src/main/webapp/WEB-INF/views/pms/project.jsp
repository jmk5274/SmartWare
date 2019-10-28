<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<link href="${cp }/plugin/jquery-gantt/jquery-gantt.css"
	rel="stylesheet" />

<div id="gantt"></div>

<style>
#chart_div svg {
	overflow-x: scroll;
	background: white;
	/*   max-width: 1000px; */
	width: 2000;
	/* 	height: 4000px; */
	border-radius: .5rem;
	padding: .5rem;
	margin: 0 auto;
	box-shadow: 0 2px 1rem rgba(0, 0, 0, .2);
	/*Background Color*/
	g: nth-child(2){ 
    rect{fill: transparent;
}

}

/* Chart Settings */
g:nth-child(3) {
	rect: nth-child(odd){fill: transparent;
} /* Rows Odd */
rect:nth-child(even) {
	fill: transparent;
} /* Rows Even */
text {
	/* Hotizontal Labels */
	fill: dodgerblue;
	font-family: 'Roboto Mono' !important;
	font-weight: normal !important;
	text-transform: uppercase;
	letter-spacing: -.5px;
}

line {
	/* Row Lines */
	stroke: transparent;
	stroke-width: 0;
}

}

/* Arrows */
g:nth-child(4) {path { stroke-width:1;
	stroke: dodgerblue;
}

}

/* Shadow */
g:nth-child(6) {rect { fill:dodgerblue;
	
}

}

/* Bars */
g:nth-child(7) {
	rect {fill: dodgerblue;
}

}

/* Percent Complete */
g:nth-child(8) {
	path {fill: rgba(0, 0, 0, .2);
}

}

/* Side Labels */
g:nth-child(9) {
	text {fill: dodgerblue;
}

}

/* Tooltips */
g:nth-child(10) {rect { stroke:white;
	
}

text {
	fill: rgba(0, 0, 0, .6);
	font-size: 12.5px !important;
	letter-spacing: -.5px;
	font-family: 'Roboto Mono' !important;
}

text:nth-child(2) {
	fill: dodgerblue;
}
}
}
</style>

<div id="chart_div"></div>

<script src="${cp }/plugin/google-gantt-charts/loader.js"></script>
<script>
	var cp = "${cp}";
</script>
<script type="text/javascript">
	google.charts.load('current', {
		'packages' : [ 'gantt' ]
	});
	google.charts.setOnLoadCallback(drawChart);

	var jsonData = []
	function ajaxAllGantt() {
		$.ajax({
			url : cp + "/getAllGantt",
			type : "get",
			data : "pro_id=pj0003",
			dataType : "JSON",
			success : function(datas) {
				console.log(datas);
				return jsonData;
			},
			error : function() {
			}
		})
	}

	function drawChart() {
		ajaxAllGantt();

		var data = new google.visualization.DataTable();
		data.addColumn('string', 'Task ID');
		data.addColumn('string', 'Task Name');
		data.addColumn('string', 'Resource');
		data.addColumn('date', 'Start Date');
		data.addColumn('date', 'End Date');
		data.addColumn('number', 'Duration');
		data.addColumn('number', 'Percent Complete');
		data.addColumn('string', 'Dependencies');

		var ajaxArr = [];

		$.ajax({
			url : cp + "/getAllGantt",
			type : "get",
			data : "pro_id=pj0003",
			dataType : "JSON",
			async : false,
			success : function(datas) {
				$.each(datas.taskList, function(idx, value) {
					var a;
					if (typeof value.PA_TASK_ID == "undefined") {
						a = null;
					} else {
						a = value.PA_TASK_ID;
					}
					var ar = [ value.TASK_ID, value.TASK_CONT, value.RS,
							new Date(value.ST_DT), new Date(value.END_DT),
							null, value.PER, a ];
					console.log(ar);
					data.addRow(ar)
				});
			}
		})

		console.log(ajaxArr);

		var options = {
			height : 5000,
			gantt : {
				criticalPathEnabled : false, // Critical path arrows will be the same as other arrows.
				arrow : {
					angle : 0,
					width : 0,
					color : 'dodgerblue',
					radius : 0
				},
				labelStyle : {
					fontName : 'Roboto Mono',
					fontSize : 12,
					color : 'dodgerblue'
				},
				barCornerRadius : 2,
				backgroundColor : {
					fill : 'transparent',
				},
				innerGridHorizLine : {
					stroke : '#ddd',
					strokeWidth : 0,
				},
				innerGridTrack : {
					fill : 'transparent'
				},
				innerGridDarkTrack : {
					fill : 'transparent'
				},
				percentEnabled : true,
				percentStyle: {
				   fill:	'black',
				},
				shadowEnabled : false
			}
		};

		var chart = new google.visualization.Gantt(document.getElementById('chart_div'));

		chart.draw(data, options);
	}
</script>