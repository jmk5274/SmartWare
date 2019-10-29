<%@page import="kr.or.ddit.smartware.employee.model.Employee"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>


<!DOCTYPE html>
<html class=''>
<head>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<link href="${cp }/bootstrap/css/style.css" rel="stylesheet">
<script src="${cp }/js/jquery-3.4.1.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<link
	href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>

<!------ Include the above in your HEAD tag ---------->
<script
	src='//production-assets.codepen.io/assets/editor/live/console_runner-079c09a0e3b9ff743e39ee2d5637b9216b3545af0de366d4b9aad9dc87e26bfd.js'></script>
<!-- <script src='//production-assets.codepen.io/assets/editor/live/events_runner-73716630c22bbc8cff4bd0f07b135f00a0bdc5d14629260c3ec49e5606f98fdd.js'></script> -->
<script
	src='//production-assets.codepen.io/assets/editor/live/css_live_reload_init-2c0dc5167d60a5af3ee189d570b1835129687ea2a61bee3513dee3a50c115a77.js'></script>
<meta charset='UTF-8'>
<meta name="robots" content="noindex">
<link rel="shortcut icon" type="image/x-icon"
	href="//production-assets.codepen.io/assets/favicon/favicon-8ea04875e70c4b0bb41da869e81236e54394d63638a1ef12fa558a4a835f1164.ico" />
<link rel="mask-icon" type=""
	href="//production-assets.codepen.io/assets/favicon/logo-pin-f2d2b6d2c61838f7e76325261b7195c27224080bc099486ddd6dccb469b8e8e6.svg"
	color="#111" />
<link rel="canonical"
	href="https://codepen.io/emilcarlsson/pen/ZOQZaV?limit=all&page=74&q=contact+" />
<link
	href='https://fonts.googleapis.com/css?family=Source+Sans+Pro:400,600,700,300'
	rel='stylesheet' type='text/css'>

<script src="https://use.typekit.net/hoy3lrg.js"></script>
<script src="${cp }/js/sockjs.min.js"></script>
<script>try{Typekit.load({ async: true });}catch(e){}</script>
<link rel='stylesheet prefetch'
	href='https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css'>
<link rel='stylesheet prefetch'
	href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.2/css/font-awesome.min.css'>
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

#frame .content .messages ul li.sent p a {
	color: white;
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
	font-family: "proxima-nova", "Source Sans Pro", sans-serif;
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
	margin-top: 3px;
	font-size: 1.1em;
	color: #435f7a;
	opacity: .5;
	cursor: pointer;
}

@media screen and (max-width: 735px) {
	#frame .content .message-input .wrap .attachment {
		/*     margin-top: 17px; */
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

#searchTable tr td {
	vertical-align: middle;
}

