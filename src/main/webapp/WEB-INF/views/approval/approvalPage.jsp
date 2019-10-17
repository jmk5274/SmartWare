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
</head>
<script>
    $(function(){
        $("#sendbtn").click(function(){
            $("#frm").submit();
        });

        $("#confirmbtn").on('click', function(){
            var res = "";
            $('input:checkbox[name=checkBox]:checked').each(function (i, a) {
                if (res != null && res.trim() !== "") res += ", ";
                res += $(this).val();
            });
            $("#reci").val("");
            $("#reci").val(res);
            // $(':checkbox:checked').attr('checked', false );
        });

        $(document).on('click', '.toggleBtn', function() {
            var text = $(this).text();
            $(this).text(text === 'Collapse' ? 'Collapse' : 'Expand').parent().find('.dd-list').toggle();
            /* this.dataset.action = $(this).text; */
        });

        // $('#summerNote').val('<h1><strong>test</strong></h1>');
        // 코드값 넣기
        $('#formList').change(function () {
            // var form = $(this).val();
            // console.log(form);
            // $('.note-editable.panel-body').html($(this).val());
            $.ajax({
                url : "${cp}/approval/formInfo",
                method : "post",
                data : {form_id : $(this).val()},
                dataType : "json",
                success : function (data) {
                    $('.note-editable.panel-body').html(data.form_cont);
                }
            });
        });
    });
</script>

<script src="${cp }/bootstrap/plugins/nestable/js/jquery.nestable.js"></script>

<form id="emailCheckFrm" action="${cp }/validator">
    <input type="hidden" id="checkEmail" name="email"/>
</form>

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
                                                                                                    <c:if test="${depart.depart_id == employee.depart_id && position.posi_id == employee.posi_id}">
                                                                                                        <li class="dd-item select" data-id="${depart.depart_id }">
                                                                                                            <div class="dd-handle"><input value="${employee.emp_nm}(${employee.emp_id })" type="checkbox" name="checkBox" class="listCheck" style="display: inline-block;"/> &nbsp;&nbsp;&nbsp;${employee.emp_nm } &nbsp;/&nbsp;${employee.email }&nbsp;/&nbsp;${position.posi_nm }&nbsp;</div>
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
                            <form id="frm" action="${cp}/sendEmail" method="post" enctype="multipart/form-data">
                                <div class="compose-content mt-5">
                                    <input id="reci" type="text" name="reci" value=""
                                           placeholder=" To"
                                           style="width: 400px; height: 43px;"> &nbsp;&nbsp
                                    <button type="button" class="btn btn-outline-success m-b-30 m-t-15 f-s-14 p-l-20 p-r-20 m-r-10" data-toggle="modal" data-target="#basicModal">주소록</button>
                                    <br>
                                </div>
                                <br>
                                <div class="form-group">
                                    <div style="float: left; width: 50%;">
                                        <input type="text" name="subject"
                                               class="form-control bg-transparent" placeholder=" Title"/>
                                    </div>
                                    <div class="form-row align-items-center">
                                        <div class="col-auto my-1 align-items-center">
                                            <select class="custom-select mr-sm-2" id="formList">
                                                <option id="cleanForm">양식 선택</option>
                                                <c:forEach items="${formList}" var="form" varStatus="loop">
                                                    <option id="${form.form_id}" value="${form.form_id}">${form.form_nm}</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="col_c" style="margin-bottom: 30px">
                                    <div class="input-group">
<%--                                        ckEditor--%>
<%--                                        <textarea class="form-control" id="p_content" name="cont"></textarea>--%>
<%--                                        <script type="text/javascript">--%>
<%--                                            CKEDITOR.replace('p_content', {--%>
<%--                                                allowedContent:true, height: 500, width: 1200--%>
<%--                                            });--%>
<%--                                        </script>--%>
                                        <div id="summerNote"></div>
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
                                <h5 class="m-b-20">
                                    <i class="fa fa-paperclip m-r-5 f-s-18"></i> Attatchment
                                </h5>
                                <div class="form-group">
                                    <div class="fallback">
                                        <input class="l-border-1" name="attatch" type="file"
                                               multiple="multiple">
                                    </div>
                                </div>
                            </form>
                        </div>
                        <div class="text-left m-t-15">
                            <button id="sendbtn"
                                    class="btn btn-primary m-b-30 m-t-15 f-s-14 p-l-20 p-r-20 m-r-10"
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