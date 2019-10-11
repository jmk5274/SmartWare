<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>

<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<!DOCTYPE html><html class=''>
<head>
<script src='//production-assets.codepen.io/assets/editor/live/console_runner-079c09a0e3b9ff743e39ee2d5637b9216b3545af0de366d4b9aad9dc87e26bfd.js'></script>
<!-- <script src='//production-assets.codepen.io/assets/editor/live/events_runner-73716630c22bbc8cff4bd0f07b135f00a0bdc5d14629260c3ec49e5606f98fdd.js'></script> -->
<script src='//production-assets.codepen.io/assets/editor/live/css_live_reload_init-2c0dc5167d60a5af3ee189d570b1835129687ea2a61bee3513dee3a50c115a77.js'></script>
<meta charset='UTF-8'><meta name="robots" content="noindex"><link rel="shortcut icon" type="image/x-icon" href="//production-assets.codepen.io/assets/favicon/favicon-8ea04875e70c4b0bb41da869e81236e54394d63638a1ef12fa558a4a835f1164.ico" />
<link rel="mask-icon" type="" href="//production-assets.codepen.io/assets/favicon/logo-pin-f2d2b6d2c61838f7e76325261b7195c27224080bc099486ddd6dccb469b8e8e6.svg" color="#111" />
<link rel="canonical" href="https://codepen.io/emilcarlsson/pen/ZOQZaV?limit=all&page=74&q=contact+" />
<link href='https://fonts.googleapis.com/css?family=Source+Sans+Pro:400,600,700,300' rel='stylesheet' type='text/css'>

<script src="https://use.typekit.net/hoy3lrg.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.3.0/sockjs.min.js"></script>
<script>try{Typekit.load({ async: true });}catch(e){}</script>
<link rel='stylesheet prefetch' href='https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css'><link rel='stylesheet prefetch' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.2/css/font-awesome.min.css'>
<style class="cp-pen-styles">
#frame {
  width: 100%;
  min-width: 360px;
  max-width: 1000px;
  height: 100vh;
  min-height: 300px;
  max-height: 720px;
  background: #E6EAEA;
}
@media screen and (max-width: 360px) {
  #frame {
    width: 100%;
    height: 100vh;
  }
}
#frame .content {
  float: right;
  width: 100%;
  height: 100%;
  overflow: hidden;
  position: relative;
}
@media screen and (max-width: 735px) {
  #frame .content {
    width: calc(100%);
    min-width: 300px !important;
  }
}
@media screen and (min-width: 900px) {
  #frame .content {
    width: calc(100%);
  }
}
#frame .content .contact-profile {
  width: 100%;
  height: 60px;
  line-height: 60px;
  background: #f5f5f5;
}
#frame .content .contact-profile img {
  width: 40px;
  border-radius: 50%;
  float: left;
  margin: 9px 12px 0 9px;
}
#frame .content .contact-profile p {
  float: left;
}
#frame .content .contact-profile .social-media {
  float: right;
}
#frame .content .contact-profile .social-media i {
  margin-left: 14px;
  cursor: pointer;
}
#frame .content .contact-profile .social-media i:nth-last-child(1) {
  margin-right: 20px;
}
#frame .content .contact-profile .social-media i:hover {
  color: #435f7a;
}
#frame .content .messages {
  height: auto;
  min-height: calc(100% - 93px);
  max-height: calc(100% - 93px);
  overflow-y: scroll;
  overflow-x: hidden;
}
@media screen and (max-width: 735px) {
  #frame .content .messages {
    max-height: calc(100% - 105px);
  }
}
#frame .content .messages::-webkit-scrollbar {
  width: 8px;
  background: transparent;
}
#frame .content .messages::-webkit-scrollbar-thumb {
  background-color: rgba(0, 0, 0, 0.3);
}
#frame .content .messages ul li {
  display: inline-block;
  clear: both;
  float: left;
  margin: 15px 15px 5px 15px;
  width: calc(100% - 25px);
  font-size: 0.9em;
}
#frame .content .messages ul li:nth-last-child(1) {
  margin-bottom: 20px;
}
#frame .content .messages ul li.sent img {
  margin: 6px 8px 0 0;
}
#frame .content .messages ul li.sent p {
  background: #435f7a;
  color: #f5f5f5;
}
#frame .content .messages ul li.replies img {
  float: right;
  margin: 6px 0 0 8px;
}
#frame .content .messages ul li.replies p {
  background: #f5f5f5;
  float: right;
}
#frame .content .messages ul li img {
  width: 22px;
  border-radius: 50%;
  float: left;
}
#frame .content .messages ul li p {
  display: inline-block;
  padding: 10px 15px;
  border-radius: 20px;
  max-width: 205px;
  line-height: 130%;
  word-break: break-all;
}
@media screen and (min-width: 735px) {
  #frame .content .messages ul li p {
    max-width: 300px;
  }
}
#frame .content .message-input {
  position: absolute;
  bottom: 0;
  width: 100%;
  z-index: 99;
}
#frame .content .message-input .wrap {
  position: relative;
}
#frame .content .message-input .wrap input {
  font-family: "proxima-nova",  "Source Sans Pro", sans-serif;
  float: left;
  border: none;
  width: calc(100% - 90px);
  padding: 11px 32px 10px 8px;
  font-size: 0.8em;
  color: #32465a;
}
@media screen and (max-width: 735px) {
  #frame .content .message-input .wrap input {
    padding: 15px 32px 16px 8px;
  }
}
#frame .content .message-input .wrap input:focus {
  outline: none;
}
#frame .content .message-input .wrap .attachment {
  position: absolute;
  right: 60px;
  z-index: 4;
  margin-top: 10px;
  font-size: 1.1em;
  color: #435f7a;
  opacity: .5;
  cursor: pointer;
}
@media screen and (max-width: 735px) {
  #frame .content .message-input .wrap .attachment {
    margin-top: 17px;
    right: 65px;
  }
}
#frame .content .message-input .wrap .attachment:hover {
  opacity: 1;
}
#frame .content .message-input .wrap button {
  float: right;
  border: none;
  width: 50px;
  padding: 12px 0;
  cursor: pointer;
  background: #32465a;
  color: #f5f5f5;
}
@media screen and (max-width: 735px) {
  #frame .content .message-input .wrap button {
    padding: 16px 0;
  }
}
#frame .content .message-input .wrap button:hover {
  background: #435f7a;
}
#frame .content .message-input .wrap button:focus {
  outline: none;
}
#frame .content .messages ul .replies span {
    float: right;
    vertical-align: middle;
    position: relative;
    transform: translate(-10px, 10px);
