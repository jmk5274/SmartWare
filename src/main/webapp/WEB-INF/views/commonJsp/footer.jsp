<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.3.0/sockjs.min.js"></script>
<script>
	var socket = new SockJS("/ws/chat");
	
	socket.onmessage = function(evt) {
		var d = new Date();
		var time = d.getHours() + ":" + d.getMinutes();
		var str = evt.data.split(":")
		
		console.log(str);
	};
	
	socket.onclose = function(evt) {
	}

	socket.onmessage = function(evt) {
		var d = new Date();
		var time = d.getHours() + ":" + d.getMinutes();
		var str = evt.data.split(":")
		
		console.log(str)
		
	};
</script>