<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="${cp }/js/jquery-3.4.1.min.js"></script>
<script>
//사용자 정보 클릭시 이벤트 핸들러
// $(document).ready(function(){
	$(function(){
		if("${res }"){
			alert("${res }");
		}
	});
// 	$(".deleteEmp").on("click", function(){
// 		alert("${employee.EMP_ID}사원을 삭제하시겠습니까?");
// 	})
// 	$(".userTr").on("click", function(){
//}
</script>

<%-- <form id="frm" action="${cp }/user/user" method="get"> --%>
<!-- 	<input type="hidden" id="emp_id" name="emp_id" /> -->
<!-- </form> -->

	<div class="container-fluid">
	<div class="row">
		<div class="col-lg-12">
			<div class="card">
				<div class="card-body">

			<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">


				<div class="row">
					<div class="col-sm-8 blog-main">
					<h2 class="sub-header">사원 리스트</h2>
						<div class="table-responsive">
							<table class="table table-hover">
								<tr>
									<th>사원 아이디</th>
									<th>사원 이름</th>
									<th>부서</th>
									<th>직책</th>
									<th>입사일</th>
								</tr>
								
								<c:forEach items="${employeeList }" var="employee">
									<tr class="employeeTr" data-emp_id="${employee.EMP_ID}">
										<input type="hidden" value="${employee.EMP_ID}"/>
										<td>${employee.EMP_ID }</td>
										<td>${employee.EMP_NM }</td>
										<td>${employee.DEPART_ID }</td>
										<td>${employee.POSI_ID }</td>
										<td><fmt:formatDate value="${employee.JOIN_DT }" pattern="yyyy-MM-dd"/></td>
										<td><a href="${cp }/updateEmployee" class="btn mb-1 btn-outline-success pull-right">비활성화</a>
										<a href="${cp }/deleteEmployee?emp_id=${employee.EMP_ID}" id="deleteEmp" class="deleteEmp btn mb-1 btn-outline-dark pull-right">삭제</a>
										<a href="${cp }/updateEmployee" class="btn mb-1 btn-outline-primary pull-right">직책 변경</a></td>
									</tr>
								</c:forEach>
							</table>
						</div>
<!-- 사원 추가 -->				<a href="${cp }/insertEmployee" class="btn mb-1 btn-outline-primary pull-right">사원 추가</a>
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
		</div>
	</div>
</div>