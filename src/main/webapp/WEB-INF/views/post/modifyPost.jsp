<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="${cp }/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="${cp }/ckeditor/ckeditor.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	
	// 전송버튼 클릭이벤트
	$("#savebutton").click(function(){
		if(confirm("저장하시겠습니까?")) {
// 			if(validation()) {
			// 이부분에 에디터 validation 검증
				$("#frm").submit();
			}
			
// 		}
	})
	
// 	$("#cancelBtn").click(function(){
// 		if(confirm("취소하시겠습니까?")) 
// 			location.href = "${cp }/post";
// 	});
	
	$(".x").click(function(){
		$(this).closest('.postfiles').remove();
// 		$(this).prev().prev().remove();
// 		$(this).prev().remove();
// 		$(this).next().remove();
// 		$(this).remove();
		
// 		$("#atfNum").val(atfnum);
// 		var postNm = $("#postNm2").val();
// 		$("#postNm").val(postNm);
// 		var postCont = $("#smarteditor").html();
// 		$("#postCont").val(postCont);
		
// 		$("#hiddenFrm").submit();
	});
	
	$("#postFile").change(function(){
		if(this.files.length > (5-$(".x").length)){
	         alert("파일의 갯수는 5개를 초과할 수 없습니다.");
	         $(this).val("");
		}
	})

});

// 필수값 Check
// function validation(){
// 	var contents = CKEDITOR.instances.DSC.getData();
// 	if(contents === '<p>&nbsp;</p>' || contents === ''){ // 기본적으로 아무것도 입력하지 않아도 <p>&nbsp;</p> 값이 입력되어 있음. 
// 		alert("내용을 입력하세요.");
// 		oEditors.getById['smarteditor'].exec('FOCUS');
// 		return false;
// 	}

// 	return true;
// }
</script>

<style>
	.x{
		cursor: pointer;
	}
</style>
<%-- <form id="hiddenFrm" action="${cp }/deleteAtf" method="post"> --%>
<!-- 	<input id="atfNum" name="atfNum" type="hidden"> -->
<%-- 	<input id="boardNum" name="boardNum" value="${boardNum }" type="hidden"> --%>
<%-- 	<input id="postNum2" name="postNum2" value="${postNum2 }" type="hidden"> --%>
<!-- 	<input id="postNm" name="postNm" value="" type="hidden"> -->
<!-- 	<input id="postCont" name="postCont" value="" type="hidden"> -->
<%-- 	<input id="userId" name="userId" value="${pvo.userId }" type="hidden"> --%>
<!-- </form> -->
		<div class="container-fluid">
	<div class="row">
		<div class="col-lg-12">
			<div class="card">
				<div class="card-body">
		
			<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">

				<form id="frm" class="form-horizontal" role="form" action="${cp }/modifyPost"
					method="post" enctype="multipart/form-data">
					<div class="form-group">
						<input type="hidden" name="board_id" value="${board_id }"/>
						<input type="hidden" name="post_id" value="${post_id }"/>
						<input type="hidden" name="pa_post_id" value="${pa_post_id }"/>
						<input type="hidden" name="gn" value="${post.gn }"/>
						<label for="title" class="col-sm-2 control-label">제목</label>
						<div class="col-sm-6">
							<input type="text" class="form-control" id="title2" name="title"
								placeholder="TITLE" value="${post.title }"/>
						</div>
					</div>

					<div class="form-group">
					<div class="col-sm-8"> 
						<textarea name="cont" id="cont" rows="10" cols="100" style="width:766px; height:412px;">${post.cont }</textarea>
							<script type="text/javascript">
					                  CKEDITOR.replace('cont', {height: 500, width: 900
					                	  
					                                                  });
					        </script>
						</div>
					</div>
					
					<div class="form-group">
						<label for="postFile" class="col-sm-2 control-label">첨부파일</label>
						<div class="col-sm-6">
							<c:forEach items="${postfileList }" var="postfile">
							<div class="postfiles">
								<input type="hidden" name="files" value="${postfile.file_id }"/>
								<label class="control-label cmt"> ${postfile.file_nm } </label>&nbsp;<span class="x">&times;</span><br>
							</div>
							</c:forEach>
						</div>
					</div>
					
					<div class="form-group">
						<label for="postFile" class="col-sm-2 control-label"></label>
						<div class="col-sm-6">
							<input type="file" class="form-control atfCnt" id="postFile" name="postFile"
								placeholder="첨부파일" multiple="multiple"/>
						</div>
					</div>

					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-10">
							<button type="button" id="savebutton" class="btn mb-1 btn-outline-primary">저장</button>
<!-- 							<button type="button" id="cancelBtn" class="btn btn-default">취소</button>  -->
						</div>
					</div>
				</form>
				</div>
				</div>
			</div>
		</div>
	</div>
</div>