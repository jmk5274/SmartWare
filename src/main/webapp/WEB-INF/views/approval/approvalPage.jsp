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
        $("#confirmbtn").on('click', function(){
            $("#to").val("");
            var res = "";
            $('input:checkbox[name=checkBox]:checked').each(function (i, a) {
                if (res != null && res.trim() !== "") res += ", ";
                res += $(this).val();
            });
            $("#to").val(res);
            applCheckBox(res)
        });

        $(document).on('click', '.toggleBtn', function() {
            var text = $(this).text();
            $(this).text(text === 'Collapse' ? 'Collapse' : 'Expand').parent().find('.dd-list').toggle();
            /* this.dataset.action = $(this).text; */
        });

        // $('#summerNote').val('<h1><strong>test</strong></h1>');
        // 코드값 넣기
        $('#formList').change(function () {
            if ($(this).val() !== 'noForm') {
                $.ajax({
                    url : "${cp}/approval/formInfo",
                    method : "post",
                    data : {form_id : $(this).val()},
                    dataType : "json",
                    success : function (data) {
                        $('.note-editable.panel-body').html(data.form_cont);
                    }
                });
            } else {
                $('.note-editable.panel-body').html("");
            }
        });

        /* 개인 결재선 선택 시 */
        $('#myAppr').on('click', function () {
            var form_id = $('#formList').val();

            if (form_id == null || form_id == 'noForm') {
                alertError("양식을 선택하세요");
            } else {
                $.ajax({
                    url : "${cp}/approval/myAppr",
                    method : "post",
                    data : {form_id : form_id},
                    dataType : "json",
                    success : function (data) {
                        $("#to").val("");
                        var res="";

                        for (var i = 0; i < data.apprMemInfoList.length; i++ ) {
                            if (res != null && res.trim() !== "") res += ", ";
                            res += data.apprMemInfoList[i].EMP_NM + "(" + data.apprMemInfoList[i].EMP_ID + ")";

                            $('#' + data.apprMemInfoList[i].EMP_ID).attr('checked', true);
                        }
                        $("#to").val(res);
                        applCheckBox(res)
                    }
                });
            }
        });

        function applCheckBox(apprMember) {
            $.ajax({
                url : '${cp}/approval/applCheckBox',
                method : "post",
                data : {apprMember : apprMember},
                dataType : "json",
                success : function (data) {
                    $('#checkAppl').empty();
                    var checkAppl = "";
                    checkAppl += '<table class="checkBlock" cellspacing=0 border=1>';
                    checkAppl += '        <tbody>';
                    checkAppl += '        <tr style="height:18.066666666667px;">';
                    checkAppl += '          <td style="text-align:center;border-left:1px solid;border-right:1px solid;border-top:1px solid;border-left-color:#000000;border-right-color:#000000;border-top-color:#000000;min-width:40px" rowspan=2>';
                    checkAppl += '              <span>결</span>';
                    checkAppl += '              <br />';
                    checkAppl += '              <br />';
                    checkAppl += '              <span>재</span>';
                    checkAppl += '           </td>';
                    for (var i = data.applList.length - 1; i >= 0; i-- ) {
                        checkAppl += '           <td style="text-align:center;border:1px solid;border-left-color:#000000;border-right-color:#000000;border-top-color:#000000;border-bottom-color:#000000;min-width:100px">';
                        checkAppl +=                data.applList[i].JOB_NM;
                        checkAppl += '          </td>';
                    }
                    checkAppl += '        </tr>';
                    checkAppl += '        <tr style="height:74px;">';
                    for (var i = data.applList.length - 1; i >= 0; i-- ) {
                        checkAppl += '          <td id="' + data.applList[i].JOB_ID + '" style="border:1px solid;border-left-color:#000000;border-right-color:#000000;border-top-color:#000000;border-bottom-color:#000000;min-width:100px">';
                        checkAppl += '              &nbsp;';
                        checkAppl += '          </td>';
                    }
                    checkAppl += '        </tr>';
                    checkAppl += '    </tbody>';
                    checkAppl += '</table>';

                    $('#checkAppl').append(checkAppl);
                }
            })
        }

        $('#sendBtn').click(function () {
            Swal({
                title: '결재를 올리시겠습니까?',
                text: "확인을 누를시 전송됩니다",
                type: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: '네',
                cancelButtonText: '아니오'
            }).then((result) => {
                if (result.value) {
                if(result.value) {
                    var contents = $('#contents').val($('.note-editable').html());
                    var res;
                    if ($('#to').val() === "") {
                        alertError("결재선을 선택하세요");
                    } else if ($('#title').val() === "") {
                        alertError("제목을 입력하세요");
                        $('#title').focus();
                    } else if (contents === "") {
                        alertError("내용을 입력하세요");
                    } else {
                        $('#form_id').val($('#formList').val());
                        $("#frm").submit();
                    }
                }
                    // Swal({
                    //     title: '전송 성공.',
                    //     text: '전송 되었습니다.',
                    //     type: 'success',
                    //     confirmButtonText: '확인'
                    // }).then((result) => {
                    //
                    // });
                }
            });
        });

        function alertError(errorStr) {
            Swal({
                type: 'error', // success, error, warning, info, question
                title: 'Error',
                text: errorStr
            });
        }
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
                            <div class="btn-group m-b-20">                                &nbsp;&nbsp;&nbsp;&nbsp;
                                <div class="bootstrap-modal">
                                    <!-- Button trigger modal -->
                                    <!-- Modal -->
                                    <div class="modal fade" id="basicModal" style="display: none;" aria-hidden="true">
                                        <div class="modal-dialog" role="document">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h3 class="modal-title">주소록</h3>
                                                    <button type="button" class="close" data-dismiss="modal"><span>×</span>
                                                    </button>
                                                </div>
                                                <div class="modal-body">
                                                    <div class="col-lg-12">
                                                        <div class="card">
                                                            <div class="card-body">
                                                                <h3 class="card-title">SmartWare</h3>
                                                                <div class="card-content">
                                                                    <div class="nestable">
                                                                        <div class="dd" id="nestable2">
                                                                            <ol class="dd-list">
                                                                                <!-- 부서로해서 for문을 돌려 class를 지정해주고 id값을 넣어준다 -->
                                                                                <c:forEach items="${departList }" var="depart" varStatus="loop">
                                                                                    <li class="dd-item dd-collapsed" data-id="${depart.depart_id }"><button data-id="${depart.depart_id }" class="toggleBtn" data-action="collapse" type="button">Collapse</button>
                                                                                        <div class="dd-handle">${depart.depart_nm }</div>
                                                                                        <ol class="dd-list">
                                                                                            <c:forEach items="${employeeList }" var="employee">
                                                                                                <c:forEach items="${positionList }" var="position">
                                                                                                    <c:if test="${depart.depart_id == employee.DEPART_ID && position.posi_id == employee.POSI_ID}">
                                                                                                        <li class="dd-item select" data-id="${depart.depart_id }">
                                                                                                            <div class="dd-handle"><input id="${employee.EMP_ID}" value="${employee.EMP_NM}(${employee.EMP_ID })" type="checkbox" name="checkBox" class="listCheck" style="display: inline-block;"/>
                                                                                                                &nbsp;&nbsp;&nbsp;${employee.EMP_NM } &nbsp;
                                                                                                                /&nbsp;${employee.EMAIL }&nbsp;
                                                                                                                /&nbsp;${employee.POSI_NM }&nbsp;
                                                                                                                /&nbsp;${employee.JOB_NM }&nbsp;
                                                                                                            </div>
                                                                                                        </li>
                                                                                                    </c:if>
                                                                                                </c:forEach>
                                                                                            </c:forEach>
                                                                                        </ol>
                                                                                    </li>
                                                                                </c:forEach>
                                                                            </ol>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                                        <button type="button" id="confirmbtn" class="btn btn-primary" data-dismiss="modal">확인</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                </div> <br>

                            </div>
                            <form id="frm" action="${cp}/approval/sendApprovalList" method="post" enctype="multipart/form-data">
                                <input id="contents" name="cont" type="hidden" value="">
                                <input id="form_id" name="form_id" type="hidden" value="">
                                <div class="compose-content mt-5">
                                    <input id="to" type="text" name="to" value=""
                                           placeholder=" To" readonly
                                           style="width: 400px; height: 43px;"> &nbsp;&nbsp
                                    <button type="button" class="btn btn-outline-success m-b-30 m-t-15 f-s-14 p-l-20 p-r-20 m-r-10" data-toggle="modal" data-target="#basicModal">주소록</button> &nbsp
                                    <button id="myAppr" type="button" class="btn btn-outline-primary m-b-30 m-t-15 f-s-14 p-l-20 p-r-20 m-r-10">개인 결재선</button>
                                    <br>
                                </div>
                                <br>
                                <div class="form-group">
                                    <div style="float: left; width: 50%;">
                                        <input id="title" type="text" name="title"
                                               class="form-control bg-transparent" placeholder=" Title"/>
                                    </div>
                                    <div class="form-row align-items-center">
                                        <div class="col-auto my-1 align-items-center">
                                            <select id="formList" class="custom-select mr-sm-2" >
                                                <option id="cleanForm" value="noForm">양식 선택</option>
                                                <c:forEach items="${formList}" var="form" varStatus="loop">
                                                    <option id="${form.form_id}" value="${form.form_id}">${form.form_nm}</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="col_c" style="margin-bottom: 30px">
                                    <div class="input-group">
                                        <div id="summerNote" name="contentsText"></div>
                                        <script type="text/javascript">
                                            $('#summerNote').summernote({
                                                height : 800,
                                                width : 900,
                                                minHeight : null,
                                                maxHeight : null,
                                                focus : true
                                            });
                                        </script>
                                    </div>
                                </div>
                            </form>
                        </div>
                        <div class="text-left m-t-15">
                            <button id="sendBtn"
                                    class="btn btn-danger m-b-30 m-t-15 f-s-14 p-l-20 p-r-20 m-r-10"
                                    type="button">
                                <i class="fa fa-paper-plane m-r-5"></i> Send
                            </button>
                            <a href="${cp }/main">
                                <button id = "discard" class="btn btn-dark m-b-30 m-t-15 f-s-14 p-l-20 p-r-20"
                                        type="button">
                                    <i class="ti-close m-r-5 f-s-12"></i> Discard
                                </button>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>