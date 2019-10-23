<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="${cp }/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="${cp }/ckeditor/ckeditor.js"></script>
<script type="text/javascript">
$(document).ready(function() {

	// 전송버튼 클릭이벤트
	$("#savebutton").click(function(){
		if($("#title").val()==""){
			Swal({
				type: 'warning', // success, error, warning, info, question
				title: '필수 사항',
				text: '제목을 입력해주세요.'
			});
			
			return;
		} if(CKEDITOR.instances.cont.getData() == ''){
			Swal({
				type: 'warning', // success, error, warning, info, question
				title: '필수 사항',
				text: '내용을 입력해주세요.'
			});
			CKEDITOR.instances.cont.focus();
			return false;
		}
		
		Swal({
			title: '저장하시겠습니까?',
			text: "",
			type: 'question',
			showCancelButton: true,
			confirmButtonColor: '#3085d6',
			cancelButtonColor: '#d33',
			confirmButtonText: '네',
			cancelButtonText: '아니오'
		}).then((result) => {
			if (result.value) {
				Swal({
					title: '저장되었습니다.',
					text: '',
					type: 'success',
					confirmButtonText: '확인'
				})
				
				$("#frm").submit();
			}
		});
	});
		
// 		if(confirm("저장하시겠습니까?")) {
// 			// 이부분에 에디터 validation 검증
// 			if(validation()) {
// 				$("#frm").submit();
// 			}
// 		}
// 	});
	
	$("#postFile").change(function(){
		if(this.files.length > (5-$(".x").length)){
	         alert("파일의 갯수는 5개를 초과할 수 없습니다.");
	         $(this).val("");
		}
	});
	
});

// 필수값 Check
// function validation(){
// 	var contents = $.trim("#p_content");
// 	if(contents === '<p>&nbsp;</p>' || contents === ''){ // 기본적으로 아무것도 입력하지 않아도 <p>&nbsp;</p> 값이 입력되어 있음. 
// 		alert("내용을 입력하세요.");
// 		return false;
// 	}

// 	return true;
// }
</script>
		<div class="container-fluid">
	<div class="row">
		<div class="col-lg-12">
			<div class="card">
				<div class="card-body">

			<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">

				<form id="frm" class="form-horizontal" role="form" action="${cp }/writePost"
					method="post" enctype="multipart/form-data">
					<div class="form-group">
						<input type="hidden" name="post_id" value="${post_id }"/>
						<input type="hidden" name="board_id" value="${board_id }"/>
						<input type="hidden" name="pa_post_id" value="${pa_post_id}"/>
						<input type="hidden" name="gn" value="${gn}"/>
						<label for="title" class="col-sm-2 control-label">제목</label>
						<div class="col-sm-6">
							<input type="text" class="form-control" id="title" name="title"
								placeholder="TITLE" />
						</div>
					</div>

					<div class="form-group">
						<!-- <label for="cont" id="p_content" class="col-sm-2 control-label"></label> -->
						<div class="col-sm-8"> 
							<textarea id="cont" name="cont" id="cont" rows="10" cols="100" style="width:766px; height:412px;"></textarea>
							<script type="text/javascript">
					                  CKEDITOR.replace('cont', {height: 500, width: 900
					                	  
					                                                  });
					                  </script>
						</div>
					</div>
					
					<div class="form-group">
						<label for="postFile" class="col-sm-2 control-label">첨부파일</label>
						<div class="col-sm-6">
							<input type="file" class="form-control" id="postFile" name="postFile"
								placeholder="첨부파일" multiple="multiple"/>
						</div>
					</div>

					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-10">
							<button type="button" id="savebutton" class="btn mb-1 btn-outline-primary">저장</button>
						</div>
					</div>
				</form>
				</div>
			</div>
		</div>
	</div>
</div>
</div>
