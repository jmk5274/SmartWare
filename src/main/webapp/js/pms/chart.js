//am4core.ready(function() {
//
//	// Themes begin
//	am4core.useTheme(am4themes_animated);
//	// Themes end
//	
//	// Create chart instance
//	var chart = am4core.create("pj0003", am4charts.PieChart);
//	var chart2 = am4core.create("pj0003_e0009", am4charts.PieChart);
//	
//	// Add data
//	chart.data = [ {
//		"category": "완료",
//		"value": 10,
//		"color": am4core.color("#A5DF00")
//	}, {
//		"category": "지연",
//		"value": 1,
//		"color": am4core.color("#F78181")
//	}, {
//		"category": "진행중",
//		"value": 3,
//		"color": am4core.color("#81BEF7")
//	}, {
//		"category": "시작전",
//		"value": 5,
//		"color": am4core.color("#D8D8D8")
//	} ];
//	chart2.data = [ {
//		"category": "완료",
//		"value": 40,
//		"color": am4core.color("#A5DF00")
//	}, {
//		"category": "지연",
//		"value": 3,
//		"color": am4core.color("#F78181")
//	}, {
//		"category": "진행중",
//		"value": 12,
//		"color": am4core.color("#81BEF7")
//	}, {
//		"category": "시작전",
//		"value": 77,
//		"color": am4core.color("#D8D8D8")
//	} ];
//	
//	// 타이틀
////	let title = chart.titles.create();
////	title.text = "전체 현황";
////	title.fontSize = 25;
////	let title2 = chart2.titles.create();
////	title2.text = "나의 현황";
////	title2.fontSize = 25;
//
//	// Add and configure Series
//	var pieSeries = chart.series.push(new am4charts.PieSeries());
//	pieSeries.dataFields.value = "value";
//	pieSeries.dataFields.category = "category";
//	var pieSeries2 = chart2.series.push(new am4charts.PieSeries());
//	pieSeries2.dataFields.value = "value";
//	pieSeries2.dataFields.category = "category";
//	
//	// 영역 색상
//	pieSeries.slices.template.propertyFields.fill = "color";
//	pieSeries2.slices.template.propertyFields.fill = "color";
//	
//	// 테두리
//	pieSeries.slices.template.stroke = am4core.color("#fff");
//	pieSeries.slices.template.strokeWidth = 2;
//	pieSeries.slices.template.strokeOpacity = 1;
//	pieSeries2.slices.template.stroke = am4core.color("#fff");
//	pieSeries2.slices.template.strokeWidth = 2;
//	pieSeries2.slices.template.strokeOpacity = 1;
//	
//	// This creates initial animation
//	pieSeries.hiddenState.properties.opacity = 1;
//	pieSeries.hiddenState.properties.endAngle = -90;
//	pieSeries.hiddenState.properties.startAngle = -90;
//	pieSeries2.hiddenState.properties.opacity = 1;
//	pieSeries2.hiddenState.properties.endAngle = -90;
//	pieSeries2.hiddenState.properties.startAngle = -90;
//	
//	// Disable ticks and labels
//	pieSeries.labels.template.disabled = true;
//	pieSeries.ticks.template.disabled = true;
//	pieSeries2.labels.template.disabled = true;
//	pieSeries2.ticks.template.disabled = true;
//	
//}); // end am4core.ready()