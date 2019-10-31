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
		
		$(document).on('click', '.fa-trash', function() {
			var msgNumber = new Array();
// 			msgNumber = $(':checkbox:checked').data("id");
			
			$(':checkbox:checked').each(function(i, a){
				 msgNumber.push($(this).data("id"));
			 })
			
			var emailLabel = $("#emailLabel").val();
			
			Swal.fire({
				  title: '해당메일을 삭제하시겠습니까?',
				  text: "지금 삭제시키면 복원할수 없습니다",
				  type: 'warning',
				  showCancelButton: true,
				  confirmButtonColor: '#3085d6',
				  cancelButtonColor: '#d33',
				  confirmButtonText: 'Mail delete!'
				}).then((result) => {
				  if (result.value) {
				    Swal.fire(
				    )
		    		$.ajax({
					      url : "${cp}/deleteMail",
					      async: false,
					      type : "post",
					      data : "emailLabel=" + emailLabel + '&msgNumber=' + msgNumber,
					      success : function(data){
					    	  console.log("성공");
								for(var i = 0; i < msgNumber.length; i++){
									$("#div"+msgNumber[i]).remove();
								}
					    	  mesUID = data.mesUID;
						      emailLabel = data.emailLabel;
					      },
					      error : function(xhr){
					    	  console.log("실패");
					      }
					  });
				  }
				})
		});
		
		
		$(document).on('click', '.fa-trash-o', function() {
			var msgNumber = new Array();
			msgNumber.push($(this).data("id"));
			var emailLabel = $("#emailLabel").val();
			
			Swal.fire({
				  title: '해당메일을 삭제하시겠습니까?',
				  text: "지금 삭제시키면 복원할수 없습니다",
				  type: 'warning',
				  showCancelButton: true,
				  confirmButtonColor: '#3085d6',
				  cancelButtonColor: '#d33',
				  confirmButtonText: 'Mail delete!'
				}).then((result) => {
				  if (result.value) {
				    Swal.fire(
				    )
		    		$.ajax({
					      url : "${cp}/deleteMail",
					      async: false,
					      type : "post",
					      data : "emailLabel=" + emailLabel + '&msgNumber=' + msgNumber,
					      success : function(data){
					    	  console.log("성공");
								for(var i = 0; i < msgNumber.length; i++){
									$("#div"+msgNumber[i]).remove();
								}
					    	  mesUID = data.mesUID;
						      emailLabel = data.emailLabel;
					      },
					      error : function(xhr){
					    	  console.log("실패");
					      }
					  });
				  }
				})
			
			
			
			
			
		});
		
		
		
		$(document).on('click', '.subject', function() {
			var msgNumber = $(this).data("id");
			$("#msg").val(msgNumber);
			
			$("#mailfrm").submit();
		});	
		
	});
	
	
	
	

</script>

<form id="mailfrm" action="${cp }/detailMail?emailLabel=${emailLabel }" method="post">
 <input id="msg" type="hidden" name="msgNumber" >
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
								
								<div id="div${msg.getMessageNumber() }" class="message">
									<div class="row">
										<span class="col-1" style="text-align: center">
											<span class="email-checkbox">
												<input data-id=${msg.getMessageNumber() } type="checkbox">
											</span>
											&nbsp;<i data-id=${msg.getMessageNumber() } name="single" class="fa fa-trash-o" aria-hidden="true" style="cursor:pointer;"></i>
										</span>
												<c:choose>
													<c:when test="${empty personal }">
														<span class="col-2">나</span>
													</c:when>
													<c:otherwise>
														<span class="col-2">${personal}</span>
													</c:otherwise>
												</c:choose>
											<span data-id=${msg.getMessageNumber() } data-label="${emailLabel }" class="col-8 subject" style="cursor:pointer;">${msg.subject }</span>
										<span class="col-1"><fmt:formatDate value="${msg.receivedDate }" pattern="yyyy-MM-dd"/></span>
									</div>
								</div>
							</c:forEach>
						<!-- panel -->
						<div class="row">
							<div class="col-7">
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