<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<style>
 	.message:hover{
 		box-shadow:0 5px 20px rgba(0, 0, 0, 0.1);
	} 
	
	
	
	
</style>


<script>
	$(function(){
		var descount;
		var emailLabel;
		var mesUID = new Array();
		
		$(document).on('click', '.fa-star-o', function() {
			$(this).attr('class','fa fa-star').css("color", "#A82743");
			//클래스 가  fa fa-star 가된것들을 Array로 받는다 ex)chatView.jsp
			var msgNumber = $(this).data("id");
			emailLabel = $("#emailLabel").val();
			
			$.ajax({
			      url : "${cp}/moveStarbox",
			      async: false,
			      type : "post",
			      data : "emailLabel=" + emailLabel + '&msgNumber=' + msgNumber,
			      success : function(data){
			    	  console.log(data.descount);
			    	  descount = data.descount;
				      emailLabel = data.emailLabel;
				      
			    	  $.ajax({
			    		 url : "${cp}/starIdSave",
			    		 async: false,
			    		 type: "post",
			    		 data : "msgNumber=" + msgNumber + '&descount=' + descount,
			    		 success : function(data){
			    			 console.log(data);
			    		 }
			    		  
			    	  });
			    	  
			    	  const toast = Swal.mixin({
						  toast: true,
						  position: 'top-end',
						  showConfirmButton: false,
						  timer: 1500
						});

					toast({
					  type: 'success',
					  title: '별표메일함으로 이동됬습니다.'
					})
			      },
			      error : function(xhr){
			    	  console.log("실패");
			      }
			   });
		});
		
		$(document).on('click', '.fa-star', function() {
			$(this).attr('class','fa fa-star-o').css("color", "black");
					var mN = $(this).data("id");
					var des
					
					$.ajax({
						url : "${cp}/starIdCall",
						type: "post",
						async: false,
						data: "msgNumber="+mN,
						success: function(data){
							des = data.descount;
						}
						
					});
					
					
			
					$.ajax({
					      url : "${cp}/removeStarbox",
					      type : "post",
// 					      data : "emailLabel=" + emailLabel + '&descount=' + descount,
					      data : "emailLabel=" + emailLabel + '&descount=' + des,
					      success : function(data){
					    	  const toast = Swal.mixin({
								  toast: true,
								  position: 'top-end',
								  showConfirmButton: false,
								  timer: 1500
								});

							toast({
							  type: 'success',
							  title: '중요메일함 에서 삭제되었습니다.'
							})
					      },
					      error : function(xhr){
					    	  console.log("실패");
					      }
					   });
		});
		
		$(document).on('click', '.fa-trash', function() {
			var msgNumber = new Array();
			$("#mailCount").html("");
// 			msgNumber = $(':checkbox:checked').data("id");
			
			$(':checkbox:checked').each(function(i, a){
				 msgNumber.push($(this).data("id"));
			 })
			
			var emailLabel = $("#emailLabel").val();
			
			
			$.ajax({
			      url : "${cp}/trashbox",
			      async: false,
			      type : "post",
			      data : "emailLabel=" + emailLabel + '&msgNumber=' + msgNumber,
			      success : function(data){
						for(var i = 0; i < msgNumber.length; i++){
							$("#div"+msgNumber[i]).remove();
						}
			    	  mesUID = data.mesUID;
				      emailLabel = data.emailLabel;
			    	  
			    	  const toast = Swal.mixin({
						  toast: true,
						  position: 'top-end',
						  showConfirmButton: false,
						  timer: 1500
						});

					toast({
					  type: 'success',
					  title: '휴지통 으로 이동됬습니다.'
					})
			      },
			      error : function(xhr){
			    	  console.log("실패");
			      }
			   });
			
		});
		
		
		$(document).on('click', '.subject', function() {
			var msgNumber = $(this).data("id");
			console.log(msgNumber);
			$("#msg").val(msgNumber);
			
			$("#mailfrm").submit();
		});	
		
	});
	
	
	
	

</script>

<form id="mailfrm" action="${cp }/detailMail" method="post">
 <input id="msg" type="hidden" name="msgNumber" >
 <input id="emailLabel" type="hidden" name="emailLabel" value="${emailLabel }">
</form>

