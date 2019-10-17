<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<script>
	$(function(){
		$(document).on('click', '.fa-star-o', function() {
			$(this).attr('class','fa fa-star').css("color", "#A82743");
			

			
		});
		
		$(document).on('click', '.fa-star', function() {
			$(this).attr('class','fa fa-star-o').css("color", "black");
			
		});
		
		$(document).on('click', '.subject', function() {
			var msgNumber = $(this).data("id");
			console.log(msgNumber);
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
						 <table>
						 	 <tr>
					 	 		<td>
									<div class="btn-group">
										<button aria-expanded="false" data-toggle="dropdown"
											class="btn btn-dark dropdown-toggle" type="button">
											More <span class="caret m-l-5"></span>
										</button>
										<div class="dropdown-menu">
											<a href="javascript: void(0);" class="dropdown-item">Read Mail</a>
											<a href="javascript: void(0);" class="dropdown-item">UnRead Mail</a> 
										</div>
									</div>
								</td>
								<td>
									&nbsp;&nbsp;&nbsp;<i class="fa fa-trash fa-3x" aria-hidden="true"></i>
								</td>
							</tr>
						</table>
						</div>
						<div class="email-list m-t-15">
							<c:set var="mNum" value="${fn:length(messages)}" />
							
							<c:forEach  var="i" begin="1" end="${mNum }" step="1">
								<c:set var="msg" value="${messages[mNum-i]}" />
								<c:set var="personal" value="${personalList[mNum-i]}" />
								
								<div class="message">
									<div class="row">
										<span class="col-1">
											<span class="email-checkbox">
												<input type="checkbox">
											</span>
											&nbsp;<i name="star" class="fa fa-star-o" aria-hidden="true"></i>
										</span>
												<c:choose>
													<c:when test="${empty personal }">
														<span class="col-2">나</span>
													</c:when>
													<c:otherwise>
														<span class="col-2">${personal}</span>
													</c:otherwise>
												</c:choose>
											<span data-id=${msg.getMessageNumber() } class="col-8 subject">${msg.subject }</span>
										<span class="col-1"><fmt:formatDate value="${msg.receivedDate }" pattern="yyyy-MM-dd"/></span>
									</div>
								</div>
							</c:forEach>
						<!-- panel -->
						<div class="row">
							<div class="col-7">
								<div class="text-left">1 - ${messagesCount } of ${messagesCount }</div>
							</div>
							<div class="col-5">
								<div class="btn-group float-right">
									<button class="btn btn-gradient" type="button">
										<i class="fa fa-angle-left"></i>
									</button>
									<button class="btn btn-dark" type="button">
										<i class="fa fa-angle-right"></i>
									</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>