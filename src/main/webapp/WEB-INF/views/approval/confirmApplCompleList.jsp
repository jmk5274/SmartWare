<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%--<link href= "${cp }/css/approval/approval.css" rel="stylesheet" />--%>

<script src="${cp }/js/jquery-3.4.1.min.js"></script>
<script>
	$( function () {
		$('.applTr').on('click', function () {
			$('#frm').attr('action', "${cp}/approval/" + $(this).data("appl_id")).submit();
		});

		var msg = "appr^${appr_emp}";
		if (msg) {
			setTimeout(function() {
				console.log(msg);
				socket.send(msg);
			}, 500);
		}
	});
</script>

<form id="frm">
	<input type="hidden" id="flag" name="flag" value="cc">
</form>
	<div class="container-fluid">
	<div class="row">
		<div class="col-lg-12">
			<div class="card">
				<div class="card-body">

			<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">


				<div class="row">
					<div class="col-sm-12 blog-main">
						<h2 class="sub-header">결재문서(수신) 완료함</h2>
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
										<tr class="applTr" data-appl_id="${ appl.APPL_ID }">
											<td >${appl.APPL_ID }</td>
											<td>${appl.FORM_NM}</td>
											<td>
												${appl.TITLE}
											</td>
											<td>${appl.EMP_NM }</td>
											<td><fmt:formatDate value="${appl.REG_DT }" pattern="yyyy-MM-dd"/> </td>
											<td>
												<c:choose>
													<c:when test="${appl.ABLE == 'T'}">
														<input type="checkbox" checked disabled>
													</c:when>
													<c:otherwise>
														<input type="checkbox" disabled>
													</c:otherwise>
												</c:choose>
											</td>
									</tr>
								</c:forEach>
							</table>
						</div>
				
						<div class="bootstrap-pagination">
							<nav>

								<ul class="pagination justify-content-center">
									<jsp:include page="confirmPagination.jsp">
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