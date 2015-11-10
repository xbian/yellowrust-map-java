<%@ include file="header.jsp" %>

<script src="<c:url value='/scripts/yrmap.js'/>" type="text/javascript"></script>
<link href="<c:url value='/styles/clusterpies.css'/>" rel="stylesheet" type="text/css">

<h2>Yellow Rust Map</h2>

<div id="map"></div>

<br/>

<div class="row">
    <div class="col-md-4">

        <div class="input-group">
               <span class="input-group-btn">

                   <button type="button" class="btn btn-default"
                           onclick="location.href='yellowrust-map/phenotype';">Phenotype Data
                   </button>
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
                <span class="input-group-btn ">
                <button type="button" class="btn btn-default"
                        onclick="ukcpvs_only();">UKCPVS Only
                </button>
                <button type="button" class="btn btn-default"
                        onclick="ukcpvs_and_all();">ALL
                </button>
                </span>
        </div>
    </div>
</div>
<br/>

<div id="tableWrapper" style="margin-top:-45px;">
    <table id="resultTable"></table>
</div>

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
        var niabregex = new RegExp('^NIAB[A-z0-9._%+-\\s]*$');
        var tagregex = new RegExp('^TAG[A-z0-9._%+-\\s]*$');
        var filtered_data = [];
        for (i = 0; i < sample_list_all.length; i++) {
            if (sample_list_all[i]['location'] != undefined && sample_list_all[i]['UKCPVS ID'] != undefined && sample_list_all[i]['UKCPVS ID'] != ''
                && (niabregex.test(sample_list_all[i]['Company']) || tagregex.test(sample_list_all[i]['Company']))
            ) {
                filtered_data.push(sample_list_all[i]);
            }
        }
        $("#slider").dateRangeSlider({
            bounds: {
                min: new Date(2013, 0, 1),
                max: new Date(2014, 11, 31)
            },
            defaultValues: {
                min: new Date(2013, 0, 1),
                max: new Date(2014, 11, 31)
            }
        });
        displayYRLocations(filtered_data);
        yrtable = $('#resultTable').DataTable({
            data: filtered_data,
            "columns": [
                {data: "ID", title: "ID"},
                {data: "Country", title: "Country", "sDefaultContent": ""},
                {
                    title: "UKCPVS ID",
                    "render": function (data, type, full, meta) {
                        return phenotype_html_ukid(full['UKCPVS ID'], full['phenotype']);
                    }
                },
                {data: "Rust (YR/SR/LR)", title: "Rust Type", "sDefaultContent": "Unknown"},
                {data: "Name/Collector", title: "Collector", "sDefaultContent": ""},
                {data: "Date collected", title: "Date", "sDefaultContent": ""},
                {data: "Host", title: "Host", "sDefaultContent": ""},
                {data: "RNA-seq? (Selected/In progress/Completed/Failed)", title: "RNA-seq", "sDefaultContent": ""},
                {
                    title: "Phenotype",
                    "render": function (data, type, full, meta) {
                        return phenotype_html(full['UKCPVS ID'], full['phenotype']);
                    }
                },
                {
                    title: "Genotype",
                    "render": function (data, type, full, meta) {
                        if (full['genotype'] != undefined && full['genotype'] != "undefined") {
                            return full['genotype']['Genetic group'];
                        }
                        else {
                            return '';
                        }
                    }
                },
                {data: "Variety", title: "Variety", "sDefaultContent": ""},
                {data: "Company", title: "Company", "sDefaultContent": ""},
                {
                    title: "Location info",
                    "render": function (data, type, full, meta) {
                        return ((full["Further Location information"] == 'undefined' || full["Further Location information"] == undefined) ? '' : full["Further Location information"])
                               + ' '
                               + ((full["Postal code"] == 'undefined') || full["Postal code"] == undefined ? '' : full["Postal code"]);
                    }
                }
            ]
            ,
            initComplete: function () {
                var column = this.api().column(3);
                var select = $('<select class="form-control"><option value="">Select Rust Type</option></select>')
                        .appendTo($('#yrselect').empty())
                        .on('change', function () {
                                var val = $.fn.dataTable.util.escapeRegex(
                                        $(this).val()
                                );

                                column
                                        .search(val ? '^' + val + '$' : '', true, false)
                                        .draw();
                            });

                column.data().unique().sort().each(function (d, j) {
                    select.append('<option value="' + d + '">' + d + '</option>')
                });
            }

        });

        jQuery('#resultTable').on('search.dt', function () {
            removePointers();
            var filteredData = yrtable.rows({filter: 'applied'}).data().toArray();
            displayYRLocations(filteredData);
        });


        $("#slider").bind("valuesChanging", function (e, data) {
            datemin = Date.parse(data.values.min);
            datemax = Date.parse(data.values.max);

            yrtable.draw();
        });

        ukcpvs_only();
        mapFitBounds([[49.781264, -7.910156], [61.100789, -0.571289]]);
        renderLegend();

    });

</script>

<%@ include file="footer.jsp" %>