<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script type="text/javascript" src="${cp }/ckeditor/ckeditor.js"></script>
<link href="${cp }/bootstrap/plugins/nestable/css/nestable.css" rel="stylesheet">
<link href="${cp }/bootstrap/css/style.css" rel="stylesheet">

					                  
<script>
	$(function(){
	
		CKEDITOR.replace('p_content', {height: 500, width: 900
      	  
        });

		$("#btnTest_alert").click(function(){
			var cont = CKEDITOR.instances['p_content'].getData();
// 			$("#p_content").val(cont);
			$("#cont").val(cont);
					
			var formData = new FormData();
			var myForm = document.getElementById('frm');
			formData = new FormData(myForm);
			
			 $.ajax({
			      url : "${cp}/sendEmail",
			      enctype: 'multipart/form-data',
			      contentType : false,
			      processData : false,
			      dataType : "json",
			      method : "post",
			      data : formData,
			      success : function(data){
			    	  Swal({
							type: 'success', // success, error, warning, info, question
							title: '메일이 전송 되었습니다',
						});
			    	  
			    	  setTimeout("location.href='${cp}/main'",2000);
			      },
			      error : function(xhr){
			    	  Swal({
							type: 'error', // success, error, warning, info, question
							title: '메일전송 실패'
						});
			    	  
			    	  $("#reci").focus();
			    	  
			      }
			   });
			
		});
		
		$("#emailCheck").click(function(evt){
// 			$("#validator").submit();
			evt.preventDefault();
			
			var checkEmail = $("#reci").val();
			var checkArr = checkEmail.split(" ").filter(e => e.replace(/ +/g, ''));
	
			var regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
			
			if(checkArr.length > 0){
				for(var i = 0; i < checkArr.length; i++){
					if (checkArr[i].match(regExp) != null) {
					   $("#emailSpan").text("사용할수 있는 이메일(들)").css("color", "lightgreen");
					}
					else {
					   $("#emailSpan").text("사용할수 없는 이메일").css("color", "red");
					}
				}
			}
	
		});
		
		$(document).on('click', '.select', function() {
			 res = "";
			 $(':checkbox:checked').each(function(i, a){
				 res += $(this).val() +  " ";
			 })
		});
		
		$("#confirmbtn").on('click', function(){
			$("#reci").val("");
			$("#reci").val(res);
			$(':checkbox:checked').attr('checked', false );
		});
		
		$(document).on('click', '.toggleBtn', function() {
			var text = $(this).text();
			$(this).text(text === 'Collapse' ? 'Collapse' : 'Expand').parent().find('.dd-list').toggle();
			/* this.dataset.action = $(this).text; */
		});	
	})

function checkEmail(){
		var checkEmail = $("#reci").val();
		$("#checkEmail").val(checkEmail);
		$("#emailCheckFrm").submit();
}	
	
	
function goBack() {
    window.history.back();
}
</script>



	
<script src="${cp }/bootstrap/plugins/nestable/js/jquery.nestable.js"></script>

<form id="emailCheckFrm" action="${cp }/validator">
	<input type="hidden" id="checkEmail" name="email"/>
</form>


