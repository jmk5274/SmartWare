<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- fullcalendar css -->
<link href= "${cp }/plugin/fullcalendar-4.3.1/core.min.css" rel="stylesheet" />
<link href= "${cp }/plugin/fullcalendar-4.3.1/daygrid.min.css" rel="stylesheet" />
<link href= "${cp }/plugin/fullcalendar-4.3.1/timegrid.min.css" rel="stylesheet" />
<link href= "${cp }/plugin/fullcalendar-4.3.1/list.min.css" rel="stylesheet" />

<!-- colorselector css -->
<link href= "${cp }/plugin/bootstrap-colorselector/bootstrap-colorselector.css" rel="stylesheet" />

<!-- tui-date-picker css -->
<link href= "${cp }/plugin/tui-date-picker/tui-date-picker.css" rel="stylesheet"/>
<link href= "${cp }/plugin/tui-date-picker/tui-time-picker.css" rel="stylesheet"/>

<!-- 현재 페이지의 css -->
<link href= "${cp }/css/calendar/calendar.css" rel="stylesheet" />

<!-- body 시작 -->

<!-- calendar -->
<div class="card">
	<div class="card-body">
		<div id="calendar"></div>
	</div>
</div>

<!-- filter -->
<div class="row" style='user-select:none;'>
	<div class="col">
		<div class="card">
			<div class="card-body filter" id="empCategory">
				<i class="fa fa-calendar-check-o fa-2x" style="color: black;"> </i>
				<h3>개인 일정</h3>
				<span id="empCategoryOff" class="categoryAll">전체 해제</span>
				<span class="categoryAll"> / </span>
				<span id="empCategoryOn" class="categoryAll">전체 선택</span>
			</div>
		</div>
	</div>
	<div class="col">
		<div class="card">
			<div class="card-body filter" id="depCategory">
				<i class="fa fa-calendar-check-o fa-2x" style="color: black;"> </i>
				<h3>부서 일정(${depart_nm })</h3>
				<span id="depCategoryOff" class="categoryAll">전체 해제</span>
				<span class="categoryAll"> / </span>
				<span id="depCategoryOn" class="categoryAll">전체 선택</span>
			</div>
		</div>
	</div>
</div>

