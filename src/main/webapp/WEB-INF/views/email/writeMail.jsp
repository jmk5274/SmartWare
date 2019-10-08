<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<script type="text/javascript" src="${cp }/ckeditor/ckeditor.js"></script>
<script>
	$(function(){
		$("#sendbtn").click(function(){
			$("#frm").submit();
		});
		
	})
</script>

<div class="container-fluid">
	<div class="row">
		<div class="col-lg-12">
			<div class="card">
				<div class="card-body">
					<div class="email-center-box">
						<div class="toolbar" role="toolbar">
							<div class="btn-group m-b-20">
								<a href="${cp}/sendEmail " class="btn btn-primary btn-block">메일
									쓰기</a>
							</div>
						</div>
						<form id="frm" action="${cp}/sendEmail" method="post" enctype="multipart/form-data">
						<div class="compose-content mt-5">
								<input type="text" name="reci"
									class="form-control bg-transparent" placeholder=" To"
									style="width: 300px;"> <input type="text" name="email"
									value="${S_EMPLOYEE.email }" /> <input type="text"
									name="emailPass" value="${S_EMPLOYEE.email_pass }" />
						</div>
						<div class="form-group">
							<input type="text" name="subject"
								class="form-control bg-transparent" placeholder=" Subject"
								style="width: 900px;">
						</div>

						<div class="row justify-content-md-center">
							<div class="col_c" style="margin-bottom: 30px">
								<div class="input-group">
									<textarea class="form-control" id="p_content" name="cont"></textarea>
									<script type="text/javascript">
					                  CKEDITOR.replace('p_content'
					                                                  , {height: 500                                                  
					                                                  });
					                  </script>
								</div>
							</div>
						</div>
						</form>
						<h5 class="m-b-20">
							<i class="fa fa-paperclip m-r-5 f-s-18"></i> Attatchment
						</h5>
						<form action="#" class="dropzone">
							<div class="form-group">
								<div class="fallback">
									<input class="l-border-1" name="attatch" type="file"
										multiple="multiple">
								</div>
							</div>
						</form>
					</div>
					<div class="text-left m-t-15">
						<button id="sendbtn"
							class="btn btn-primary m-b-30 m-t-15 f-s-14 p-l-20 p-r-20 m-r-10"
							type="button">
							<i class="fa fa-paper-plane m-r-5"></i> Send
						</button>
						<button class="btn btn-dark m-b-30 m-t-15 f-s-14 p-l-20 p-r-20"
							type="button">
							<i class="ti-close m-r-5 f-s-12"></i> Discard
						</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
