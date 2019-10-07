<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
                <li class="icons dropdown"><a href="javascript:void(0)" data-toggle="dropdown">
                        <i class="fa fa-users"></i>
                        <span class="badge badge-pill gradient-1">3</span>
                    </a>
                    <div class="drop-down animated fadeIn dropdown-menu">
                        <div class="dropdown-content-heading d-flex justify-content-between">
                            <span class="">3 New Messages</span>  
                            <a href="javascript:void()" class="d-inline-block">
                                <span class="badge badge-pill gradient-1">3</span>
                            </a>
                        </div>
                        <div class="dropdown-content-body">
                            <ul>
                            	<c:forEach items="${A_CHATLIST }" var="chat">
	                                <li class="notification-unread">
	                                    <a href="javascript:void(window.open('${cp }/chatRoom', '채팅방','width=500px, height=650px'))">
	                                        <img class="float-left mr-3 avatar-img" src="bootstrap/images/avatar/1.jpg" alt="">
	                                        <div class="notification-content">
	                                            <div class="notification-heading">${chat.CHAT_NM } / ${chat.CNT }명</div>
<!-- 	                                            <div class="notification-timestamp">08 Hours ago</div> -->
	                                            <div class="notification-text">${chat.MSG_CONT }</div>
	                                        </div>
	                                        <p><fmt:formatDate value="${chat.SEND_DT }" pattern="yyyy/MM/dd"/></p>
	                                    </a>
	                                </li>
                            	</c:forEach>
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
                
                <li class="icons dropdown">
                    <div class="user-img c-pointer position-relative"   data-toggle="dropdown">
                        <span class="activity active"></span>
                        <img src="bootstrap/images/user/1.png" height="40" width="40" alt="">
                    </div>
                    <div class="drop-down dropdown-profile animated fadeIn dropdown-menu">
                        <div class="dropdown-content-body">
                            <ul>
                                <li>
                                    <a href="app-profile.html"><i class="icon-user"></i> <span>Profile</span></a>
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
                                <li><a href="${cp}/login"><i class="icon-key"></i> <span>Logout</span></a></li>
                            </ul>
                        </div>
                    </div>
                </li>
            </ul>
        </div>
    </div>
</div>
      <!--**********************************
          Header end ti-comment-alt
      ***********************************-->