<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link href= "${cp }/css/approval/approval.css" rel="stylesheet" />

<script src="${cp }/js/jquery-3.4.1.min.js"></script>
<script>

</script>

<form id="frm" action="${cp }/selectPost" method="get">
	<input type="hidden" id="post_id" name="post_id"/>
	<input type="hidden" id="board_id" name="board_id" value="${board_id }"/>
	<input type="hidden" id="board_nm" name="board_nm" value="${board_nm }"/>
</form>

	<div class="container-fluid">
	<div class="row">
		<div class="col-lg-12">
			<div class="card">
				<div class="card-body">

			<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">


				<div class="row">
					<div class="col-sm-12 blog-main">
						<h2 class="sub-header">${board_nm }</h2>
						<div class="table-responsive">
							<table class="table table-hover">
								<tr>
									<th>번호</th>
									<th>제목</th>
									<th>작성자 아이디</th>
									<th>작성일시</th>
									<th>승인 여부</th>
								</tr>

								<c:forEach items="${applList }" var="appl">
										<tr class="postTr" data-post_id="${ appl.application.appl_id }">
										<td >${appl.application.appl_id }</td>
										<td>
											${appl.application.title}
										</td>
										<td>${appl.application.emp_id }</td>
										<td><fmt:formatDate value="${appl.application.reg_dt }" pattern="yyyy-MM-dd"/> </td>
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
				
<%--						<div class="bootstrap-pagination">--%>
<%--							<nav>--%>
<%--					  --%>
<%--								<ul class="pagination justify-content-center">--%>
<%--								<!-- 이전 페이지 가기 : 지금 있는 페이지에서 한페이지 전으로 -->--%>
<%--									--%>
<%--									<c:choose>--%>
<%--										<c:when test="${page == 1 }">--%>
<%--											<li class="page-item  disabled"><a class="page-link" href="#" tabindex="-1">&laquo;</a></li>--%>
<%--												<span aria-hidden="Previous"></span>--%>
<%--										</c:when>--%>
<%--										<c:otherwise>--%>
<%--											<li class="page-item">--%>
<%--								 				<a class="page-link" href="${cp }/post?page=1&board_id=${board_id}" aria-label="Previous">--%>
<%--													<span aria-hidden="true">&laquo;</span>--%>
<%--												</a>--%>
<%--											</li>--%>
<%--										</c:otherwise>--%>
<%--									</c:choose>--%>
<%--											--%>
<%--											--%>
<%--									<c:choose>--%>
<%--										<c:when test="${page == 1 }">--%>
<%--											<li class="page-item disabled"><a class="page-link" href="#" tabindex="-1">&lt;</a></li>--%>
<%--										</c:when>--%>
<%--										<c:otherwise>--%>
<%--											<li class="page-item"><a class="page-link" href="${cp }/post?page=${page-1}&board_id=${board_id}" tabindex="-1">&lt;</a></li>--%>
<%--										</c:otherwise>--%>
<%--									</c:choose>--%>
<%--									--%>
<%--									<c:forEach begin="1" end="${paginationSize }" var="i">--%>
<%--										<c:choose>--%>
<%--											<c:when test="${i == page }">--%>
<%--												 <li class="page-item disabled"><span class="page-link">${i }</span></li>--%>
<%--											</c:when>--%>
<%--											<c:otherwise>--%>
<%--												 <li class="page-item"><a class="page-link" href="${cp }/post?page=${i }&board_id=${board_id}">${i }</a></li>--%>
<%--											</c:otherwise>--%>
<%--										</c:choose>--%>
<%--									</c:forEach>--%>
<%--									--%>
<%--									<c:choose>--%>
<%--										<c:when test="${page == paginationSize || paginationSize == 0}">--%>
<%--											<li class="page-item disabled"><a class="page-link" href="#">&gt;</a></li>--%>
<%--										</c:when>--%>
<%--										<c:otherwise>--%>
<%--												<li class="page-item"><a class="page-link" href="${cp }/post?page=${page+1}&board_id=${board_id}">&gt;</a>--%>
<%--                                            </li>--%>
<%--										</c:otherwise>--%>
<%--									</c:choose>--%>
<%--									--%>
<%--									<c:choose>--%>
<%--										<c:when test="${page == paginationSize || paginationSize == 0}">--%>
<%--											<li class="page-item disabled"><a class="page-link" href="#">&raquo;</a></li>--%>
<%--												<span aria-hidden="Next"></span>--%>
<%--										</c:when>--%>
<%--										<c:otherwise>--%>
<%--											<li class="page-item">--%>
<%--								 				<a class="page-link" href="${cp }/post?page=${paginationSize }&board_id=${board_id}" aria-label="Previous">--%>
<%--													<span aria-hidden="true">&raquo;</span>--%>
<%--												</a>--%>
<%--											</li>--%>
<%--										</c:otherwise>--%>
<%--									</c:choose>--%>
<%--					--%>
<%--								</ul>--%>
<%--							</nav>--%>
<%--						</div>--%>
					</div>
				</div>
			</div>
			</div>
			</div>
		</div>
	</div>
</div>