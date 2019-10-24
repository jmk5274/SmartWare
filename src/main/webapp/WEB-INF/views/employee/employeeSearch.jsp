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
		
	$(".deleteBtn").on("click", function(){
		Swal({
			title: '삭제 요청',
			text: "해당 사원을 삭제하시겠습니까?",
			type: 'question',
			showCancelButton: true,
			confirmButtonColor: '#3085d6',
			cancelButtonColor: '#d33',
			confirmButtonText: '네',
			cancelButtonText: '아니오'
		}).then((result) => {
			if (result.value) {
				Swal({
					title: '삭제 완료',
					text: '삭제되었습니다.',
					type: 'success',
					confirmButtonText: '확인'
				})
				
				$("#selectEmp").val($(this).data("emp_id"));
				$("#frm").prop("action", "${cp}/deleteEmployee");
				$("#frm").submit();
			}
		});
	});
// 		var result = confirm("해당 사원을 삭제하시겠습니까?");
		
// 		if(result) {
// 			$("#selectEmp").val($(this).data("emp_id"));
// 			$("#frm").prop("action", "${cp}/deleteEmployee");
// 			$("#frm").submit();
// 		}
		
// 	});
	
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
	});
	
	$(".updateBtn4").on("click", function(){
		$("#selectEmp").val(($(this).parents("tr")).attr("id"));
		$("#updateBtn4").val($(this).attr("value"));
		var emp_id = ($(this).parents("tr")).attr("id");
		$("#updateJob").val($("#updateJob"+emp_id + " option:selected").val());
		console.log($("#updateJob"+emp_id + " option:selected").val());
		$("#frm").submit();
	});
	
	$("#createEmp").on("click", function() {
		var newEmp_id = $("#newEmp_id").val();
		var newEmp_nm = $("#newEmp_nm").val();
		var newPass = $("#newPass").val();
		var newRank = $("#newRank").val();
		var newEmail = $("#newEmail").val();
		var newTel = $("#newTel").val();
		var newJoin_dt = $("#newJoin_dt").val();
		var newEmail_pass = $("#newEmail_pass").val();
		
		if(newEmp_id == '' || newEmp_id.length == 0){
			Swal({
				type: 'warning', // success, error, warning, info, question
				title: '필수 사항',
				text: '사원 아이디를 입력해주세요.'
			})
				return;
			
		} else if(newEmp_nm == '' || newEmp_nm.length == 0){
			Swal({
				type: 'warning', // success, error, warning, info, question
				title: '필수 사항',
				text: '사원 이름을 입력해주세요.'
			})
				return;
			
		} else if(newPass == '' || newPass.length == 0) {
			Swal({
				type: 'warning', // success, error, warning, info, question
				title: '필수 사항',
				text: '비밀번호를 입력해주세요.'
			})
				return;
				
		} else if(newEmail == '' || newEmail.length == 0) {
			Swal({
				type: 'warning', // success, error, warning, info, question
				title: '필수 사항',
				text: '이메일을 입력해주세요.'
			})
				return;
				
		} else if(newTel == '' || newTel.length == 0) {
			Swal({
				type: 'warning', // success, error, warning, info, question
				title: '필수 사항',
				text: '전화번호를 입력해주세요.'
			})
				return;
				
		// input -> ''(string)
		} else if(newEmail_pass == '' || newEmail_pass.length == 0) {
			Swal({
				type: 'warning', // success, error, warning, info, question
				title: '필수 사항',
				text: '이메일 비밀번호를 입력해주세요.'
			})
				return;
				
		// date -> null(''(string) -> x))
		} else if(newJoin_dt == null || newJoin_dt.length == 0) {
			Swal({
				type: 'warning', // success, error, warning, info, question
				title: '필수 사항',
				text: '입사일을 입력해주세요.'
			})
				return;
		}
		
		Swal({
			title: '등록 요청',
			text: "저장하시겠습니까?",
			type: 'question',
			showCancelButton: true,
			confirmButtonColor: '#3085d6',
			cancelButtonColor: '#d33',
			confirmButtonText: '네',
			cancelButtonText: '아니오'
		}).then((result) => {
			if (result.value) {
				Swal({
					title: '등록 완료',
					text: '저장되었습니다.',
					type: 'success',
					confirmButtonText: '확인'
				})
				
				$("#createFrm").submit();
			}
		});
	});
	
});
		
// 		$("#createFrm").submit();
// 	});
	
// });
	

</script>

