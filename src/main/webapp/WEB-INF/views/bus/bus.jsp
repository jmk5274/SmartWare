<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<title>간단한 지도 표시하기</title>
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=f1diildqfi"></script>
<div id="map" style="width:100%;height:400px;"></div>

<script>
 $(function(){
	 $("#bus").click(function(){
		 
		 $.ajax({
			 url : "/busMap",
			 type : "GET",
			 dataType: "text",
			 success: function(data){
				 console.log(data);
				 if(data){
					 map = new naver.maps.Map('map', map);
					 
// 					 $(data).firstChild('itemList').each(function(){
// 						 var tmX = $(this).find("GPS_LATI").text();

						 var tmX = $(data).find('itemList').first('itemList').find("GPS_LATI").text();
						 console.log(tmX);
// 						 var tmY = $(this).find("GPS_LONG").text();
						 var tmY = $(data).find('itemList').first('itemList').find("GPS_LONG").text();
						 console.log(tmY);
						 
						 marker = new naver.maps.Marker({
							
							 position: new naver.maps.LatLng(tmX, tmY),
							 map: map
						 });
// 					 });
				 }
			 }
		 });
	 });
 })
 

var mapOptions = {
    center: new naver.maps.LatLng(36.350681, 127.384797),
    
    zoom: 8
 }

var map = new naver.maps.Map("map", mapOptions);

// var polyline = new naver.maps.Polyline({
//     map: map,
//     path: [],
//     strokeColor: '#5347AA',
//     strokeWeight: 2
// });

// naver.maps.Event.addListener(map, 'change', function(e) {

//     var point = e.coord;

//     var path = polyline.getPath();
//     path.push(point);

//     new naver.maps.Marker({
//         map: map,
//         position: point
//     });
// });

</script>



<button id="bus" type="button">Bus</button>