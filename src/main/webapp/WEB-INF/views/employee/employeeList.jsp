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
		
	$(".deleteEmp").on("click", function(){
		alert("해당 사원을 삭제하시겠습니까?");
	})
	
	$(".updateBtn").on("click", function(){
		
		$("#selectEmp").val(($(this).parents("tr")).attr("id"));
		$("#updateBtn").val($(this).attr("value"));
		var emp_id = ($(this).parents("tr")).attr("id");
		$("#updateAble").val($("#updateAble"+emp_id + " option:selected").val());
		console.log($("#updateBtn").val());
		$("#frm").submit();
	})
	
	$(".updateBtn2").on("click", function(){
		$("#selectEmp").val(($(this).parents("tr")).attr("id"));
		$("#updateBtn2").val($(this).attr("value"));
		var emp_id = ($(this).parents("tr")).attr("id");
		$("#updateRank").val($("#updateRank"+emp_id + " option:selected").val());
		console.log($("#updateRank"+emp_id + " option:selected").val());
		$("#frm").submit();
	})
	
	$(".updateBtn3").on("click", function(){
		$("#selectEmp").val(($(this).parents("tr")).attr("id"));
		$("#updateBtn3").val($(this).attr("value"));
		var emp_id = ($(this).parents("tr")).attr("id");
		$("#updateDepart").val($("#updateDepart"+emp_id + " option:selected").val());
		console.log($("#updateDepart"+emp_id + " option:selected").val());
		$("#frm").submit();
	})

});
	

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
					<div class="col-sm-12 blog-main">
					<h2 class="sub-header">사원 리스트</h2>
						<div class="table-responsive">
				<form id="frm" class="form-horizontal" action="${cp }/updateEmployee" method="post">
					<input id="selectEmp" name="emp_id" type="hidden"/>
					<input id="updateBtn" name="updateBtn" type="hidden"/>
					<input id="updateBtn2" name="updateBtn2" type="hidden"/>
					<input id="updateBtn3" name="updateBtn3" type="hidden"/>
					<input id="updateRank" name="posi_id" type="hidden"/>
					<input id="updateAble" name="able" type="hidden"/>
					<input id="updateDepart" name="depart_id" type="hidden"/>
					
					<div class="form-group">
							<table class="table table-hover">
								<tr>
									<th>사원 아이디</th>
									<th>사원 이름</th>
									<th>부서</th>
									<th>직책</th>
									<th>입사일</th>
								</tr>
								<td>
								<input id="emp_id2" type="text" name="emp_id2" class="form-control" value="${employee.EMP_ID }"/>
								</td>
								<td>
								<input id="pass2" type="text" name="pass2" class="form-control" value="${employee.PASS }"/>
								</td>
								<td>
								<input id="emp_nm2" type="text" name="emp_nm2" class="form-control" value="${employee.EMP_NM }"/>
								</td>
