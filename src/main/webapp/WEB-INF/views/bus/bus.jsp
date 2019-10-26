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
// 					 map = new naver.maps.Map('map', map);
// 					 $(data).firstChild('itemList').each(function(){
// 						 var tmX = $(this).find("GPS_LATI").text();

						 var tmX = $(data).find('itemList').first('itemList').find("GPS_LATI").text();
						 console.log(tmX);
// 						 var tmY = $(this).find("GPS_LONG").text();
						 var tmY = $(data).find('itemList').first('itemList').find("GPS_LONG").text();
						 console.log(tmY);
						 
// 						 marker = new naver.maps.Marker({
							
// 							 position: new naver.maps.LatLng(tmX, tmY),
// 							 map: map
// 						 });
						 
						 
						 var position = new naver.maps.LatLng(tmX, tmY);
						 var map = new naver.maps.Map('map', {
						     center: position,
						     zoom: 11
						 });

						 var markerOptions = {
						     position: position.destinationPoint(90, 15),
						     map: map,
						     icon: {
						         url: '/img/bus/buss.png',
						         size: new naver.maps.Size(50, 54),
						         origin: new naver.maps.Point(0, 0),
						         anchor: new naver.maps.Point(25, 26)
						     }
						 };

						 var marker = new naver.maps.Marker(markerOptions);
						 
// 					 });
				 }
			 }
		 });
	 });
 })
 



// var map = new naver.maps.Map('map', {
// 	    center: new naver.maps.LatLng(36.350681, 127.384797),
// 	    zoom: 8,
// 	    minZoom: 1,
// 	    mapTypeId: naver.maps.MapTypeId.HYBRID,
// 	    zoomControl: true,
// 	    zoomControlOptions: {
// 	        position: naver.maps.Position.TOP_RIGHT
// 	    },
// 	    disableKineticPan: false
// 	});

// 	map.setOptions({
// 	    mapTypeControl: true,
// 	    scaleControl: false,
// 	    logoControl: false
// 	});

// 	// 미니 맵이 들어갈 HTML 요소를 controls 객체에 추가합니다. 가장 오른쪽 아래에 위치하기 위해서 다른 옵션들을 잠시 끕니다.
// 	map.controls[naver.maps.Position.BOTTOM_RIGHT].push($("#minimap")[0]);
// 	map.setOptions({
// 	    scaleControl: true,
// 	    logoControl: true,
// 	});

// 	var minimap = new naver.maps.Map('minimap', { //미니 맵 지도를 생성합니다.
// 	    bounds: map.getBounds(),
// 	    scrollWheel: false,
// 	    scaleControl: false,
// 	    mapDataControl: false,
// 	    logoControl: false
// 	});


// 	var semaphore = false;
// 	naver.maps.Event.addListener(map, 'bounds_changed', function(bounds) {
// 	    if (semaphore) return;

// 	    minimap.fitBounds(bounds);
// 	});
// 	naver.maps.Event.addListener(map, 'mapTypeId_changed', function(mapTypeId) {
// 	    var toTypes = {
// 	        "normal": "hybrid",
// 	        "terrain": "satellite",
// 	        "satellite": "terrain",
// 	        "hybrid": "normal"
// 	    };

// 	    minimap.setMapTypeId(toTypes[mapTypeId]);
// 	});
// 	naver.maps.Event.addListener(minimap, 'drag', function() {
// 	    semaphore = true;
// 	    map.panTo(minimap.getCenter());
// 	    naver.maps.Event.once(map, 'idle', function() {
// 	        semaphore = false;
// 	    });

// 	});

</script>



<button id="bus" type="button">Bus</button>