<div class="container-fluid">
	<div class="row">
		<div class="col-lg-12">
			<div class="card">
				<div class="card-body">
					<div class="email-center-box">
						<div class="toolbar" role="toolbar">
							<div class="btn-group m-b-20">
								<a href="${cp}/writeMail " class="btn btn-primary btn-block">메일
									쓰기</a>
								&nbsp;&nbsp;&nbsp;&nbsp;
								<div class="bootstrap-modal">
                                    <!-- Button trigger modal -->
                                    
                                    <!-- Modal -->
                                    <div class="modal fade" id="basicModal" style="display: none;" aria-hidden="true">
                                        <div class="modal-dialog" role="document">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h3 class="modal-title">주소록</h3>
                                                    <button type="button" class="close" data-dismiss="modal"><span>×</span>
                                                    </button>
                                                </div>
                                                <div class="modal-body">
											<div class="col-lg-12">
								                        <div class="card">
								                            <div class="card-body">
								                                <h3 class="card-title">SmartWare</h3>
								                                <div class="card-content">
								                                    <div class="nestable">
								                                        <div class="dd" id="nestable2">
								                                            <ol class="dd-list">
								                                            	<!-- 부서로해서 for문을 돌려 class를 지정해주고 id값을 넣어준다 -->
								                                            	<c:forEach items="${departList }" var="depart" varStatus="loop">
								                                            					<c:if test="${depart.depart_id != 'de0006' }">
												                                            	<li class="dd-item dd-collapsed" data-id="${depart.depart_id }"><button data-id="${depart.depart_id }" class="toggleBtn" data-action="collapse" type="button">Collapse</button>
												                                                    <div class="dd-handle">${depart.depart_nm }</div>
											                                                    </c:if>
													                                                    <ol class="dd-list">
														                                            		<c:forEach items="${employeeList }" var="employee">
															                                            		<c:forEach items="${positionList }" var="position">
															                                            				<c:if test="${depart.depart_id == employee.DEPART_ID && position.posi_id == employee.POSI_ID}">
															                                            					<c:if test="${employee.EMP_ID != 'admin' }">
																		                                                        <li class="dd-item select" data-id="${depart.depart_id }">
																		                                                            <div class="dd-handle"><input value="${employee.EMAIL }" type="checkbox" class="listCheck" style="display: inline-block;"/>
																			                                                             &nbsp;&nbsp;&nbsp;${employee.EMP_NM } &nbsp;
																			                                                             /&nbsp;${employee.EMAIL }&nbsp;
																			                                                             /&nbsp;${employee.POSI_NM }&nbsp;
																			                                                             /&nbsp;${employee.JOB_NM }&nbsp;
																		                                                             </div>
																		                                                        </li>
																	                                                        </c:if>
																		                                                </c:if>
																		                                         </c:forEach>
															                                                </c:forEach>
												                                                    	</ol>
											                                                   </li>
								                                            	   </c:forEach>
								                                            </ol>
								                                        </div>
								                                    </div>
								                                </div>
								                            </div>
								                        </div>
				                  				  </div>
                                          <div class="modal-footer">
                                              <button type="button" id="confirmbtn" class="btn btn-primary" data-dismiss="modal">확인</button>
                                              <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
                                          </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
							</div> <br>
							
						</div>
						<form id="frm" action="${cp}/sendEmail" method="post" enctype="multipart/form-data">
						<div class="compose-content mt-5">
								<input type="hidden" id="cont" name="cont"/>
								<input id="reci" type="text" name="reci" value="${param.email }"
									placeholder=" To"
									style="width: 400px; height: 43px;"> &nbsp;&nbsp;
								<a id="validator" href="javascript:checkEmail();">
									<button type="button" id="emailCheck" class="btn btn-outline-dark m-b-30 m-t-15 f-s-14 p-l-20 p-r-20 m-r-10">유효성 검사</button>
								</a> 
								<button type="button" class="btn btn-outline-success m-b-30 m-t-15 f-s-14 p-l-20 p-r-20 m-r-10" data-toggle="modal" data-target="#basicModal">주소록</button><br>
<%-- 								<form:errors path="email.email"/> --%>
								<span id="emailSpan"></span>
								<br>
									<input type="hidden" id="email" name="email"
									value="${S_EMPLOYEE.email }" /> <input type="hidden"
									id="emailpass" name="emailPass" value="${S_EMPLOYEE.email_pass }" />
						</div>
						<br>
						<div class="form-group">
							<input type="text" id="subject" name="subject"
								class="form-control bg-transparent" placeholder=" Subject"
								style="width: 900px;">
						</div>

							<div class="col_c" style="margin-bottom: 30px">
								<div class="input-group">
									<textarea class="form-control" id="p_content" name="p_content"></textarea>
								</div>
							</div>
						<h5 class="m-b-20">
							<i class="fa fa-paperclip m-r-5 f-s-18"></i> Attatchment
						</h5>
							<div class="form-group">
								<div class="fallback">
									<input class="l-border-1" id="attatch" name="attatch" type="file"
										multiple="multiple">
								</div>
							</div>
						</form>
					</div>
					<div class="text-left m-t-15">
					
						<button id="btnTest_alert"
							class="btn btn-danger btn sweet-wrong m-b-30 m-t-15 f-s-14 p-l-20 p-r-20 m-r-10"
							type="button">
							<i class="fa fa-paper-plane m-r-5"></i> Send
						</button>
						<button id = "discard" class="btn btn-dark m-b-30 m-t-15 f-s-14 p-l-20 p-r-20"
							type="button" onclick="goBack()">
							<i class="ti-close m-r-5 f-s-12"></i> Discard
						</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
