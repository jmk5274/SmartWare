<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link href="${cp }/plugin/tui-date-picker/tui-date-picker.css"
	rel="stylesheet" />
<link href="${cp }/plugin/tui-date-picker/tui-time-picker.css"
	rel="stylesheet" />
<script src="${cp }/plugin/tui-date-picker/tui-code-snippet.js"></script>
<script src="${cp }/plugin/tui-date-picker/tui-dom.js"></script>
<script src="${cp }/plugin/tui-date-picker/tui-time-picker.js"></script>
<script src="${cp }/plugin/tui-date-picker/tui-date-picker.js"></script>

<style>
.form-row {
	margin-bottom: 30px;
}
</style>
<script>
	$(function(){
		var page = ${page};
		popupListView(page);
		
		$(".insertPopup").click(function(){
			var fileCheck = document.getElementById("file").files;
// 			var title = $("#pop_title").val();
// 			var left = $("#left").val().split;
// 			var top = $("#top").val().split;
// 			var startpicker = $("#startpicker-input").val() + "";
// 			var endpicker = $("#endpicker-input").val() + "";
			
			if(fileCheck.length===0){
// 				|| title.length===0 || left[0].length===0 || top[0].length===0 || startpicker.length===0 || endpicker.length===0
				alert("항목을 모두 입력해주세요.")
				insertForm.reset();
				$("#fileLabel").text("");
				return false;
			}
			
	        var myForm = document.getElementById('insertForm');
	        var formData = new FormData(myForm);
	        
			$.ajax({
				url : "${cp}/insertPopupView",
				enctype : "multipart/form-data",
				contentType : false,
				processData : false,
				dataType : "json",
				method : "post",
				data : formData,
				success : function(data){
					insertForm.reset();		
					$("#fileLabel").text("");
					popupListView(1);
				}
			});
		});
		
		$("#moveBtn").click(function(){
				var popupX = (window.screen.width / 2) - (500 / 2);
				var popupY= (window.screen.height / 2) - (650 / 2);
				
				hpop = window.open('${cp }/tempPopup', '팝업창', 'width=500px, height=650px, left='+ popupX + ', top='+ popupY);
		});
		
		$("#modifyMoveBtn").click(function(){
				var popupX = (window.screen.width / 2) - (500 / 2);
				var popupY= (window.screen.height / 2) - (650 / 2);
				
				hpop = window.open('${cp }/modifyPopup', '팝업창', 'width=500px, height=650px, left='+ popupX + ', top='+ popupY);
		});
		
		$("#file").change(function(e){
	        var myForm = document.getElementById('insertForm');
	        var formData = new FormData(myForm);
	        
			$("#fileLabel").text(($('input[type=file]')[0].files[0].name));
		});

		$(".bd-example-modal-lg").on('hide.bs.modal', function(e){
			insertForm.reset();
			$("#fileLabel").text("");
		});
		
		$("#file2").change(function(e){
	        var myForm = document.getElementById('insertForm');
	        var formData = new FormData(myForm);
	        
			$("#fileLabel2").text(($('input[type=file]')[1].files[0].name));
		});
	});

	function popupListView(page){
		$.ajax({
			url : "${cp}/popupPagiList",
			data : "page="+page,
			success : function(data){
				popupPagingList(data.popupPageList);
				pagination(data.page, data.paginationSize);
			}
		});
	}
	
	function popupPagingList(popupPageList){
		var html = "";
		
		$("#tBody").empty();
		popupPageList.forEach(function(popup){
	        html += '<tr class="popupTr" data-pop_id="'+popup.pop_id+'">';
	        html += 	'<td>'+popup.pop_id+'</td>';
	        html += 	'<td>'+popup.pop_title+'</td>';
	        html += 	'<td>'+moment(new Date(popup.pop_st_dt)).format('YYYY/MM/DD')+'</td>';
	        html += 	'<td>'+moment(new Date(popup.pop_end_dt)).format('YYYY/MM/DD')+'</td>';
	        html += 	'<td>';
	        html +=		'<input data-pop_id='+popup.pop_id+' style="float:right;" class="btn btn-outline-primary viewBtn" type="button" value="미리보기"></td>';
	    	html += '</tr>'
		});
		$("#tBody").html(html);
		
		$(".viewBtn").click(function(){
			var pop_id = $(this).data("pop_id");
			
			$.ajax({
				url : "${cp}/getOnePopup",
				data : "pop_id="+pop_id,
				method : "post",
				success : function(data){
					
				var popupX = (data.popup.pop_left);
				var popupY= (data.popup.pop_top);
			
				window.open('${cp }/popupView?pop_id='+pop_id, '팝업창', 'width=500px, height=650px, left='+ popupX + ', top='+ popupY);
				}
			});
		});
		
		$(".popupTr").click(function(){
			$("#fileLabel2").text("");
			modifyForm.reset();
			var pop_id = $(this).data("pop_id");
			$.ajax({
				url : "${cp}/getOnePopup",
				dataType : "json",
				method : "post",
				data : "pop_id="+pop_id,
				success : function(data){
					$("#writer").val(data.popup.emp_id);
					$("#modifyTitle").val(data.popup.pop_title);
					$("#modifyTop").val("X 좌표: " + data.popup.pop_left);
					$("#modifyLeft").val("Y 좌표: " + data.popup.pop_top);
					$("#reg_dt").val(moment(new Date(data.popup.reg_dt)).format('YYYY-MM-DD'));
					$("#startpicker-input2").val(moment(new Date(data.popup.pop_st_dt)).format('YYYY-MM-DD'));
					$("#endpicker-input2").val(moment(new Date(data.popup.pop_end_dt)).format('YYYY-MM-DD'));
					$("#hidden").val(data.popup.pop_id);	
					var deleteBtn = $('<button data-pop_id="'+data.popup.pop_id+'" type="button" style="float:right;" class="btn btn-danger deletePopup" data-dismiss="modal">삭제</button>');
					var modifyBtn = $('<button type="button" class="btn btn-primary modifyPopup" data-dismiss="modal">수정</button>');
					
					deleteBtn.click(function(){
						var pop_id = $(this).data("pop_id");
						
						$.ajax({
							url : "${cp}/deletePopup",
							dataType : "json",
							method : "post",
							data : "pop_id="+pop_id,
							success : function(data){
								popupListView(1);
								$(".btnSpace").empty()
							}
						});
					});
					
					modifyBtn.click(function(){
				        var myForm = document.getElementById('modifyForm');
				        var formData = new FormData(myForm);
						$.ajax({
							url : "${cp}/modifyPopup",
							enctype : "multipart/form-data",
							contentType : false,
							processData : false,
							dataType : "json",
							method : "post",
							data : formData,
							success : function(data){
								modifyForm.reset();		
								$("#fileLabel2").text("");
								popupListView(1);
								$(".btnSpace").empty()
							}
						});
					});
					
					$(".btnSpace").empty().append(deleteBtn).append(modifyBtn);
				}
			});
		});
	}

	function pagination(page, paginationSize){
		var html = "";
		
		$(".pagination").empty();
		if(page == 1)
			html += '<li class="page-item readonly"><span class="page-link">«</span></li>';
		else
       		html +=	'<li class="page-item" data-page="'+i+'"><span class="page-link">«</span></li>';
       	for(var i=1; i<=paginationSize; i++){
			if(i==page)
				html += '<li class="page-item readonly"><span class="page-link">'+i+'</span></li>';
			else
				html += '<li class="page-item" data-page="'+i+'"><span class="page-link">'+i+'</span></li>';
       	}
       	if(page == paginationSize)
       		html += '<li class="page-item readonly"><span class="page-link">»</span></li>';
       	else
       		html += '<li class="page-item" data-page="'+i+'"><span class="page-link">»</span></li>';
		$(".pagination").html(html);
       		
    	$(".page-item").click(function(){
    		var page = $(this).data("page");
    		popupListView(page);
    	});
	}