th {
	font-weight: bold;
}
</style>
</head>
<body>
	<div id="frame">
		<div class="content">
			<div class="contact-profile">
				<c:choose>
					<c:when test="${chat_nm == null || chat_nm == '' }">
					</c:when>
					<c:otherwise>
						<img src="${cp }/employeePicture?emp_id=${S_EMPLOYEE.emp_id}"
							alt="" />
						<p>${chat_nm }</p>
					</c:otherwise>
				</c:choose>
				<div class="social-media">
					<c:choose>
						<c:when test="${chatEmpList == null || chatEmpList.size() == 0 }">
							<span><span id='cnt'></span>&nbsp;
								<div class="bootstrap-modal" style="display: inline-block;">
									<!-- Button trigger modal -->
									<a data-toggle="modal" href="#basicModal"><i
										class="fa fa-plus"></i></a>
									<!-- Modal -->
									<div class="modal fade" id="basicModal" style="display: none;"
										aria-hidden="true">
										<div class="modal-dialog" role="document">
											<div class="modal-content">
												<div class="col-md-6 col-lg-3">
													<div class="card">
														<div class="card-body">
															<p class="card-text d-inline">
																<small class="text-muted">사원 검색</small>
															</p>
															<br>
															<div class="input-group input-group-sm"
																style="width: 200px;">
																<table id="searchTable">
																	<tr>
																		<td style="width: 500px;">
																			<div>
																				<input id="emp_nm" type="text" class="form-control" />
																			</div>
																		</td>
																		<td>
																			<div>
																				<input type="button" id="searchBtn"
																					class="btn btn-primary float-right" value="검색"
																					style="margin-left: 5px;" />
																			</div>
																		</td>
																	</tr>
																</table>
															</div>
														</div>
														<div class="card-footer">
															<p class="card-text d-inline">
																<small class="text-muted empInfo">사원 정보</small>
															</p>
															<br>
															<table id="empTable" class="table table-hover">
																<thead>
																	<tr>
																		<th>이름</th>
																		<th>부서</th>
																		<th>직책</th>
																		<th>선택</th>
																	</tr>
																</thead>
																<tbody>
																	<c:forEach items="${empList }" var="emp">
																		<tr class='empList'>
																			<td>${emp.EMP_NM}</td>
																			<td>${emp.DEPART_NM}</td>
																			<td>${emp.POSI_NM}</td>
																			<td><input data-emp_nm="${emp.EMP_NM }"
																				data-emp_id="${emp.EMP_ID }" type="checkbox"
																				class="listCheck" style="display: inline-block;" />
																			</td>
																		</tr>
																	</c:forEach>
																</tbody>
															</table>
														</div>
													</div>
												</div>
												<div class="modal-footer">
													<button type="button" class="btn btn-secondary"
														data-dismiss="modal">취소</button>
													<button type="button" id="inviteEmp"
														class="btn btn-primary" data-dismiss="modal">초대하기</button>
												</div>
											</div>
										</div>
									</div>
								</div> </span>
						</c:when>
						<c:otherwise>
							<c:choose>
								<c:when test="${chatEmpList.size()==1 }">
									<span><span id='cnt'>${chatEmpList.get(0).emp_nm }</span>
										&nbsp;
										<div class="bootstrap-modal" style="display: inline-block;">
											<!-- Button trigger modal -->
											<a data-toggle="modal" href="#basicModal"><i
												class="fa fa-plus"></i></a>
											<!-- Modal -->
											<div class="modal fade" id="basicModal"
												style="display: none;" aria-hidden="true">
												<div class="modal-dialog" role="document">
													<div class="modal-content">
														<div class="col-md-6 col-lg-3">
															<div class="card">
																<div class="card-body">
																	<p class="card-text d-inline">
																		<small class="text-muted">사원 검색</small>
																	</p>
																	<br>
																	<div class="input-group input-group-sm"
																		style="width: 200px;">
																		<table id="searchTable">
																			<tr>
																				<td style="width: 500px;">
																					<div>
																						<input id="emp_nm" type="text"
																							class="form-control" />
																					</div>
																				</td>
																				<td>
																					<div>
																						<input type="button" id="searchBtn"
																							class="btn btn-primary float-right" value="검색"
																							style="margin-left: 5px;" />
																					</div>
																				</td>
																			</tr>
																		</table>
																	</div>
																</div>
																<div class="card-footer">
																	<p class="card-text d-inline">
																		<small class="text-muted empInfo">사원 정보</small>
																	</p>
																	<br>
																	<table id="empTable" class="table table-hover">
																		<thead>
																			<tr>
																				<th>이름</th>
																				<th>부서</th>
																				<th>직책</th>
																				<th>선택</th>
																			</tr>
																		</thead>
																		<tbody>
																			<c:forEach items="${empList }" var="emp">
																				<tr class='empList'>
																					<td>${emp.EMP_NM}</td>
																					<td>${emp.DEPART_NM}</td>
																					<td>${emp.POSI_NM}</td>
																					<td><input data-emp_nm="${emp.EMP_NM }"
																						data-emp_id="${emp.EMP_ID }" type="checkbox"
																						class="listCheck" style="display: inline-block;" />
																					</td>
																				</tr>
																			</c:forEach>
																		</tbody>
																	</table>
																</div>
															</div>
														</div>
														<div class="modal-footer">
															<button type="button" class="btn btn-secondary"
																data-dismiss="modal">취소</button>
															<button type="button" id="inviteEmp"
																class="btn btn-primary" data-dismiss="modal">초대하기</button>
														</div>
													</div>
												</div>
											</div>
										</div> </span>
								</c:when>
								<c:otherwise>
									<span><span id='cnt'>${chatEmpList.get(0).emp_nm }
											외 ${chatEmpList.size()-1 }명</span>&nbsp;
										<div class="bootstrap-modal" style="display: inline-block;">
											<!-- Button trigger modal -->
											<a data-toggle="modal" href="#basicModal"><i
												class="fa fa-plus"></i></a>
											<!-- Modal -->
											<div class="modal fade" id="basicModal"
												style="display: none;" aria-hidden="true">
												<div class="modal-dialog" role="document">
													<div class="modal-content">
														<div class="col-md-6 col-lg-3">
															<div class="card">
																<div class="card-body">
																	<p class="card-text d-inline">
																		<small class="text-muted">사원 검색</small>
																	</p>
																	<br>
																	<div class="input-group input-group-sm"
																		style="width: 200px;">
																		<table id="searchTable">
																			<tr>
																				<td style="width: 500px;">
																					<div>
																						<input id="emp_nm" type="text"
																							class="form-control" />
																					</div>
																				</td>
																				<td>
																					<div>
																						<input type="button" id="searchBtn"
																							class="btn btn-primary float-right" value="검색"
																							style="margin-left: 5px;" />
																					</div>
																				</td>
																			</tr>
																		</table>
																	</div>
																</div>
																<div class="card-footer">
																	<p class="card-text d-inline">
																		<small class="text-muted empInfo">사원 정보</small>
																	</p>
																	<br>
																	<table id="empTable" class="table table-hover">
																		<thead>
																			<tr>
																				<th>이름</th>
																				<th>부서</th>
																				<th>직책</th>
																				<th>선택</th>
																			</tr>
																		</thead>
																		<tbody id="tbody">
																			<c:forEach items="${empList }" var="emp">
																				<tr class='empList'>
																					<td>${emp.EMP_NM}</td>
																					<td>${emp.DEPART_NM}</td>
																					<td>${emp.POSI_NM}</td>
																					<td><input data-emp_nm="${emp.EMP_NM }"
																						data-emp_id="${emp.EMP_ID }" type="checkbox"
																						class="listCheck" style="display: inline-block;" />
																					</td>
																				</tr>
																			</c:forEach>
																		</tbody>
																	</table>
																</div>
															</div>
														</div>
														<div class="modal-footer">
															<button type="button" class="btn btn-secondary"
																data-dismiss="modal">취소</button>
															<button type="button" id="inviteEmp"
																class="btn btn-primary" data-dismiss="modal">초대하기</button>
														</div>
													</div>
												</div>
											</div>
										</div> </span>
								</c:otherwise>
							</c:choose>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
			<div class="messages">
				<ul id="msg_ul">
					<c:choose>
						<c:when test="${messageList == null || messageList.size() == 0 }">
						</c:when>
						<c:otherwise>
							<c:forEach begin="0" end="${messageList.size()-1 }" var="i" step="1">
								<fmt:formatDate value="${messageList[i].SEND_DT }" pattern="MMdd" var="date1" />
								<fmt:formatDate value="${messageList[i+1].SEND_DT }" pattern="MMdd" var="date2" />
								<c:if test="${i==0 }">
									<li style="text-align:center; font-weight:bold;"><p><fmt:formatDate value="${messageList[i].SEND_DT }" pattern="yyyy년 MM월 dd일" /></p></li>
								</c:if>
								<c:choose>
									<c:when test="${messageList[i].EMP_ID != S_EMPLOYEE.emp_id}">
										<li class="sent msgList" data-msg_id=${messageList[i].MSG_ID }>
											<img src="${cp }/employeePicture?emp_id=${messageList[i].EMP_ID}"
											alt="" />
											<p style='background: none; color: black; font-weight: bold;'>${messageList[i].EMP_NM }</p>
											<div>
												<p>${messageList[i].MSG_CONT }</p>
												<span style='margin-left: 2px;'>
													<fmt:formatDate value="${messageList[i].SEND_DT }" pattern="HH:mm" />
												</span>
											</div>
										</li>
									</c:when>
									<c:otherwise>
										<li class="replies msgList" data-msg_id=${messageList[i].MSG_ID }>
											<img src="${cp }/employeePicture?emp_id=${messageList[i].EMP_ID}" alt="" />
											<p>${messageList[i].MSG_CONT }</p> 
											<span>
												<fmt:formatDate value="${messageList[i].SEND_DT }" pattern="HH:mm" /> 
											</span>
										</li>
									</c:otherwise>
								</c:choose>
								<c:if test="${date1!=date2 && i!=messageList.size()-1}">
									<li style="text-align:center; font-weight:bold;"><p><fmt:formatDate value="${messageList[i+1].SEND_DT }" pattern="yyyy년 MM월 dd일" /></p></li>
								</c:if>
								<c:set var="now" value="<%=new java.util.Date()%>" />
								<c:set var="sysDate"><fmt:formatDate value="${now}" pattern="MMdd" /></c:set>
								<c:if test="${date1!=sysDate && i==messageList.size()-1}">
									<li style="text-align:center; font-weight:bold;"><p><fmt:formatDate value="${now }" pattern="yyyy년 MM월 dd일" /></p></li>
								</c:if>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</ul>
			</div>
			<div class="message-input">
				<div class="wrap">
					<form id="messageFrm" action="${cp }/insertMessage" method="post">
						<input id="msg_cont" name="msg_cont" type="text"
							placeholder="내용을 입력해주세요" autocomplete="off" /> <input
							name="chat_id" type="hidden" value="${chat_id }" /> <label>
							<i id="btn" class="fa fa-paperclip attachment" aria-hidden="true"></i>
							<input id="file" name="file" type="file" style='display: none' />
						</label>
						<button id="btn1" class="submit" type="button"
							data-chat_id="${chat_id }">
							<i class="fa fa-paper-plane" aria-hidden="true"></i>
						</button>
					</form>
				</div>
			</div>
		</div>
	</div>

	<script
		src='//production-assets.codepen.io/assets/common/stopExecutionOnTimeout-b2a7b3fe212eaa732349046d8416e00a9dec26eb7fd347590fbced3ab38af52e.js'></script>
	<script>
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