/*     bottom: 0; */
/*     right: 0; */
}

</style></head><body>

<div id="frame">
	<div class="content">
		<div class="contact-profile">
			<c:choose>
				<c:when test="${chat_nm == null || chat_nm == '' }">
				</c:when>
				<c:otherwise>
					<img src="${cp }/empPicture?emp_id=${S_EMPLOYEE.emp_id}" alt="" />
					<p>${chat_nm } </p>
				</c:otherwise>
			</c:choose>
			<div class="social-media">
				<c:choose>
					<c:when test="${chatEmpList == null || chatEmpList.size() == 0 }">
						<span>&nbsp;<i class="fa fa-plus" aria-hidden="true"></i></span>
					</c:when>
					<c:otherwise>
						<c:choose>
							<c:when test="${chatEmpList.size()==1 }">
								<span>${chatEmpList.get(0).emp_nm } &nbsp; <i class="fa fa-plus" aria-hidden="true"></i></span>
							</c:when>
							<c:otherwise>
								<span>${chatEmpList.get(0).emp_nm } 외 ${chatEmpList.size()-1 }명 &nbsp; <i class="fa fa-plus" aria-hidden="true"></i></span>
							</c:otherwise>
						</c:choose>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
		<div class="messages">
			<ul>
				<c:choose>
					<c:when test="${messageList == null || messageList.size() == 0 }">
						
					</c:when>
					<c:otherwise>
						<c:forEach items="${messageList }" var="message">
							<c:choose>
								<c:when test="${message.EMP_ID != S_EMPLOYEE.emp_id}">
									<li class="sent">
										<img src="${cp }/empPicture?emp_id=${message.EMP_ID}" alt="" />
										<p>${message.MSG_CONT }</p>
										<span><fmt:formatDate value="${message.SEND_DT }" pattern="HH:mm"/></span>
									</li>
								</c:when>
								<c:otherwise>
									<li class="replies">
										<img src="${cp }/empPicture?emp_id=${message.EMP_ID}" alt="" />
										<p>${message.MSG_CONT }</p>
										<span><fmt:formatDate value="${message.SEND_DT }" pattern="HH:mm"/> </span>
									</li>
								</c:otherwise>
							</c:choose>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</ul>
		</div>
		<div class="message-input">
			<div class="wrap">
				<form id="messageFrm" action="${cp }/insertMessage" method="post">
					<input id="msg_cont" name="msg_cont" type="text" placeholder="내용을 입력해주세요" />
					<input name="chat_id" type="hidden" value="${chat_id }"/>
					<label>
						<i id="btn" class="fa fa-paperclip attachment" aria-hidden="true"></i>
						<input name="file" type="file" style='display: none'/>
					</label>
					<button id="btn1" class="submit" type="button" data-chat_id="${chat_id }"><i class="fa fa-paper-plane" aria-hidden="true"></i></button>
				</form>
			</div>
		</div>
	</div>
