<%@ include file="header.jsp" %>

<h2>Yellow Rust Map</h2>

<div class="post-entry">
    <div id="map"></div>
    <br/>

    <div class="row">
        <div class="col-md-4">

            <div class="input-group">
               <span class="input-group-btn">
                   <button type="button" class="btn btn-default"
                           onclick="mapFitBounds([[49.781264,-7.910156],[61.100789, -0.571289]]);">Zoom UK
                   </button>
                   <button type="button" class="btn btn-default"
                           onclick="mapFitBounds([[36.738884,-14.765625],[56.656226, 32.34375]]);">Zoom Europe
                   </button>
                   <button type="button" class="btn btn-default"
                           onclick="location.href='yellowrust-map/phenotype';">Phenotype Data
                   </button>
               </span>
            </div>
        </div>
        <div class="col-md-4">
            <div class="input-group">
                <input type="text" id="min" name="min" class="form-control" placeholder="Start Date"/>
                <span class="input-group-btn" style="width:0px;"></span>
                <input type="text" id="max" name="max" class="form-control" placeholder="End Date"
                       style="margin-left:-1px"/>
            </div>
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

    <div id="tableWrapper">
        <table id="resultTable"></table>
    </div>
</div>

<script type="text/javascript">
    var yrtable;
    jQuery(document).ready(function () {
        makeYRJSON();
        displayYRLocations(sample_list);
        yrtable = $('#resultTable').DataTable({
            data: sample_list,
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
                {data: "genotype", title: "Genotype", "sDefaultContent": ""},
                {data: "Company", title: "Company", "sDefaultContent": ""},
//                {data: "Town", title: "Town", "sDefaultContent": ""},
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

        $('#min, #max').datepicker(
                {
                    dateFormat: 'yy-mm-dd',
                });
        $('#min').keyup(function () {
            yrtable.draw();
        });
        $('#max').keyup(function () {
            yrtable.draw();
        });

        ukcpvs_only();
        mapFitBounds([[49.781264, -7.910156], [61.100789, -0.571289]]);

    });

    function ukcpvs_only() {
        var column = yrtable.column(2);
        column.search('^((?!Unknown).)*$', true, false).draw();
    }

    function ukcpvs_and_all() {
        var column = yrtable.column(2);
        column.search('').draw();
    }


    var markers = new Array();

    var markersGroup = new L.MarkerClusterGroup();

    var map = L.map('map').setView([52.621615, 10.219470], 5);

    L.tileLayer('http://otile1.mqcdn.com/tiles/1.0.0/map/{z}/{x}/{y}.jpg', {
        attribution: 'Map data &copy; <a href="http://openstreetmap.org">OpenStreetMap</a> contributors, <a href="http://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>',
        maxZoom: 18
    }).addTo(map);

    function displayYRLocations(array) {
        for (i = 0; i < array.length; i++) {
            var la = array[i]['location']['latitude'];
            var lo = array[i]['location']['longitude'];
            var note = '<b>ID: </b>' + array[i]['ID'] + '<br/>'
                       + '<b>Country: </b>' + array[i]['Country'] + '<br/>'
                       + '<b>UKCPVS ID: </b>' + phenotype_html_ukid(array[i]['UKCPVS ID'], array[i]['phenotype']) + '<br/>'
                       + '<b>Rust (YR/SR/LR): </b>' + array[i]['Rust (YR/SR/LR)'] + '<br/>'
                       + '<b>Name/Collector: </b>' + array[i]['Name/Collector'] + '<br/>'
                       + '<b>Date collected: </b>' + array[i]['Date collected'] + '<br/>'
                       + '<b>Host: </b>' + array[i]['Host'] + '<br/>'
                       + '<b>RNA-seq: </b>' + array[i]['RNA-seq? (Selected/In progress/Completed/Failed)'] + '<br/>'
                       + '<b>Phenotype: </b>' + phenotype_html(array[i]['UKCPVS ID'], array[i]['phenotype']) + '<br/>'
                       + '<b>Genotype: </b>' + array[i]['genotype'] + '<br/>'
                       + '<b>Company: </b>' + array[i]['Company'] + '<br/>'
                       + '<b>Town: </b>' + array[i]['Town'] + '<br/>'
                       + '<b>Postal code: </b>' + array[i]['Postal code'] + '<br/>'
                       + '<b>Further Location info: </b>' + array[i]['Further Location information'];
            addPointer(la, lo, note);
        }
    }

    function phenotype_html_ukid(id, phenotype) {
        if (id != undefined) {
            if (phenotype) {
                return '<u onclick="phenotype_colorbox(\'' + id + '\');" style="cursor: pointer;">' + id + '</u>';
            }
            else {
                return id;
            }
        }
        else {
            return "Unknown";
        }
    }

    function phenotype_html(id, phenotype) {
        if (id != undefined) {
            if (phenotype) {
                return '<u onclick="phenotype_colorbox(\'' + id + '\');" style="cursor: pointer;">' + id + '</u>';
            }
            else {
//                return "N/A";
                return "";
            }
        }
        else {
//            return "N/A";
            return "";
        }
    }

    function phenotype_colorbox(id) {
        var phynotype_data = phenotype(id);
        jQuery.colorbox({width: "80%", html: phynotype_data});
        jQuery('#'+id).DataTable();
    }

    function phenotype(id) {
        var phynotype_data = "";
//        if (id != '' && id != undefined && id != 'undefined') {
        for (i = 0; i < sample_phenotyping.length; i++) {
            if (id == sample_phenotyping[i]['Isolate']) {
                phynotype_data = '<div style="margin:20px;">'
                                 + '<table id="'+id+'">'
                                 + '<tbody>'
                                 + '<tr><td>Batch: </td><td>' + sample_phenotyping[i]['Batch'] + '</td></tr>'
                                 + '<tr><td>No of isols tested: </td><td>' + sample_phenotyping[i]['No of isols tested'] + '</td></tr>'
                                 + '<tr><td>Isolate: </td><td>' + sample_phenotyping[i]['Isolate'] + '</td></tr>'
                                 + '<tr><td>Host: </td><td>' + sample_phenotyping[i]['Host'] + '</td></tr>'
                                 + '<tr><td>Chinese 166 Gene:1: </td>' + divbgcolor(sample_phenotyping[i]['Chinese 166 Gene:1']) + '</tr>'
                                 + '<tr><td>Kalyansona Gene:2: </td>' + divbgcolor(sample_phenotyping[i]['Kalyansona Gene:2']) + '</tr>'
                                 + '<tr><td>Vilmorin 23 Gene:3a+: </td>' + divbgcolor(sample_phenotyping[i]['Vilmorin 23 Gene:3a+']) + '</tr>'
                                 + '<tr><td>Nord Desprez Gene:3a+: </td>' + divbgcolor(sample_phenotyping[i]['Nord Desprez Gene:3a+']) + '</tr>'
                                 + '<tr><td>Hybrid 46 Gene:(3b)4b: </td>' + divbgcolor(sample_phenotyping[i]['Hybrid 46 Gene:(3b)4b']) + '</tr>'
                                 + '<tr><td>Heines Kolben Gene:2,6: </td>' + divbgcolor(sample_phenotyping[i]['Heines Kolben Gene:2,6']) + '</tr>'
                                 + '<tr><td>Heines Peko Gene:2,6: </td>' + divbgcolor(sample_phenotyping[i]['Heines Peko Gene:2,6']) + '</tr>'
                                 + '<tr><td>Lee Gene:7: </td>' + divbgcolor(sample_phenotyping[i]['Lee Gene:7']) + '</tr>'
                                 + '<tr><td>Av x Yr7 NIL Gene:7: </td>' + divbgcolor(sample_phenotyping[i]['Av x Yr7 NIL Gene:7']) + '</tr>'
                                 + '<tr><td>Compair Gene:8: </td>' + divbgcolor(sample_phenotyping[i]['Compair Gene:8']) + '</tr>'
                                 + '<tr><td>Kavkaz x 4 Fed Gene:9: </td>' + divbgcolor(sample_phenotyping[i]['Kavkaz x 4 Fed Gene:9']) + '</tr>'
                                 + '<tr><td>Clement Gene:9: </td>' + divbgcolor(sample_phenotyping[i]['Clement Gene:9']) + '</tr>'
                                 + '<tr><td>AVS x Yr 15 Gene:15: </td>' + divbgcolor(sample_phenotyping[i]['AVS x Yr 15 Gene:15']) + '</tr>'
                                 + '<tr><td>VPM 1 Gene:17: </td>' + divbgcolor(sample_phenotyping[i]['VPM 1 Gene:17']) + '</tr>'
                                 + '<tr><td>Rendezvous Gene:17: </td>' + divbgcolor(sample_phenotyping[i]['Rendezvous Gene:17']) + '</tr>'
                                 + '<tr><td>Av x Yr17 Gene:17: </td>' + divbgcolor(sample_phenotyping[i]['Av x Yr17 Gene:17']) + '</tr>'
                                 + '<tr><td>Carstens V Gene:32: </td>' + divbgcolor(sample_phenotyping[i]['Carstens V Gene:32']) + '</tr>'
                                 + '<tr><td>Talon Gene:32: </td>' + divbgcolor(sample_phenotyping[i]['Talon Gene:32']) + '</tr>'
                                 + '<tr><td>Av x Yr32 Gene:32: </td>' + divbgcolor(sample_phenotyping[i]['Av x Yr32 Gene:32']) + '</tr>'
                                 + '<tr><td>Spaldings Prolific Gene:sp: </td>' + divbgcolor(sample_phenotyping[i]['Spaldings Prolific Gene:sp']) + '</tr>'
                                 + '<tr><td>Robigus Gene:Rob\': </td>' + divbgcolor(sample_phenotyping[i]['Robigus Gene:Rob\'']) + '</tr>'
                                 + '<tr><td>Solstice Gene:\'Sol\': </td>' + divbgcolor(sample_phenotyping[i]['Solstice Gene:\'Sol\'']) + '</tr>'
                                 + '<tr><td>Timber Gene:\'Tim\': </td>' + divbgcolor(sample_phenotyping[i]['Timber Gene:\'Tim\'']) + '</tr>'
                                 + '<tr><td>Warrior Gene:War\': </td>' + divbgcolor(sample_phenotyping[i]['Warrior Gene:War\'']) + '</tr>'
                                 + '<tr><td>KWS-Sterling Gene:Ste\': </td>' + divbgcolor(sample_phenotyping[i]['KWS-Sterling Gene:Ste\'']) + '</tr>'
                                 + '<tr><td>Cadenza Gene:6 7: </td>' + divbgcolor(sample_phenotyping[i]['Cadenza Gene:6 7']) + '</tr>'
                                 + '<tr><td>Claire Gene:Claire: </td>' + divbgcolor(sample_phenotyping[i]['Claire Gene:Claire']) + '</tr>'
                                 + '<tr><td>Crusoe Gene:Crusoe: </td>' + divbgcolor(sample_phenotyping[i]['Crusoe Gene:Crusoe']) + '</tr>'
                                 + '<tr><td>Ambition Gene:Amb\': </td>' + divbgcolor(sample_phenotyping[i]['Ambition Gene:Amb\'']) + '</tr>'
                                 + '<tr><td>Heines VII Gene:Yr2 Yr25+: </td>' + divbgcolor(sample_phenotyping[i]['Heines VII Gene:Yr2 Yr25+']) + '</tr>'
                                 + '<tr><td>Suwon Omar Gene:Yr(Su): </td>' + divbgcolor(sample_phenotyping[i]['Suwon Omar Gene:Yr(Su)']) + '</tr>'
                                 + '<tr><td>Avocet Yr5 Gene:Yr5: </td>' + divbgcolor(sample_phenotyping[i]['Avocet Yr5 Gene:Yr5']) + '</tr>'
                                 + '<tr><td>Avocet Yr6 Gene:Yr6: </td>' + divbgcolor(sample_phenotyping[i]['Avocet Yr6 Gene:Yr6']) + '</tr>'
                                 + '<tr><td>Moro Gene:Yr10: </td>' + divbgcolor(sample_phenotyping[i]['Moro Gene:Yr10']) + '</tr>'
                                 + '<tr><td>Avocet Yr24 Gene:Yr24: </td>' + divbgcolor(sample_phenotyping[i]['Avocet Yr24 Gene:Yr24']) + '</tr>'
                                 + '<tr><td>Opata Gene:Yr27+: </td>' + divbgcolor(sample_phenotyping[i]['Opata Gene:Yr27+']) + '</tr>'
                                 + '<tr><td>Strubes Dickkopf Gene:YrSd Yr25: </td>' + divbgcolor(sample_phenotyping[i]['Strubes Dickkopf Gene:YrSd Yr25']) + '</tr>'
                                 + '<tr><td>Avocet Yr27 Gene:Yr27: </td>' + divbgcolor(sample_phenotyping[i]['Avocet Yr27 Gene:Yr27']) + '</tr>'
                                 + '<tr><td>Apache Gene:7 17: </td>' + divbgcolor(sample_phenotyping[i]['Apache Gene:7 17']) + '</tr>'
                                 + '<tr><td>Vuka: </td>' + divbgcolor(sample_phenotyping[i]['Vuka']) + '</tr>'
                                 + '<tr><td>Grenado: </td>' + divbgcolor(sample_phenotyping[i]['Grenado']) + '</tr>'
                                 + '<tr><td>Benetto: </td>' + divbgcolor(sample_phenotyping[i]['Benetto']) + '</tr>'
                                 + '<tr><td>Tradiro: </td>' + divbgcolor(sample_phenotyping[i]['Tradiro']) + '</tr>'
                                 + '<tr><td>Tribeca: </td>' + divbgcolor(sample_phenotyping[i]['Tribeca']) + '</tr>'
                                 + '<tr><td>Tulus: </td>' + divbgcolor(sample_phenotyping[i]['Tulus']) + '</tr>'
                                 + '<tr><td>Dublet: </td>' + divbgcolor(sample_phenotyping[i]['Dublet']) + '</tr>'
                                 + '<tr><td>KWS Fido: </td>' + divbgcolor(sample_phenotyping[i]['KWS Fido']) + '</tr>'
                                 + '<tr><td>Brigadier: </td>' + divbgcolor(sample_phenotyping[i]['Brigadier']) + '</tr>'
                                 + '<tr><td>Stigg: </td>' + divbgcolor(sample_phenotyping[i]['Stigg']) + '</tr>'
                                 + '</tbody>'
                                 + '</table>'
                                 + '</div>';

            }
        }
//        }
        return phynotype_data;
    }

    function makeTable() {
        makeYRJSON();
    }

    function divbgcolor(value) {
        if (parseFloat(value) < 1) {
            return "<td class='pheno_1 in_box'>" + value + "</td>";
        }
        if (parseFloat(value) >= 1 && parseFloat(value) < 2) {
            return "<td class='pheno_12 in_box'>" + value + "</td>";
        }
        if (parseFloat(value) >= 2 && parseFloat(value) < 3) {
            return "<td class='pheno_23 in_box'>" + value + "</td>";
        }
        if (parseFloat(value) >= 3) {
            return "<td class='pheno_3 in_box'>" + value + "</td>";
        } else {
            return "<td >" + value + "</td>";
        }
    }

    function getDate(yyyymmdd) {
        console.log(yyyymmdd);
        if (yyyymmdd == undefined || yyyymmdd.length < 7) {
            return "Not Known"
        }
        else {
            var dt = yyyymmdd.substring(6, 7);
            var mon = yyyymmdd.substring(4, 5);
            var yr = yyyymmdd.substring(0, 3);
            return yr + '-' + mon + '-' + dt;
        }
    }

    function makeYRJSON() {
        for (i = 0; i < sample_list.length; i++) {
            var location = '';
            var phenotype = false;
            var genotype = "";
            for (j = 0; j < location_list.length; j++) {
                if (sample_list[i]['ID'] == location_list[j]['ID']) {
                    location = location_list[j]['location'];
                }
            }
            for (j = 0; j < sample_phenotyping.length; j++) {
                if (sample_list[i]['UKCPVS ID'] == sample_phenotyping[j]['Isolate']) {
                    phenotype = true;
                }
            }
            for (j = 0; j < sample_genotype.length; j++) {
                if (sample_list[i]['ID'] == sample_genotype[j]['ID']) {
                    genotype = sample_genotype[j]['Genetic group'];
                }
            }
            sample_list[i]['location'] = location;
            sample_list[i]['phenotype'] = phenotype;
            sample_list[i]['genotype'] = genotype;
        }
    }

    function addRandomPointer() {
        var la = randomNumberFromInterval(45, 60);
        var lo = randomNumberFromInterval(0, 25);

        addPointer(la, lo, "Hey, random! la: " + la + " lo: " + lo);
    }

    function addPointer(la, lo, note) {
        var markerLayer = L.marker([la, lo]).bindPopup(note);
        markers.push(markerLayer);
        markersGroup.addLayer(markerLayer);
        map.addLayer(markersGroup);
    }

    function removePointers() {
        map.removeLayer(markersGroup);
        markersGroup = new L.MarkerClusterGroup();
    }

    function removeTable() {
        jQuery('#resultTable').dataTable().fnDestroy();
        jQuery('#tableWrapper').html('<table id="resultTable"></table>');
    }

    function popup(msg) {
        L.popup()
                .setLatLng([52.621615, 8.219])
                .setContent(msg)
                .openOn(map);
    }

    function mapFitBounds(list) {
        map.fitBounds(list);
    }

    function randomNumberFromInterval(min, max) {
        return Math.random() * (max - min + 1) + min;
    }


</script>

<%@ include file="footer.jsp" %>