<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
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
                            <i class="fa fa-star gradient-1-text" aria-hidden="true"></i>
                            <p>Star</p>
                        </a>
                    </div>
                    <div class="col-4 border-right-1 pt-3"><a class="text-center d-block text-muted" href="javascript:void()">
                        <i class="fa fa-heart gradient-3-text"></i>
                            <p>Like</p>
                        </a>
                    </div>
                    <div class="col-4 pt-3"><a class="text-center d-block text-muted" href="javascript:void()">
                        <i class="fa fa-envelope gradient-4-text"></i>
                            <p>Email</p>
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
				<h3><i class="fa fa-bars" aria-hidden="true"></i> 진행중인 프로젝트</h3>
				<hr>
				<blockquote>
					프로젝트 명: ㅎㅇ<br>
					팀장: 배상현<br>
					팀원: 조민수<br>
				</blockquote>
			</div>
		</div>
		<div class="card">
			<div class="card-body">
				<h3><i class="fa fa-bars" aria-hidden="true"></i> 완료한 프로젝트</h3>
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