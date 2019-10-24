<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<title>간단한 지도 표시하기</title>
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=f1diildqfi"></script>
<div id="map" style="width:100%;height:400px;"></div>

<script>
var mapOptions = {
    center: new naver.maps.LatLng(36.325050, 127.420167),
    zoom: 8
};

var map = new naver.maps.Map('map', mapOptions);
</script>
