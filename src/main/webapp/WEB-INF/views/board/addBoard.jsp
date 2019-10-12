<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="${cp }/js/jquery-3.4.1.min.js"></script>
<script>
	$(function(){
		if("${res }"){
			alert("${res }");
		}
	});
</script>
	<div class="container-fluid">
	<div class="row">
		<div class="col-lg-12">
			<div class="card">
				<div class="card-body">
				
			<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
			
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

				<c:forEach items="${A_BOARDLIST }" var="list">
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
										<c:when test="${list.able == 'T' }">
											<option selected>사용</option>
											<option>미사용</option>
										</c:when>
										<c:when test="${list.able == 'F' }">
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
	</div>
</div>
</div>