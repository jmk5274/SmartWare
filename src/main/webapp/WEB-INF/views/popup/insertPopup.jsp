<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div class="container-fluid">
	<div class="row">
		<div class="col-12">
			<div class="card">
				<div class="card-body">
					<div>
						<h4>팝업 등록</h4>
					</div>
					<br>
					<div class="form-row">
						<div class="col-1">
							<label class="col-form-label">작성자</label>
						</div>
						<div class="col">
							<input type="text" class="form-control" value="${S_EMPLOYEE.emp_nm }" disabled>
						</div>
					</div>
					<div class="form-row">
						<div class="col-1">
							<label class="col-form-label">타이틀</label>
						</div>
						<div class="col">
							<input type="text" class="form-control" placeholder="Title을 입력하세요">
						</div>
					</div>
					<form>
						<div class="form-row">
							<div class="col-1">
								<label class="col-form-label">위치</label>
							</div>
							<div class="col">
								<input type="text" class="form-control" placeholder="top">
							</div>
							<div class="col">
								<input type="text" class="form-control" placeholder="right">
							</div>
							<div class="col">
								<input type="text" class="form-control" placeholder="bottom">
							</div>
							<div class="col">
								<input type="text" class="form-control" placeholder="left">
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>