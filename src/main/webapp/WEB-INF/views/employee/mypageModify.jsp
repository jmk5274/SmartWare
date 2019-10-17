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
		
		$(".updateBtn").on("click", function(){
			$("#frm").submit();
		})

});
	
</script>
<style>
	img {
		text-align : center;
		border-radius : 100px;
		align : center;
	}
	
	h3 {
		text-align : center;
		font-weight : bold;
	}
	
	lable {
		font-size : 100px;
	}
	
	p {
		text-align : center;
	}

</style>

	<div class="container-fluid">
	<div class="row">
		<div class="col-lg-4">
			<div class="card">
				<div class="card-body">
				

					<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
		
						<div class="row">
							<div class="col-sm- blog-main">
						<h2 class="sub-header">마이페이지</h2>
							<br>
								<div class="table-responsive">
						<form id="frm" class="form-horizontal" action="${cp }/mypageModify">
							<input id="selectEmp" name="emp_id2" type="hidden"/>
							<table class="table table-hover">
								<div class="form-group">
								<!-- 프로필 사진 -->
								<div class="media align-items-center mb-4">
								<tr id="margin">
								<td id="photo">
				                   <img class="mr-3" src="${cp }/employeePicture?emp_id=${employee.emp_id}" width="200" height="200" alt="">
				                      <div class="media-body">
				                    </td>
				                         <td><h3 class="mb-3">${employee.emp_nm }</h3>
				                            <p class="text-muted mb-0">${employee.depart_id }</p></td>
				                 </tr>
				                      </div>
				                 </div>
								<div id="${employee.emp_id}" class="employeeTr" data-emp_id="${employee.emp_id}">

									<!-- 사원 아이디 -->
									
									<tr>
										<td><strong class="text-dark mr-4">사원 아이디</strong></td>
										<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${employee.emp_id }
											<input type="hidden" id="emp_id" name="emp_id" value="${employee.emp_id }"></td>
									</tr>
			
										
									<!-- 사원 이름 -->
									<tr>
										<td><strong class="text-dark mr-4">사원 이름</strong></td>
										<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${employee.emp_nm }
											<input type="hidden" id="emp_nm" name="emp_nm" value="${employee.emp_nm }"></td>
									</tr>
										
										
									<!-- 부서 -->
									<tr>
									
										<td><strong class="text-dark mr-4">부서</strong></td>
										<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${employee.depart_id }
											<input type="hidden" id="depart_id" name="depart_id" value="${employee.depart_id }"></td>
									</tr>
									
									<!-- 직책 -->
									<tr>
										<td><strong class="text-dark mr-4">직책</strong></td>
										<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${employee.posi_id }
											<input type="hidden" id="posi_id" name="posi_id" value="${employee.posi_id }"></td>
									</tr>
									

									<!-- 이메일 -->
									<tr>
									
										<td><strong class="text-dark mr-4">이메일</strong></td>
										<td><input type="email" id="email" name="email" class="form-control input-default" value="${employee.email }"></td>
									</tr>
										

									<!-- 전화번호 -->
									<tr>
									
										<td><strong class="text-dark mr-4">전화번호</strong></td>
										<td><input type="tel" id="tel" name="tel" class="form-control input-default" value="${employee.tel }"></td>
									</tr>
										
									
									<!-- 입사일 -->
									<tr>
									
										<td><strong class="text-dark mr-4">입사일</strong></td>
										<td><input type="date" id="join_dt" name="join_dt" class="form-control input-default" value="${employee.join_dt }"></td>
									</tr>

									</div>
								</table>
								<br>
								<!-- 수정 버튼 -->
								<button id="update" type="button" name="updateBtn" class="updateBtn btn mb-1 btn-outline-success pull-right" value="modify">수정</button>		
							</form>
						</div>
<%-- 				<a href="${cp }/insertEmployee" id="insertEmp" class="insertEmp btn mb-1 btn-outline-primary pull-right">사원 추가 </a> --%>
					</div>
				</div>
			</div>
			</div>
			</div>
		</div>
		</div>
	</div>