<!-- Category Modal -->
<div class="bootstrap-modal">
    <div class="modal fade" id="categoryModal">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h3 class="modal-title" id="categoryModalTitle">타이틀</h3>
                </div>
                <div class="modal-body basic-form">
                	<form id="categoryForm">
                		<input type="hidden" id="category_id" name="category_id"/>
                		<div class="form-group row">
		                    <label class="col-sm-3 col-form-label">카테고리 이름</label>
		                    <div class="col-sm-9">
		                    	<input type="text" class="form-control" name="category_nm" id="category_nm">
		                    </div>
	                    </div>
	                    <div class="form-group row">
		                    <label class="col-sm-3 col-form-label">카테고리 색상</label>
		                    <div class="col-sm-9">
		                    	<select id="colorselector" name="color">
				                    <option value="#000000" data-color="#000000">#000000</option>
									<option value="#372A50" data-color="#372A50">#372A50</option>
									<option value="#C36A8A" data-color="#C36A8A">#C36A8A</option>
									<option value="#FC4BFC" data-color="#FC4BFC">#FC4BFC</option>
									<option value="#8D5C83" data-color="#8D5C83">#8D5C83</option>
									<option value="#9ACDEC" data-color="#9ACDEC">#9ACDEC</option>
									<option value="#00C0EF" data-color="#00C0EF">#00C0EF</option>
									<option value="#0D9A00" data-color="#0D9A00">#0D9A00</option>
									<option value="#00EFA7" data-color="#00EFA7">#00EFA7</option>
									<option value="#FFBF00" data-color="#FFBF00">#FFBF00</option>
									<option value="#CDA85C" data-color="#CDA85C">#CDA85C</option>
									<option value="#FFF800" data-color="#FFF800">#FFF800</option>
									<option value="#FF7F50" data-color="#FF7F50">#FF7F50</option>
									<option value="#FB2E01" data-color="#FB2E01">#FB2E01</option>
									<option value="#C80141" data-color="#C80141">#C80141</option>
		                    	</select>
		                    </div>
	                    </div>
	                    <div class="form-group row" id="divDepartmentNm">
		                    <label class="col-sm-3 col-form-label">부서명</label>
		                    <div class="col-sm-9">
		                    	<input type="hidden" id="depart_id" name="depart_id" value="${S_EMPLOYEE.depart_id }">
		                    	<input type="text" class="form-control" value="${depart_nm }" readonly>
		                    </div>
	                    </div>
	                    <div class="form-group row">
		                    <label class="col-sm-3 col-form-label">생성자</label>
		                    <div class="col-sm-9">
		                    	<input type="hidden" name="emp_id" value="${S_EMPLOYEE.emp_id }">
		                    	<input type="text" class="form-control" value="${S_EMPLOYEE.emp_nm }" readonly>
		                    </div>
	                    </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" id="btnInsertCategory">생성</button>
                    <button type="button" class="btn btn-primary" id="btnUpdateCategory">수정</button>
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Calendar Modal -->
<div class="bootstrap-modal">
    <div class="modal fade" id="calendarModal">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h3 class="modal-title" id="calendarModalTitle">타이틀</h3>
                </div>
                <div class="modal-body basic-form">
                	<form id="calendarForm">
                	
                		<input type="hidden" id="cal_id" name="cal_id"/>
                		
                		<div class="form-group row">
		                    <label class="col-sm-3 col-form-label">일정 제목</label>
		                    <div class="col-sm-9">
		                    	<input type="text" class="form-control" id="cal_title" name="cal_title">
		                    </div>
	                    </div>
	                    
	                     <div class="form-group row">
		                    <label class="col-sm-3 col-form-label">날짜</label>
		                    <div class="col-sm-4">
								<div class="form-control tui-datepicker-input tui-datetime-input tui-has-focus">
									<input id="startpicker-input" type="text" aria-label="Date">
									<span class="tui-ico-date"></span>
									<div id="startpicker-container" style="margin-left: -1px;"></div>
								</div>
		                    </div>
							<span>~</span>
		                    <div class="col-sm-4">
								<div class="form-control tui-datepicker-input tui-datetime-input tui-has-focus">
									<input id="endpicker-input" type="text" aria-label="Date">
									<span class="tui-ico-date"></span>
									<div id="endpicker-container" style="margin-left: -1px;"></div>
								</div>
		                    </div>
						</div>
	                    
	                    <div class="form-group row">
		                    <label class="col-sm-3 col-form-label">하루 종일</label>
		                    <div class="col-sm-9">
	                    		<input id="allDay" name="allDay" type="checkbox" style="margin-top: 10px;">
		                    </div>
	                    </div>
	                    
	                    <div class="form-group row">
		                    <label class="col-sm-3 col-form-label">카테고리</label>
		                    <div class="col-sm-9">
		                    	<select id="categoryList" name="category_nm"></select>
		                    </div>
	                    </div>
	                    
	                    <div class="form-group row">
		                    <label class="col-sm-3 col-form-label">일정 내용</label>
		                    <div class="col-sm-9">
		                    	<textarea class="form-control h-150px" rows="6" id="cal_cont" name="cal_cont"></textarea>
		                    </div>
	                    </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" id="btnInsertCalendar">생성</button>
                    <button type="button" class="btn btn-primary" id="btnUpdateCalendar">수정</button>
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- moment js -->
<script src="${cp }/js/moment.js"></script>

<!-- fullcalendar js -->
<script src="${cp }/plugin/fullcalendar-4.3.1/core.min.js"></script>
<script src="${cp }/plugin/fullcalendar-4.3.1/interaction.min.js"></script>
<script src="${cp }/plugin/fullcalendar-4.3.1/daygrid.min.js"></script>
<script src="${cp }/plugin/fullcalendar-4.3.1/timegrid.min.js"></script>
<script src="${cp }/plugin/fullcalendar-4.3.1/list.min.js"></script>

<!-- fullcalendar js(한글) -->
<script src="${cp }/plugin/fullcalendar-4.3.1/ko.js"></script>

<!-- colorselector js -->
<script src="${cp }/plugin/bootstrap-colorselector/bootstrap-colorselector.js"></script>

<!-- tui-date-picker 관련 js -->
<script type="text/javascript" src="${cp }/plugin/tui-date-picker/tui-code-snippet.js"></script>
<script type="text/javascript" src="${cp }/plugin/tui-date-picker/tui-dom.js"></script>
<script type="text/javascript" src="${cp }/plugin/tui-date-picker/tui-time-picker.js"></script>
<script src="${cp }/plugin/tui-date-picker/tui-date-picker.js"></script>

<!-- 현재 페이지의 js -->
<script> // 외부스크립트에서 ${cp}를 사용하지 못하기 때문에 사용하려고 전역변수로 cp를 선언한다.
	var cp = "${cp}";
</script> 
<script src="${cp }/js/calendar/main.js"></script>
<script src="${cp }/js/calendar/calendar.js"></script>
<script src="${cp }/js/calendar/category.js"></script>