</div>

<script src='//production-assets.codepen.io/assets/common/stopExecutionOnTimeout-b2a7b3fe212eaa732349046d8416e00a9dec26eb7fd347590fbced3ab38af52e.js'></script><script src='https://code.jquery.com/jquery-2.2.4.min.js'></script>
<script >

	var msgs = $('.messages')[0];
	msgs.scrollTo({
		top: msgs.scrollHeight });

$("#profile-img").click(function() {
	$("#status-options").toggleClass("active");
});

$(".expand-button").click(function() {
  $("#profile").toggleClass("expanded");
	$("#contacts").toggleClass("expanded");
});

$("#status-options ul li").click(function() {
	$("#profile-img").removeClass();
	$("#status-online").removeClass("active");
	$("#status-away").removeClass("active");
	$("#status-busy").removeClass("active");
	$("#status-offline").removeClass("active");
	$(this).addClass("active");
	
	if($("#status-online").hasClass("active")) {
		$("#profile-img").addClass("online");
	} else if ($("#status-away").hasClass("active")) {
		$("#profile-img").addClass("away");
	} else if ($("#status-busy").hasClass("active")) {
		$("#profile-img").addClass("busy");
	} else if ($("#status-offline").hasClass("active")) {
		$("#profile-img").addClass("offline");
	} else {
		$("#profile-img").removeClass();
	};
	
	$("#status-options").removeClass("active");
});

function newMessage() {
	var param={};
	var chat_id = $("#btn1").data('chat_id');
	var msg = $(".message-input #msg_cont").val();
	var d = new Date();
	var time = d.getHours() + ":" + d.getMinutes();
	
	$("#msg_cont").val("");
	
	param.chat_id = chat_id;
	param.msg_cont = msg;
	
	$.ajax({
		url : "${cp}/insertMessage",
		contentType : "application/json",
		dataType : "json",
		method : "post",
		data : JSON.stringify(param),
		success : function(data){
			$(".messages ul").append('<li class="replies"><img src="${cp }/empPicture?emp_id='+ data.emp_id +'" alt="" /><p>' + data.msg_cont + '</p> <span>'+ time +'</span></li>');
			
			$('.messages').animate({
				scrollTop: $('.messages').get(0).scrollHeight}, 1000);
		}
	});
};

	var socket = new SockJS("/ws/chat");
	
	socket.onmessage = function(evt) {
		var d = new Date();
		var time = d.getHours() + ":" + d.getMinutes();
		var str = evt.data.split(":")
		
		$(".messages ul").append('<li class="sent"><img src="${cp }/empPicture?emp_id='+ str[0] +'" alt="" /><p>' + str[1] + '</p> <span>'+ time +'</span></li>');
		
		$('.messages').animate({
			scrollTop: $('.messages').get(0).scrollHeight}, 1000);    
	};
	
	socket.onclose = function(evt) {
	}
	
	$("#btn1").on("click", function() {
		message = $(".message-input #msg_cont").val();
		if($.trim(message) == '') {
			return false;
		}
		socket.send(message);
		newMessage();
	})
	
	$(window).on('keydown', function(e) {
		  if (e.which == 13) {
			message = $(".message-input #msg_cont").val();
			if($.trim(message) == '') {
				return false;
			}
			socket.send(message);
		    newMessage();
		    return false;
		  }
	 })
	 
	$(window).bind("beforeunload", function (e){
		<%session.setAttribute("C_USE", "false"); %>
	    opener.location.reload();
	    window.close();
	});

	 
//# sourceURL=pen.js
</script>
</body></html>