<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
	.chart, .taskList {
 		width: auto;
		height: 300px;
	}
	
	.taskList > table {
		width: 650px;
	}
	
	td > h3 {
		text-align: center;
	} 
</style>
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
			<div class="card-body">
				<h2><i class="fa fa-bars" aria-hidden="true"></i> 진행중인 프로젝트</h2>
				<hr>
				<blockquote>
					<h3>프로젝트1</h3>
					<hr>
					<table>
						<tbody>
							<tr>
								<td>
									<h3>전체 현황</h3>
							    	<div id="chartdiv" class="chart"></div>
								</td>
								<td>
									<h3>나의 현황</h3>
							    	<div id="chartdiv2" class="chart"></div>
								</td>
								<td>
			                        <h3>주간 업무</h3>
				                    <div class="taskList">
					                    <table class="table header-border table-hover verticle-middle">
					                        <thead>
					                            <tr>
					                                <th scope="col"></th>
					                                <th scope="col">업무명</th>
					                                <th scope="col">진척도</th>
					                                <th scope="col">현황</th>
					                            </tr>
					                        </thead>
					                        <tbody>
					                            <tr>
					                                <th>1</th>
					                                <td>Air Conditioner</td>
					                                <td>
					                                    <div class="progress" style="height: 10px">
					                                        <div class="progress-bar gradient-1" style="width: 70%;" role="progressbar"><span class="sr-only">70% Complete</span>
					                                        </div>
					                                    </div> 
					                                </td>
					                                <td><span class="label gradient-1 btn-rounded">70%</span>
					                                </td>
					                            </tr>
					                            <tr>
					                                <th>2</th>
					                                <td>Textiles</td>
					                                <td>
					                                    <div class="progress" style="height: 10px">
					                                        <div class="progress-bar gradient-2" style="width: 70%;" role="progressbar"><span class="sr-only">70% Complete</span>
					                                        </div>
					                                    </div> 
					                                </td>
					                                <td><span class="label btn-rounded gradient-2">70%</span>
					                                </td>
					                            </tr>
					                            <tr>
					                                <th>3</th>
					                                <td>Milk Powder</td>
					                                <td>
					                                    <div class="progress" style="height: 10px">
					                                        <div class="progress-bar gradient-3" style="width: 70%;" role="progressbar"><span class="sr-only">70% Complete</span>
					                                        </div>
					                                    </div> 
					                                </td>
					                                <td><span class="label btn-rounded gradient-3">70%</span>
					                                </td>
					                            </tr>
					                        </tbody>
					                    </table>
				                    </div>
								</td>
							</tr>
						</tbody>
					</table>
					<hr>
					<div> 팀장: <img alt="" class="rounded-circle mt-4" src="/asd/bootstrap/images/users/1.jpg" style="width: 50px;">배상현</div>
				    <div> 팀원: <img alt="" class="rounded-circle mt-4" src="/asd/bootstrap/images/users/5.jpg" style="width: 50px;">조민수, 
				    		   <img alt="" class="rounded-circle mt-4" src="/asd/bootstrap/images/users/3.jpg" style="width: 50px;">전민규, 
				    		   <img alt="" class="rounded-circle mt-4" src="/asd/bootstrap/images/users/2.jpg" style="width: 50px;">김도훈, 
				    		   <img alt="" class="rounded-circle mt-4" src="/asd/bootstrap/images/users/4.jpg" style="width: 50px;">홍다은, </div>
				</blockquote>
			</div>
		</div>
		<div class="card">
			<div class="card-body">
				<h2><i class="fa fa-bars" aria-hidden="true"></i> 완료한 프로젝트</h2>
				<hr>
				<div id="accordion-two" class="accordion">
					<div class="card">
						<div class="card-header">
							<h5 class="mb-0" data-toggle="collapse"
								data-target="#collapseOne1" aria-expanded="true"
								aria-controls="collapseOne1">
								<i class="fa" aria-hidden="true"></i> Accordion Header One
							</h5>
						</div>
						<div id="collapseOne1" class="collapse show"
							data-parent="#accordion-two">
							<div class="card-body">Anim pariatur cliche reprehenderit,
								enim eiusmod high life accusamus terry richardson ad squid. 3
								wolf moon officia aute, non cupidatat skateboard dolor brunch.
								Food truck quinoa nesciunt laborum eiusmod.</div>
						</div>
					</div>
					<div class="card">
						<div class="card-header">
							<h5 class="mb-0 collapsed" data-toggle="collapse"
								data-target="#collapseTwo2" aria-expanded="false"
								aria-controls="collapseTwo2">
								<i class="fa" aria-hidden="true"></i> Accordion Header Two
							</h5>
						</div>
						<div id="collapseTwo2" class="collapse"
							data-parent="#accordion-two">
							<div class="card-body">Anim pariatur cliche reprehenderit,
								enim eiusmod high life accusamus terry richardson ad squid. 3
								wolf moon officia aute, non cupidatat skateboard dolor brunch.
								Food truck quinoa nesciunt laborum eiusmod.</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- amchart -->
<script src="${cp }/plugin/amcharts/core.js"></script>
<script src="${cp }/plugin/amcharts/charts.js"></script>
<script src="${cp }/plugin/amcharts/animated.js"></script>

<!-- 현재 페이지 차트 js -->
<script src="${cp }/js/pms/chart.js"></script>