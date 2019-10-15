<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<script>
	$(function(){
		$(document).on('click', '.fa-star-o', function() {
			$(this).attr('class','ti-star');

			
		});
		
		$(document).on('click', '.ti-star', function() {
			$(this).attr('class','fa-star-o');
			
		});
		
		$(document).on('click', '.subject', function() {
			
		});	
		
	});
	
	
	
	

</script>

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
							<c:forEach items="${messages }" var="msg">
								<div class="message">
									<div class="row">
										<span class="col-1">
											<span class="email-checkbox">
												<input type="checkbox">
											</span>
											&nbsp;<i class="fa fa-star-o" aria-hidden="true"></i>
										</span>
												<c:choose>
													<c:when test="${msg.getFrom()[0] == S_EMPLOYEE.email }">
														<span class="col-2">나</span>
													</c:when>
													<%-- <c:when test="${fn:contains(msg.getFrom()[0], '@') && (msg.getFrom()[0] != S_EMPLOYEE.email)}">
														<c:set var="array" value="${fn:split(msg.getFrom()[0], '@') }" />
														<span class="col-2">${array[0] }</span>
													</c:when> --%>
													<c:otherwise>
														<span class="col-2">${msg.getFrom()[0] }</span>
													</c:otherwise>
												</c:choose>
										<form id action="${cp }/detailMail" method="post">
											<span class="col-8 subject">${msg.subject }</span>
										</form>
										<span class="col-1"><fmt:formatDate value="${msg.receivedDate }" pattern="yyyy-MM-dd"/></span>
									</div>
								</div>
							</c:forEach>
						<!-- panel -->
						<div class="row">
							<div class="col-7">
								<div class="text-left">1 - 20 of ${messagesCount }</div>
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