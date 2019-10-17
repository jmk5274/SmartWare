<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="${cp }/js/jquery-3.4.1.min.js"></script>
<link href ="../sweetalert2/dist/sweetalert2.min.css" rel="stylesheet" >
<script src="../sweetalert2/dist/sweetalert2.min.js"></script>
<script>
//사용자 정보 클릭시 이벤트 핸들러
// $(document).ready(function(){
	$(function(){
		if("${res }"){
			alert("${res }");
		}	

});
	
</script>
<style>
	div {
		text-align :  center;
	}
	
	img {
		text-align : center;
		border-radius : 100px;
		align : center;
	}
	
	h3 {
		font-weight : bold;
	}
</style>

	<div class="container-fluid">
	<div class="row">
		<div class="col-lg-12">
			<div class="card">
				<div class="card-body">
				

					<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
		
						<div class="row">
							<div class="col-sm- blog-main">
						<h2 class="sub-header">마이페이지</h2>
							<br>
								<div class="table-responsive">
						<form id="frm" class="form-horizontal" action="${cp }/mypage">
							<input id="selectEmp" name="emp_id2" type="hidden"/>
								<div class="form-group">
								<!-- 프로필 사진 -->
								<div class="media align-items-center mb-4">
				                   <img class="mr-3" src="${cp }/employeePicture?emp_id=${employee.emp_id}" width="200" height="200" alt="">
				                      <div class="media-body">
				                    
				                         <h3 class="mb-3">${employee.emp_nm }</h3>
				                            <p class="text-muted mb-0">${employee.depart_id }</p>
				                      </div>
				                 </div>
										
								<div id="${employee.emp_id}" class="employeeTr" data-emp_id="${employee.emp_id}">

									<!-- 사원 아이디 -->
									<div class="col-sm-10">
										<label class="col-sm control-label">사원 아이디</label>
											<input type="hidden" id="emp_id" name="emp_id" value="${employee.emp_id }">
									</div>
										
									<!-- 사원 이름 -->
									<div class="col-sm-10">
										<label class="col-sm control-label">사원 이름</label>
											<input type="hidden" id="emp_nm" name="emp_nm" value="${employee.emp_nm }">
									</div>
										
										
									<!-- 부서 -->
									<div class="col-sm-10">
										<label class="col-sm control-label">부서</label>
											<input type="hidden" id="depart_id" name="depart_id" value="${employee.depart_id }">
									</div>
									
									<!-- 직책 -->
									<div class="col-sm-10">
										<label class="col-sm control-label">직책</label>
											<input type="hidden" id="posi_id" name="posi_id" value="${employee.posi_id }">
									</div>

									<!-- 이메일 -->
									<div class="col-sm-10">
										<label class="col-sm control-label">이메일</label>
											<input type="hidden" id="email" name="email" value="${employee.email }">
									</div>
										

									<!-- 전화번호 -->
									<div class="col-sm-10">
										<label class="col-sm control-label">전화번호</label>
											<input type="hidden" id="tel" name="tel" value="${employee.tel }">
									</div>
										
									
									<!-- 입사일 -->
									<div class="col-sm-10">
										<label class="col-sm control-label">입사일</label>
											<input type="hidden" id="join_dt" name="join_dt" value="${employee.join_dt }">
										<fmt:formatDate value="${employee.join_dt }" pattern="yyyy-MM-dd"/>
									</div>

										<!-- 버튼 -->
<!-- 										<td> -->
<%-- 										<button id="update${employee.EMP_ID}" type="button" name="updateBtn" class="updateBtn btn mb-1 btn-outline-success" value="modify">수정</button> --%>
<%-- 										<button id="updateDepart${employee.EMP_ID }" type="button" name="updateBtn3" class="updateBtn3 btn mb-1 btn-outline-primary" value="modifyDepartment">부서변경</button> --%>
<%-- 										<button id="updateRank${employee.EMP_ID }" type="button" name="updateBtn2" class="updateBtn2 btn mb-1 btn-outline-primary" value="modifyPosition">직책변경</button> --%>
<!-- 										</td> -->
									</div>
								</div>
							</form>
						</div>
<%-- <!-- 사원 추가 -->			<a href="${cp }/insertEmployee" id="insertEmp" class="insertEmp btn mb-1 btn-outline-primary pull-right">사원 추가 </a> --%>
					</div>
				</div>
			</div>
			</div>
			</div>
		</div>
		</div>
	</div>