<!-- 								<td> -->
<%-- 								<c:forEach items="${departmentList }" var="department"> --%>
<%-- 										<td value="${department.depart_id }">${department.depart_nm }</td> --%>
<%-- 								</c:forEach> --%>
<!-- 								</td> -->
								<td><fmt:formatDate value="${employee.JOIN_DT }" pattern="yyyy-MM-dd"/></td>
								</table>
								<br>
								<br>
								<br>
								<br>
								<div class="form-group">
							<table class="table table-hover">
								<tr>
									<th>사원 아이디</th>
									<th>사원 이름</th>
									<th>부서</th>
									<th>직책</th>
									<th>입사일</th>
								</tr>
								<c:forEach items="${employeeList }" var="employee">
									<tr id="${employee.EMP_ID}" class="employeeTr" data-emp_id="${employee.EMP_ID}">
										<td>${employee.EMP_ID }</td>
										<td>${employee.EMP_NM }</td>
										<c:if test="${employee.ABLE == 'T' }">
										<td><select id="updateDepart${employee.EMP_ID}" name="updatedepartment" class="form-control">
										<c:forEach items="${departmentList }" var="department">
												<c:choose>
													<c:when test="${employee.DEPART_ID == department.depart_id}">
														<option value="${employee.DEPART_ID}" selected>${department.depart_nm}</option>
													</c:when>
													<c:otherwise>
														<option value="${department.depart_id}">${department.depart_nm}</option>
													</c:otherwise>
												</c:choose>
										</c:forEach>
											</select>
										</td>
										</c:if>
										
										<c:if test="${employee.ABLE == 'F' }">
										<td><select id="updateDepart${employee.EMP_ID}" name="updatedepartment" class="form-control" disabled>
										<c:forEach items="${departmentList }" var="department">
												<c:choose>
													<c:when test="${employee.DEPART_ID == department.depart_id}">
														<option value="${employee.DEPART_ID}" selected>${department.depart_nm}</option>
													</c:when>
													<c:otherwise>
														<option value="${department.depart_id}">${department.depart_nm}</option>
													</c:otherwise>
												</c:choose>
										</c:forEach>
											</select>
										</td>
										</c:if>
										
										
										<c:if test="${employee.ABLE == 'T' }">
										<td><select id="updateRank${employee.EMP_ID}" name="updaterank" class="form-control">
										<c:forEach items="${positionList }" var="position">
												<c:choose>
													<c:when test="${employee.POSI_ID == position.posi_id}">
														<option value="${employee.POSI_ID}" selected>${position.posi_nm}</option>
													</c:when>
													<c:otherwise>
														<option value="${position.posi_id}">${position.posi_nm}</option>
													</c:otherwise>
												</c:choose>
										</c:forEach>
											</select>
										</td>
										</c:if>
										
										<c:if test="${employee.ABLE == 'F' }">
										<td><select id="updateRank${employee.EMP_ID}" name="updaterank" class="form-control" disabled>
												<c:forEach items="${positionList }" var="position">
												<c:choose>
													<c:when test="${employee.POSI_ID == position.posi_id}">
														<option value="${employee.POSI_ID}" selected>${position.posi_nm}</option>
													</c:when>
													<c:otherwise>
														<option value="${position.posi_id}">${position.posi_nm}</option>
													</c:otherwise>
												</c:choose>
										</c:forEach>
											</select>
											
										</td>
										</c:if>
										<td><fmt:formatDate value="${employee.JOIN_DT }" pattern="yyyy-MM-dd"/></td>
										<td>
										<select id="updateAble${employee.EMP_ID}" name="updateable" class="form-control">
											<c:choose>
												<c:when test="${employee.ABLE == 'T' }">
													<option selected>활성화</option>
													<option>비활성화</option>
												</c:when>
												<c:when test="${employee.ABLE == 'F' }">
													<option>활성화</option>
													<option selected>비활성화</option>
												</c:when>
											</c:choose>
										</select>
										</td>
										<td>
										<button id="update${employee.EMP_ID}" type="button" name="updateBtn" class="updateBtn btn mb-1 btn-outline-success" value="modify">수정</button>
										<a href="${cp }/deleteEmployee?emp_id=${employee.EMP_ID}" id="deleteEmp" class="deleteEmp btn mb-1 btn-outline-dark pull-right">삭제</a>
										<c:if test="${employee.ABLE == 'T' }">
										<button id="updateRank${employee.EMP_ID }" type="button" name="updateBtn2" class="updateBtn2 btn mb-1 btn-outline-primary" value="modifyPosition">직책변경</button>
										</c:if>
										<c:if test="${employee.ABLE == 'F' }">
										<button id="updateRank${employee.EMP_ID }" type="button" name="updateBtn2" class="updateBtn2 btn mb-1 btn-outline-primary" value="modifyPosition" disabled="disabled">직책변경</button>
										</c:if>
										<c:if test="${employee.ABLE == 'T' }">
										<button id="updateDepart${employee.EMP_ID }" type="button" name="updateBtn3" class="updateBtn3 btn mb-1 btn-outline-primary" value="modifyDepartment">부서변경</button>
										</c:if>
										<c:if test="${employee.ABLE == 'F' }">
										<button id="updateDepart${employee.EMP_ID }" type="button" name="updateBtn3" class="updateBtn3 btn mb-1 btn-outline-primary" value="modifyDepartment" disabled="disabled">부서변경</button>
										</c:if>
										</td>
									</tr>
								</c:forEach>
							</table>
						</div>
						</form>
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
</div>