$("#basicModal").on('hide.bs.modal', function(e){
	$("#emp_nm").val("");
	searchEmp();
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

	var socket = new SockJS("${cp}/ws/chat");
	
	socket.onmessage = function(evt) {
		var d = new Date();
		var hours = d.getHours() + "";
		if(hours.length == 1){
			hours = "0" + d.getHours();
		}
		var minutes = d.getMinutes() + "";
		if(minutes.length == 1){
			minutes = "0" + d.getMinutes();
		}
		var time = hours + ":" + minutes;
		var str = evt.data.split("^");
		console.log(str);
		if(str[0]===("msg")){
// 			console.log(str);
			$(".messages ul").append("<li class='sent msgList' data-msg_id="+ str[5] +"><img src='${cp }/employeePicture?emp_id="+ str[1] +"' alt='' /><p style='background: none; color: black; font-weight: bold;'>"+str[2]+"</p><div><p>" + str[3] + "</p> <span>"+ time +"</span></div></li>");
			
			$('.messages').animate({
				scrollTop: $('.messages').get(0).scrollHeight}, 1000);
		}else if(str[0]===("close")){
			getChatInfo();
			searchEmp();
			
			$(".messages ul").append('<li style="text-align:center; font-weight:bold;"><p>' + str[1] + ' 님이 채팅방을 나갔습니다.</p></li>');
			
			$('.messages').animate({
				scrollTop: $('.messages').get(0).scrollHeight}, 1000); 
		}else if(str[0]===("invite")){

			getChatInfo();
			
			$(".messages ul").append('<li style="text-align:center; font-weight:bold;"><p>' + str[1] + ' 님을 초대했습니다.</p></li>');
			
			$('.messages').animate({
				scrollTop: $('.messages').get(0).scrollHeight}, 1000);
		}
	};
	
	socket.onclose = function(evt) {
	}
	
	$("#btn1").on("click", function() {
		var msg = $(".message-input #msg_cont").val();
		
		if($.trim(msg) == '') {
			return false;
		}
			
		var chat_id = $("#btn1").data('chat_id');
		var msg = $(".message-input #msg_cont").val();
		var d = new Date();
		var hours = d.getHours() + "";
		if(hours.length == 1){
			hours = "0" + d.getHours();
		}
		var minutes = d.getMinutes() + "";
		if(minutes.length == 1){
			minutes = "0" + d.getMinutes();
		}
		var time = hours + ":" + minutes;
		var myForm = document.getElementById('messageFrm');
		var formData = new FormData(myForm);
		
		$.ajax({
			url : "${cp}/insertMessage",
			enctype : "multipart/form-data",
            processData: false,
            contentType: false,
			dataType : "json",
			method : "post",
			data : formData,
			success : function(data){
				var message = "msg^" + data.msg_cont + "^" + chat_id + "^";
				message += data.msg_id + "";
				
				$(".messages ul").append('<li class="replies msgList" data-msg_id='+ data.msg_id +'><img src="${cp }/employeePicture?emp_id='+ data.emp_id +'" alt="" /><p>' + data.msg_cont + '</p> <span>'+ time +'</span></li>');
				
				$('.messages').animate({
					scrollTop: $('.messages').get(0).scrollHeight}, 1000);
				
				$.ajax({
					url : "${cp}/getChatInfo",
					contentType : "application/json",
					dataType : "json",
					method : "get",
					data : "chat_id="+chat_id,
					success : function(data){
						
						var chatEmpList = data.chatEmpList
						
						chatEmpList.forEach(function(chatEmp){
							message += "^" + chatEmp.emp_id
						});
						
						socket.send(message);
					}
				});
				messageFrm.reset();
				$(".message-input #msg_cont").focus();
			}
		});
	})
	
	$(window).on('keydown', function(e) {
		if (e.which == 13) {
			var msg = $(".message-input #msg_cont").val();
			
			if($.trim(msg) == '') {
				return false;
			}
				
			var chat_id = $("#btn1").data('chat_id');
			var msg = $(".message-input #msg_cont").val();
			var d = new Date();
			var hours = d.getHours() + "";
			if(hours.length == 1){
				hours = "0" + d.getHours();
			}
			var minutes = d.getMinutes() + "";
			if(minutes.length == 1){
				minutes = "0" + d.getMinutes();
			}
			var time = hours + ":" + minutes;
			var myForm = document.getElementById('messageFrm');
			var formData = new FormData(myForm);
			
			$.ajax({
				url : "${cp}/insertMessage",
				enctype : "multipart/form-data",
	            processData: false,
	            contentType: false,
				dataType : "json",
				method : "post",
				data : formData,
				success : function(data){
					var message = "msg^" + data.msg_cont + "^" + chat_id + "^";
					message += data.msg_id + "";
					
					$(".messages ul").append('<li class="replies msgList" data-msg_id='+ data.msg_id +'><img src="${cp }/employeePicture?emp_id='+ data.emp_id +'" alt="" /><p>' + data.msg_cont + '</p> <span>'+ time +'</span></li>');
					
					$('.messages').animate({
						scrollTop: $('.messages').get(0).scrollHeight}, 1000);
					
						$.ajax({
							url : "${cp}/getChatInfo",
							contentType : "application/json",
							dataType : "json",
							method : "get",
							data : "chat_id="+chat_id,
							success : function(data){
								
								var chatEmpList = data.chatEmpList
								
								chatEmpList.forEach(function(chatEmp){
									message += "^" + chatEmp.emp_id
								});
								
								socket.send(message);
							}
						});
					
					messageFrm.reset();
					$(".message-input #msg_cont").focus();
				}
			});
			return false;
		}
	 })
	 
	$(window).bind("beforeunload", function (e){
		var param={};
		var msg_id = $('.messages ul li:last-child').data('msg_id'); 
		var chat_id = "${chat_id}";
		
		param.chat_id = chat_id;
		param.msg_id = msg_id;
		
		$.ajax({
			url : "${cp}/updateLastMsg",
			contentType : "application/json",
			dataType : "json",
			method : "post",
			data : JSON.stringify(param),
			success : function(data){
			}
		});
		
	    opener.location.reload();
	    window.close();
	});

	//ajax call을 통해 page, pagesize 해당하는 사용자 데이터를 가져온다.
	$("#searchBtn").on("click", searchEmp);
	
	function searchEmp() {
		var emp_nm = $("#emp_nm").val().trim();
		$("#emp_nm").val("");
		var html = "";
		var flag = false;
		$(".empTable").empty();

		$.ajax({
			url : "${cp}/searchInviteList",
			data : "emp_nm="+emp_nm+"&chat_id=${chat_id}",
			success : function(data){
				
				var empList = data.empList;
				var chatList = data.chatList;
				
				html += "<thead>"
				html += 	"<tr>"
				html += 		"<th>이름</th>"
				html += 		"<th>부서</th>"
				html += 		"<th>직책</th>"
				html += 		"<th>선택</th>"
				html += 	"</tr>"
				html += "</thead>"
					
				if(empList.length==null || empList.length < 1){
					html += "<tbody>"
					html += 	"<tr>"
					html += 	"<td colspan='3'>검색 결과가 없습니다.</td>"
					html += 	"</tr>"
					html += "</tbody>"
				}else{
					empList.forEach(function(emp){
						flag=false;
						chatList.forEach(function(chat){
							if(emp.EMP_ID==chat){ 
								flag=true 
								return;
							}
						})
						if(flag==false){
							html += "<tbody>"
							html += 	"<tr class='empList'>";
							html += 		"<td>" + emp.EMP_NM + "</td>";
							html += 		"<td>" + emp.DEPART_NM + "</td>";
							html += 		"<td>" + emp.POSI_NM + "</td>";
							html += 		"<td> <input data-emp_nm='"+emp.EMP_NM+"'data-emp_id=" + emp.EMP_ID + " type='checkbox' class='listCheck' style='display: inline-block;'/> </td>"
							html += 	"</tr>";
							html += "</tbody>"
						}
					});
				}
				$("#empTable").html(html);
			}
		});
	}
	
	$("#inviteEmp").click(function(){
		var param={};
		var msgList = Array.from($('.messages ul li')).filter(e => e.dataset.msg_id);
		if(msgList.length != 0){
			var msg_id = msgList.slice(-1)[0].dataset.msg_id;	
		}else{
			var msg_id = "";
		}
		var emp_id = new Array(); 
		var chat_id = "${chat_id }";
		var html = "";
		var inviteMsg = "invite";
		 $(':checkbox:checked').each(function(i, a){
			 emp_id.push($(this).data("emp_id"));
			 inviteMsg += "^" + $(this).data("emp_nm")
		 })
		
		$(".empTable").empty();
		 
		$.ajax({
			url : "${cp}/insertChatEmp?chat_id="+chat_id+"&emp_id="+emp_id+"&msg_id="+msg_id,
			contentType : "application/json",
			dataType : "json",
			method : "get",
			success : function(data){
				socket.send(inviteMsg);
				var empList = data.empList;
				var chatList = data.chatList;
				
				if(data.countList==null || data.countList.length == 0){
					$("#cnt").text("");
				}else if(data.countList.length == 1){
					$("#cnt").text(data.countList[0].emp_nm);
				}else{
					$("#cnt").text(data.countList[0].emp_nm + " 외 " + data.cnt + "명");
				}
				
				html += "<thead>"
				html += 	"<tr>"
				html += 		"<th>이름</th>"
				html += 		"<th>부서</th>"
				html += 		"<th>직책</th>"
				html += 		"<th>선택</th>"
				html += 	"</tr>"
				html += "</thead>"
					
				if(empList.length==null || empList.length < 1){
					html += "<tbody>"
					html += 	"<tr>"
					html += 	"<td colspan='3'>검색 결과가 없습니다.</td>"
					html += 	"</tr>"
					html += "</tbody>"
				}else{
					empList.forEach(function(emp){
						flag=false;
						chatList.forEach(function(chat){
							if(emp.EMP_ID==chat){ 
								flag=true 
								return;
							}
						})
						if(flag==false){
							html += "<tbody>"
							html += 	"<tr class='empList'>";
							html += 		"<td>" + emp.EMP_NM + "</td>";
							html += 		"<td>" + emp.DEPART_NM + "</td>";
							html += 		"<td>" + emp.POSI_NM + "</td>";
							html += 		"<td> <input data-emp_nm='"+emp.EMP_NM+"' data-emp_id=" + emp.EMP_ID + " type='checkbox' class='listCheck' style='display: inline-block;'/> </td>"
							html += 	"</tr>";
							html += "</tbody>"
						}
					});
				}
				$("#empTable").html(html);
			}
		});
	});
	
	$("#file").change(function(e){
		var msg = $(".message-input #msg_cont").val();
		
		var chat_id = $("#btn1").data('chat_id');
		var msg = $(".message-input #msg_cont").val();
		var d = new Date();
		var hours = d.getHours() + "";
		if(hours.length == 1){
			hours = "0" + d.getHours();
		}
		var minutes = d.getMinutes() + "";
		if(minutes.length == 1){
			minutes = "0" + d.getMinutes();
		}
		var time = hours + ":" + minutes;
		var myForm = document.getElementById('messageFrm');
		var formData = new FormData(myForm);
		
		$.ajax({
			url : "${cp}/insertMessage",
			enctype : "multipart/form-data",
            processData: false,
            contentType: false,
			dataType : "json",
			method : "post",
			data : formData,
			success : function(data){
				var message = "msg^" + data.msg_cont + "^" + chat_id + "^";
				message += data.msg_id + "";
				$(".messages ul").append('<li class="replies msgList" data-msg_id='+ data.msg_id +'><img src="${cp }/employeePicture?emp_id='+ data.emp_id +'" alt="" /><p>' + data.msg_cont + '</p> <span>'+ time +'</span></li>');
				
				$('.messages').animate({
					scrollTop: $('.messages').get(0).scrollHeight}, 1000);
				
				$.ajax({
					url : "${cp}/getChatInfo",
					async : false,
					contentType : "application/json",
					dataType : "json",
					method : "get",
					data : "chat_id="+chat_id,
					success : function(data){
						
						var chatEmpList = data.chatEmpList
						
						chatEmpList.forEach(function(chatEmp){
							message += "^" + chatEmp.emp_id
						});
						console.log(message);
					}
				});
				console.log(message);
				socket.send(message);
				messageFrm.reset();
				$(".message-input #msg_cont").focus();
			}
		});
	});
	
	function getChatInfo(){
		var chat_id = "${chat_id}"
		$.ajax({
			url : "${cp}/getChatInfo",
			contentType : "application/json",
			dataType : "json",
			method : "get",
			data : "chat_id="+chat_id,
			success : function(data){
				var chatEmpList = data.chatEmpList;
				var empList = data.chatEmpList2;
				var cnt = data.cnt
				var chatEmpSize = "";
				var html = "";
				
				$("#tbody").empty();
				
				if(chatEmpList == null || chatEmpList.length == 0){
					chatEmpSize = "";
				}else if(chatEmpList.length == 1){
					chatEmpSize = chatEmpList[0].emp_nm + "";
				}else{
					chatEmpSize = chatEmpList[0].emp_nm + " 외 " + cnt + "명";
				}
				
				empList.forEach(function(emp){
 					html += '<tr class="empList">'
 					html += 	'<td> '+emp.EMP_NM+' </td>'
					html += 	'<td> '+emp.DEPART_NM+' </td>'
					html += 	'<td> '+emp.POSI_NM+' </td>'
					html += 	'<td> <input data-emp_nm="'+emp.EMP_NM+'" data-emp_id = "'+emp.EMP_ID+'" type="checkbox" class="listCheck" style="display: inline-block;"/> </td>'
					html += '</tr>'
				});
				
				$("#cnt").text(chatEmpSize+"");
				$("#tbody").html(html);
			}
		});
	}
//# sourceURL=pen.js
</script>
</body>
</html>