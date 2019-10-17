<%@page import="kr.or.ddit.smartware.employee.model.Employee"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%
	Employee employee = (Employee) session.getAttribute("S_EMPLOYEE");
	if(employee != null){
		employee.setC_use("false");
		employee.setChat_id("");
		session.setAttribute("S_EMPLOYEE", employee);
	}
%>

<script src="${cp }/js/moment.js"></script>
<script>

	var audio = new Audio('${cp}/audio/카톡.mp3');

	function getChatList(){
		$.ajax({
			url : "${cp}/getChatList",
			contentType : "application/json",
			dataType : "json",
			method : "get",
			success : function(data){
				var chatList = data.chatList;
				var totalCnt = data.totalCnt;
				if (totalCnt==0){
					totalCnt = "";
				}
				var html = "";
				var emp_id = "${S_EMPLOYEE.emp_id}";
				
				$("#chatDtailList ul").empty();
				chatList.forEach(function(chat){
					var msg_cnt = chat.MSG_CNT;
					if(msg_cnt==0){
						msg_cnt = "";
					}
                    html += '<li id="'+chat.CHAT_ID+'" class="notification-unread chatList">'
                    html +=     '<a class="getChatId" data-chat_id="'+chat.CHAT_ID+'" href="#">'
                    html +=         '<img class="float-left mr-3 avatar-img" src="${cp }/empPicture?emp_id='+emp_id+'" alt="">'
                    html +=         '<div class="notification-content">'
                    html +=             '<span class="notification-heading">'+chat.CHAT_NM+' / '+chat.EMP_CNT+'명</span>'	
                    html +=             '<i class="fa fa-times x" style="float : right; visibility:hidden;" data-chat_id="'+chat.CHAT_ID+'"></i>'
                    html +=             '<div class="notification-timestamp">'+chat.MSG_CONT+'<br>'+moment(new Date(chat.SEND_DT)).format('YYYY/MM/DD HH:mm')+'</div>'
                    html +=         '</div>'
	                html +=         '<span id="'+msg_cnt+'" class="badge badge-pill gradient-1">'+msg_cnt+'</span>'
                    html +=     '</a>'
                    html += '</li>'
				})
				$("#totalCnt").text(totalCnt+"");
				$("#chatDtailList ul").append(html);
				
				$(".chatList").hover(function(){
					if($(".x", this).css("visibility") == "visible")
						$(".x", this).css("visibility", "hidden");
					else
						$(".x", this).css("visibility", "visible");
				});
				
				$(".getChatId").click(function(){
					var chat_id = $(this).data("chat_id")+"";
					$.ajax({
						url : "${cp}/getLastMsg",
						method : "get",
						data : "chat_id="+chat_id,
						success : function(data){
							var param = {};
							var msg_id = data.msg_id + "";
							
							param.chat_id = chat_id;
							param.msg_id = msg_id;
							
							$.ajax({
								url : "${cp}/updateLastMsg",
								contentType : "application/json",
								dataType : "json",
								method : "post",
								data : JSON.stringify(param),
								success : function(data){
									getChatList();
								}
							});
						}
					});

					window.open('${cp }/chatRoom?chat_id='+chat_id, '채팅방', 'width=500px, height=650px')
				});
				
				$(".x").click(function(event){
					var param={};
					var chat_id = $(this).data('chat_id');
					
					param.chat_id = chat_id;
					
					$.ajax({
						url : "${cp}/deleteChat",
						contentType : "application/json",
						dataType : "json",
						method : "post",
						data : JSON.stringify(param),
						success : function(data){
							$("#"+data.chat_id).remove();
							socket.send("close:삭제");
						}
					});
					return false;
				});
			}
		});
	}

	var socket = new SockJS("${cp}/ws/chat");
	
	socket.onmessage = function(evt) {
		var str = evt.data.split(":");
		if(str[0]===("msg")){
			getChatList();
			audio.play();
			const toast = Swal.mixin({
				  toast: true,
				  position: 'top-end',
				  showConfirmButton: false,
				  timer: 1500
				});

			toast({
			  type: 'success',
			  title: '메시지가 왔습니다.'
			})
		}
	};
	
	$(function() {
		
		getChatList();
		
	});
	
</script>

<!--**********************************
    Nav header start
***********************************-->
<div class="nav-header">
    <div class="brand-logo">
        <a href="index.html">
            <b class="logo-abbr"><img src="bootstrap/images/logo.png" alt=""> </b>
            <span class="logo-compact"><img src="${cp }/bootstrap/images/logo-compact.png" alt=""></span>
            <span class="brand-title">
                <img src="bootstrap/images/logo-text.png" alt="">
            </span>
        </a>
    </div>
</div>
<!--**********************************
    Nav header end
***********************************-->

<!--**********************************
    Header start
