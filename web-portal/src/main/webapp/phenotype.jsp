<%@ include file="header.jsp" %>

<h2>Yellow Rust Phenotype Data</h2>

<div>
    Toggle column:
    <a data-column="4" class="toggle-vis">Chinese 166</a> -
    <a data-column="5" class="toggle-vis">Kalyansona</a> -
    <a data-column="6" class="toggle-vis">Vilmorin 23</a> -
    <a data-column="7" class="toggle-vis">Nord Desprez</a> -
    <a data-column="8" class="toggle-vis">Hybrid 46</a> -
    <a data-column="9" class="toggle-vis">Heines Kolben</a> -
    <a data-column="10" class="toggle-vis">Heines Peko</a> -
    <a data-column="11" class="toggle-vis">Lee</a> -  <br/>
    <a data-column="12" class="toggle-vis">Av x Yr7 NIL</a> -
    <a data-column="13" class="toggle-vis">Compair</a> -
    <a data-column="14" class="toggle-vis">Kavkaz x 4 Fed</a> -
    <a data-column="15" class="toggle-vis">Clement</a> -
    <a data-column="16" class="toggle-vis">AVS x Yr 15</a> -
    <a data-column="17" class="toggle-vis">VPM 1</a> -
    <a data-column="18" class="toggle-vis">Rendezvous</a> -
    <a data-column="19" class="toggle-vis">Av x Yr17</a> - <br/>
    <a data-column="20" class="toggle-vis">Carstens V</a> -
    <a data-column="21" class="toggle-vis">Talon</a> -
    <a data-column="22" class="toggle-vis">Av x Yr32</a> -
    <a data-column="23" class="toggle-vis">Spaldings Prolific</a> -
    <a data-column="24" class="toggle-vis">Robigus</a> -
    <a data-column="25" class="toggle-vis">Solstice</a> -
    <a data-column="26" class="toggle-vis">Timber</a> -
    <a data-column="27" class="toggle-vis">Warrior</a> -  <br/>
    <a data-column="28" class="toggle-vis">KWS-Sterling</a> -
    <a data-column="29" class="toggle-vis">Cadenza</a> -
    <a data-column="30" class="toggle-vis">Claire</a> -
    <a data-column="31" class="toggle-vis">Crusoe</a> -
    <a data-column="32" class="toggle-vis">Ambition</a> -
    <a data-column="33" class="toggle-vis">Heines VII</a> -
    <a data-column="34" class="toggle-vis">Suwon Omar</a> -
    <a data-column="35" class="toggle-vis">Avocet Yr5</a> -
    <a data-column="36" class="toggle-vis">Avocet Yr6</a> -  <br/>
    <a data-column="37" class="toggle-vis">Moro</a> -
    <a data-column="38" class="toggle-vis">Avocet Yr24</a> -
    <a data-column="39" class="toggle-vis">Opata</a> -
    <a data-column="40" class="toggle-vis">Strubes Dickkopf</a> -
    <a data-column="41" class="toggle-vis">Avocet Yr27</a> -
    <a data-column="42" class="toggle-vis">Apache</a> -
    <a data-column="43" class="toggle-vis">Vuka</a> -
    <a data-column="44" class="toggle-vis">Grenado</a> -
    <a data-column="45" class="toggle-vis">Benetto</a> -  <br/>
    <a data-column="46" class="toggle-vis">Tradiro</a> -
    <a data-column="47" class="toggle-vis">Tribeca</a> -
    <a data-column="48" class="toggle-vis">Tulus</a> -
    <a data-column="49" class="toggle-vis">Dublet</a> -
    <a data-column="50" class="toggle-vis">KWS Fido</a> -
    <a data-column="51" class="toggle-vis">Brigadier</a> -
    <a data-column="52" class="toggle-vis">Stigg</a>
</div>
<br/>
<p>Scroll left/right for more columns</p>
<div id="tableWrapper">
    <table id="resultTable" class="phenotype"></table>
</div>