</script>

<div class="container-fluid">
	<div class="row">
		<div class="col-8">
			<div class="card">
				<div class="card-body">
					<div>
						<h4>팝업 목록</h4>
					</div>
					<div class="header-content clearfix">
						<div class="header-left"
							style="margin-left: 0px; margin-bottom: 30px;">
							<div class="input-group icons">
								<div class="input-group-prepend">
									<span class="input-group-text bg-transparent border-0"
										id="basic-addon1"><i class="mdi mdi-magnify"></i></span>
								</div>
								<input type="search" class="form-control"
									placeholder="Search Dashboard" aria-label="Search Dashboard">
								<div class="drop-down   d-md-none">
									<form action="#">
										<input type="text" class="form-control" placeholder="Search">
									</form>
								</div>
							</div>
						</div>
					</div>
					<table class="table table-hover">
						<thead>
							<tr>
								<th>번호</th>
								<th>타이틀</th>
								<th>시작 날짜</th>
								<th>종료 날짜</th>
							</tr>
						</thead>
						<tbody id="tBody">
						</tbody>
					</table>
					<div class="bootstrap-pagination">
						<nav>
							<ul class="pagination justify-content-center">
							</ul>
							<div class="bootstrap-modal" style="float: right;">
								<!-- Large modal -->
								<button type="button" class="btn btn-primary"
									data-toggle="modal" data-target=".bd-example-modal-lg">등록</button>
								<div class="modal fade bd-example-modal-lg" tabindex="-1"
									role="dialog" aria-hidden="true">
									<div class="modal-dialog modal-lg">
										<div class="modal-content">
											<div class="modal-header">
												<h5 class="modal-title">팝업 등록</h5>
												<button type="button" class="close" data-dismiss="modal">
													<span>×</span>
												</button>
											</div>
											<div class="modal-body">
												<div class="form-row">
													<div class="col-2">
														<label class="col-form-label">작성자</label>
													</div>
													<div class="col">
														<input type="text" class="form-control"
															value="${S_EMPLOYEE.emp_nm }" readonly>
													</div>
												</div>
												<form id="insertForm" method="post"
													enctype="multipart/form-data">
													<div class="form-row">
														<div class="col-2">
															<label class="col-form-label">타이틀</label>
														</div>
														<div class="col">
															<input name="pop_title" type="text" class="form-control"
																placeholder="Title을 입력하세요">
														</div>
													</div>
													<div class="form-row">
														<div class="col-2">
															<label class="col-form-label">위치</label>
														</div>
														<div class="col">
															<input id="left" name="X" type="text"
																class="form-control" placeholder="X 좌표" readonly />
														</div>
														<div class="col">
															<input id="top" name="Y" type="text" class="form-control"
																placeholder="Y 좌표" readonly />
														</div>
														<div class="col-2">
															<input style="vertical-align: middle;" id="moveBtn"
																type="button" class="btn btn-secondary" value="클릭" />
														</div>
													</div>
													<div class="form-row code-html">
														<div class="col-2">
															<label class="col-form-label">기간</label>
														</div>
														<div class="col-3">
															<div
																class="form-control tui-datepicker-input tui-datetime-input tui-has-focus">
																<input name="startPicker" id="startpicker-input"
																	type="text" aria-label="Date"> <span
																	class="tui-ico-date"></span>
																<div id="startpicker-container"
																	style="margin-left: -1px;"></div>
															</div>
														</div>
														<div class="col-3">
															<div
																class="form-control tui-datepicker-input tui-datetime-input tui-has-focus">
																<input name="endPicker" id="endpicker-input" type="text"
																	aria-label="Date"> <span class="tui-ico-date"></span>
																<div id="endpicker-container" style="margin-left: -1px;"></div>
															</div>
														</div>
													</div>
													<div class="form-row">
														<div class="col-2">
															<label class="col-form-label">파일첨부</label>
														</div>
														<div class="col">
															<div class="custom-file">
																<input id="file" name="file" type="file"
																	class="custom-file-input"> <label
																	id="fileLabel" class="custom-file-label"></label>
															</div>
														</div>
													</div>
												</form>
											</div>
											<div class="modal-footer">
												<button type="button" class="btn btn-secondary closePopup"
													data-dismiss="modal">취소</button>
												<button type="button" class="btn btn-primary insertPopup"
													data-dismiss="modal">등록</button>
											</div>
										</div>
									</div>
								</div>
							</div>
						</nav>
					</div>
				</div>
			</div>
		</div>
		<div class="col">
			<div class="card">
				<div class="card-body">
					<div>
						<h4>팝업 정보</h4>
					</div>
					<div class="modal-body">
						<div class="form-row">
							<div class="col-2">
								<label class="col-form-label">작성자</label>
							</div>
							<div class="col">
								<input id="writer" type="text" class="form-control" readonly>
							</div>
						</div>
						<div class="form-row">
							<div class="col-2">
								<label class="col-form-label">등록일</label>
							</div>
							<div class="col">
								<input id="reg_dt" type="text" class="form-control" readonly>
							</div>
						</div>
						<form id="modifyForm" method="post" enctype="multipart/form-data">
							<div class="form-row">
								<div class="col-2">
									<label class="col-form-label">타이틀</label>
								</div>
								<div class="col">
									<input id="modifyTitle" name="pop_title" type="text"
										class="form-control" placeholder="Title을 입력하세요">
								</div>
							</div>
							<div class="form-row">
								<div class="col-2">
									<label class="col-form-label">위치</label>
								</div>
								<div class="col">
									<input id="modifyLeft" name="X" type="text"
										class="form-control" placeholder="X 좌표" readonly />
								</div>
								<div class="col">
									<input id="modifyTop" name="Y" type="text" class="form-control"
										placeholder="Y 좌표" readonly />
								</div>
								<div class="col-2">
									<input style="vertical-align: middle;" id="modifyMoveBtn"
										type="button" class="btn btn-secondary" value="클릭" />
								</div>
							</div>
							<div class="form-row code-html">
								<div class="col-2">
									<label class="col-form-label">기간</label>
								</div>
								<div class="col-4">
									<div
										class="form-control tui-datepicker-input tui-datetime-input tui-has-focus">
										<input name="startPicker" id="startpicker-input2" type="text"
											aria-label="Date"> <span class="tui-ico-date"></span>
										<div id="startpicker-container2" style="margin-left: -1px;"></div>
									</div>
								</div>
								<div class="col-4">
									<div
										class="form-control tui-datepicker-input tui-datetime-input tui-has-focus">
										<input name="endPicker" id="endpicker-input2" type="text"
											aria-label="Date"> <span class="tui-ico-date"></span>
										<div id="endpicker-container2" style="margin-left: -1px;"></div>
									</div>
								</div>
							</div>
							<div class="form-row">
								<div class="col-2">
									<label class="col-form-label">파일첨부</label>
								</div>
								<div class="col">
									<div class="custom-file">
										<input id="file2" name="file2" type="file"
											class="custom-file-input"> <label id="fileLabel2"
											class="custom-file-label"></label>
									</div>
								</div>
							</div>
							<input id="hidden" name="pop_id" type="hidden" />
						</form>
					</div>
					<div class="modal-footer btnSpace"></div>
				</div>
			</div>
		</div>
	</div>
</div>
<script class="code-js">
	var picker = tui.DatePicker.createRangePicker({
		language: 'ko',
	    startpicker: {
	        date: new Date(),
	        input: '#startpicker-input',
	        container: '#startpicker-container'
	    },
	    endpicker: {
	        date: new Date(),
	        input: '#endpicker-input',
	        container: '#endpicker-container'
	    },
	    type: 'date',
	    format: 'yyyy-MM-dd'
	});
	
	var picker2 = tui.DatePicker.createRangePicker({
		language: 'ko',
	    startpicker: {
	        date: new Date(),
	        input: '#startpicker-input2',
	        container: '#startpicker-container2'
	    },
	    endpicker: {
	        date: new Date(),
	        input: '#endpicker-input2',
	        container: '#endpicker-container2'
	    },
	    type: 'date',
	    format: 'yyyy-MM-dd'
	});

</script>
