<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- tui-date-picker css -->
<link href= "${cp }/plugin/tui-date-picker/tui-date-picker.css" rel="stylesheet"/>
<link href= "${cp }/plugin/tui-date-picker/tui-time-picker.css" rel="stylesheet"/>

<!-- select2 css -->
<link href= "${cp }/plugin/select2/select2.min.css" rel="stylesheet"/>

<!-- 현재 페이지의 css -->
<link href= "${cp }/css/pms/main.css" rel="stylesheet" />

<!-- body 시작 -->
<div class="row">
	<!-- project list -->
	<c:if test="${S_EMPLOYEE.posi_id eq 'posi0001' or S_EMPLOYEE.posi_id eq 'posi0002' or S_EMPLOYEE.posi_id eq 'posi0003' }">
		<div class="col-12">
		<div class="card">
			<div class="card-body">
				<button type="button" id="btnInsertProject" class="btn mb-1 btn-outline-dark btn-lg">
					<i class="fa fa-plus" aria-hidden="true"></i> 신규 프로젝트 생성
				</button>
			</div>
		</div>
	</div>
	</c:if>
	
	<div class="col-12">
		<div class="card">
			<div id="runningProject" class="card-body">
				<h2><i class="fa fa-file-text"></i> 진행중인 프로젝트</h2>
			</div>
		</div>
		<div class="card">
			<div id="pastProject" class="card-body">
				<h2><i class="fa fa-file-text"></i> 완료한 프로젝트</h2>
			</div>
		</div>
	</div>
</div>

<!-- new project modal -->
<div class="bootstrap-modal">
    <div class="modal fade" id="projectModal">
        <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h3 class="modal-title"><i class='fa fa-file-text fa-lg' style='color: black;'> </i> 신규 프로젝트 생성</h3>
                </div>
                <div class="modal-body basic-form">
                	<form id="projectForm">
<!--                 		<input type="hidden" name="cal_id" id="cal_id"/> -->
<%--                 		<input type="hidden" name="depart_id" value="${S_EMPLOYEE.depart_id }"/> --%>
<%--                 		<input type="hidden" name="emp_id" value="${S_EMPLOYEE.emp_id }"/> --%>
                		
                		<div class="form-group row">
                			<div class="col-sm-1"></div>
		                    <label class="col-sm-2 col-form-label">프로젝트명</label>
		                    <div class="col-sm-8">
		                    	<input type="text" class="form-control" id="pro_nm" name="pro_nm">
		                    </div>
	                    </div>
	                    
	                    <div class="form-group row">
	                     	<div class="col-sm-1"></div>
		                    <label class="col-sm-2 col-form-label">시작일</label>
		                    <div class="col-sm-3">
								<div class="form-control tui-datepicker-input tui-datetime-input tui-has-focus">
									<input id="startpicker-input" type="text" aria-label="Date" name="st_dt">
									<span class="tui-ico-date"></span>
									<div id="startpicker-container" style="margin-left: -1px;"></div>
								</div>
		                    </div>
		                    <label class="col-sm-2 col-form-label">종료일</label>
		                    <div class="col-sm-3">
								<div class="form-control tui-datepicker-input tui-datetime-input tui-has-focus">
									<input id="endpicker-input" type="text" aria-label="Date" name="end_dt">
									<span class="tui-ico-date"></span>
									<div id="endpicker-container" style="margin-left: -1px;"></div>
								</div>
		                    </div>
		                </div>
						
	                    <div class="form-group row">
	                    	<div class="col-sm-1"></div>
		                    <label class="col-sm-2 col-form-label">팀장</label>
		                    <div class="col-sm-8">
		                    	<select class="form-control empList" id="leader" style="width: 100%" name="leader"></select>
		                    </div>
	                    </div>
	                    <div class="form-group row">
	                    	<div class="col-sm-1"></div>
		                    <label class="col-sm-2 col-form-label">팀원</label>
		                    <div class="col-sm-8">
								<select class="form-control empList" id="member" style="width: 100%" name="member" multiple="multiple"></select>
		                    </div>
	                    </div>
                    </form>
                </div>
                <div class="modal-footer" style="display: inline-block;">
                    <button type="button" class="btn mb-1 btn-dark" data-dismiss="modal" style="float: right;">취소</button>
                    <button type="button" class="btn mb-1 btn-dark" id="updateProject" style="float: right;">수정</button>
                    <button type="button" class="btn mb-1 btn-dark" id="insertProject" style="float: right;">생성</button>
                    <button type="button" class="btn mb-1 btn-danger" id="deleteProject" style="float: left;">삭제</button>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- amchart -->
<script src="${cp }/plugin/amcharts/core.js"></script>
<script src="${cp }/plugin/amcharts/charts.js"></script>
<script src="${cp }/plugin/amcharts/animated.js"></script>

<!-- tui-date-picker 관련 js -->
<script src="${cp }/plugin/tui-date-picker/tui-code-snippet.js"></script>
<script src="${cp }/plugin/tui-date-picker/tui-dom.js"></script>
<script src="${cp }/plugin/tui-date-picker/tui-time-picker.js"></script>
<script src="${cp }/plugin/tui-date-picker/tui-date-picker.js"></script>

<!-- select2 js -->
<script src="${cp }/plugin/select2/select2.min.js"></script>

<!-- 현재 페이지 js -->
<script> // 외부스크립트에서 ${cp}를 사용하지 못하기 때문에 사용하려고 전역변수로 cp를 선언한다.
	var cp = "${cp}";
	var emp_id = "${S_EMPLOYEE.emp_id}";
</script> 
<script src="${cp }/js/pms/main.js"></script>
<script src="${cp }/js/pms/chart.js"></script>
<script src="${cp }/js/pms/project.js"></script>
