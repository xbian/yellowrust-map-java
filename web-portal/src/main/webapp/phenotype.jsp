<%@ include file="header.jsp" %>

<h2>Yellow Rust Phenotype Data</h2>

<script src="<c:url value='/scripts/phenotype.js'/>" type="text/javascript"></script>
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



</script>


<%@ include file="footer.jsp" %>