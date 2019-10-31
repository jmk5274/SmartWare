<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<style>
	.hpanel .panel-body {
	    background: #fff;
	    border-radius: 2px;
	    padding: 15px;
	    position: relative;
	   -webkit-box-shadow: 0px 1px 2px 0px rgba(0, 0, 0, 0.1);
	    box-shadow: 0px 1px 2px 0px rgba(0, 0, 0, 0.1);
	}
	.panel-body {
	    padding: 15px;
	   background:#fff;
	}


</style>

<script>
	$(function(){
		$(".spam").click(function(){
			var emailLabel = $("#emailLabel").val();
			var msgNumber = $("#msgNumber").val();
			
			$.ajax({
			      url : "${cp}/spambox",
			      async: false,
			      type : "post",
			      data : "emailLabel=" + emailLabel + '&msgNumber=' + msgNumber,
			      success : function(data){
			    	  const toast = Swal.mixin({
						  toast: true,
						  position: 'top-end',
						  showConfirmButton: false,
						  timer: 1500
						});

					toast({
					  type: 'success',
					  title: '스팸메일함으로 이동됬습니다.'
					})
					
					setTimeout("location.href='${cp}/mailbox?emailLabel=[Gmail]/스팸함'",1000);
					
			      },
			      error : function(xhr){
			    	  console.log("실패");
			      }
			   });
		});
		
		
		$(".trash").click(function(){
			var emailLabel = $("#emailLabel").val();
			var msgNumber = $("#msgNumber").val();
			
			$.ajax({
			      url : "${cp}/trashbox",
			      async: false,
			      type : "post",
			      data : "emailLabel=" + emailLabel + '&msgNumber=' + msgNumber,
			      success : function(data){
					  console.log("성공");
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
					
					setTimeout("location.href='${cp}/mailbox?emailLabel=[Gmail]/휴지통'",1000);
					
			      },
			      error : function(xhr){
			    	  console.log("실패");
			      }
			   });
		});
	});




	function goBack() {
	    window.history.back();
	}
</script>

		<div class="card">
			<div class="card-body">
				<div class="email-center-box">
					<input type="hidden" id="emailLabel" name="emailLabel" value="${emailLabel }"/>
					<input type="hidden" id="msgNumber" name="msgNumber" value="${msgNumber }"/>
					<div class="toolbar" role="toolbar">
						<div class="btn-group m-b-20">
							<button type="button" class="btn btn-light spam">
								<i class="fa fa-exclamation-circle spam"></i>
							</button>
							<button type="button" class="btn btn-light trash">
								<i class="fa fa-trash"></i>
							</button>
						</div>
					</div>
					<div class="read-content">
						<div class="media pt-5">
							<div class="">
								<i class="fa fa-user-circle-o fa-3x" aria-hidden="true"></i>
							</div>
							&nbsp;&nbsp;
							<div class="media-body">
								
								<c:choose>
									<c:when test="${empty personal }">
										<h5 class="m-b-3">나</h5>
									</c:when>
									<c:otherwise>
										<h5 class="m-b-3">${personal }</h5>
									</c:otherwise>
								</c:choose>
							
								<p class="m-b-1"><fmt:formatDate value="${message.getReceivedDate() }" pattern="yyyy-MM-dd"/></p>
							</div>

						</div>
						<hr>
						<div class="media mb-4 mt-1">
							<div class="media-body">
								<span class="float-right"><fmt:formatDate value="${message.getReceivedDate() }" pattern="hh:mm a"/></span>
								<h4 class="m-0 text-primary">${message.subject }</h4>
								<c:choose>
									<c:when test="${reci2 == S_EMPLOYEE.email }">
										<small class="text-muted">To: 나에게</small>
									</c:when>
									<c:otherwise>
										<small class="text-muted">To: ${reci2 }</small>
									</c:otherwise>
								</c:choose>
							</div>
						</div>
						<h5 class="m-b-15">${textCont }</h5>
						<hr>
						<h6 class="p-t-15">
							<i class="fa fa-download mb-2"></i> Attachments 
							<span>
								<c:choose>
									<c:when test="${attachmentCount != 0 }">
										(${attachmentCount })
									</c:when>
									<c:otherwise>
										()
									</c:otherwise>
								</c:choose>
							</span>
						</h6>
						<div class="row m-b-30">
							<div class="col-auto"></div>
							<c:forEach items="${attachments }" var="info">
								<div class="hpanel">
			                        <div class="panel-body file-body incon-ctn-view" style="text-align: center;">
										<a href="${cp }/fileDownloadView2?filename=${info.getName() }">
										<c:choose>
												 <c:when test="${fn:split(info.getName(),'.')[1] eq 'jpg' || fn:split(info.getName(),'.')[1] eq 'JPG' || 
		                                             fn:split(info.getName(),'.')[1] eq 'png' || fn:split(info.getName(),'.')[1] eq 'png' ||
		                                             fn:split(info.getName(),'.')[1] eq 'gif' || fn:split(info.getName(),'.')[1] eq 'GIF'}">
			                                     <i class="fa fa-picture-o fa-3x" aria-hidden="true" style="display: block; color: #9D7E79"></i>
			                                	 </c:when>
												<c:otherwise>
													<i class="fa fa-file-pdf-o text-info fa-3x" style="display: block"></i>
												</c:otherwise>
										</c:choose>
			                        </div>
			                        <div class="panel-footer">
										<span>${info.getName() }</span>&nbsp;&nbsp;&nbsp;</a>
			                        </div>
		                      </div>&nbsp;&nbsp;
							</c:forEach>
						</div>
						<hr>

					</div>
					<div class="text-right">
						<a href="${cp }/writeMail?email=${address }"><button id="sendWrite" class="btn btn-primaryw-md m-b-30" type="button">Send</button></a>
						<button class="btn btn-primaryw-md m-b-30" type="button" onclick="goBack()">cancel</button>
					</div>
				</div>
			</div>
		</div>
