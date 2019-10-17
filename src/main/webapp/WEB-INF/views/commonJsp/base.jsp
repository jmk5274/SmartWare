<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
    
<!DOCTYPE html>
<html lang="en">
<head>
    <!--*******************
        BasicLib start
    ********************-->
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width,initial-scale=1">
	<title>SmartWare</title>
	
	<tiles:insertAttribute name="basicLib"/>
	
	<!-- Favicon icon -->
	<link rel="icon" type="image/png" sizes="16x16" href="bootstrap/images/favicon.png">
	<!-- Pignose Calender -->
<%-- 	<link href="${cp }/bootstrap/plugins/pg-calendar/css/pignose.calendar.min.css" rel="stylesheet"> --%>
	<!-- Chartist -->
<%-- 	<link rel="stylesheet" href="${cp }/bootstrap/plugins/chartist/css/chartist.min.css"> --%>
<%-- 	<link rel="stylesheet" href="${cp }/bootstrap/plugins/chartist-plugin-tooltips/css/chartist-plugin-tooltip.css"> --%>
	<!-- Custom Stylesheet -->
	<link href="${cp }/bootstrap/css/style.css" rel="stylesheet">
	<!-- sweetalert2-->
	<link href ="${cp }/sweetalert2/dist/sweetalert2.min.css" rel="stylesheet" >
	<script src="${cp }/sweetalert2/dist/sweetalert2.min.js"></script>
    <!--*******************
        BasicLib end
    ********************-->
</head>
<body>

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

    
    <!--**********************************
        Main wrapper start
    ***********************************-->
    <div id="main-wrapper">

        <!--**********************************
            Header start
        ***********************************-->
		<tiles:insertAttribute name="header"/>
        <!--**********************************
            Header end ti-comment-alt
        ***********************************-->

        <!--**********************************
            Sidebar start
        ***********************************-->
		<tiles:insertAttribute name="left"/>
        <!--**********************************
            Sidebar end
        ***********************************-->

        <!--**********************************
            Content body start
        ***********************************-->
        <div class="content-body">
            <div class="container-fluid mt-3">
            
				<tiles:insertAttribute name="content"/>
				
            </div>
            <!-- #/ container -->
        </div>
        <!--**********************************
            Content body end
        ***********************************-->
        
        
        <!--**********************************
            Footer start
        ***********************************-->
		<tiles:insertAttribute name="footer"/>
        <!--**********************************
            Footer end
        ***********************************-->
    </div>
    <!--**********************************
        Main wrapper end
    ***********************************-->

    <!--**********************************
        Scripts
    ***********************************-->
    <script src="${cp }/bootstrap/plugins/common/common.min.js"></script>
    <script src="${cp }/bootstrap/js/custom.min.js"></script>
    <script src="${cp }/bootstrap/js/settings.js"></script>
    <script src="${cp }/bootstrap/js/gleek.js"></script>
    <script src="${cp }/bootstrap/js/styleSwitcher.js"></script>

    <!-- Chartjs -->
<%--     <script src="${cp }/bootstrap/plugins/chart.js/Chart.bundle.min.js"></script> --%>
    <!-- Circle progress -->
<%--     <script src="${cp }/bootstrap/plugins/circle-progress/circle-progress.min.js"></script> --%>
    <!-- Datamap -->
<%--     <script src="${cp }/bootstrap/plugins/d3v3/index.js"></script> --%>
<%--     <script src="${cp }/bootstrap/plugins/topojson/topojson.min.js"></script> --%>
<%--     <script src="${cp }/bootstrap/plugins/datamaps/datamaps.world.min.js"></script> --%>
    <!-- Morrisjs -->
<%--     <script src="${cp }/bootstrap/plugins/raphael/raphael.min.js"></script> --%>
<%--     <script src="${cp }/bootstrap/plugins/morris/morris.min.js"></script> --%>
    <!-- Pignose Calender -->
<%--     <script src="${cp }/bootstrap/plugins/moment/moment.min.js"></script> --%>
<%--     <script src="${cp }/bootstrap/plugins/pg-calendar/js/pignose.calendar.min.js"></script> --%>
    <!-- ChartistJS -->
<%--     <script src="${cp }/bootstrap/plugins/chartist/js/chartist.min.js"></script> --%>
<%--     <script src="${cp }/bootstrap/plugins/chartist-plugin-tooltips/js/chartist-plugin-tooltip.min.js"></script> --%>

</body>

</html>