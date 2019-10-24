<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="${cp }/js/jquery-3.4.1.min.js"></script>
<script>
function btnevent(){
	$(document).on('click', '.detailEmp', function() {
			 var emp_id = $(this).data("id");
			 
			 $.ajax({
					url : "${cp}/detailEmp",
					data : "emp_id="+emp_id,
					dataType : "json",
					method : "post",
					success : function(data){
							var id = data.emp.EMP_ID;
							$("#id").text(id);
							
							var emp_nm = data.emp.EMP_NM;
							$("#name").text(emp_nm);
							
							var email = data.emp.EMAIL;
							$("#email").text(email);
							
							var tel = data.emp.TEL;
							$("#tel").text(tel);
							
							$("#join_dt").text(moment(new Date(data.emp.JOIN_DT)).format('YYYY/MM/DD'));
							
							var depart_nm = data.emp.DEPART_NM;
							$("#depart").text(depart_nm);
							
							var posi_nm = data.emp.POSI_NM;
							$("#position").text(posi_nm);
							
							var job_nm = data.emp.JOB_NM;
							$("#job").text(job_nm);
							
							
							var emp_pic = data.emp.EMP_PIC;
						var html = "";
							html += '<td id="photo">'
							html += '<br>'
							html += '	<img class="mr-3" src="${cp }/employeePicture?emp_id='+id+'" width="200" height="200" alt="">'
							html += '		<div class="media-body">'           
							html += '<br>'
							html += '</td>'
							html += '<td><h3 class="mb-3">'+emp_nm+'</h3>'
							html += '<p class="text-muted mb-0">'+depart_nm+'</p></td>'
						$("#margin").html(html);
						}
				});
		});
	}
	
		$(window).on('keydown', function(e) {
			if (e.which == 13) {
				var keyword = $("#search").val();
				
				if($.trim(keyword) == '') {
					return false;
				}
				
				
				var html = "";
				var code = "";
				$.ajax({
					url : "${cp}/searchEmp",
					contentType : "application/json",
					dataType : "json",
					method : "get",
					data : "keyword="+encodeURI(keyword),
					success : function(data){
						var list = data.searchList;
						$("#page").remove();
						
						html += "<thead>"
						html += 	"<tr>"
						html += 		"<th>부서</th>"
						html += 		"<th>직급</th>"
						html += 		"<th>직책</th>"
						html += 		"<th>사원 아이디</th>"
						html += 		"<th>사원 이름</th>"
						html += 		"<th>입사일</th>"
						html += 	"</tr>"
						html += "</thead>"
							
							if(data.searchList.length==null || data.searchList.length < 1){
								html += "<tbody>"
								html += 	"<tr>"
								html += 	"<td colspan='3'>검색 결과가 없습니다.</td>"
								html += 	"</tr>"
								html += "</tbody>"
							}
							else{
								data.searchList.forEach(function(ss){
									html += "<tbody>"
									html += 	"<tr class='empList'>";
									html += 		"<td>" + ss.DEPART_NM + "</td>";
									html += 		"<td>" + ss.POSI_NM + "</td>";
									html += 		"<td>" + ss.JOB_NM + "</td>";
									html += 		"<td>" + ss.EMP_ID + "</td>";
									html += 		"<td>" + ss.EMP_NM + "</td>";
									html += 		"<td>" + moment(new Date(ss.JOIN_DT)).format('YYYY/MM/DD') + "</td>";
									html += 		"<td><button type='button' class='btn btn-primary detailEmp' data-id="+ss.EMP_ID+" data-toggle='modal' data-target='.bd-example-modal-lg'>사원 상세보기</button></td>"
									html += 	"</tr>";
									html += "</tbody>"
									$(".departTable").html(html);
								})
							}
						}

				});
				$("#search").val("");
			}
		 })



	$(function() {
		$("#select").on("change", function(){
			$("#page").remove();
			
			
			var depart_nm = $("#select option:selected").val();
			var depart_id = $("#select option:selected").data("id");
			
			var html = "";
			var code = "";
			$(".departTable").empty();

			$.ajax({
				url : "${cp}/departSearch",
				data : "depart_id="+depart_id,
				success : function(data){
					var list = data.detailDepartList;
					
					code += "<h4>"+depart_nm+"</h4>"
					html += "<thead>"
					html += 	"<tr>"
					html += 		"<th>직급</th>"
					html += 		"<th>직책</th>"
					html += 		"<th>사원 아이디</th>"
					html += 		"<th>사원 이름</th>"
					html += 		"<th>입사일</th>"
					html += 	"</tr>"
					html += "</thead>"
						
						if(list.length==null || list.length < 1){
							html += "<tbody>"
							html += 	"<tr>"
							html += 	"<td colspan='3'>검색 결과가 없습니다.</td>"
							html += 	"</tr>"
							html += "</tbody>"
						}
						else{
						list.forEach(function(depart){
								var join = new Date(depart.JOIN_DT);
							
								html += "<tbody>"
								html += 	"<tr class='empList'>";
								html += 		"<td>" + depart.POSI_NM + "</td>";
								html += 		"<td>" + depart.JOB_NM + "</td>";
								html += 		"<td>" + depart.EMP_ID + "</td>";
								html += 		"<td>" + depart.EMP_NM + "</td>";
								html += 		"<td>" + moment(new Date(depart.JOIN_DT)).format('YYYY/MM/DD') + "</td>";
								html += 		"<td><button type='button' class='btn btn-primary detailEmp' data-id="+depart.EMP_ID+" data-toggle='modal' data-target='.bd-example-modal-lg'>사원 상세보기</button></td>"
								html += 	"</tr>";
								html += "</tbody>"
								$(".departTable").html(html);
								$("#subtitle").html(code);
							})
						}
					}
				});
			});
			
		btnevent();
		
		
	
	});
