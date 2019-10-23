am4core.ready(function() {

	// Themes begin
	am4core.useTheme(am4themes_animated);
	// Themes end
	
	// Create chart instance
	var chart = am4core.create("chartdiv", am4charts.PieChart);
	
	// Add data
	chart.data = [ {
		"category": "완료",
		"value": 10,
		"color": am4core.color("#A5DF00")
	}, {
		"category": "지연",
		"value": 1,
		"color": am4core.color("#F78181")
	}, {
		"category": "진행중",
		"value": 3,
		"color": am4core.color("#81BEF7")
	}, {
		"category": "시작전",
		"value": 5,
		"color": am4core.color("#D8D8D8")
	} ];
	
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

}); // end am4core.ready()