<script type="text/javascript">
    jQuery(document).ready(function () {
        var phenotype_table = jQuery('#resultTable').DataTable({
            data: sample_phenotyping,
            "scrollX": "1150px",
//            "scrollY": "600px",
//            paging: false,
            "columns": [
                {data: "Batch", title: "Batch", "sDefaultContent": ""},
                {data: "No of isols tested", title: "No of isols tested", "sDefaultContent": ""},
                {data: "Isolate", title: "Isolate", "sDefaultContent": ""},
                {data: "Host", title: "Host", "sDefaultContent": ""},
                {
                    data: "Chinese 166 Gene:1",
                    title: "Chinese 166 Gene:1",
                    "sDefaultContent": "",
                    createdCell: function (cell, cellData, rowData, rowIndex, colIndex) {
                        color_coding(cellData, cell);
                    }
                },
                {
                    data: "Kalyansona Gene:2",
                    title: "Kalyansona Gene:2",
                    "sDefaultContent": "",
                    createdCell: function (cell, cellData, rowData, rowIndex, colIndex) {
                        color_coding(cellData, cell);
                    }
                },
                {
                    data: "Vilmorin 23 Gene:3a+",
                    title: "Vilmorin 23 Gene:3a+",
                    "sDefaultContent": "",
                    createdCell: function (cell, cellData, rowData, rowIndex, colIndex) {
                        color_coding(cellData, cell);
                    }
                },
                {
                    data: "Nord Desprez Gene:3a+",
                    title: "Nord Desprez Gene:3a+",
                    "sDefaultContent": "",
                    createdCell: function (cell, cellData, rowData, rowIndex, colIndex) {
                        color_coding(cellData, cell);
                    }
                },
                {
                    data: "Hybrid 46 Gene:(3b)4b", title: "Hybrid 46 Gene:(3b)4b", "sDefaultContent": "",
                    createdCell: function (cell, cellData, rowData, rowIndex, colIndex) {
                        color_coding(cellData, cell);
                    }
                },
                {
                    data: "Heines Kolben Gene:2,6",
                    title: "Heines Kolben Gene:2,6",
                    "sDefaultContent": "",
                    createdCell: function (cell, cellData, rowData, rowIndex, colIndex) {
                        color_coding(cellData, cell);
                    }
                },
                {
                    data: "Heines Peko Gene:2,6",
                    title: "Heines Peko Gene:2,6",
                    "sDefaultContent": "",
                    createdCell: function (cell, cellData, rowData, rowIndex, colIndex) {
                        color_coding(cellData, cell);
                    }
                },
                {
                    data: "Lee Gene:7",
                    title: "Lee Gene:7",
                    "sDefaultContent": "",
                    createdCell: function (cell, cellData, rowData, rowIndex, colIndex) {
                        color_coding(cellData, cell);
                    }
                },
                {
                    data: "Av x Yr7 NIL Gene:7",
                    title: "Av x Yr7 NIL Gene:7",
                    "sDefaultContent": "",
                    createdCell: function (cell, cellData, rowData, rowIndex, colIndex) {
                        color_coding(cellData, cell);
                    }
                },
                {
                    data: "Compair Gene:8",
                    title: "Compair Gene:8",
                    "sDefaultContent": "",
                    createdCell: function (cell, cellData, rowData, rowIndex, colIndex) {
                        color_coding(cellData, cell);
                    }
                },
                {
                    data: "Kavkaz x 4 Fed Gene:9",
                    title: "Kavkaz x 4 Fed Gene:9",
                    "sDefaultContent": "",
                    createdCell: function (cell, cellData, rowData, rowIndex, colIndex) {
                        color_coding(cellData, cell);
                    }
                },
                {
                    data: "Clement Gene:9",
                    title: "Clement Gene:9",
                    "sDefaultContent": "",
                    createdCell: function (cell, cellData, rowData, rowIndex, colIndex) {
                        color_coding(cellData, cell);
                    }
                },
                {
                    data: "AVS x Yr 15 Gene:15",
                    title: "AVS x Yr 15 Gene:15",
                    "sDefaultContent": "",
                    createdCell: function (cell, cellData, rowData, rowIndex, colIndex) {
                        color_coding(cellData, cell);
                    }
                },
                {
                    data: "VPM 1 Gene:17",
                    title: "VPM 1 Gene:17",
                    "sDefaultContent": "",
                    createdCell: function (cell, cellData, rowData, rowIndex, colIndex) {
                        color_coding(cellData, cell);
                    }
                },
                {
                    data: "Rendezvous Gene:17",
                    title: "Rendezvous Gene:17",
                    "sDefaultContent": "",
                    createdCell: function (cell, cellData, rowData, rowIndex, colIndex) {
                        color_coding(cellData, cell);
                    }
                },
                {
                    data: "Av x Yr17 Gene:17",
                    title: "Av x Yr17 Gene:17",
                    "sDefaultContent": "",
                    createdCell: function (cell, cellData, rowData, rowIndex, colIndex) {
                        color_coding(cellData, cell);
                    }
                },
                {
                    data: "Carstens V Gene:32",
                    title: "Carstens V Gene:32",
                    "sDefaultContent": "",
                    createdCell: function (cell, cellData, rowData, rowIndex, colIndex) {
                        color_coding(cellData, cell);
                    }
                },
                {
                    data: "Talon Gene:32",
                    title: "Talon Gene:32",
                    "sDefaultContent": "",
                    createdCell: function (cell, cellData, rowData, rowIndex, colIndex) {
                        color_coding(cellData, cell);
                    }
                },
                {
                    data: "Av x Yr32 Gene:32",
                    title: "Av x Yr32 Gene:32",
                    "sDefaultContent": "",
                    createdCell: function (cell, cellData, rowData, rowIndex, colIndex) {
                        color_coding(cellData, cell);
                    }
                },
                {
                    data: "Spaldings Prolific Gene:sp",
                    title: "Spaldings Prolific Gene:sp",
                    "sDefaultContent": "",
                    createdCell: function (cell, cellData, rowData, rowIndex, colIndex) {
                        color_coding(cellData, cell);
                    }
                },
                {
                    data: "Robigus Gene:Rob\'",
                    title: "Robigus Gene:Rob'",
                    "sDefaultContent": "",
                    createdCell: function (cell, cellData, rowData, rowIndex, colIndex) {
                        color_coding(cellData, cell);
                    }
                },
                {
                    data: "Solstice Gene:\'Sol\'",
                    title: "Solstice Gene:\'Sol\'",
                    "sDefaultContent": "",
                    createdCell: function (cell, cellData, rowData, rowIndex, colIndex) {
                        color_coding(cellData, cell);
                    }
                },
                {
                    data: "Timber Gene:\'Tim\'",
                    title: "Timber Gene:\'Tim\'",
                    "sDefaultContent": "",
                    createdCell: function (cell, cellData, rowData, rowIndex, colIndex) {
                        color_coding(cellData, cell);
                    }
                },
                {
                    data: "Warrior Gene:War\'",
                    title: "Warrior Gene:War\'",
                    "sDefaultContent": "",
                    createdCell: function (cell, cellData, rowData, rowIndex, colIndex) {
                        color_coding(cellData, cell);
                    }
                },
                {
                    data: "KWS-Sterling Gene:Ste\'",
                    title: "KWS-Sterling Gene:Ste\'",
                    "sDefaultContent": "",
                    createdCell: function (cell, cellData, rowData, rowIndex, colIndex) {
                        color_coding(cellData, cell);
                    }
                },
                {
                    data: "Cadenza Gene:6 7",
                    title: "Cadenza Gene:6 7",
                    "sDefaultContent": "",
                    createdCell: function (cell, cellData, rowData, rowIndex, colIndex) {
                        color_coding(cellData, cell);
                    }
                },
                {
                    data: "Claire Gene:Claire",
                    title: "Claire Gene:Claire",
                    "sDefaultContent": "",
                    createdCell: function (cell, cellData, rowData, rowIndex, colIndex) {
                        color_coding(cellData, cell);
                    }
                },
                {
                    data: "Crusoe Gene:Crusoe",
                    title: "Crusoe Gene:Crusoe",
                    "sDefaultContent": "",
                    createdCell: function (cell, cellData, rowData, rowIndex, colIndex) {
                        color_coding(cellData, cell);
                    }
                },
                {
                    data: "Ambition Gene:Amb\'",
                    title: "Ambition Gene:Amb\'",
                    "sDefaultContent": "",
                    createdCell: function (cell, cellData, rowData, rowIndex, colIndex) {
                        color_coding(cellData, cell);
                    }
                },
                {
                    data: "Heines VII Gene:Yr2 Yr25+",
                    title: "Heines VII Gene:Yr2 Yr25+",
                    "sDefaultContent": "",
                    createdCell: function (cell, cellData, rowData, rowIndex, colIndex) {
                        color_coding(cellData, cell);
                    }
                },
                {
                    data: "Suwon Omar Gene:Yr(Su)",
                    title: "Suwon Omar Gene:Yr(Su)",
                    "sDefaultContent": "",
                    createdCell: function (cell, cellData, rowData, rowIndex, colIndex) {
                        color_coding(cellData, cell);
                    }
                },
                {
                    data: "Avocet Yr5 Gene:Yr5",
                    title: "Avocet Yr5 Gene:Yr5",
                    "sDefaultContent": "",
                    createdCell: function (cell, cellData, rowData, rowIndex, colIndex) {
                        color_coding(cellData, cell);
                    }
                },
                {
                    data: "Avocet Yr6 Gene:Yr6",
                    title: "Avocet Yr6 Gene:Yr6",
                    "sDefaultContent": "",
                    createdCell: function (cell, cellData, rowData, rowIndex, colIndex) {
                        color_coding(cellData, cell);
                    }
                },
                {
                    data: "Moro Gene:Yr10",
                    title: "Moro Gene:Yr10",
                    "sDefaultContent": "",
                    createdCell: function (cell, cellData, rowData, rowIndex, colIndex) {
                        color_coding(cellData, cell);
                    }
                },
                {
                    data: "Avocet Yr24 Gene:Yr24",
                    title: "Avocet Yr24 Gene:Yr24",
                    "sDefaultContent": "",
                    createdCell: function (cell, cellData, rowData, rowIndex, colIndex) {
                        color_coding(cellData, cell);
                    }
                },
                {
                    data: "Opata Gene:Yr27+",
                    title: "Opata Gene:Yr27+",
                    "sDefaultContent": "",
                    createdCell: function (cell, cellData, rowData, rowIndex, colIndex) {
                        color_coding(cellData, cell);
                    }
                },
                {
                    data: "Strubes Dickkopf Gene:YrSd Yr25",
                    title: "Strubes Dickkopf Gene:YrSd Yr25",
                    "sDefaultContent": "",
                    createdCell: function (cell, cellData, rowData, rowIndex, colIndex) {
                        color_coding(cellData, cell);
                    }
                },
                {
                    data: "Avocet Yr27 Gene:Yr27",
                    title: "Avocet Yr27 Gene:Yr27",
                    "sDefaultContent": "",
                    createdCell: function (cell, cellData, rowData, rowIndex, colIndex) {
                        color_coding(cellData, cell);
                    }
                },
                {
                    data: "Apache Gene:7 17",
                    title: "Apache Gene:7 17",
                    "sDefaultContent": "",
                    createdCell: function (cell, cellData, rowData, rowIndex, colIndex) {
                        color_coding(cellData, cell);
                    }
                },
                {
                    data: "Vuka",
                    title: "Vuka",
                    "sDefaultContent": "",
                    createdCell: function (cell, cellData, rowData, rowIndex, colIndex) {
                        color_coding(cellData, cell);
                    }
                },
                {
                    data: "Grenado",
                    title: "Grenado",
                    "sDefaultContent": "",
                    createdCell: function (cell, cellData, rowData, rowIndex, colIndex) {
                        color_coding(cellData, cell);
                    }
                },
                {
                    data: "Benetto",
                    title: "Benetto",
                    "sDefaultContent": "",
                    createdCell: function (cell, cellData, rowData, rowIndex, colIndex) {
                        color_coding(cellData, cell);
                    }
                },
                {
                    data: "Tradiro",
                    title: "Tradiro",
                    "sDefaultContent": "",
                    createdCell: function (cell, cellData, rowData, rowIndex, colIndex) {
                        color_coding(cellData, cell);
                    }
                },
                {
                    data: "Tribeca",
                    title: "Tribeca",
                    "sDefaultContent": "",
                    createdCell: function (cell, cellData, rowData, rowIndex, colIndex) {
                        color_coding(cellData, cell);
                    }
                },
                {
                    data: "Tulus",
                    title: "Tulus",
                    "sDefaultContent": "",
                    createdCell: function (cell, cellData, rowData, rowIndex, colIndex) {
                        color_coding(cellData, cell);
                    }
                },
                {
                    data: "Dublet",
                    title: "Dublet",
                    "sDefaultContent": "",
                    createdCell: function (cell, cellData, rowData, rowIndex, colIndex) {
                        color_coding(cellData, cell);
                    }
                },
                {
                    data: "KWS Fido",
                    title: "KWS Fido",
                    "sDefaultContent": "",
                    createdCell: function (cell, cellData, rowData, rowIndex, colIndex) {
                        color_coding(cellData, cell);
                    }
                },
                {
                    data: "Brigadier",
                    title: "Brigadier",
                    "sDefaultContent": "",
                    createdCell: function (cell, cellData, rowData, rowIndex, colIndex) {
                        color_coding(cellData, cell);
                    }
                },
                {
                    data: "Stigg", title: "Stigg", "sDefaultContent": "",
                    createdCell: function (cell, cellData, rowData, rowIndex, colIndex) {
                        color_coding(cellData, cell);
                    }
                }
            ]
        });

        jQuery('a.toggle-vis').on('click', function (e) {
            e.preventDefault();

            // Get the column API object
            var column = phenotype_table.column(jQuery(this).attr('data-column'));

            // Toggle the visibility
            column.visible(!column.visible());
        });
    });

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

</div>

<%@ include file="footer.jsp" %>