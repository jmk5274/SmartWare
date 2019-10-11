<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="${cp }/bootstrap/css/style.css" rel="stylesheet">
<script src="${cp }/js/jquery-3.4.1.min.js"></script>

<title>대화방 개설</title>
</head>
<body>
<div class="col-lg-6">
    <div class="card border-primary">
        <div class="card-body">
            <h5 class="card-title">대화방 개설하기</h5>
            <form action="${cp }/chatAdd" method="post">
	            <div class="form-group row">
	                <label class="col-sm-2 col-form-label">이름</label>
	                <div class="col-sm-10">
	                    <input name="chat_nm" type="text" class="form-control" placeholder="대화방 이름을 입력해주세요">
	                </div>
	            </div>
            <input type="submit" class="btn btn-primary" value="확인"/>
            </form>
        </div>
    </div>
</div>
</body>
</html>