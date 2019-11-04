<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%--<link href= "${cp }/css/approval/approval.css" rel="stylesheet" />--%>

<script src="${cp }/js/jquery-3.4.1.min.js"></script>
<script>
	$(function () {
		var flag = ${res};
		if (flag) {

			setTimeout(function() {
				socket.send("appr^${emp_id}");
			}, 500);
			<%--socket.send("refer^${emp_id}");--%>
			Swal({
				    title: '전송 성공',
				    text: '전송 되었습니다.',
				    type: 'success',
				    confirmButtonText: '확인'
				});
		}

		$('.applTr').on('click', function () {
			$('#frm').attr('action', "${cp}/approval/" + $(this).data("appl_id")).submit();
		});
	});
</script>

<form id="frm">
	<input type="hidden" id="flag" name="flag" value="s">
</form>
	<div class="container-fluid">
	<div class="row">
		<div class="col-lg-12">
			<div class="card">
				<div class="card-body">

			<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">


				<div class="row">
					<div class="col-sm-12 blog-main">
						<h2 class="sub-header">결재문서(송신)함</h2>
						<div class="table-responsive">
							<table class="table table-hover">
								<tr>
									<th>번호</th>
									<th>신청 유형</th>
									<th>제목</th>
									<th>신청자 이름</th>
									<th>신청 일시</th>
									<th>승인 여부</th>
								</tr>

								<c:forEach items="${applList }" var="appl">
										<tr class="applTr" data-appl_id="${ appl.application.APPL_ID }">
											<td >${appl.application.APPL_ID }</td>
											<td>${appl.application.FORM_NM}</td>
											<td>
												${appl.application.TITLE}
											</td>
											<td>${appl.application.EMP_NM }</td>
											<td><fmt:formatDate value="${appl.application.REG_DT }" pattern="yyyy-MM-dd"/> </td>
											<td>
												<c:forEach items="${appl.applApprs}" var="confirm">
													<c:choose>
														<c:when test="${confirm.able == 'T'}">
															<input type="checkbox" checked disabled>
														</c:when>
														<c:otherwise>
															<input type="checkbox" disabled>
														</c:otherwise>
													</c:choose>
												</c:forEach>
											</td>
									</tr>
								</c:forEach>
							</table>
						</div>
						<div class="bootstrap-pagination">
							<nav>
								<ul class="pagination justify-content-center">
						<%-- 페이지네이션 --%>
									<jsp:include page="sendPagination.jsp">
										<jsp:param name="url" value="${url}"/>
										<jsp:param name="page" value="${page}"/>
										<jsp:param name="paginationSize" value="${paginationSize}"/>
									</jsp:include>

								</ul>
							</nav>
						</div>

					</div>
				</div>
			</div>
			</div>
			</div>
		</div>
	</div>
</div>