<%-- <form id="frm" action="${cp }/user/user" method="get"> --%>
<!-- 	<input type="hidden" id="emp_id" name="emp_id" /> -->
<!-- </form> -->

	<div class="container-fluid">
	<div class="row">
		<div class="col-lg-12">
			<div class="card">
				<div class="card-body">

			<div class="col-sm-11 col-sm-offset-5 col-md-12 col-md-offset-4 main">

				<div class="row">
					<div class="col-sm- blog-main">
					<br>
					<!-- 사원 리스트 메인 테이블 -->
						<div class="table-responsive">
				<form id="frm" class="form-horizontal" action="${cp }/updateEmployee" method="post">
					<input id="selectEmp" name="emp_id" type="hidden"/>
					<input id="updateBtn" name="updateBtn" type="hidden"/>
					<input id="updateBtn2" name="updateBtn2" type="hidden"/>
					<input id="updateBtn3" name="updateBtn3" type="hidden"/>
					<input id="updateBtn4" name="updateBtn4" type="hidden"/>
					<input id="updateRank" name="posi_id" type="hidden"/>
					<input id="updateAble" name="able" type="hidden"/>
					<input id="updateDepart" name="depart_id" type="hidden"/>
					<input id="updateJob" name="job_id" type="hidden"/>
					<input id="deleteBtn" name="emp_id2" type="hidden"/>
				</form>
								<div class="form-group">
								  
								  <div class="input-group input-group-sm"> 
								  	<h2 style="display: inline;">사원리스트</h2>
					                	<div class="input-group-prepend">
											<span class="input-group-text bg-transparent border-0"
												id="basic-addon1"><i class="mdi mdi-magnify"></i></span>
										</div>
										<input style="width: 200px;" type="search" class="form-control"
											placeholder="Search Dashboard" aria-label="Search Dashboard">
										<div class="drop-down   d-md-none">
											<form action="#">
												<input type="text" class="form-control" placeholder="Search">
											</form>
										</div>
					                </div>
								<br>
							<table class="table table-hover">
								<thead>
									<tr class="">
										<th>사원 아이디</th>
										<th>사원 이름</th>
										<th>부서</th>
										<th>직급</th>
										<th>직책</th>
										<th>입사일</th>
									</tr>
								</thead>
								<c:forEach items="${employeeList }" var="employee">
									<tr id="${employee.EMP_ID}" class="employeeTr" data-emp_id="${employee.EMP_ID}">
										<!-- 사원 아이디 -->
										<td>${employee.EMP_ID }</td>
										<!-- 사원 이름 -->
										<td>${employee.EMP_NM }</td>
										<!-- 활성화인 경우 부서변경  td -->
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
										
										<!-- 비활성화인 경우 부서변경  td (disabled) -->
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
										
										<!-- 활성화인 경우 직급변경  td -->
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
										
										<!-- 비활성화인 경우 직급변경  td (disabled) -->
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
										
										<!-- 활성화인 경우 직책변경  td -->
										<c:if test="${employee.ABLE == 'T' }">
										<td><select id="updateJob${employee.EMP_ID}" name="updatejob" class="form-control">
										<c:forEach items="${jobList }" var="job">
												<c:choose>
													<c:when test="${employee.JOB_ID == job.job_id}">
														<option value="${employee.JOB_ID}" selected>${job.job_nm}</option>
													</c:when>
													<c:otherwise>
														<option value="${job.job_id}">${job.job_nm}</option>
													</c:otherwise>
												</c:choose>
										</c:forEach>
											</select>
										</td>
										</c:if>
										
										<!-- 비활성화인 경우 직책변경  td (disabled) -->
										<c:if test="${employee.ABLE == 'F' }">
										<td><select id="updateJob${employee.EMP_ID}" name="updatejob" class="form-control" disabled>
												<c:forEach items="${jobList }" var="job">
												<c:choose>
													<c:when test="${employee.JOB_ID == job.job_id}">
														<option value="${employee.JOB_ID}" selected>${job.job_nm}</option>
													</c:when>
													<c:otherwise>
														<option value="${job.job_id}">${job.job_nm}</option>
													</c:otherwise>
												</c:choose>
										</c:forEach>
											</select>
											
										</td>
										</c:if>
										
										<!-- 입사날짜 -->
										<td><fmt:formatDate value="${employee.JOIN_DT }" pattern="yyyy-MM-dd"/></td>
										<!-- 활성화 / 비활성화 -->
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
										
										<!-- 버튼 -->
										<td>
										<button id="update${employee.EMP_ID}" type="button" name="updateBtn" class="updateBtn btn mb-1 btn-outline-success" value="modify">수정</button>
