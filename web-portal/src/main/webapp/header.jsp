<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en-gb">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv='cache-control' content='no-cache'>
    <meta http-equiv='expires' content='0'>
    <meta http-equiv='pragma' content='no-cache'>

    <%-- timestamp to force browser to reload javascript --%>
    <jsp:useBean id="timestamp" class="java.util.Date" scope="request"/>

    <title>Yellow Rust Map</title>
    <script type="text/javascript" src="<c:url value='/scripts/scriptaculous/prototype.js'/>"></script>
    <script type="text/javascript" src="<c:url value='/scripts/fluxion-ajax/fluxion-ajax-compiled.js?ts=${timestamp.time}'/>"></script>


    <link rel="stylesheet" href="<c:url value='/styles/style.css?ts=${timestamp.time}'/>" type="text/css">
    <!-- font awesome -->
    <link href="<c:url value='/scripts/fontawesome/css/font-awesome.min.css'/>" rel="stylesheet" type="text/css">

    <!-- jQuery -->
    <script type="text/javascript" src="<c:url value='/scripts/jquery/js/jquery-1.11.3.min.js'/>"></script>
    <script type="text/javascript" src="<c:url value='/scripts/jquery/jquery-ui-1.11.4.custom/jquery-ui.min.js'/>"></script>
    <script type="text/javascript" src="<c:url value='/scripts/jquery/colorbox/jquery.colorbox-min.js'/>"></script>
    <link rel="stylesheet" href="<c:url value='/scripts/jquery/jquery-ui-1.11.4.custom/jquery-ui.min.css'/>"
          type="text/css">
    <link rel="stylesheet" href="<c:url value='/scripts/jquery/colorbox/colorbox.css'/>"
          type="text/css">

    <!-- bootstrap -->
    <script src="<c:url value='/scripts/bootstrap/js/bootstrap.min.js?ts=${timestamp.time}'/>" type="text/javascript"></script>
    <link href="<c:url value='/scripts/bootstrap/css/bootstrap.min.css'/>" rel="stylesheet" type="text/css">

    <!-- Leaflet -->
    <link rel="stylesheet" href="<c:url value='/scripts/leaflet/leaflet.css'/>" />
    <script src="<c:url value='/scripts/leaflet/leaflet.js'/>"></script>

    <!-- Leaflet markercluster -->
    <link rel="stylesheet" href="<c:url value='/scripts/leaflet.markercluster/MarkerCluster.css'/>" />
    <link rel="stylesheet" href="<c:url value='/scripts/leaflet.markercluster/MarkerCluster.Default.css'/>" />
    <script src="<c:url value='/scripts/leaflet.markercluster/leaflet.markercluster.js'/>"></script>

    <!-- wis -->
    <script type="text/javascript" src="<c:url value='/scripts/wis.js?ts=${timestamp.time}'/>"></script>

    <script src="<c:url value='/scripts/d3/d3.min.js'/>" type="text/javascript"></script>

    <script src="<c:url value='/scripts/jquery/datatables/js/jquery.dataTables.min.js'/>" type="text/javascript"></script>
    <link href="<c:url value='/scripts/jquery/datatables/css/jquery.dataTables.css'/>" rel="stylesheet" type="text/css">
    <script src="<c:url value='/scripts/jquery/jqrangeslider/jQAllRangeSliders-withRuler-min.js'/>" type="text/javascript"></script>
    <script src="<c:url value='/scripts/jquery/datatables/js/dataTables.fixedColumns.min.js'/>" type="text/javascript"></script>
    <link href="<c:url value='/scripts/jquery/jqrangeslider/css/iThing.css'/>" rel="stylesheet" type="text/css">



    <%--<script src="<c:url value='/scripts/yrdata.js'/>" type="text/javascript"></script>--%>
    <script type="text/javascript">jQuery.noConflict();</script>


    <!-- Global site tag (gtag.js) - Google Analytics -->
    <script async src="https://www.googletagmanager.com/gtag/js?id=UA-21666189-16"></script>
    <script>
        window.dataLayer = window.dataLayer || [];
        function gtag(){dataLayer.push(arguments);}
        gtag('js', new Date());

        gtag('config', 'UA-21666189-16');
    </script>



</head>
<body>

<div class="container center-block">

    <!-- Fixed navbar -->
    <div id="logo">
        <a href="<c:url value='/'/>" ><img border="0" src="<c:url value='/images/titlev3.png'/>" width="1150px"></a>
    </div>