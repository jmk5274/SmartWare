<%@page import="kr.or.ddit.smartware.employee.model.Employee"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="h-100" lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>Quixlab - Bootstrap Admin Dashboard Template by Themefisher.com</title>
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="../../assets/images/favicon.png">
    <!-- <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous"> -->
    <link href="${cp }/bootstrap/css/style.css" rel="stylesheet">
	
	<script src="${cp }/js/jquery-3.4.1.min.js"></script>
	
	<script src="${cp }/js/js.cookie.js"></script>
 <script>
 
	$(document).ready(function(){
		
		var emp_id = Cookies.get("emp_id");
		if(emp_id != undefined){
			$("#emp_id").val(emp_id);
			// remember me checkbox 체크
			$("#rememberMe").prop("checked", true);	
			$("#pass").focus();
		}
		
		// signin btn 클릭 이벤트 핸들러
		$("#signinBtn").on("click", function(){
			
			// 체크 되었으면
			if($('#rememberMe').prop("checked")) {
				// userId 쿠키를 생성하고 값은 userId input의 값을 쿠기 값으로 설정
				Cookies.set("emp_id", $("#emp_id").val(), {expires : 30});
			// 체크 안되었으면
			} else {
				// 기존에 사용자가 아이디를 쿠키에 저장하는 기능을 사용하다가 더 이상 사용하지 않는 경우
				// 처음부터 아이디 쿠키 저장 기능을 사용하지 않는 경우
				// ==> userId 쿠키를 삭제
				Cookies.remove("emp_id");
			}
			
			//로그인 요청
			$("#frm").submit();
		
		});
		
		// 로그인할 때 엔터키로 sign in 실행
		$("#userId, #pass").keydown(function(key) {
			if (key.keyCode == 13) {
				$("#frm").submit();
			}
		});
	});
	</script>
    
</head>

<body class="h-100">
    
    <!--*******************
        Preloader start
    ********************-->
    <div id="preloader">
        <div class="loader">
            <svg class="circular" viewBox="25 25 50 50">
                <circle class="path" cx="50" cy="50" r="20" fill="none" stroke-width="3" stroke-miterlimit="10" />
            </svg>
        </div>
    </div>
    <!--*******************
        Preloader end
    ********************-->

    <div class="login-form-bg h-100">
        <div class="container h-100">
            <div class="row justify-content-center h-100">
                <div class="col-xl-6">
                    <div class="form-input-content">
                        <div class="card login-form mb-0">
                            <div class="card-body pt-5">
                            
                                <a class="text-center"><h4>Login</h4></a>
                                <form class="mt-5 mb-5 login-input" action="<%=request.getContextPath() %>/login" method="post">
                                    <div class="form-group">
                                        <input type="text" id="emp_id" name="emp_id" class="form-control"
        	   								placeholder="Id" required autofocus value="e003">
                                    </div>
                                    <div class="form-group">
                                        <input id="pass" name="pass" type="password" class="form-control" placeholder="Password" value="test1234">
                                    </div>
                                    
                                    <div class="checkbox">
							          <label>
							            <input id="rememberMe" name="rememberMe" type="checkbox" value="remember-me">  Remember me
							          </label>
							        </div>
							        
                                    <button id="signinBtn" class="btn login-form__btn submit w-100">Sign In</button>
                                </form>
<!--                                 <p class="mt-5 login-form__footer">Dont have account? <a href="page-register.html" class="text-primary">Sign Up</a> now</p> -->
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!--**********************************
        Scripts
    ***********************************-->
    <script src="${cp }/bootstrap/plugins/common/common.min.js"></script>
    <script src="${cp }/bootstrap/js/custom.min.js"></script>
    <script src="${cp }/bootstrap/js/settings.js"></script>
    <script src="${cp }/bootstrap/js/gleek.js"></script>
    <script src="${cp }/bootstrap/js/styleSwitcher.js"></script>
</body>
</html>