<%-- 										<a href="${cp }/deleteEmployee?emp_id=${employee.EMP_ID}" id="deleteEmp" class="deleteEmp btn mb-1 btn-outline-dark pull-right">삭제</a> --%>
										<button id="delete${employee.EMP_ID}" data-emp_id="${employee.EMP_ID}" type="button" name="deleteBtn" class="deleteBtn btn mb-1 btn-outline-dark pull-right" value="delete">삭제</button>
										<c:if test="${employee.ABLE == 'T' }">
										<button id="updateDepart${employee.EMP_ID }" type="button" name="updateBtn3" class="updateBtn3 btn mb-1 btn-outline-primary" value="modifyDepartment">부서변경</button>
										</c:if>
										<c:if test="${employee.ABLE == 'F' }">
										<button id="updateDepart${employee.EMP_ID }" type="button" name="updateBtn3" class="updateBtn3 btn mb-1 btn-outline-primary" value="modifyDepartment" disabled="disabled">부서변경</button>
										</c:if>
										<c:if test="${employee.ABLE == 'T' }">
										<button id="updateRank${employee.EMP_ID }" type="button" name="updateBtn2" class="updateBtn2 btn mb-1 btn-outline-primary" value="modifyPosition">직급변경</button>
										</c:if>
										<c:if test="${employee.ABLE == 'F' }">
										<button id="updateRank${employee.EMP_ID }" type="button" name="updateBtn2" class="updateBtn2 btn mb-1 btn-outline-primary" value="modifyPosition" disabled="disabled">직급변경</button>
										</c:if>
										<c:if test="${employee.ABLE == 'T' }">
										<button id="updateJob${employee.EMP_ID }" type="button" name="updateBtn4" class="updateBtn4 btn mb-1 btn-outline-primary" value="modifyJob">직책변경</button>
										</c:if>
										<c:if test="${employee.ABLE == 'F' }">
										<button id="updateJob${employee.EMP_ID }" type="button" name="updateBtn4" class="updateBtn4 btn mb-1 btn-outline-primary" value="modifyJob" disabled="disabled">직책변경</button>
										</c:if>
										</td>
									</tr>
								</c:forEach>
							</table>
						</div>
<%-- <!-- 사원 추가 -->			<a href="${cp }/insertEmployee" id="insertEmp" class="insertEmp btn mb-1 btn-outline-primary pull-right">사원 추가 </a> --%>
						<!-- 사원 리스트 페이지네이션 -->
						<div class="bootstrap-pagination">
							<nav>
								<ul class="pagination justify-content-center">
								<!-- 이전 페이지 가기 : 지금 있는 페이지에서 한페이지 전으로 -->
									
									<c:choose>
										<c:when test="${page == 1 }">
											<li class="page-item disabled"><a class="page-link" href="#" tabindex="-1">&laquo;</a></li>
												<span aria-hidden="Previous"></span>
										</c:when>
										<c:otherwise>
											<li class="page-item">
								 				<a class="page-link" href="${cp }/employeeList?page=1&emp_id=${emp_id}" aria-label="Previous">
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
											<li class="page-item"><a class="page-link" href="${cp }/employeeList?page=${page-1}&emp_id=${emp_id}" tabindex="-1">&lt;</a></li>
										</c:otherwise>
									</c:choose>
									
									<c:forEach begin="1" end="${paginationSize }" var="i">
										<c:choose>
											<c:when test="${i == page }">
												 <li class="page-item disabled"><span class="page-link">${i }</span></li>
											</c:when>
											<c:otherwise>
												 <li class="page-item"><a class="page-link" href="${cp }/employeeList?page=${i }&emp_id=${emp_id}">${i }</a></li>
											</c:otherwise>
										</c:choose>
									</c:forEach>
									
									<c:choose>
										<c:when test="${page == paginationSize || paginationSize == 0}">
											<li class="page-item disabled"><a class="page-link" href="#">&gt;</a></li>
										</c:when>
										<c:otherwise>
												<li class="page-item"><a class="page-link" href="${cp }/employeeList?page=${page+1}&emp_id=${emp_id}">&gt;</a>
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
								 				<a class="page-link" href="${cp }/employeeList?page=${paginationSize }&emp_id=${emp_id}" aria-label="Previous">
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