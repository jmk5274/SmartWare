<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="${cp }/js/jquery-3.4.1.min.js"></script>
<script>
	$(document).ready(function(){
		
		if("${res }"){
			alert("${res }");
		}
		
		$(".postTr").on("click", function(){
			var post_id = $(this).data("post_id");
			$("#post_id").val(post_id);
			$("#frm").submit();
		});
		
	});
</script>

<form id="frm" action="${cp }/selectPost" method="get">
	<input type="hidden" id="post_id" name="post_id"/>
	<input type="hidden" id="board_id" name="board_id" value="${board_id }"/>
	<input type="hidden" id="board_nm" name="board_nm" value="${board_nm }"/>
</form>

	<div class="container-fluid">
		<div class="row">

			<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">


				<div class="row">
					<div class="col-sm-8 blog-main">
						<h2 class="sub-header">${board_nm }</h2>
						<div class="table-responsive">
							<table class="table table-hover">
								<tr>
									<th>게시글 번호</th>
									<th>제목</th>
									<th>작성자 아이디</th>
									<th>작성일시</th>
								</tr>

								<c:forEach items="${postList }" var="list">
									<c:choose>
										<c:when test="${list.able=='F' }">
											<tr class="postTr" data-post_id="${ list.post_id }">
										</c:when>
										<c:otherwise>
											<tr class="postTr" data-post_id="">
										</c:otherwise>
									</c:choose>
										<td >${list.post_id }</td>
										<td>
										<c:forEach begin="0" end="${(list.level-1)*2 }" var="i">
											&nbsp;
										</c:forEach>
										<c:if test="${(list.level-1)*2 != 0 }">
											➔
										</c:if>
										
										<c:choose>
											<c:when test="${list.able == 'T' }">
												삭제된 게시글입니다.
											</c:when>
											<c:otherwise>
												${list.title }
											</c:otherwise>										
										</c:choose>
										</td>
										
										<td>${list.emp_id }</td>
										<td><fmt:formatDate value="${list.reg_dt }" pattern="yyyy-MM-dd"/> </td>
									</tr>
								</c:forEach>
							</table>
						</div>
						<c:if test="${S_EMPLOYEE.emp_id == 'e0002' || board_id != 'board0003'}">
						<a href="${cp }/writePost?board_id=${board_id}" class="btn mb-1 btn-outline-dark pull-right">글 작성</a>
						</c:if>
				
						<div class="bootstrap-pagination">
							<nav>
					  
								<ul class="pagination justify-content-center">
								<!-- 이전 페이지 가기 : 지금 있는 페이지에서 한페이지 전으로 -->
									
									<c:choose>
										<c:when test="${page == 1 }">
											<li class="page-item  disabled"><a class="page-link" href="#" tabindex="-1">&laquo;</a></li>
												<span aria-hidden="Previous"></span>
										</c:when>
										<c:otherwise>
											<li class="page-item">
								 				<a class="page-link" href="${cp }/post?page=1&board_id=${board_id}" aria-label="Previous">
													<span aria-hidden="true">&laquo;</span>
												</a>
											</li>
										</c:otherwise>
									</c:choose>
											
											
									<c:choose>
										<c:when test="${page == 1 }">
											<li class="page-item disabled"><a class="page-link" href="#" tabindex="-1">&lt;</a></li>
										</c:when>
										<c:otherwise>
											<li class="page-item"><a class="page-link" href="${cp }/post?page=${page-1}&board_id=${board_id}" tabindex="-1">&lt;</a></li>
										</c:otherwise>
									</c:choose>
									
									<c:forEach begin="1" end="${paginationSize }" var="i">
										<c:choose>
											<c:when test="${i == page }">
												 <li class="page-item disabled"><span class="page-link">${i }</span></li>
											</c:when>
											<c:otherwise>
												 <li class="page-item"><a class="page-link" href="${cp }/post?page=${i }&board_id=${board_id}">${i }</a></li>
											</c:otherwise>
										</c:choose>
									</c:forEach>
									
									<c:choose>
										<c:when test="${page == paginationSize || paginationSize == 0}">
											<li class="page-item disabled"><a class="page-link" href="#">&gt;</a></li>
										</c:when>
										<c:otherwise>
												<li class="page-item"><a class="page-link" href="${cp }/post?page=${page+1}&board_id=${board_id}">&gt;</a>
                                            </li>
										</c:otherwise>
									</c:choose>
									
									<c:choose>
										<c:when test="${page == paginationSize || paginationSize == 0}">
											<li class="page-item disabled"><a class="page-link" href="#">&raquo;</a></li>
												<span aria-hidden="Next"></span>
										</c:when>
										<c:otherwise>
											<li class="page-item">
								 				<a class="page-link" href="${cp }/post?page=${paginationSize }&board_id=${board_id}" aria-label="Previous">
													<span aria-hidden="true">&raquo;</span>
												</a>
											</li>
										</c:otherwise>
									</c:choose>
					
								</ul>
							</nav>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>