<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<link href="${cp }/bootstrap/css/style.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.3.0/sockjs.min.js"></script>

<script>
var socket;
function initSocket(url) {
	socket = new SockJS(url);
	
	
	socket.onmessage = function(evt) {
		var d = new Date();
		var time = d.getHours() + ":" + d.getMinutes();
		var str = evt.data.split(":")
		
		$("#data").append('<li class="sent"><img src="http://emilcarlsson.se/assets/mikeross.png" alt="" /><p>' + str[1] + '</p></li><span>'+ time +'</span>');
	};
	
	socket.onclose = function(evt) {
		$("#data").append("연결 종료");
	}
	
	$("#sendBtn").on("click", function() {
		var msg = $("#message").val();
		socket.send(msg);
	});
}
$(document).ready(function() {
	initSocket("/ws/chat");	//websocket 연결
	$(document).scrollTop($(document).height());
});
</script>
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
			<img src="http://emilcarlsson.se/assets/harveyspecter.png" alt="" />
			<p>${chat_nm } </p>
			<div class="social-media">
				<c:choose>
					<c:when test="${chatEmpList.size()==1 }">
						<span>${chatEmpList.get(0).emp_nm } &nbsp; <i class="fa fa-plus" aria-hidden="true"></i></span>
					</c:when>
					<c:otherwise>
						<span>${chatEmpList.get(0).emp_nm } 외 ${chatEmpList.size()-1 }명 &nbsp; <i class="fa fa-plus" aria-hidden="true"></i></span>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
		<div class="messages">
			<ul id="data">
				<c:forEach items="${messageList }" var="message">
					<c:choose>
						<c:when test="${message.EMP_ID != S_EMPLOYEE.emp_id}">
							<li class="sent">
								<img src="http://emilcarlsson.se/assets/mikeross.png" alt="" />
								<p>${message.MSG_CONT }</p>
								<span><fmt:formatDate value="${message.SEND_DT }" pattern="HH:mm"/></span>
							</li>
						</c:when>
						<c:otherwise>
							<li class="replies">
								<img src="http://emilcarlsson.se/assets/harveyspecter.png" alt="" />
								<p>${message.MSG_CONT }</p>
								<span><fmt:formatDate value="${message.SEND_DT }" pattern="HH:mm"/> </span>
							</li>
						</c:otherwise>
					</c:choose>
				</c:forEach>
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
					<button id="sendBtn" class="submit" type="button"><i class="fa fa-paper-plane" aria-hidden="true"></i></button>
				</form>
			</div>
		</div>
	</div>
</div>
</body>
</html>

