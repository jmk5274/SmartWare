<%@page import="kr.or.ddit.smartware.employee.model.Employee"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<meta name="description" content="">
<meta name="author" content="">
 <!-- Favicon icon -->
	<link rel="icon" type="image/png" sizes="16x16" href="images/favicon.png">
    <!-- Pignose Calender -->
    <link href="${cp}/bootstrap/plugins/pg-calendar/css/pignose.calendar.min.css" rel="stylesheet">
    <!-- Chartist -->
    <link rel="stylesheet" href="${cp}/bootstrap/plugins/chartist/css/chartist.min.css">
    <link rel="stylesheet" href="${cp}/bootstrap/plugins/chartist-plugin-tooltips/css/chartist-plugin-tooltip.css">
    <!-- Custom Stylesheet -->
    <link href="${cp}/bootstrap/css/style.css" rel="stylesheet">

<title>Jsp-Main</title>
<%@ include file="/WEB-INF/views/commonJsp/basicLib.jsp"%>
<script>
	$(function(){
		if("${res }"){
			alert("${res }");
		}
	});
</script>
</head>

<body>

	<!-- header -->
	<%@ include file="/WEB-INF/views/commonJsp/header.jsp"%>

	<div class="container-fluid">
		<div class="row">

			<div class="col-sm-3 col-md-2 sidebar">

				<%@ include file="/WEB-INF/views/commonJsp/left.jsp"%>

			</div>
				
			<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
				<br>
				<br>
				
				<div class="blog-header">
					<h1 class="blog-title">메뉴 관리</h1>
				</div>
				<hr>
				<br><br>
				
				<form class="form-horizontal" role="form" action="${cp }/addBoard" method="post">
					<div class="form-group">
						<label for="board" class="col-sm-2 control-label">게시판 이름</label>
						<div class="col-sm-2">
							<input type="text" name="board_nm" class="form-control"/>
						</div>
						<div class="col-sm-1">
							<select name="able" class="form-control">
								<option>사용</option>
								<option>미사용</option>
							</select>
						</div>
						
						<div class="col-sm-2">
							<input type="submit" name="btnValue" class="btn mb-1 btn-outline-info" value="생성">
						</div>
					</div>
				</form>

				<c:forEach items="${boardList }" var="list">
					<form class="form-horizontal" role="form" action="${cp }/addBoard" method="post">
						<div class="form-group">
							<input type="hidden" name=board_id value="${list.board_id}"/>
							<label for="board" class="col-sm-2 control-label">게시판 이름</label>
							<div class="col-sm-2">
								<input type="text" name="board_nm" class="form-control" value="${list.board_nm }"/>
							</div>
							<div class="col-sm-1">
								<select name="able" class="form-control">
									<c:choose>
										<c:when test="${list.able == 'Y' }">
											<option selected>사용</option>
											<option>미사용</option>
										</c:when>
										<c:when test="${list.able == 'N' }">
											<option>사용</option>
											<option selected>미사용</option>
										</c:when>
									</c:choose>
								</select>
							</div>
							
							<div class="col-sm-2">
								<input type="submit" name="btnValue" class="btn mb-1 btn-outline-success" value="수정">
							</div>
						</div>
					</form>
				</c:forEach>
						<div class="row">
						<div class="col-sm-8 blog-main">
						</div>
						</div>
				</div>
			</div>
		</div>
</body>
</html>