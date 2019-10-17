<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="nk-sidebar">           
    <div class="nk-nav-scroll">
        <ul class="metismenu" id="menu">
            <li class="nav-label">SmartWare</li>
            <li>
                <a class="has-arrow" href="javascript:void()" aria-expanded="false">
                    <i class="icon-envelope menu-icon"></i><span class="nav-text">전자메일</span>
                </a>
                <ul aria-expanded="false">
                    <li><a href="${cp }/writeMail">메일 작성</a></li>
                    <li><a href="${cp }/mailbox?emailLabel=INBOX">받은 편지함</a></li>
                    <li><a href="${cp }/mailbox?emailLabel=[Gmail]/보낸편지함">보낸 편지함</a></li>
                    <li><a href="${cp }/mailbox?emailLabel=[Gmail]/별표편지함">별표 편지함</a></li>
                    <li><a href="${cp }/mailbox?emailLabel=[Gmail]/휴지통">휴지통</a></li>
                    <li><a href="${cp }/mailbox?emailLabel=[Gmail]/스팸함">스팸 편지함</a></li>
                </ul>
            </li>
            <li class="mega-menu mega-menu-sm">
                <a class="has-arrow" href="javascript:void()" aria-expanded="false">
<!--                     <i class="fab fa-wpforms"></i><span class="nav-text">전자결재</span> -->
                    <i class="fa fa-file-text-o menu-icon"></i><span class="nav-text">전자결재</span>
                </a>
                <ul aria-expanded="false">
                    <li><a href="${cp }/approval/approvalPage">결재하기</a></li>
                    <li><a href="${cp }/bootstrap/layout-fixed-header.html">결재문서 보기</a></li>
                </ul>
            </li>
            <li>
                <a class="has-arrow" href="javascript:void()" aria-expanded="false">
                    <i class="fa fa-list-alt menu-icon"></i> <span class="nav-text">사내 게시판</span>
                </a>
                <ul aria-expanded="false">
                <c:if test="${S_EMPLOYEE.rank == 'admin'}">
                    <li><a href="${cp }/addBoard">메뉴 관리</a></li>                    
                </c:if>
                    <c:forEach items="${A_BOARDLIST }" var="list">
			        	<c:if test="${list.able == 'T' }">
			 		       	<li class="active"><a href="${cp }/post?board_id=${list.board_id}&board_nm=${list.board_nm}">${list.board_nm} <span class="sr-only">(current)</span></a></li>
			        	</c:if>
			        </c:forEach>  
<%--                     <li><a href="${cp }/bootstrap/email-inbox.html">소통 게시판</a></li> --%>
<%--                     <li><a href="${cp }/bootstrap/email-compose.html">자료실</a></li> --%>
                </ul>
            </li>
            <li>
                <a href="${cp }/calendar" aria-expanded="false">
                    <i class="fa fa-calendar menu-icon"></i><span class="nav-text">일정관리</span>
                </a>
            </li>
            <li>
                <a class="has-arrow" href="javascript:void()" aria-expanded="false">
                    <i class="fa fa-sitemap"></i> <span class="nav-text">조직도</span>
                </a>
                <ul aria-expanded="false">
                    <li><a href="${cp }/bootstrap/chart-flot.html">조직도 조회</a></li>
                    <li><a href="${cp }/bootstrap/chart-morris.html">사원 검색</a></li>
                    <c:if test="${S_EMPLOYEE.emp_id == 'e0002'}">
                    <li><a href="${cp }/employeeList">사원 관리</a></li>
                    </c:if>
                </ul>
            </li>
            <li>
                <a class="has-arrow" href="javascript:void()" aria-expanded="false">
                    <i class="icon-grid menu-icon"></i><span class="nav-text">PMS</span>
                </a>
                <ul aria-expanded="false">
                    <li><a href="${cp }/bootstrap/ui-accordion.html">일감 조회</a></li>
                    <li><a href="${cp }/bootstrap/ui-alert.html">일감 추가</a></li>
                </ul>
            </li>
            
            <li>
                <a href="${cp }/useForm" aria-expanded="false">
                    <i class="icon-grid menu-icon"></i><span class="nav-text">양식 예제</span>
                </a>
            </li>
        </ul>
    </div>
</div>