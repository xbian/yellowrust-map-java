<%@ include file="header.jsp" %>

<script src="<c:url value='/scripts/yrmap_new.js'/>" type="text/javascript"></script>
<link href="<c:url value='/styles/clusterpies.css'/>" rel="stylesheet" type="text/css">

<h2>Yellow Rust Map</h2>
<div id="status"></div>
<div id="map"></div>

<br/>

<div class="row">
    <div class="col-md-4">

        <div class="input-group">
               <span class="input-group-btn">

                   <%--<button type="button" class="btn btn-default"--%>
                           <%--onclick="location.href='yellowrust-map/phenotype';">Phenotype Data--%>
                   <%--</button>--%>
                <button type="button" class="btn btn-default"
                        onclick="genotype_view();">Genotype View
                </button>
                <button type="button" class="btn btn-default"
                        onclick="normal_view();">Normal View
                </button>
               </span>
        </div>
    </div>
    <div class="col-md-4">
        <div id="slider" style="margin-top:3px;margin-left:10px;margin-right:10px;z-index: 1000;"></div>
        <%--<div class="input-group">--%>
        <%--<input type="text" id="min" name="min" class="form-control" placeholder="Start Date" value=""/>--%>
        <%--<span class="input-group-btn" style="width:0px;"></span>--%>
        <%--<input type="text" id="max" name="max" class="form-control" placeholder="End Date" value=""--%>
        <%--style="margin-left:-1px"/>--%>
        <%--</div>--%>
    </div>

    <div class="col-md-4">

        <div class="input-group">
            <div id="yrselect"></div>
            <%--<span class="input-group-btn ">--%>
            <%--<button type="button" class="btn btn-default"--%>
            <%--onclick="ukcpvs_only();">UKCPVS Only--%>
            <%--</button>--%>
            <%--<button type="button" class="btn btn-default"--%>
            <%--onclick="ukcpvs_and_all();">ALL--%>
            <%--</button>--%>
            <%--</span>--%>
        </div>
    </div>
</div>
<br/>

<div id="tableWrapper" style="margin-top:-45px;">
    <table id="resultTable"></table>
</div>

<div style="margin-top: 100px;"><i>The data generated by our field pathogenomics study and hosted on this site is
    licensed under a Creative Commons Attribution-NonCommercial-ShareAlike 3.0 Unported License. Our goal is to make the
    genotypic and phenotypic data of wheat yellow rust isolates collected across the world rapidly and broadly available
    to the scientific community. As highlighted by the BROAD institute, the genome sequencing community has adopted a
    <a target="_blank" href="http://www.genome.gov/page.cfm?pageID=10506376">statement of principles for the
        distribution and use of
        large-scale data</a>. We also follow these principles and urge users to follow them as
    well.
    <br/><br/>
    We specifically ask that you do not distribute the original data from this site without our consent and please
    redirect others to this website. Likewise, if you carry out significant analysis of the data we would encourage you
    to contact us so it can be hosted on the website to continue to build up this resource. It is our intention to
    publish the work of this project in a timely fashion and we welcome collaborative interaction on the project and
    analyses.</i></div>

<div id="legend"></div>
<div id="zoom">
    <div class="input-group">
               <span class="input-group-btn">
        <button type="button" class="btn btn-default"
                onclick="mapFitBounds([[49.781264,-7.910156],[61.100789, -0.571289]]);">Zoom UK
        </button>
        <button type="button" class="btn btn-default"
                onclick="mapFitBounds([[36.738884,-14.765625],[56.656226, 32.34375]]);">Zoom Europe
        </button>
               </span>
    </div>
</div>

<script type="text/javascript">

    var pie_view = false;
    var yrtable;
    var filtered_data = [];

    var datemin = 0;
    var datemax = 0;

    var markers = new Array();
    var markersGroup = new L.MarkerClusterGroup({});
    var map = L.map('map', {zoomControl: false}).setView([52.621615, 10.219470], 5);

    L.tileLayer('http://otile1.mqcdn.com/tiles/1.0.0/map/{z}/{x}/{y}.jpg', {
        attribution: 'Map data &copy; <a href="http://openstreetmap.org">OpenStreetMap</a> contributors, <a href="http://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>',
        maxZoom: 18
    }).addTo(map);

    L.control.zoom({position: 'topright'}).addTo(map);

    jQuery(document).ready(function () {

        getData('${company}',true);
        mapFitBounds([[49.781264, -7.910156], [61.100789, -0.571289]]);
        jQuery("#slider").dateRangeSlider({
            bounds: {
                min: new Date(2013, 0, 1),
                max: new Date(2014, 11, 31)
            },
            defaultValues: {
                min: new Date(2013, 0, 1),
                max: new Date(2014, 11, 31)
            }
        });
    });





</script>

<%@ include file="footer.jsp" %>