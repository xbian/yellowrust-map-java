<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en-gb">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <meta http-equiv='cache-control' content='no-cache'>
    <meta http-equiv='expires' content='0'>
    <meta http-equiv='pragma' content='no-cache'>

    <%-- timestamp to force browser to reload javascript --%>
    <jsp:useBean id="timestamp" class="java.util.Date" scope="request"/>

    <title>Yellow Rust Map - Powered by Grassroots API</title>
    <script type="text/javascript" src="<c:url value='/scripts/scriptaculous/prototype.js'/>"></script>
    <script type="text/javascript" src="<c:url value='/scripts/fluxion-ajax/fluxion-ajax-compiled.js?ts=${timestamp.time}'/>"></script>

    <!-- bootstrap -->
    <script src="<c:url value='/scripts/bootstrap/bootstrap.min.js?ts=${timestamp.time}'/>" type="text/javascript"></script>
    <link href="<c:url value='/scripts/bootstrap/css/bootstrap.min.css'/>" rel="stylesheet" type="text/css">

    <link rel="stylesheet" href="<c:url value='/styles/style.css?ts=${timestamp.time}'/>" type="text/css">
    <!-- font awesome -->
    <link href="<c:url value='/scripts/fontawesome/css/font-awesome.min.css'/>" rel="stylesheet" type="text/css">

    <!--Scriptaculous JS scripts below -->
    <script type="text/javascript" src="<c:url value='/scripts/scriptaculous/scriptaculous.js'/>"></script>
    <script type="text/javascript" src="<c:url value='/scripts/scriptaculous/activityInput.js'/>"></script>
    <script type="text/javascript" src="<c:url value='/scripts/scriptaculous/effects.js'/>"></script>
    <script type="text/javascript" src="<c:url value='/scripts/scriptaculous/unittest.js'/>"></script>
    <script type="text/javascript" src="<c:url value='/scripts/scriptaculous/dragdrop.js'/>"></script>
    <script type="text/javascript" src="<c:url value='/scripts/scriptaculous/slider.js'/>"></script>
    <script type="text/javascript" src="<c:url value='/scripts/scriptaculous/builder.js'/>"></script>
    <script type="text/javascript" src="<c:url value='/scripts/scriptaculous/sound.js'/>"></script>
    <script type="text/javascript" src="<c:url value='/scripts/scriptaculous/controls.js'/>"></script>

    <!-- jQuery -->
    <script type="text/javascript" src="<c:url value='/scripts/jquery/js/jquery-1.11.3.min.js'/>"></script>
    <script type="text/javascript" src="<c:url value='/scripts/jquery/jquery-ui-1.11.4.custom/jquery-ui.min.js'/>"></script>
    <script type="text/javascript" src="<c:url value='/scripts/jquery/js/jquery.simplyCountable.js'/>"></script>
    <script type="text/javascript" src="<c:url value='/scripts/jquery/js/jquery.tinysort.min.js'/>"></script>
    <script type="text/javascript" src="<c:url value='/scripts/jquery/js/jquery.tablesorter.min.js'/>"></script>
    <script type="text/javascript" src="<c:url value='/scripts/jquery/js/jquery.uitablefilter.js'/>"></script>
    <script type="text/javascript" src="<c:url value='/scripts/jquery/js/jquery.validate.min.js'/>"></script>
    <script type="text/javascript" src="<c:url value='/scripts/jquery/colorbox/jquery.colorbox-min.js'/>"></script>
    <link rel="stylesheet" href="<c:url value='/scripts/jquery/jquery-ui-1.11.4.custom/jquery-ui.min.css'/>"
          type="text/css">
    <link rel="stylesheet" href="<c:url value='/scripts/jquery/colorbox/colorbox.css'/>"
          type="text/css">

    <!-- Leaflet -->
    <link rel="stylesheet" href="<c:url value='/scripts/leaflet/leaflet.css'/>" />
    <script src="<c:url value='/scripts/leaflet/leaflet.js'/>"></script>

    <!-- Leaflet markercluster -->
    <link rel="stylesheet" href="<c:url value='/scripts/leaflet.markercluster/MarkerCluster.css'/>" />
    <link rel="stylesheet" href="<c:url value='/scripts/leaflet.markercluster/MarkerCluster.Default.css'/>" />
    <script src="<c:url value='/scripts/leaflet.markercluster/leaflet.markercluster.js'/>"></script>

    <!-- wis -->
    <script type="text/javascript" src="<c:url value='/scripts/wis.js?ts=${timestamp.time}'/>"></script>
    <%--<script type="text/javascript" src="<c:url value='/scripts/external.js?ts=${timestamp.time}'/>"></script>--%>
    <%--<script type="text/javascript" src="<c:url value='/scripts/search.js?ts=${timestamp.time}'/>"></script>--%>

    <!--CryptoJS-->
    <script type="text/javascript" src="<c:url value='/scripts/sha1.js'/>"></script>
    <script type="text/javascript" src="<c:url value='/scripts/enc-base64-min.js'/>"></script>


    <!-- give $ back to prototype -->
    <script type="text/javascript">jQuery.noConflict();</script>

    <script type="text/javascript" src="<c:url value='/scripts/multi_select_drag_drop.js?ts=${timestamp.time}'/>"></script>

    <%--<link rel="shortcut icon" href="<c:url value='/styles/images/favicon.ico'/>" type="image/x-icon"/>--%>

    <!--drop down menu -->

    <%--<script src="<c:url value='/scripts/menus.js?ts=${timestamp.time}'/>" type="text/javascript"></script>--%>

    <script>
        (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
            (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
                m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
        })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

        ga('create', 'UA-21666189-10', 'auto');
        ga('send', 'pageview');

    </script>

    <link rel="stylesheet" type="text/css" href="http://fonts.googleapis.com/css?family=Droid+Sans:regular,bold">
    <link rel="stylesheet" type="text/css" href="http://fonts.googleapis.com/css?family=Droid+Serif:regular,bold">
    <link rel="stylesheet" type="text/css" href="http://fonts.googleapis.com/css?family=Fredericka+the+Great">
    <style type="text/css">
        NAV DIV UL LI A {
            font-size: 14px !important;
            color: #00475c !important;
        }
        PICK ELEMENT FIRST! {
            font-size: 20px !important;
            color: #222 !important;
        }
        .site-name a {
            font-family: 'Fredericka the Great', cursive;
            font-size: 3.5em;
            color: #dd9933 !important;
            line-height: 1.1em;
        }
        .site-name a:hover {
            text-decoration: none;
            color: #dd9933 !important;
        }
        #logo .site-description {
            display:block;
            font-size:14px;
            margin:10px 33px 0 0;
            text-align: right;
            color: #dd9933 !important;
        }
    </style>

