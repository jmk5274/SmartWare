<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="${cp }/js/jquery-3.4.1.min.js"></script>
<title>미리보기</title>
<script>
	$(function(){
		$("#check").change(function() {
		    var checked = $(this).prop('checked');
		 
		    if(checked){
		    	self.close();
		    }
		});
	});
</script>
</head>
<body>
	<div>
		<img src="${cp }/getPopup?pop_id=${pop_id}" height="610" width="490" alt="">
		<input style="float: right;" type="checkbox" id="check"><span style="float: right;">오늘만 보지 않기</span>
	</div>
</body>
</html>