<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<script>
	$(function(){
		$(".ti-star").click(function(){
			
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
						</div>
						<div class="email-list m-t-15">
							<c:forEach items="${messages }" var="msg">
								<div class="message">
									<div class="row">
										<span class="col-1">
											<span class="email-checkbox">
												<input type="checkbox">
											</span>
											&nbsp;&nbsp;<i class="fa fa-star" aria-hidden="true"></i>
										</span>
												<c:choose>
													<c:when test="${msg.getFrom()[0] == S_EMPLOYEE.email }">
														<span class="col-2">나</span>
													</c:when>
													<c:otherwise>
														<span class="col-2">${msg.getFrom()[0] }</span>
													</c:otherwise>
												</c:choose>
										<span class="col-8">${msg.subject }</span>
										<span class="col-1"><fmt:formatDate value="${msg.receivedDate }" pattern="yyyy-MM-dd"/></span>
									</div>
								</div>
							</c:forEach>
						<!-- panel -->
						<div class="row">
							<div class="col-7">
								<div class="text-left">1 - 20 of 568</div>
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