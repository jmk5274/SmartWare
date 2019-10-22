<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="${cp }/bootstrap/css/style.css" rel="stylesheet">
<script src="${cp }/js/jquery-3.4.1.min.js"></script>
<title>Insert title here</title>
<script>
	$(function(){
		$(".btn").click(function(){
			$( "#modifyLeft", opener.document ).val("X 좌표: " + window.screenLeft);
			$( "#modifyTop", opener.document ).val("Y 좌표: " + window.screenTop);
			
			self.close();
		});
	});
</script>
</head>
<body>
	<div class="card text-center">
	    <div class="card-body">
	        <h3 class="card-title">위치 지정</h3>
	        <p class="card-text">
	        	현재 페이지는 팝업창 위치를 정하는 페이지입니다.<br>
	        	팝업창을 출력할 위치로 이동시킨 후 확인버튼을 클릭해주세요
	        	버튼을 클릭한 후 팝업의 위치가 자동으로 저장됩니다.
	        </p>
	        <a href="#" class="btn btn-primary">확인</a>
	    </div>
	</div>
</body>
</html>