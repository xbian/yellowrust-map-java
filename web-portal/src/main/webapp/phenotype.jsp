<%@ include file="header.jsp" %>

<h2>Yellow Rust Phenotype Data</h2>

<script src="<c:url value='/scripts/yrmap_new.js'/>" type="text/javascript"></script>
<div class="row">
    <div class="col-md-4">
        Toggle column: <br/>
        <select multiple="multiple" class="form-control toggle-vis-select" width="200px">
            <option value="4 " class="toggle-vis" selected="selected">Chinese 166</option>
            <option value="5 " class="toggle-vis" selected="selected">Kalyansona</option>
            <option value="6 " class="toggle-vis" selected="selected">Vilmorin 23</option>
            <option value="7 " class="toggle-vis" selected="selected">Nord Desprez</option>
            <option value="8 " class="toggle-vis" selected="selected">Hybrid 46</option>
            <option value="9 " class="toggle-vis" selected="selected">Heines Kolben</option>
            <option value="10 " class="toggle-vis" selected="selected">Heines Peko</option>
            <option value="11 " class="toggle-vis" selected="selected">Lee</option>
            <option value="12 " class="toggle-vis" selected="selected">Av x Yr7 NIL</option>
            <option value="13 " class="toggle-vis" selected="selected">Compair</option>
            <option value="14 " class="toggle-vis" selected="selected">Kavkaz x 4 Fed</option>
            <option value="15 " class="toggle-vis" selected="selected">Clement</option>
            <option value="16 " class="toggle-vis" selected="selected">AVS x Yr 15</option>
            <option value="17 " class="toggle-vis" selected="selected">VPM 1</option>
            <option value="18 " class="toggle-vis" selected="selected">Rendezvous</option>
            <option value="19 " class="toggle-vis" selected="selected">Av x Yr17</option>
            <option value="20 " class="toggle-vis" selected="selected">Carstens V</option>
            <option value="21 " class="toggle-vis" selected="selected">Talon</option>
            <option value="22 " class="toggle-vis" selected="selected">Av x Yr32</option>
            <option value="23 " class="toggle-vis" selected="selected">Spaldings Prolific</option>
            <option value="24 " class="toggle-vis" selected="selected">Robigus</option>
            <option value="25 " class="toggle-vis" selected="selected">Solstice</option>
            <option value="26 " class="toggle-vis" selected="selected">Timber</option>
            <option value="27 " class="toggle-vis" selected="selected">Warrior</option>
            <option value="28 " class="toggle-vis" selected="selected">KWS-Sterling</option>
            <option value="29 " class="toggle-vis" selected="selected">Cadenza</option>
            <option value="30 " class="toggle-vis" selected="selected">Claire</option>
            <option value="31 " class="toggle-vis" selected="selected">Crusoe</option>
            <option value="32 " class="toggle-vis" selected="selected">Ambition</option>
            <option value="33 " class="toggle-vis" selected="selected">Heines VII</option>
            <option value="34 " class="toggle-vis" selected="selected">Suwon Omar</option>
            <option value="35 " class="toggle-vis" selected="selected">Avocet Yr5</option>
            <option value="36 " class="toggle-vis" selected="selected">Avocet Yr6</option>
            <option value="37 " class="toggle-vis" selected="selected">Moro</option>
            <option value="38 " class="toggle-vis" selected="selected">Avocet Yr24</option>
            <option value="39 " class="toggle-vis" selected="selected">Opata</option>
            <option value="40 " class="toggle-vis" selected="selected">Strubes Dickkopf</option>
            <option value="41 " class="toggle-vis" selected="selected">Avocet Yr27</option>
            <option value="42 " class="toggle-vis" selected="selected">Apache</option>
            <option value="43 " class="toggle-vis" selected="selected">Vuka</option>
            <option value="44 " class="toggle-vis" selected="selected">Grenado</option>
            <option value="45 " class="toggle-vis" selected="selected">Benetto</option>
            <option value="46 " class="toggle-vis" selected="selected">Tradiro</option>
            <option value="47 " class="toggle-vis" selected="selected">Tribeca</option>
            <option value="48 " class="toggle-vis" selected="selected">Tulus</option>
            <option value="49 " class="toggle-vis" selected="selected">Dublet</option>
            <option value="50 " class="toggle-vis" selected="selected">KWS Fido</option>
            <option value="51 " class="toggle-vis" selected="selected">Brigadier</option>
            <option value="52 " class="toggle-vis" selected="selected">Stigg</option>
        </select>
    </div>