</script>






<div class="container-fluid">
	<div class="row">
		<div class="col-12">
			<div class="card">
				<div class="card-body">
					<div>
						<h3>조직도</h3>
					</div>
					<div class="header-content clearfix">
						<div class="header-left"
							style="margin-left: 0px; margin-bottom: 30px;">
							<div class="input-group icons">
								<div class="input-group-prepend">
									<span class="input-group-text bg-transparent border-0"
										id="basic-addon1"><i class="mdi mdi-magnify"></i></span>
								</div>
								<input id="search" type="text" class="form-control" placeholder="사원 검색">
								<select name="department" id="select" class="form-control" style="margin-left: 10px;">
											<option id="op" data-id="0" class="op">전체보기</option>
											<c:forEach items="${departmentList }" var="department">
													<c:if test="${department.depart_id != 'de0006' }">
														<option class="op" data-id=${department.depart_id }>${department.depart_nm}</option>
													</c:if>
											</c:forEach>
								</select>
							</div>
						</div>
					</div>
					<div class="table-responsive">
						<div class="form-group">
							<table class="table table-hover departTable">
							 <div>
							 	<span id="subtitle">
							 	
							 	</span>
								<thead>
									<tr>
										<th>사원 아이디</th>
										<th>사원 이름</th>
										<th>부서</th>
										<th>직급</th>
										<th>직책</th>
										<th>입사일</th>
									</tr>
								</thead>
									<tbody id="tBody">
										<c:forEach items="${employeeList }" var="employee">
											<c:if test="${employee.EMP_ID != 'admin' }">
												<tr>
													<td>${employee.EMP_ID }</td>
													<td>${employee.EMP_NM }</td>
													<td>${employee.DEPART_NM }</td>
													<td>${employee.POSI_NM }</td>
													<td>${employee.JOB_NM}</td>
													<td><fmt:formatDate value="${employee.JOIN_DT }" pattern="yyyy-MM-dd"/></td>
													<td><button type="button" class="btn btn-primary detailEmp" data-id="${employee.EMP_ID }" data-toggle="modal" data-target=".bd-example-modal-lg">사원 상세보기</button></td>
												</tr>
											</c:if>
										</c:forEach>
									</tbody>
								</div>
							</table>
						</div>
					</div>
					
					<div class="bootstrap-modal" style="float: right;">
								<!-- Large modal -->
								
								<div class="modal fade bd-example-modal-lg" tabindex="-1"
									role="dialog" aria-hidden="true">
									<div class="modal-dialog modal-lg">
										<div class="modal-content">
											<div class="modal-header">
												<h5 class="modal-title">사원 상세정보</h5>
												<button type="button" class="close" data-dismiss="modal">
													<span>×</span>
												</button>
											</div>
											<div class="modal-body">
														<div class="table-responsive">
															<input id="selectEmp" name="emp_id2" type="hidden"/>
																<table class="table table-hover">
																	<div class="form-group">
																	<!-- 프로필 사진 -->
																	<div class="media align-items-center mb-4">
																	<tr id="margin">
																		
													                 </tr>
													                      </div>
													                 </div>
									
																		<!-- 사원 아이디 -->
																		
																		<tr>
																			<td><strong class="text-dark mr-4">아이디</strong></td>
																			<td id="id">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
																		</tr>
												
																			
																		<!-- 사원 이름 -->
																		<tr>
																			<td><strong class="text-dark mr-4">이름</strong></td>
																			<td id="name">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
																		</tr>
																		
																		<!-- 부서 -->
																		<tr>
																		
																			<td><strong class="text-dark mr-4">부서</strong></td>
																			<td id="depart">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
																		</tr>
																		
																		<!-- 직급 -->
																		<tr>
																			<td><strong class="text-dark mr-4">직급</strong></td>
																			<td id="position">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
																		</tr>
																		
																		<!-- 직책 -->
																		<tr>
																			<td><strong class="text-dark mr-4">직책</strong></td>
																			<td id="job">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;$</td>
																		</tr>
									
																		<!-- 이메일 -->
																		<tr>
																			<td><strong class="text-dark mr-4">이메일</strong></td>
																			<td id="email">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
																		</tr>
																		
																		<tr>
																		
																			<td><strong class="text-dark mr-4">입사일</strong></td>
																			<td id="join_dt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
																		</tr>
																		<!-- 전화번호 -->
																		<tr>
																		
																			<td><strong class="text-dark mr-4">전화번호</strong></td>
																			<td id="tel">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
																		</tr>
																		
																			
																		
																		<!-- 서명 -->
																		<tr id="sign">
																			
																		</tr>
									
																		</div>
																	</table>
																	<br>
																</div>
															</div>
											<div class="modal-footer">
												<button type="button" class="btn btn-secondary closePopup"
													data-dismiss="modal">취소</button>
											</div>
										</div>
									</div>
								</div>
							</div>
					
					<div id="page" class="bootstrap-pagination">
						<nav>
							<ul class="pagination justify-content-center">
								<!-- 이전 페이지 가기 : 지금 있는 페이지에서 한페이지 전으로 -->

								<c:choose>
									<c:when test="${map.page == 1 }">
										<li class="page-item disabled"><a class="page-link"
											href="#" tabindex="-1">&laquo;</a></li>
										<span aria-hidden="Previous"></span>
									</c:when>
									<c:otherwise>
										<li class="page-item"><a class="page-link"
											href="${cp }/employeeSearch?page=1"
											aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
										</a></li>
									</c:otherwise>
								</c:choose>


								<c:choose>
									<c:when test="${map.page == 1 }">
										<li class="page-item disabled"><a class="page-link"
											href="#" tabindex="-1">&lt;</a></li>
									</c:when>
									<c:otherwise>
										<li class="page-item"><a class="page-link"
											href="${cp }/employeeSearch?page=${map.page-1}"
											tabindex="-1">&lt;</a></li>
									</c:otherwise>
								</c:choose>

								<c:forEach begin="1" end="${paginationSize }" var="i">
									<c:choose>
										<c:when test="${i == map.page }">
											<li class="page-item disabled"><span class="page-link">${i }</span></li>
										</c:when>
										<c:otherwise>
											<li class="page-item"><a class="page-link"
												href="${cp }/employeeSearch?page=${i }">${i }</a></li>
										</c:otherwise>
									</c:choose>
								</c:forEach>

								<c:choose>
									<c:when test="${map.page == paginationSize || paginationSize == 0}">
										<li class="page-item disabled"><a class="page-link"
											href="#">&gt;</a></li>
									</c:when>
									<c:otherwise>
										<li class="page-item"><a class="page-link"
											href="${cp }/employeeSearch?page=${page+1}">&gt;</a>
										</li>
									</c:otherwise>
								</c:choose>

								<c:choose>
									<c:when test="${map.page == paginationSize || paginationSize == 0}">
										<li class="page-item disabled"><a class="page-link"
											href="#">&raquo;</a></li>
										<span aria-hidden="Next"></span>
									</c:when>
									<c:otherwise>
										<li class="page-item"><a class="page-link"
											href="${cp }/employeeSearch?page=${paginationSize }"
											aria-label="Previous"> <span aria-hidden="true">&raquo;</span>
										</a></li>
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


