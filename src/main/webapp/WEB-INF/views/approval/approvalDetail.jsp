<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%--<script type="text/javascript" src="${cp }/ckeditor/ckeditor.js"></script>--%>
<head>
    <link href="${cp }/bootstrap/plugins/nestable/css/nestable.css" rel="stylesheet">
    <link href="${cp }/bootstrap/css/style.css" rel="stylesheet">

<%--    <link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">--%>

    <!-- include summernote css/js-->
    <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
    <script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>

    <!-- include summernote css/js-->
    <link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
    <script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>
    <style>
        .checkBlock {
            float: right;
        }
    </style>
</head>
<script>
    $(function(){
        $('#okBtn').on('click', function () {
            var img = '<img src="${cp }/approval/empSignPicture?sign=${S_EMPLOYEE.sign}" width="100px" height="90px">';
            Swal({
                title: '결재 승인',
                text: "승인하시겠습니까?",
                type: 'question',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: '네',
                cancelButtonText: '아니오'
            }).then((result) => {
                if(result.value) {
                    console.log(result);
                    $('#${S_EMPLOYEE.job_id}').html(img);

                    $('#contents').val($('#appl').html());
                    $('#frm').attr('action', "${cp}/approval/checkAppl").submit();
                }
            });
        });

        $('#returnBtn').on('click', function () {
            Swal({
                title: '결재 반려',
                text: "반려하시겠습니까?",
                type: 'question',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: '네',
                cancelButtonText: '아니오'
            }).then((result) => {
                if(result.value) {
                    Swal.fire({
                        title: '반려 사유',
                        input: 'text',
                        inputAttributes: {
                            autocapitalize: 'off'
                        },
                        showCancelButton: true,
                        confirmButtonText: 'REFER',
                        showLoaderOnConfirm: true,
                        preConfirm : (data) => {
                            $('#refer_res').val(data);
                        }
                    }).then((result) => {
                            $('#frm').attr('action', "${cp}/approval/checkRefer").submit();
                    });
                }
            });
        });

        $('#reSend').on('click', function () {
            Swal({
                title: '결재 반려',
                text: "반려하시겠습니까?",
                type: 'question',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: '네',
                cancelButtonText: '아니오'
            }).then((result) => {
                if (result.value) {

                    $('#contents').val($('#appl').html());
                    $('#frm').attr('action', "${cp}/approval/reSend").submit();
                }
            });
        });
    });
</script>

<script src="${cp }/bootstrap/plugins/nestable/js/jquery.nestable.js"></script>

<body>

<div class="container-fluid">
    <div class="row">
        <div class="col-lg-12">
            <div class="card">
                <div class="card-body">
                    <h2 class="sub-header">결재문서 상세정보</h2>
                    <div class="email-center-box">
                        <div class="toolbar" role="toolbar">
                            <form id="frm" method="post" enctype="multipart/form-data">
                                <input id="contents" name="cont" type="hidden" value="">
                                <input id="appl_id" name="appl_id" type="hidden" value="${appl.appl_id}">
                                <input id="form_id" name="form_id" type="hidden" value="${appl.form_id}">
                                <input id="refer_res" name="refer_res" type="hidden" value="">
                                <div class="compose-content mt-5">
                                </div>
                                <br>
                                <div class="form-group">
                                    <div style="float: left; width: 50%;">
                                        <input id="title" type="text" name="title"
                                               class="form-control bg-transparent" placeholder=" Title" value="${appl.title}" readonly/>
                                    </div>
                                    <br>
                                    <div class="form-row align-items-center">
                                        <div class="col-auto my-1 align-items-center">

                                        </div>
                                    </div>
                                </div>
                                <div class="col_c" style="margin-bottom: 30px">
                                    <div class="input-group">
                                        <div id="appl" name="appl">
                                            ${appl.cont}
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                        <c:if test="${flag eq 'c'}" >
                             <div class="text-left m-t-15">
                                <button id="okBtn"
                                        class="btn btn-success m-b-30 m-t-15 f-s-14 p-l-20 p-r-20 m-r-10"
                                        type="button">
                                    <i class="fa fa-paper-plane m-r-5"></i> 승인
                                </button>
                                <button id = "returnBtn" class="btn btn-dark m-b-30 m-t-15 f-s-14 p-l-20 p-r-20"
                                        type="button">
                                    <i class="ti-close m-r-5 f-s-12"></i> 기각
                                </button>
                            </div>
                        </c:if>
                        <c:if test="${flag eq 'sr'}" >
                            <div class="text-left m-t-15">
                                <button id="reSend"
                                        class="btn btn-success m-b-30 m-t-15 f-s-14 p-l-20 p-r-20 m-r-10"
                                        type="button">
                                    <i class="fa fa-paper-plane m-r-5"></i> 재송신
                                </button>
                            </div>
                        </c:if>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>