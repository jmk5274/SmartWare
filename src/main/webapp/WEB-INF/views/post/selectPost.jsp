<%@page import="kr.or.ddit.smartware.employee.model.Employee"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>
	ol{
		list-style : none;
	}
	.replyDiv{
		background : #f2f2f2;
		padding : 20px; 
	}
	.delCmt:hover{
		cursor: pointer;
	}
</style>
<script>
	$(document).ready(function(){
		$(".delCmt").on("click", function(){
			var com_id = $(this).data("com_id");
			
			$("#com_id").val(com_id);

			$("#hiddenFrm").submit();
		});
	});
</script>
<% 
	HttpSession session1 = request.getSession();
	Employee employee = (Employee) session1.getAttribute("S_EMPLOYEE");
	
	request.setAttribute("employee", employee);
%>
<form action="${cp }/deleteComments" method="post" id="hiddenFrm">
	<input type="hidden" id="com_id" name="com_id" />
	<input type="hidden" id="board_id" name="board_id" value="${board_id }" />
	<input type="hidden" id="post_id" name="post_id" value="${post.post_id }" />
</form>
			<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
			<h2 class="sub-header">${board_nm }</h2>
				<form id="frm" class="form-horizontal" role="form" action="${cp }/modifyPost"
					method="get">

					<div class="form-group">
						<input type="hidden" name="board_id" value="${board_id }"/>
						<input type="hidden" name="board_nm" value="${board_nm }"/>
						<input type="hidden" name="pa_post_id" value="${post.post_id }"/>
						<input type="hidden" name="gn" value="${post.gn }"/>
						<input type="hidden" name="title" value="${post.title }"/>
						<input type="hidden" name="emp_id" value="${post.emp_id }"/>
						<label for="title" class="col-sm-2 control-label">제목</label>
						<div class="col-sm-6">
	                    	<label class="control-label">${post.title } </label>
						</div>
					</div>

					<div class="form-group">
						<label class="col-sm-2 control-label">글 내용</label>
						<div class="col-sm-8">
							<label>${post.cont } </label>
						</div>
					</div>
					
					<div class="form-group">
						<label for="postFile" class="col-sm-2 control-label">첨부파일</label>
						<div class="col-sm-6">
							<c:forEach items="${postfileList }" var="postfile">
								<label class="control-label"> <a href="${cp }/fileDownloadView?file_id=${postfile.file_id}">${postfile.file_nm }</a> </label><br>
							</c:forEach>
						</div>
					</div>
					
					<div class="form-group">
						<label for="postFile" class="col-sm-2 control-label"></label>
						<div class="col-sm-6">
						<c:if test="${employee.emp_id == post.emp_id}">
							<input type="submit" class="btn mb-1 btn-outline-dark" id="btnUpdqtePost" name="btnValue" value="수정"/>
							<input type="submit" class="btn mb-1 btn-outline-dark" id="btnDelPost" name="btnValue" value="삭제"/>
						</c:if>
							<input type="submit" class="btn mb-1 btn-outline-dark" id="btnAnsPost" name="btnValue" value="답글"/>
						</div>
					</div>
				</form>
					
				<form id="cmtFrm" class="form-horizontal" role="form" action="${cp }/insertComments"
					method="post">
					<div class="form-group">
						<label class="col-sm-2 control-label">댓글</label>
						<div class="col-sm-6">
							<c:forEach items="${commentsList }" var="comments">
								<div class="replyDiv">
									<span>
									<c:choose>
										<c:when test="${comments.able == 'T' }">
											<font color="silver">삭제된 댓글입니다.</font>
										</c:when>
										<c:otherwise>
											${comments.cont }&nbsp;&nbsp;&nbsp;[${comments.emp_id } / ${comments.reg_dt }]
										</c:otherwise>
									</c:choose>
									<c:if test="${S_EMPLOYEE.emp_id == comments.emp_id && comments.able=='F'}">
										&nbsp;<span id="deleteComments" class="delCmt glyphicon glyphicon-trash" data-com_id="${comments.com_id }"></span>
									</c:if>
									</span>
								</div>
								<br>
							</c:forEach>
						</div>
					</div>
				
					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-10">
							<div class="col-sm-6">
								<input type="hidden" name="post_id" value="${post.post_id }"/>
								<input type="hidden" name="board_id" value="${board_id }"/>
								<input type="text" class="form-control" id="cont" name="cont"/>
							</div>
							<br><br>
							<div class="col-sm-2">
								<input type="submit" class="btn mb-1 btn-outline-dark" value="댓글저장"/>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>