***********************************-->
<div class="header">    
    <div class="header-content clearfix">
        
        <div class="nav-control">
            <div class="hamburger">
                <span class="toggle-icon"><i class="icon-menu"></i></span>
            </div>
        </div>
        
        <div class="header-left">
        </div>
        
        <div class="header-right">
            <ul class="clearfix">
              <c:if test="${sessionScope.S_EMPLOYEE != null}">
            	<li class="icons dropdown"><a href="javascript:void(0)" data-toggle="dropdown">
                        <i class="fa fa-bus"></i>
                        <span class="badge badge-pill gradient-1"></span>
                    </a>
                    <div class="drop-down animated fadeIn dropdown-menu">
                        <div class="dropdown-content-heading d-flex justify-content-between">
                            <span class="">3 New Messages</span>  
                            <a href="javascript:void()" class="d-inline-block">
                                <span class="badge badge-pill gradient-1"></span>
                            </a>
                        </div>
                        <div class="dropdown-content-body">
                            <ul>
                                <li class="notification-unread">
                                    <a href="javascript:void()">
                                        <img class="float-left mr-3 avatar-img" src="bootstrap/images/avatar/1.jpg" alt="">
                                        <div class="notification-content">
                                            <div class="notification-heading">Saiful Islam</div>
                                            <div class="notification-timestamp">08 Hours ago</div>
                                            <div class="notification-text">Hi Teddy, Just wanted to let you ...</div>
                                        </div>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </li>
            	<li class="icons dropdown"><a href="javascript:void(0)" data-toggle="dropdown">
                        <i class="fa fa-phone"></i>
                        <span class="badge badge-pill gradient-1"></span>
                    </a>
                    <div class="drop-down animated fadeIn dropdown-menu">
                        <div class="dropdown-content-heading d-flex justify-content-between">
                            <span class="">3 New Messages</span>  
                            <a href="javascript:void()" class="d-inline-block">
                                <span class="badge badge-pill gradient-1"></span>
                            </a>
                        </div>
                        <div class="dropdown-content-body">
                            <ul>
                                <li class="notification-unread">
                                    <a href="javascript:void()">
                                        <img class="float-left mr-3 avatar-img" src="bootstrap/images/avatar/1.jpg" alt="">
                                        <div class="notification-content">
                                            <div class="notification-heading">Saiful Islam</div>
                                            <div class="notification-timestamp">08 Hours ago</div>
                                            <div class="notification-text">Hi Teddy, Just wanted to let you ...</div>
                                        </div>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </li>
                
                <li class="icons dropdown messenger"><a href="javascript:void(0)" data-toggle="dropdown">
                        <i class="fa fa-users"></i>
		                <span id="totalCnt" class="badge badge-pill gradient-1"></span>
                    </a>
                    <div class="drop-down animated fadeIn dropdown-menu">
                        <div class="dropdown-content-heading d-flex justify-content-between">
                            <span class="">대화방 개설하기</span>  
                            <a href="javascript:void(window.open('${cp }/chatAdd', '채팅방','width=500px, height=650px'))" class="d-inline-block">
                                <i class="fa fa-plus"></i>
                            </a>
                        </div>
                        <div id="chatDtailList" class="dropdown-content-body">
                            <ul>
                            </ul>
                        </div>
                    </div>
                </li>
                <li class="icons dropdown"><a href="javascript:void(0)" data-toggle="dropdown">
                        <i class="mdi mdi-bell-outline"></i>
                        <span class="badge badge-pill gradient-2">3</span>
                    </a>
                    <div class="drop-down animated fadeIn dropdown-menu dropdown-notfication">
                        <div class="dropdown-content-heading d-flex justify-content-between">
                            <span class="">2 New Notifications</span>  
                            <a href="javascript:void()" class="d-inline-block">
                                <span class="badge badge-pill gradient-2">5</span>
                            </a>
                        </div>
                        <div class="dropdown-content-body">
                            <ul>
                                <li>
                                    <a href="javascript:void()">
                                        <span class="mr-3 avatar-icon bg-success-lighten-2"><i class="icon-present"></i></span>
                                        <div class="notification-content">
                                            <h6 class="notification-heading">Events near you</h6>
                                            <span class="notification-text">Within next 5 days</span> 
                                        </div>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </li>
                </c:if>
                <li class="icons dropdown">
                    <div class="user-img c-pointer position-relative"   data-toggle="dropdown">
                        <span class="activity active"></span>
                        <img src="${cp }/empPicture?emp_id=${S_EMPLOYEE.emp_id}" height="40" width="40" alt="">
                    </div>
                    <div class="drop-down dropdown-profile animated fadeIn dropdown-menu">
                        <div class="dropdown-content-body">
                       	 <c:if test="${S_EMPLOYEE != null}">
                            <ul>
                                <li>
                                  <a href="${cp }/mypage"><i class="icon-user"></i>마이페이지</a>
                                </li>
                                <li>
                                    <a href="javascript:void()">
                                        <i class="icon-envelope-open"></i> <span>Inbox</span> <div class="badge gradient-3 badge-pill gradient-1">3</div>
                                    </a>
                                </li>
                                
                                <hr class="my-2">
                                <li>
                                    <a href="page-lock.html"><i class="icon-lock"></i> <span>Lock Screen</span></a>
                                </li>
                                <li><a href="${cp }/logout"><i class="icon-key"></i> <span>Logout</span></a></li>
<%--                                 <li><a href="${cp}/login"><i class="icon-key"></i> <span>Logout</span></a></li> --%>
                            </ul>
                            </c:if>
                            <c:if test="${sessionScope.S_EMPLOYEE == null}">
	                            <ul>
		                            <li><a href="${cp }/login"><i class="icon-key"></i> <span>Login</span></a></li>
		                        </ul>
                            </c:if>
                        </div>
                    </div>
                </li>
            </ul>
        </div>
    </div>
</div>
<button id="btnTest_timer" class="btn btn-warning btn sweet-confirm" style="display : none">confirm</button>
      <!--**********************************
          Header end ti-comment-alt
      ***********************************-->