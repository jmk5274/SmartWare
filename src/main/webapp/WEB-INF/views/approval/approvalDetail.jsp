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

    });
</script>

<script src="${cp }/bootstrap/plugins/nestable/js/jquery.nestable.js"></script>

<body>

<div class="container-fluid">
    <div class="row">
        <div class="col-lg-12">
            <div class="card">
                <div class="card-body">
                    <div class="email-center-box">
                        <div class="toolbar" role="toolbar">
                            <form id="frm" action="${cp}/approval/sendApprovalList" method="post" enctype="multipart/form-data">
                                <input id="contents" name="cont" type="hidden" value="">
                                <input id="form_id" name="form_id" type="hidden" value="">
                                <div class="compose-content mt-5">
                                </div>
                                <br>
                                <div class="form-group">
                                    <div style="float: left; width: 50%;">
                                        <input id="title" type="text" name="title"
                                               class="form-control bg-transparent" placeholder=" Title" value="${appl.title}"/>
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
                                <button id="sendBtn"
                                        class="btn btn-danger m-b-30 m-t-15 f-s-14 p-l-20 p-r-20 m-r-10"
                                        type="button">
                                    <i class="fa fa-paper-plane m-r-5"></i> 기각
                                </button>
                                <a href="${cp }/main">
                                    <button id = "discard" class="btn btn-dark m-b-30 m-t-15 f-s-14 p-l-20 p-r-20"
                                            type="button">
                                        <i class="ti-close m-r-5 f-s-12"></i> 승인
                                    </button>
                                </a>
                            </div>
                        </c:if>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>