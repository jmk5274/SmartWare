<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="${cp }/js/jquery-3.4.1.min.js"></script>
<script>
	$(function(){
		if("${res }"){
			alert("${res }");
		}
		
		$("#insert").on("click", function(event){
			var newBoard_nm = $("#newBoard_nm").val();
			
			if(newBoard_nm == '' || newBoard_nm.length == 0){
				event.preventDefault();
				Swal({
					type: 'warning', // success, error, warning, info, question
					title: '필수 사항',
					text: '게시판 이름을 입력해주세요.'
				})
				return;
			}
			
			$("#frm").submit();
		});
	});
</script>
<style>
	td {
		text-align : center;
		padding : 20px;
	}
</style>
	<div class="container-fluid">
	<div class="row">
		<div class="col-lg-12">
			<div class="card">
				<div class="card-body">
				
			<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
			
				<div class="blog-header">
					<h1 class="blog-title">게시판 관리</h1>
				</div>
				<hr>
				<br><br>
				
				<form id="dawin" class="form-horizontal" role="form" action="${cp }/addBoard" method="post">
					<div class="form-group">
						<table class="table table-bordered">
							<tr>
						<td><label for="board" class="col-sm-6 control-label">게시판 이름</label></td>
						<td>
<!-- 						<div class="col-sm-2"> -->
							<input id="newBoard_nm" type="text" name="board_nm" class="form-control"/>
<!-- 						</div> -->
						</td>
						<td>
<!-- 						<div class="col-sm-1"> -->
							<select name="able" class="form-control">
								<option>사용</option>
								<option>미사용</option>
							</select>
							</td>
<!-- 						</div> -->
						
<!-- 						<div class="col-sm-2"> -->
							<td><input id="insert" type="submit" name="btnValue" class="btn btn-primary" value="생성"></td>
							</tr>
<!-- 						</div> -->
					</div>
				</form>
				
				<c:forEach items="${A_BOARDLIST }" var="list">
					<form id="frm" class="form-horizontal" role="form" action="${cp }/addBoard" method="post">
						<div class="form-group">
							<input type="hidden" name=board_id value="${list.board_id}"/>
							<tr>
							<td><label for="board" class="col-sm-6 control-label">게시판 이름</label></td>
<!-- 							<div class="col-sm-2"> -->
							<td>
								<input type="text" name="board_nm" class="form-control" value="${list.board_nm }"/>
							</td>
							</div>
							<td>
<!-- 							<div class="col-sm-1"> -->
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
<!-- 							</div> -->
							</td>
							
							<td>
<!-- 							<div class="col-sm-2"> -->
								<input type="submit" name="btnValue" class="btn btn-dark" value="수정">
<!-- 							</div> -->
							</td>
 						</div>
						</tr>
					</form>
				</c:forEach>
				</table>
						<div class="row">
						<div class="col-sm-8 blog-main">
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- </div> -->