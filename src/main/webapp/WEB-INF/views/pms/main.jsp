<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- 현재 페이지의 css -->
<link href= "${cp }/css/pms/main.css" rel="stylesheet" />

<!-- body 시작 -->
<div class="row">
	<!-- filter -->
	<div class="col-3">
	    <div class="card">
            <div class="card-body">
                <div class="text-center">
                    <img alt="" class="rounded-circle mt-4" src="${cp }/bootstrap/images/users/5.jpg">
                    <h4 class="card-widget__title text-dark mt-3">${S_EMPLOYEE.emp_nm }</h4>
                    <p class="text-muted">${S_EMPLOYEE.depart_id }</p>
                    <a class="btn gradient-4 btn-lg border-0 btn-rounded px-5" href="javascript:void()">Folllow</a>
                </div>
            </div>
            <div class="card-footer border-0 bg-transparent">
                <div class="row">
                    <div class="col-4 border-right-1 pt-3">
                        <a class="text-center d-block text-muted" href="javascript:void()">
                            <i class="fa fa-star gradient-1-text" aria-hidden="true"></i><br>
                            Star
                        </a>
                    </div>
                    <div class="col-4 border-right-1 pt-3"><a class="text-center d-block text-muted" href="javascript:void()">
                        <i class="fa fa-heart gradient-3-text"></i><br>
                            Like
                        </a>
                    </div>
                    <div class="col-4 pt-3"><a class="text-center d-block text-muted" href="javascript:void()">
                        <i class="fa fa-envelope gradient-4-text"></i><br>
                            Email
                        </a>
                    </div>
                </div>
            </div>
   		</div>
		<div class="card">
			<div class="card-body">
				
			</div>
		</div>
	</div>
	<!-- project list -->
	<div class="col-9">
		<div class="card">
			<div id="runningProject" class="card-body">
				<h2><i class="fa fa-bars" aria-hidden="true"></i> 진행중인 프로젝트</h2>
			</div>
		</div>
		<div class="card">
			<div id="pastProject" class="card-body">
				<h2><i class="fa fa-bars" aria-hidden="true"></i> 완료한 프로젝트</h2>
			</div>
		</div>
	</div>
</div>

<!-- amchart -->
<script src="${cp }/plugin/amcharts/core.js"></script>
<script src="${cp }/plugin/amcharts/charts.js"></script>
<script src="${cp }/plugin/amcharts/animated.js"></script>


<!-- 현재 페이지 js -->
<script> // 외부스크립트에서 ${cp}를 사용하지 못하기 때문에 사용하려고 전역변수로 cp를 선언한다.
	var cp = "${cp}";
	var emp_id = "${S_EMPLOYEE.emp_id}";
</script> 
<script src="${cp }/js/pms/main.js"></script>
<script src="${cp }/js/pms/chart.js"></script>
