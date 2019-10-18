<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link href= "${cp }/plugin/tui-date-picker/tui-date-picker.css" rel="stylesheet"/>
<link href= "${cp }/plugin/tui-date-picker/tui-time-picker.css" rel="stylesheet"/>
<script src="${cp }/plugin/tui-date-picker/tui-code-snippet.js"></script>
<script src="${cp }/plugin/tui-date-picker/tui-dom.js"></script>
<script src="${cp }/plugin/tui-date-picker/tui-time-picker.js"></script>
<script src="${cp }/plugin/tui-date-picker/tui-date-picker.js"></script>

<style>
	.form-row{
		margin-bottom: 30px;
	}
</style>
<script>
	$(function(){
		var page = ${page};
		popupListView(page);
		
		$(".insertPopup").click(function(){
// 			var str = $("#insertForm").serialize();
			
			
	         
	        var myForm = document.getElementById('insertForm');
	        var formData = new FormData(myForm);
			console.log(formData);
			$.ajax({
				url : "${cp}/insertPopupView",
				enctype : "multipart/form-data",
				contentType : false,
				processData : false,
				dataType : "json",
				method : "post",
				data : formData,
				success : function(data){
					console.log(data);
				}
			});
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
	        html += '<tr>';
	        html += 	'<td>'+popup.pop_id+'</td>';
	        html += 	'<td>'+popup.pop_title+'</td>';
	        html += 	'<td>'+moment(new Date(popup.pop_st_dt)).format('YYYY/MM/DD')+'</td>';
	        html += 	'<td>'+moment(new Date(popup.pop_end_dt)).format('YYYY/MM/DD')+'</td>';
	        html += 	'<td><input style="float:right;" class="btn btn-outline-danger btn" type="button" value="삭제">';
	        html +=		'<input style="float:right;" class="btn btn-outline-info btn" type="button" value="수정">';
	        html +=		'<input style="float:right;" class="btn btn-outline-primary btn" type="button" value="미리보기"></td>';
	    	html += '</tr>'
		});
		$("#tBody").html(html);
		
		$(".btn").click(function(){
			$(this).val();
		});
	}

	function pagination(page, paginationSize){
		var html = "";
		
		$(".pagination").empty();
		if(page == 1)
			html += '<li class="page-item disabled"><span class="page-link">«</span></li>';
		else
       		html +=	'<li class="page-item" data-page="'+i+'"><span class="page-link">«</span></li>';
       	for(var i=1; i<=paginationSize; i++){
			if(i==page)
				html += '<li class="page-item disabled"><span class="page-link">'+i+'</span></li>';
			else
				html += '<li class="page-item" data-page="'+i+'"><span class="page-link">'+i+'</span></li>';
       	}
       	if(page == paginationSize)
       		html += '<li class="page-item disabled"><span class="page-link">»</span></li>';
       	else
       		html += '<li class="page-item" data-page="'+i+'"><span class="page-link">»</span></li>';
		$(".pagination").html(html);
       		
    	$(".page-item").click(function(){
    		var page = $(this).data("page");
    		console.log(page);
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
	                   <div class="header-left" style="margin-left:0px; margin-bottom:30px;">
		                   <div class="input-group icons">
		                        <div class="input-group-prepend">
		                            <span class="input-group-text bg-transparent border-0" id="basic-addon1"><i class="mdi mdi-magnify"></i></span>
		                        </div>
		                        <input type="search" class="form-control" placeholder="Search Dashboard" aria-label="Search Dashboard">
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
							<div class="bootstrap-modal" style="float:right;">
                                <!-- Large modal -->
                                <button type="button" class="btn btn-primary" data-toggle="modal" data-target=".bd-example-modal-lg">등록</button>
                                <div class="modal fade bd-example-modal-lg" tabindex="-1" role="dialog" aria-hidden="true">
                                    <div class="modal-dialog modal-lg">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title">팝업 등록</h5>
                                                <button type="button" class="close" data-dismiss="modal"><span>×</span>
                                                </button>
                                            </div>
                                            <div class="modal-body">
												<div class="form-row">
													<div class="col-2">
														<label class="col-form-label">작성자</label>
													</div>
													<div class="col">
														<input type="text" class="form-control" value="${S_EMPLOYEE.emp_nm }" disabled>
													</div>
												</div>
	                                            <form id="insertForm" method="post" enctype="multipart/form-data">
													<div class="form-row">
														<div class="col-2">
															<label class="col-form-label">타이틀</label>
														</div>
														<div class="col">
															<input name="pop_title" type="text" class="form-control" placeholder="Title을 입력하세요">
														</div>
													</div>
													<div class="form-row">
														<div class="col-2">
															<label class="col-form-label">위치</label>
														</div>
														<div class="col">
															<input name="pop_top" type="text" class="form-control" placeholder="top">
														</div>
														<div class="col">
															<input name="pop_right" type="text" class="form-control" placeholder="right">
														</div>
														<div class="col">
															<input name="pop_bottom" type="text" class="form-control" placeholder="bottom">
														</div>
														<div class="col">
															<input name="pop_left" type="text" class="form-control" placeholder="left">
														</div>
													</div>
													<div class="form-row code-html">
														<div class="col-2">
															<label class="col-form-label">기간</label>
														</div>
									                    <div class="col-3">
															<div class="form-control tui-datepicker-input tui-datetime-input tui-has-focus">
																<input name="startPicker" id="startpicker-input" type="text" aria-label="Date">
																<span class="tui-ico-date"></span>
																<div id="startpicker-container" style="margin-left: -1px;"></div>
															</div>
									                    </div>
									                    <div class="col-3">
															<div class="form-control tui-datepicker-input tui-datetime-input tui-has-focus">
																<input name="endPicker" id="endpicker-input" type="text" aria-label="Date">
																<span class="tui-ico-date"></span>
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
				                                                <input id="file" name="file" type="file" class="custom-file-input">
				                                                <label class="custom-file-label">여기를 클릭하세요</label>
				                                            </div>
														</div>
													</div>
	                                            </form>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
                                                <button type="button" class="btn btn-primary insertPopup" data-dismiss="modal">등록</button>
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
</script>
