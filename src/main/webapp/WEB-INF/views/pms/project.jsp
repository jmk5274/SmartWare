<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<link href= "${cp }/plugin/jquery-gantt/jquery-gantt.css" rel="stylesheet"/>

<div id="gantt"></div>


<script src="${cp }/plugin/jquery-gantt/jquery-gantt.min.js"></script>
<script src="${cp }/plugin/jquery-gantt/jquery-gantt.l10n.ko.js"></script>
<script>
	$('#gantt').gantt({
		data : [{
		    "title": "Zaporojie Turu",
		    "startdate": "2016/07/21",
		    "enddate": "2016/07/26",
		    "url": "http://www.example.com/1",
		    "type": "Tur",
		    "minNight": "4",
		    "price": {
		        "original": {
		            "price": 798.0000,
		            "priceType": "EUR"
		        },
		        "converted": {
		            "price": 2673,
		            "priceType": "TL"
		        }
		    },
		    "tooltipData": {
		        "title": "Zaporojie Turu",
		        "image": "http://cdn.gezinomi.com//zaporojie-turu-1126--1-29.06.2016101219-b4.jpg",
		        "desc": ["Atlas Global Havayolları Tarifeli Seferi ile ", " Türkçe Rehber ", " Vizesiz ", " 3 Gece - 4 Gün ", " Zaporojie (3)"],
		        "dates": {
		            "begin": "21 Temmuz 2016 Perşembe",
		            "end": "24 Temmuz 2016 Pazar"
		        },
		        "url": null
		    },
		    "dateorder": "\/Date(1469048400000)\/"
		}, {
		    "title": "Amsterdam İlkbahar , Yaz Turu ",
		    "startdate": "2016/07/21",
		    "enddate": "2016/07/24",
		    "url": "http://www.gezinomi.com/amsterdam-ilkbahar-yaz-turu",
		    "type": "Tur",
		    "minNight": "3",
		    "price": {
		        "original": {
		            "price": 1098.0000,
		            "priceType": "EUR"
		        },
		        "converted": {
		            "price": 3678,
		            "priceType": "TL"
		        }
		    },
		    "tooltipData": {
		        "title": "Amsterdam İlkbahar , Yaz Turu ",
		        "image": "http://cdn.gezinomi.com//amsterdam-ilkbahar-yaz-turu-1987--1-16.3.2015155554-b4.jpg",
		        "desc": ["Türk Havayolları Tarifeli Seferi ile ", " Türkçe Rehber ", " Vizeli ", " 3 Gece - 4 Gün ", " Amsterdam (3)"],
		        "dates": {
		            "begin": "21 Temmuz 2016 Perşembe",
		            "end": "24 Temmuz 2016 Pazar"
		        },
		        "url": null
		    },
		    "dateorder": "\/Date(1469048400000)\/"
		}],
		startDate : new Date('2016-07-01'),
		endDate : new Date('2016-10-01'),
		language : "ko"
	});
</script>


<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<div id="chart_div"></div>
<script>
google.charts.load('current', {'packages':['gantt']});
google.charts.setOnLoadCallback(drawChart);

function daysToMilliseconds(days) {
  return days * 24 * 60 * 60 * 1000;
}

function drawChart() {

  var data = new google.visualization.DataTable();
  data.addColumn('string', 'Task ID');
  data.addColumn('string', 'Task Name');
  data.addColumn('date', 'Start Date');
  data.addColumn('date', 'End Date');
  data.addColumn('number', 'Duration');
  data.addColumn('number', 'Percent Complete');
  data.addColumn('string', 'Dependencies');

  data.addRows([
    ['Research', 'Find sources',
     new Date(2015, 0, 1), new Date(2015, 0, 5), null,  100,  null],
    ['Write', 'Write paper',
     null, new Date(2015, 0, 9), daysToMilliseconds(3), 25, 'Research,Outline'],
    ['Cite', 'Create bibliography',
     null, new Date(2015, 0, 7), daysToMilliseconds(1), 20, 'Research'],
    ['Complete', 'Hand in paper',
     null, new Date(2015, 0, 10), daysToMilliseconds(1), 0, 'Cite,Write'],
    ['Outline', 'Outline paper',
     null, new Date(2015, 0, 6), daysToMilliseconds(1), 100, 'Research']
  ]);

  var options = {
    height: 275
  };

  var chart = new google.visualization.Gantt(document.getElementById('chart_div'));

  chart.draw(data, options);
}
</script>