<div class="container-fluid">
	<div class="row">
		<div class="col-lg-12">
			<div class="card">
				<div class="card-body">
					<div class="email-center-box">
						<div role="toolbar" class="toolbar">
						<input type="hidden" id="emailLabel" name="emailLabel" value="${emailLabel }"/>
						<input type="hidden" id="messageId" name="messageId" value="${messageId }"/>
						 <table>
						 	 <tr>
					 	 		<td>
									<div class="btn-group">
										<button aria-expanded="false" data-toggle="dropdown"
											class="btn btn-dark dropdown-toggle" type="button">
											More <span class="caret m-l-5"></span>
										</button>
										<div class="dropdown-menu">
											<a href="${cp }/MailStatus?check=T&emailLabel=${emailLabel }" class="dropdown-item">Read Mail</a>
											<a href="${cp }/MailStatus?check=F&emailLabel=${emailLabel }" class="dropdown-item">UnRead Mail</a> 
										</div>
									</div>
								</td>
								<td>
									&nbsp;&nbsp;&nbsp;<i class="fa fa-trash fa-3x" aria-hidden="true" style="cursor:pointer;"></i>
								</td>
							</tr>
						</table>
						</div>
						<div class="email-list m-t-15">
							<c:set var="mNum" value="${fn:length(messages)}" />
							<c:forEach  var="i" begin="1" end="${mNum }" step="1">
								<c:set var="msg" value="${messages[mNum-i]}" />
								<c:set var="personal" value="${personalList[mNum-i]}" />
								
								
								<div id="div${msg.getMessageNumber() }" class="message" style="margin-bottom: 2px;">
									<div class="row">
										<span class="col-1" style="text-align: center">
											<span class="email-checkbox">
												<input data-id=${msg.getMessageNumber() } type="checkbox">
											</span>
											
											<c:set value="F" var="star2"/>
											<c:forEach items="${starMail }" var="star">
													<!-- 폴더가 달라서 메세지 id가 달라 비교불가능 해서 제목으로 비교함 -->
													<c:if test="${star.subject == msg.subject }">
														<c:set value="T" var="star2"/>
														<c:if test="${star2 eq 'T' }">
															&nbsp;<i data-id=${msg.getMessageNumber() } name="star" class="fa fa-star" aria-hidden="true" style="color:#A82743;cursor:pointer;" ></i>
														</c:if>
													</c:if>
											</c:forEach>
													<c:if test="${star2 eq 'F'}">
														&nbsp;<i data-id=${msg.getMessageNumber() } name="star" class="fa fa-star-o" aria-hidden="true" style="cursor:pointer;"></i>
													</c:if>
											
										</span>
												<c:choose>
													<c:when test="${personal eq S_EMPLOYEE.email }">
														<span class="col-2">나</span>
													</c:when>
													<c:when test="${personal eq 'bshn940419@gmail.com' }">
														<span class="col-2">배상현(부장)</span>
													</c:when>
													<c:when test="${personal eq 'mingsoocode@gmail.com' }">
														<span class="col-2">조민수(과장)</span>
													</c:when>
													<c:when test="${personal eq 'testhong@gmail.com' }">
														<span class="col-2">홍다은(사원)</span>
													</c:when>
													<c:when test="${personal eq 'jmk5274@gmail.com' }">
														<span class="col-2">전민규(대리)</span>
													</c:when>
													<c:when test="${personal eq 'testhoon1217@gmail.com' }">
														<span class="col-2">김도훈(사원)</span>
													</c:when>
													<c:when test="${personal eq 'no-reply@accounts.google.com' }">
														<span class="col-2">Google</span>
													</c:when>
													<c:when test="${personal eq 'notifications@github.com' }">
														<span class="col-2">GitHub</span>
													</c:when>
													<c:otherwise>
														<span class="col-2">${personal}</span>
													</c:otherwise>
												</c:choose>
											<span data-id=${msg.getMessageNumber() } class="col-8 subject" style="cursor:pointer;">${msg.subject }</span>
										<span class="col-1"><fmt:formatDate value="${msg.receivedDate }" pattern="yyyy-MM-dd"/></span>
									</div>
								</div>
							</c:forEach>
						<!-- panel -->
						<div class="row">
							<div id="mailCount" class="col-7">
								<c:choose>
									<c:when test="${check eq 'T' || check eq 'F' }">
										
									</c:when>
									<c:otherwise>
										<c:choose>
											<c:when test="${messagesCount < map.pagesize }">
												<div class="text-left">${map.page} - ${messagesCount} of ${messagesCount }</div>
											</c:when>
											<c:when test="${paginationSize == map.page  }">
												<div class="text-left">${((map.page-1)*map.pagesize)+1} - ${messagesCount} of ${messagesCount }</div>
											</c:when>
											<c:otherwise>
												<div class="text-left">${((map.page-1)*map.pagesize)+1} - ${map.page*map.pagesize} of ${messagesCount }</div>
											</c:otherwise>
										</c:choose>
									</c:otherwise>
								</c:choose>
							
							</div>
							
							
							<c:choose>
								<c:when test="${check eq 'T' || check eq 'F' }">
										
								</c:when>
								<c:otherwise>
									<div class="bootstrap-pagination col-5">
		                                   <nav>
		                                       <ul class="pagination justify-content-end">
																	<c:choose>
																		<c:when test="${map.page == 1 }">
																			 <li class="page-item disabled">
																			 	<a class="page-link" href="#" tabindex="-1">Previous</a>
						                                            		</li>
																		</c:when>
																		<c:otherwise>
																			 <li class="page-item">
																			 	<a class="page-link" href="${cp }/mailbox?page=${map.page-1 }&emailLabel=${emailLabel} " tabindex="-1">Previous</a>
						                                            		</li>
																		</c:otherwise>
																	</c:choose>
																	
																	<c:forEach begin="1" end="${paginationSize }" var="i">
																		<c:choose>
																			<c:when test="${i == map.page }">
																				 <li class="page-item">
																				 	<a class="page-link" href="#">${i }</a>
						                                            			</li>																		
																			</c:when>
																			<c:otherwise>
																				<li class="page-item">
																					<a class="page-link" href="${cp }/mailbox?page=${i }&emailLabel=${emailLabel}">${i }</a>
						                                            			</li>
																			</c:otherwise>
																		</c:choose>
																	</c:forEach>
																	
																	<c:choose>
																		<c:when test="${map.page == paginationSize }">
																			<li class="page-item disabled">
																			 	<a class="page-link" href="#" tabindex="+1">Next</a>
						                                            		</li>
																		</c:when>
																		<c:otherwise>
																			<li class="page-item">
																			 	<a class="page-link" href="${cp }/mailbox?page=${map.page+1 }&emailLabel=${emailLabel} " tabindex="+1">Next</a>
						                                            		</li>
																		</c:otherwise>
																	
																	</c:choose>
					                        </ul>
					                   </nav>
								</div>
							</c:otherwise>
						</c:choose>
						
					</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>