<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.3.0/sockjs.min.js"></script>
<script>
	var socket = new SockJS("/ws/chat");
	
	socket.onclose = function(evt) {
		$(".messages ul").append("연결 종료");
	}
</script>