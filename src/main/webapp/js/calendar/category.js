$(function() {
	// 새로운 카테고리 버튼(개인 일정)
	$("body").on("click", "#addEmpCategory", function(e) {
		$("#categoryModalTitle").html("<i class='fa fa-calendar-check-o fa-lg' style='color: black;'> </i> 카테고리 추가 - 개인 일정");
		$("#category_nm").val("");
		$("#depart_id").val("");
		$("#divDepartmentNm").hide(); // 부서 텍스트 박스
		$("#btnInsertCategory").show(); // 생성 버튼
		$("#btnUpdateCategory").hide(); // 수정 버튼
		selectColor("#000000"); // 색상을 기본색으로 설정
	});
	
	// 새로운 카테고리 버튼(부서 일정)
	$("body").on("click", "#addDepCategory", function() {
		$("#categoryModalTitle").html("<i class='fa fa-calendar-check-o fa-lg' style='color: black;'> </i> 카테고리 추가 - 부서 일정");
		$("#category_nm").val("");
		$("#depart_id").val("${S_EMPLOYEE.depart_id }");
		$("#divDepartmentNm").show(); // 부서 텍스트 박스
		$("#btnInsertCategory").show(); // 생성 버튼
		$("#btnUpdateCategory").hide(); // 수정 버튼
		selectColor("#000000"); // 색상을 기본색으로 설정
	});
	
	// 카테고리를 호버할 때 delete, modify 버튼 보이기/숨기기
	$(document).on("mouseenter", ".categoryList", function() {
		$(".btnCateModify", this).css("visibility", "visible");
	}).on("mouseleave", ".categoryList", function() {
		$(".btnCateModify", this).css("visibility", "hidden");
	});
	
	// 카테고리 수정 버튼(스패너)
	$("body").on("click", ".btnCateUpdate", function(event) {
		$("#categoryModalTitle").html("<i class='fa fa-calendar-check-o fa-lg' style='color: black;'> </i> 카테고리 수정");
		var cateType = $(this).parent().parent().attr("id");
		var divCategory = $(this).parent();
		var category_id = divCategory.attr("id"); 
		var category_nm = divCategory.find("span").text();
		var category_color = rgb2hex(divCategory.find("i").css("color")).toUpperCase();
		var category_id = divCategory.attr("id");
		
		$("#category_id").val(category_id);
		$("#category_nm").val(category_nm.trim());
		$("#depart_id").val("");
		if(cateType == "empCategory") {
			$("#divDepartmentNm").hide();
		} else {
			$("#divDepartmentNm").show();
		}
		$("#btnInsertCategory").hide(); // 생성 버튼
		$("#btnUpdateCategory").show(); // 수정 버튼
		selectColor(category_color);
		$("#categoryModal").modal("show");
		event.stopPropagation();
	});
	
	// 카테고리 INSERT
	$("#btnInsertCategory").on("click", function() {
		if($("#category_nm").val().trim() === "") {
			alert("카테고리 이름을 입력하세요.");
			return;				
		} 
		$.ajax({
			url: cp + "/insertCategory",
			data: $("#categoryForm").serializeArray(),
			type: "post",
			success: function(data) {
				res = "<hr>";
				res += "<div id=" + data.category_id + " class='categoryList'>"
				res += "<i class='fa fa-lg fa-check-square-o on' style='color: " + $("#colorselector").val() + "; width: 20px;'></i>";
				res += "<span> " + $("#category_nm").val() + "</span>";
				res += "<button class='btnCateModify btnCateUpdate'>"
				res += "<i class='fa fa-lg fa-wrench cateModify'></i>";
				res += "</button>";
				res += "<button class='btnCateModify btnCateDelete'>"
				res += "<i class='fa fa-lg fa-times'></i>";
				res += "</button>";
				res += "</div>";
				
				if($("#depart_id").val() === "") {
					$("#addEmpCategory").prev().before(res);
				} else {
					$("#addDepCategory").prev().before(res);
				}
				
				$("#categoryModal").modal("hide");
				
				Swal({
					title: '생성되었습니다.',
					type: 'success',
					timer: 1500,
					showConfirmButton: false,
				});
			}
		});
	});
	
	// 카테고리 UPDATE
	$("body").on("click", "#btnUpdateCategory", function(event) {
		$.ajax({
			url: cp + "/updateCategory",
			data: $("#categoryForm").serializeArray(),
			type: "post",
			success: function(data) {
				Swal({
					title: '수정되었습니다.',
					type: 'success',
					timer: 1500,
					showConfirmButton: false,
				});
				$("#categoryModal").modal("hide");
				$("#" + $("#category_id").val() + " > i").css("color", $("#colorselector").val());
				
				$(calendar.getEvents()).each(function(index, event) {
					if(event.extendedProps.category_id === $("#category_id").val()) {
						event.setProp("backgroundColor", $("#colorselector").val());
				    }
				})
				calendar.rerenderEvents();
			}
		});
	});
	
	// 카테고리 DELETE
	$("body").on("click", ".btnCateDelete", function(event) {
		var divCategory = $(this).parent();
		var category_id = divCategory.attr("id"); 
		var category_nm = divCategory.find("span").text(); 
		Swal({
			title: '정말 삭제하시겠습니까?',
			html: "<span class='text-danger'>\"" + category_nm + "\"</span> 카테고리와 해당 카테고리의 일정이 삭제됩니다.",
			type: 'warning',
			showCancelButton: true,
			focusConfirm: false,
			confirmButtonColor: '#3085d6',
			cancelButtonColor: '#d33',
			confirmButtonText: '네',
			cancelButtonText: '아니오'
		}).then(function(result) {
			if (result.value) {
				console.log();
				$.ajax({
					url: cp + "/deleteCalendar",
					data: "category_id=" + $("#cal_id").val(),
					type: "post",
					success: function(data) {
						console.log($(this).parent().prev());
						divCategory.prev().remove(); // hr 삭제
						divCategory.remove(); // div 삭제
						
						Swal({
							title: '삭제되었습니다.',
							type: 'success',
							timer: 1500,
							showConfirmButton: false,
						});
						
						calendar.render();
					}
				});
			}
		});
		event.stopPropagation();
	});
	
});