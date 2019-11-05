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
		
		$("#updateBtn").on("click", function(){
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
						<form id="frm" class="form-horizontal" action="${cp }/mypage">
							<input id="selectEmp" name="emp_id2" type="hidden"/>
							<table class="table table-hover">
								<div class="form-group">
								<!-- 프로필 사진 -->
								<div class="media align-items-center mb-4">
								<tr id="margin">
								<td id="photo">
								<br>
				                   <img class="mr-3" src="${cp }/employeePicture?emp_id=${employee.emp_id}" width="200" height="200" alt="">
				                      <div class="media-body">
				                      <br>
				                    </td>
				                         <td><h3 class="mb-3">${employee.emp_nm }</h3>
				                            <p class="text-muted mb-0">${employee.depart_id }</p></td>
				                 </tr>
				                      </div>
				                 </div>
								<div id="${employee.emp_id}" class="employeeTr" data-emp_id="${employee.emp_id}">

									<!-- 사원 아이디 -->
									
									<tr>
										<td><strong class="text-dark mr-4">아이디</strong></td>
										<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${employee.emp_id }
											<input type="hidden" id="emp_id" name="emp_id" value="${employee.emp_id }"></td>
									</tr>
			
										
									<!-- 사원 이름 -->
									<tr>
										<td><strong class="text-dark mr-4">이름</strong></td>
										<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${employee.emp_nm }
											<input type="hidden" id="emp_nm" name="emp_nm" value="${employee.emp_nm }"></td>
									</tr>
									
									<!-- 비밀번호 -->
									<%--<tr>
										<td><strong class="text-dark mr-4">비밀번호</strong></td>
										<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${employee.pass }
											<input type="hidden" id="emp_nm" name="emp_nm" value="${employee.pass }"></td>
									</tr>--%>
									
									<!-- 등급 -->
									<tr>
										<td><strong class="text-dark mr-4">등급</strong></td>
										<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${employee.rank }
											<input type="hidden" id="rank" name="rank" value="${employee.rank }"></td>
									</tr>
										
									<!-- 부서 -->
									<tr>
									
										<td><strong class="text-dark mr-4">부서</strong></td>
										<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${employee.depart_id }
											<input type="hidden" id="depart_id" name="depart_id" value="${employee.depart_id }"></td>
									</tr>
									
									<!-- 직급 -->
									<tr>
										<td><strong class="text-dark mr-4">직급</strong></td>
										<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${employee.posi_id }
											<input type="hidden" id="posi_id" name="posi_id" value="${employee.posi_id }"></td>
									</tr>
									
									<!-- 직책 -->
									<tr>
										<td><strong class="text-dark mr-4">직책</strong></td>
										<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${employee.job_id }
											<input type="hidden" id="job_id" name="job_id" value="${employee.job_id }"></td>
									</tr>

									<!-- 이메일 -->
									<tr>
									
										<td><strong class="text-dark mr-4">이메일</strong></td>
										<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${employee.email }
											<input type="hidden" id="email" name="email" value="${employee.email }"></td>
									</tr>
									
									<!-- 이메일 비밀번호 -->
									<%--<tr>
									
										<td><strong class="text-dark mr-4">이메일 비밀번호</strong></td>
										<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${employee.email_pass }
											<input type="hidden" id="email_pass" name="email_pass" value="${employee.email_pass }"></td>
									</tr>--%>
										

									<!-- 전화번호 -->
									<tr>
									
										<td><strong class="text-dark mr-4">전화번호</strong></td>
										<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${employee.tel }
											<input type="hidden" id="tel" name="tel" value="${employee.tel }"></td>
									</tr>
										
									
									<!-- 입사일 -->
									<tr>
									
										<td><strong class="text-dark mr-4">입사일</strong></td>
											<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<fmt:formatDate value="${employee.join_dt }" pattern="yyyy-MM-dd"/>
											<input type="hidden" id="join_dt" name="join_dt" value="${employee.join_dt }"></td>
									</tr>
									
									<!-- 서명 -->
									<tr>
									
										<td><strong class="text-dark mr-4">서명</strong></td>
											<td>
<%-- 											&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${employee.sign } --%>
											<img src="${cp }/employeeSign?emp_id=${employee.emp_id}" width="100" height="100" alt="">
									</tr>

									</div>
								</table>
								<br>
								<!-- 수정 페이지 이동 버튼 -->
								<a href="${cp }/mypageModify?emp_id=${employee.emp_id}" id="modifyEmp" class="modifyEmp btn mb-1 btn-outline-success pull-right">정보수정 </a>
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