<%@ include file="header.jsp" %>
<script src="<c:url value='/scripts/upload.js'/>" type="text/javascript"></script>
<div class="container center-block">

    <div class="jumbotron">
        <h2>Upload Excel sheet in CSV format</h2>
        <input type="radio" name="filetype" value="sample" checked> Sample
        <input type="radio" name="filetype" value="phenotype"> Phenotype
        <input type="radio" name="filetype" value="genotype"> Genotype

        <div id="file" class="dropzone">Drop file here</div>
        <output id="list"></output>
        <br/>
        <button id="button" type="button" onclick="uploadFPFile();">Upload</button>
        <br/>
        <div id="statusdiv"></div>
    </div>
</div>

<script type="text/javascript">


    var dropZone = document.getElementById('file');
    dropZone.addEventListener('dragover', handleDragOver, false);
    dropZone.addEventListener('drop', handleFileSelect, false);


    jQuery(document).ready(function () {
    });
    function uploadFPFile(){
        var file_type = jQuery('input[name=filetype]:checked').val();
        jQuery('#statusdiv').html(filecontent);
    }


</script>

<%@ include file="footer.jsp" %>