</head>
<body class="page page-id-36 page-template-default" style="zoom: 1;">
<div id="container" class="hentry">
    <div id="header">

        <div id="logo">
            <span class="site-name"><a href="http://yellowrust.com/" title="Wheat Yellow Rust Genomics " rel="home">Wheat Yellow Rust Genomics </a></span>
            <span class="site-description">Comparative genomic analysis of Puccinia striiformis f.sp. tritici</span>
        </div><!-- end of #logo -->

        <!-- Primary Navigation Menu -->
        <nav id="access">
            <div class="menu-custom-menu-container"><ul id="menu-custom-menu" class="menu"><li id="menu-item-22" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-22"><a href="http://yellowrust.com/?page_id=19">Yellow rust</a>
                <ul class="sub-menu">
                    <li id="menu-item-17" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-17"><a href="http://yellowrust.com/?page_id=10">What is Puccinia striiformis?</a></li>
                    <li id="menu-item-39" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-39"><a href="http://yellowrust.com/?page_id=38">What is comparative genomics?</a></li>
                </ul>
            </li>
                <li id="menu-item-395" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-395"><a href="http://yellowrust.com/?page_id=394">Projects</a>
                    <ul class="sub-menu">
                        <li id="menu-item-398" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-398"><a href="http://yellowrust.com/?page_id=397">SCPRID grant</a>
                            <ul class="sub-menu">
                                <li id="menu-item-354" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-354"><a href="http://yellowrust.com/?page_id=353">Latest News</a>
                                    <ul class="sub-menu">
                                        <li id="menu-item-157" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-157"><a href="http://yellowrust.com/?page_id=155">Blog posts</a></li>
                                        <li id="menu-item-356" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-356"><a href="http://yellowrust.com/?page_id=355">Press and Media</a></li>
                                    </ul>
                                </li>
                            </ul>
                        </li>
                        <li id="menu-item-403" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-403"><a href="http://yellowrust.com/?page_id=401">Field pathogenomics</a>
                            <ul class="sub-menu">
                                <li id="menu-item-198" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-198"><a href="http://yellowrust.com/?page_id=197">Get involved</a></li>
                            </ul>
                        </li>
                    </ul>
                </li>
                <li id="menu-item-37" class="menu-item menu-item-type-post_type menu-item-object-page current-menu-item page_item page-item-36 current_page_item menu-item-37"><a href="http://yellowrust.com/?page_id=36">Tools</a>
                    <ul class="sub-menu">
                        <li id="menu-item-217" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-217"><a href="http://yellowrust.com/?page_id=215">TGAC browser</a></li>
                        <li id="menu-item-382" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-382"><a href="http://yellowrust.com/?page_id=380">TSL GeeFu</a></li>
                    </ul>
                </li>
                <li id="menu-item-283" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-283"><a href="http://yellowrust.com/?page_id=281">Protocols</a>
                    <ul class="sub-menu">
                        <li id="menu-item-285" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-285"><a href="http://yellowrust.com/?page_id=284">DNA extraction</a></li>
                    </ul>
                </li>
                <li id="menu-item-369" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-369"><a href="http://yellowrust.com/?page_id=368">Published data</a>
                    <ul class="sub-menu">
                        <li id="menu-item-85" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-85"><a href="http://yellowrust.com/?page_id=84">Isolates sequenced</a></li>
                        <li id="menu-item-29" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-29"><a href="http://yellowrust.com/?page_id=28">Genomes</a></li>
                        <li id="menu-item-106" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-106"><a href="http://yellowrust.com/?page_id=104">Predicted gene models</a></li>
                        <li id="menu-item-103" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-103"><a href="http://yellowrust.com/?page_id=101">Predicted proteomes</a></li>
                        <li id="menu-item-15" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-15"><a href="http://yellowrust.com/?page_id=12">Raw reads</a></li>
                    </ul>
                </li>
                <li id="menu-item-371" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-371"><a href="http://yellowrust.com/?page_id=370">Unpublished data</a>
                    <ul class="sub-menu">
                        <li id="menu-item-298" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-298"><a href="http://yellowrust.com/?page_id=296">PST isolates raw data</a></li>
                        <li id="menu-item-365" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-365"><a href="http://yellowrust.com/?page_id=363">Phenotypic data</a></li>
                    </ul>
                </li>
                <li id="menu-item-32" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-32"><a href="http://yellowrust.com/?page_id=31">Publications</a></li>
                <li id="menu-item-34" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-34"><a href="http://yellowrust.com/?page_id=33">Contact Us</a></li>
            </ul></div>    <select><option selected="selected" value="">Go to...</option><option value="http://yellowrust.com/?page_id=19">Yellow rust</option><option value="http://yellowrust.com/?page_id=10">What is Puccinia striiformis?</option><option value="http://yellowrust.com/?page_id=38">What is comparative genomics?</option><option value="http://yellowrust.com/?page_id=394">Projects</option><option value="http://yellowrust.com/?page_id=397">SCPRID grant</option><option value="http://yellowrust.com/?page_id=353">Latest News</option><option value="http://yellowrust.com/?page_id=155">Blog posts</option><option value="http://yellowrust.com/?page_id=355">Press and Media</option><option value="http://yellowrust.com/?page_id=401">Field pathogenomics</option><option value="http://yellowrust.com/?page_id=197">Get involved</option><option value="http://yellowrust.com/?page_id=36">Tools</option><option value="http://yellowrust.com/?page_id=215">TGAC browser</option><option value="http://yellowrust.com/?page_id=380">TSL GeeFu</option><option value="http://yellowrust.com/?page_id=281">Protocols</option><option value="http://yellowrust.com/?page_id=284">DNA extraction</option><option value="http://yellowrust.com/?page_id=368">Published data</option><option value="http://yellowrust.com/?page_id=84">Isolates sequenced</option><option value="http://yellowrust.com/?page_id=28">Genomes</option><option value="http://yellowrust.com/?page_id=104">Predicted gene models</option><option value="http://yellowrust.com/?page_id=101">Predicted proteomes</option><option value="http://yellowrust.com/?page_id=12">Raw reads</option><option value="http://yellowrust.com/?page_id=370">Unpublished data</option><option value="http://yellowrust.com/?page_id=296">PST isolates raw data</option><option value="http://yellowrust.com/?page_id=363">Phenotypic data</option><option value="http://yellowrust.com/?page_id=31">Publications</option><option value="http://yellowrust.com/?page_id=33">Contact Us</option></select></nav>
    </div><!-- end of #header -->

    <div id="wrapper" class="clearfix">

        <div id="content-full" class="row span12" role="main">








<%--</body>--%>