</div>
<br/>

<p>Scroll left/right for more columns</p>
<div id="status"></div>

<div id="tableWrapper">
    <table id="resultTable" class="phenotype"></table>
</div>

<script type="text/javascript">
    var phenotype_table;
    var phenotype_data = [];
    jQuery(document).ready(function () {
        jQuery('#status').html('<img src=\"/yellowrust-map/images/loading_spinner.gif\"/>');
        Fluxion.doAjax(
                'wisControllerHelperService',
                'getAllPublicData',
                {
                    'url': ajaxurl
                },
                {
                    'doOnSuccess': function (json) {
                        for (i = 0; i < json.data.length; i++) {
                            if (json.data[i]['data']['phenotype'] != undefined && json.data[i]['data']['sample'] != undefined) {
                                        phenotype_data.push(json.data[i]);
                            }
                        }
                        jQuery('#status').html('');
                        show_table();
                    }
                }
        );


        jQuery('.toggle-vis-select').change(function () {
            jQuery("select.toggle-vis-select option:not(:selected)").each(function () {
                hide_column(jQuery(this).val());

            });
            jQuery("select.toggle-vis-select option:selected").each(function () {
                show_column(jQuery(this).val());
            });
        });
    });


    function show_table(){
        phenotype_table = jQuery('#resultTable').DataTable({
            data: phenotype_data,
            scrollX: 1150,
            scrollCollapse: true,
            fixedColumns: {
                leftColumns: 4
            },
            "columns": [
                {data: "data.ID", title: "ID", "sDefaultContent": ""},
                {data: "data.sample.Variety", title: "Variety", "sDefaultContent": ""},
                {data: "data.sample.Host", title: "Host", "sDefaultContent": ""},
                {data: "data.sample.Date collected.date", title: "Date", "sDefaultContent": ""},
                {
                    data: "data.phenotype.Chinese 166",
                    title: "Chinese 166 Gene:1",
                    "sDefaultContent": "",
                    createdCell: function (cell, cellData, rowData, rowIndex, colIndex) {
                        color_coding(cellData, cell);
                    }
                },
                {
                    data: "data.phenotype.Kalyansona",
                    title: "Kalyansona Gene:2",
                    "sDefaultContent": "",
                    createdCell: function (cell, cellData, rowData, rowIndex, colIndex) {
                        color_coding(cellData, cell);
                    }
                },
                {
                    data: "data.phenotype.Vilmorin 23",
                    title: "Vilmorin 23 Gene:3a+",
                    "sDefaultContent": "",
                    createdCell: function (cell, cellData, rowData, rowIndex, colIndex) {
                        color_coding(cellData, cell);
                    }
                },
                {
                    data: "data.phenotype.Nord Desprez",
                    title: "Nord Desprez Gene:3a+",
                    "sDefaultContent": "",
                    createdCell: function (cell, cellData, rowData, rowIndex, colIndex) {
                        color_coding(cellData, cell);
                    }
                },
                {
                    data: "data.phenotype.Hybrid 46", title: "Hybrid 46 Gene:(3b)4b", "sDefaultContent": "",
                    createdCell: function (cell, cellData, rowData, rowIndex, colIndex) {
                        color_coding(cellData, cell);
                    }
                },
                {
                    data: "data.phenotype.Heines Kolben",
                    title: "Heines Kolben Gene:2,6",
                    "sDefaultContent": "",
                    createdCell: function (cell, cellData, rowData, rowIndex, colIndex) {
                        color_coding(cellData, cell);
                    }
                },
                {
                    data: "data.phenotype.Heines Peko",
                    title: "Heines Peko Gene:2,6",
                    "sDefaultContent": "",
                    createdCell: function (cell, cellData, rowData, rowIndex, colIndex) {
                        color_coding(cellData, cell);
                    }
                },
                {
                    data: "data.phenotype.Lee",
                    title: "Lee Gene:7",
                    "sDefaultContent": "",
                    createdCell: function (cell, cellData, rowData, rowIndex, colIndex) {
                        color_coding(cellData, cell);
                    }
                },
                {
                    data: "data.phenotype.Av x Yr7 NIL",
                    title: "Av x Yr7 NIL Gene:7",
                    "sDefaultContent": "",
                    createdCell: function (cell, cellData, rowData, rowIndex, colIndex) {
                        color_coding(cellData, cell);
                    }
                },
                {
                    data: "data.phenotype.Compair",
                    title: "Compair Gene:8",
                    "sDefaultContent": "",
                    createdCell: function (cell, cellData, rowData, rowIndex, colIndex) {
                        color_coding(cellData, cell);
                    }
                },
                {
                    data: "data.phenotype.Kavkaz x 4 Fed",
                    title: "Kavkaz x 4 Fed Gene:9",
                    "sDefaultContent": "",
                    createdCell: function (cell, cellData, rowData, rowIndex, colIndex) {
                        color_coding(cellData, cell);
                    }
                },
                {
                    data: "data.phenotype.Clement",
                    title: "Clement Gene:9",
                    "sDefaultContent": "",
                    createdCell: function (cell, cellData, rowData, rowIndex, colIndex) {
                        color_coding(cellData, cell);
                    }
                },
                {
                    data: "data.phenotype.AVS x Yr 15",
                    title: "AVS x Yr 15 Gene:15",
                    "sDefaultContent": "",
                    createdCell: function (cell, cellData, rowData, rowIndex, colIndex) {
                        color_coding(cellData, cell);
                    }
                },
                {
                    data: "data.phenotype.VPM 1",
                    title: "VPM 1 Gene:17",
                    "sDefaultContent": "",
                    createdCell: function (cell, cellData, rowData, rowIndex, colIndex) {
                        color_coding(cellData, cell);
                    }
                },
                {
                    data: "data.phenotype.Rendezvous",
                    title: "Rendezvous Gene:17",
                    "sDefaultContent": "",
                    createdCell: function (cell, cellData, rowData, rowIndex, colIndex) {
                        color_coding(cellData, cell);
                    }
                },
                {
                    data: "data.phenotype.Av x Yr17",
                    title: "Av x Yr17 Gene:17",
                    "sDefaultContent": "",
                    createdCell: function (cell, cellData, rowData, rowIndex, colIndex) {
                        color_coding(cellData, cell);
                    }
                },
                {
                    data: "data.phenotype.Carstens V",
                    title: "Carstens V Gene:32",
                    "sDefaultContent": "",
                    createdCell: function (cell, cellData, rowData, rowIndex, colIndex) {
                        color_coding(cellData, cell);
                    }
                },
                {
                    data: "data.phenotype.Talon",
                    title: "Talon Gene:32",
                    "sDefaultContent": "",
                    createdCell: function (cell, cellData, rowData, rowIndex, colIndex) {
                        color_coding(cellData, cell);
                    }
                },
                {
                    data: "data.phenotype.Av x Yr32",
                    title: "Av x Yr32 Gene:32",
                    "sDefaultContent": "",
                    createdCell: function (cell, cellData, rowData, rowIndex, colIndex) {
                        color_coding(cellData, cell);
                    }
                },
                {
                    data: "data.phenotype.Spaldings Prolific",
                    title: "Spaldings Prolific Gene:sp",
                    "sDefaultContent": "",
                    createdCell: function (cell, cellData, rowData, rowIndex, colIndex) {
                        color_coding(cellData, cell);
                    }
                },
                {
                    data: "data.phenotype.Robigus",
                    title: "Robigus Gene:Rob'",
                    "sDefaultContent": "",
                    createdCell: function (cell, cellData, rowData, rowIndex, colIndex) {
                        color_coding(cellData, cell);
                    }
                },
                {
                    data: "data.phenotype.Solstice",
                    title: "Solstice Gene:\'Sol\'",
                    "sDefaultContent": "",
                    createdCell: function (cell, cellData, rowData, rowIndex, colIndex) {
                        color_coding(cellData, cell);
                    }
                },
                {
                    data: "data.phenotype.Timber",
                    title: "Timber Gene:\'Tim\'",
                    "sDefaultContent": "",
                    createdCell: function (cell, cellData, rowData, rowIndex, colIndex) {
                        color_coding(cellData, cell);
                    }
                },
                {
                    data: "data.phenotype.Warrior",
                    title: "Warrior Gene:War\'",
                    "sDefaultContent": "",
                    createdCell: function (cell, cellData, rowData, rowIndex, colIndex) {
                        color_coding(cellData, cell);
                    }
                },
                {
                    data: "data.phenotype.KWS-Sterling",
                    title: "KWS-Sterling Gene:Ste\'",
                    "sDefaultContent": "",
                    createdCell: function (cell, cellData, rowData, rowIndex, colIndex) {
                        color_coding(cellData, cell);
                    }
                },
                {
                    data: "data.phenotype.Cadenza",
                    title: "Cadenza Gene:6 7",
                    "sDefaultContent": "",
                    createdCell: function (cell, cellData, rowData, rowIndex, colIndex) {
                        color_coding(cellData, cell);
                    }
                },
                {
                    data: "data.phenotype.Claire",
                    title: "Claire Gene:Claire",
                    "sDefaultContent": "",
                    createdCell: function (cell, cellData, rowData, rowIndex, colIndex) {
                        color_coding(cellData, cell);
                    }
                },
                {
                    data: "data.phenotype.Crusoe",
                    title: "Crusoe Gene:Crusoe",
                    "sDefaultContent": "",
                    createdCell: function (cell, cellData, rowData, rowIndex, colIndex) {
                        color_coding(cellData, cell);
                    }
                },
                {
                    data: "data.phenotype.Ambition",
                    title: "Ambition Gene:Amb\'",
                    "sDefaultContent": "",
                    createdCell: function (cell, cellData, rowData, rowIndex, colIndex) {
                        color_coding(cellData, cell);
                    }
                },
                {
                    data: "data.phenotype.Heines VII",
                    title: "Heines VII Gene:Yr2 Yr25+",
                    "sDefaultContent": "",
                    createdCell: function (cell, cellData, rowData, rowIndex, colIndex) {
                        color_coding(cellData, cell);
                    }
                },
                {
                    data: "data.phenotype.Suwon Omar",
                    title: "Suwon Omar Gene:Yr(Su)",
                    "sDefaultContent": "",
                    createdCell: function (cell, cellData, rowData, rowIndex, colIndex) {
                        color_coding(cellData, cell);
                    }
                },
                {
                    data: "data.phenotype.Avocet Yr5",
                    title: "Avocet Yr5 Gene:Yr5",
                    "sDefaultContent": "",
                    createdCell: function (cell, cellData, rowData, rowIndex, colIndex) {
                        color_coding(cellData, cell);
                    }
                },
                {
                    data: "data.phenotype.Avocet Yr6",
                    title: "Avocet Yr6 Gene:Yr6",
                    "sDefaultContent": "",
                    createdCell: function (cell, cellData, rowData, rowIndex, colIndex) {
                        color_coding(cellData, cell);
                    }
                },
                {
                    data: "data.phenotype.Moro",
                    title: "Moro Gene:Yr10",
                    "sDefaultContent": "",
                    createdCell: function (cell, cellData, rowData, rowIndex, colIndex) {
                        color_coding(cellData, cell);
                    }
                },
                {
                    data: "data.phenotype.Avocet Yr24",
                    title: "Avocet Yr24 Gene:Yr24",
                    "sDefaultContent": "",
                    createdCell: function (cell, cellData, rowData, rowIndex, colIndex) {
                        color_coding(cellData, cell);
                    }
                },
                {
                    data: "data.phenotype.Opata",
                    title: "Opata Gene:Yr27+",
                    "sDefaultContent": "",
                    createdCell: function (cell, cellData, rowData, rowIndex, colIndex) {
                        color_coding(cellData, cell);
                    }
                },
                {
                    data: "data.phenotype.Strubes Dickkopf",
                    title: "Strubes Dickkopf Gene:YrSd Yr25",
                    "sDefaultContent": "",
                    createdCell: function (cell, cellData, rowData, rowIndex, colIndex) {
                        color_coding(cellData, cell);
                    }
                },
                {
                    data: "data.phenotype.Avocet Yr27",
                    title: "Avocet Yr27 Gene:Yr27",
                    "sDefaultContent": "",
                    createdCell: function (cell, cellData, rowData, rowIndex, colIndex) {
                        color_coding(cellData, cell);
                    }
                },
                {
                    data: "data.phenotype.Apache",
                    title: "Apache Gene:7 17",
                    "sDefaultContent": "",
                    createdCell: function (cell, cellData, rowData, rowIndex, colIndex) {
                        color_coding(cellData, cell);
                    }
                },
                {
                    data: "data.phenotype.Vuka",
                    title: "Vuka",
                    "sDefaultContent": "",
                    createdCell: function (cell, cellData, rowData, rowIndex, colIndex) {
                        color_coding(cellData, cell);
                    }
                },
                {
                    data: "data.phenotype.Grenado",
                    title: "Grenado",
                    "sDefaultContent": "",
                    createdCell: function (cell, cellData, rowData, rowIndex, colIndex) {
                        color_coding(cellData, cell);
                    }
                },
                {
                    data: "data.phenotype.Benetto",
                    title: "Benetto",
                    "sDefaultContent": "",
                    createdCell: function (cell, cellData, rowData, rowIndex, colIndex) {
                        color_coding(cellData, cell);
                    }
                },
                {
                    data: "data.phenotype.Tradiro",
                    title: "Tradiro",
                    "sDefaultContent": "",
                    createdCell: function (cell, cellData, rowData, rowIndex, colIndex) {
                        color_coding(cellData, cell);
                    }
                },
                {
                    data: "data.phenotype.Tribeca",
                    title: "Tribeca",
                    "sDefaultContent": "",
                    createdCell: function (cell, cellData, rowData, rowIndex, colIndex) {
                        color_coding(cellData, cell);
                    }
                },
                {
                    data: "data.phenotype.Tulus",
                    title: "Tulus",
                    "sDefaultContent": "",
                    createdCell: function (cell, cellData, rowData, rowIndex, colIndex) {
                        color_coding(cellData, cell);
                    }
                },
                {
                    data: "data.phenotype.Dublet",
                    title: "Dublet",
                    "sDefaultContent": "",
                    createdCell: function (cell, cellData, rowData, rowIndex, colIndex) {
                        color_coding(cellData, cell);
                    }
                },
                {
                    data: "data.phenotype.KWS Fido",
                    title: "KWS Fido",
                    "sDefaultContent": "",
                    createdCell: function (cell, cellData, rowData, rowIndex, colIndex) {
                        color_coding(cellData, cell);
                    }
                },
                {
                    data: "data.phenotype.Brigadier",
                    title: "Brigadier",
                    "sDefaultContent": "",
                    createdCell: function (cell, cellData, rowData, rowIndex, colIndex) {
                        color_coding(cellData, cell);
                    }
                },
                {
                    data: "data.phenotype.Stigg", title: "Stigg", "sDefaultContent": "",
                    createdCell: function (cell, cellData, rowData, rowIndex, colIndex) {
                        color_coding(cellData, cell);
                    }
                }
            ]
        });
    }

    function toggle_column(index) {
        var column = phenotype_table.column(index);
        column.visible(!column.visible());
    }

    function hide_column(index) {
        var column = phenotype_table.column(index);
        column.visible(false);
    }

    function show_column(index) {
        var column = phenotype_table.column(index);
        column.visible(true);
    }

    function color_coding(cellData, cell) {
        if (parseFloat(cellData) < 1) {
            jQuery(cell).addClass("pheno_1");
        }
        if (parseFloat(cellData) >= 1 && parseFloat(cellData) < 2) {
            jQuery(cell).addClass("pheno_12");
        }
        if (parseFloat(cellData) >= 2 && parseFloat(cellData) < 3) {
            jQuery(cell).addClass("pheno_23");
        }
        if (parseFloat(cellData) >= 3) {
            jQuery(cell).addClass("pheno_3");
        }
    }

</script>


<%@ include file="footer.jsp" %>