<div class='modal fade' id='modalCodigos' tabindex='-1' role='dialog' aria-labelledby='myModalLabel'>
    <div class='modal-dialog' role='document'>
        <div class='modal-content'>
            <div class='modal-header'>
                <button type='button' class='close' onclick='cierraModalImpresion()' aria-label='Close'><span
                        aria-hidden='true'>&times;</span></button>
                <h4 class='modal-title' id='myModalLabel'>Impresión de Etiqueta</h4>
            </div>
            <div class='modal-body modalBodyCodigos' id='modalBodyCodigos'>

                <div class="container-fluid">
                    <div class="row">
                        <div class="col-md-12" id="infoEtiqueta"></div>
                        <div class="col-md-12" id="contenedorCodigo"></div>
                    </div>
                    <!-- Info qe va abajo del QR -->
                    <div id="infoFooter"></div>
                </div>
            </div>
            <div class='modal-footer'>
                <button type='button' class='btn btn-default' onclick='cierraModalImpresion()'>Cancelar</button>
                <button type='button' class='btn btn-primary' onclick='imprimirInfoQR()'>Imprimir</button>
            </div>
        </div>
    </div>
</div>

<div class='modal fade' id='modalCodigosPedido' tabindex='-1' role='dialog' aria-labelledby='myModalLabel'>
    <div class='modal-dialog' role='document'>
        <div class='modal-content'>
            <div class='modal-header'>
                <button type='button' class='close' onclick='cierraModalImpresionPedido()' aria-label='Close'><span
                        aria-hidden='true'>&times;</span></button>
                <h4 class='modal-title' id='myModalLabel'>Impresión de Etiqueta</h4>
            </div>
            <div class='modal-body modalBodyCodigos' id='modalBodyCodigos'>

                <div class="container-fluid">
                    <div class="row">
                        <div class="col-md-12" id="infoEtiqueta"></div>
                        <div class="col-md-12" id="contenedorCodigo"></div>
                    </div>
                    <!-- Info qe va abajo del QR -->
                    <div id="infoFooter"></div>
                </div>
            </div>
            <div class='modal-footer'>
                <button type='button' class='btn btn-default' onclick='cierraModalImpresionPedido()'>Cancelar</button>
                <button type='button' class='btn btn-primary' onclick='imprimirInfoQRpedido()'>Imprimir</button>
            </div>
        </div>
    </div>
</div>





<script>
// levanta el modal
function verModalImpresion(titulo) {
    // levanto modal con img de Codigo
    $("#modalCodigos").modal('show');
}

// levanta el modal
function verModalImpresionPedido(titulo) {
    // levanto modal con img de Codigo
    $("#modalCodigosPedido").modal('show');
}



// trae codigo QR con los datos recibidos y agrega en modal
function getQR(config, data, direccion) {
    // debugger;
    $.ajax({
        type: 'POST',
        dataType: 'json',
        data: {
            config,
            data,
            direccion
        },
        url: 'index.php/<?php echo COD ?>Codigo/generarQR',
        success: function(result) {

            if (result != null) {
                var qr = '<img  id="codigoImage" src="' + result.filename + '" alt="codigo qr" >';

                // agrego codigo Qr al modal
                $('#contenedorCodigo').append(qr);
            }
        },
        error: function(result) {

        },
        complete: function() {

        }
    });
}
// impresion de etiqueta
function imprimirInfoQR() {
    var base = "<?php echo base_url()?>";
    $('.modalBodyCodigos').printThis({
        debug: false,
        importCSS: false,
        importStyle: true,
        pageTitle: "TRAZALOG TOOLS",
        printContainer: true,
        removeInline: true,
        //header: "<h1 style='text-align: center;'>Reporte Articulos Vencidos</h1>",
        loadCSS: "<?php  echo base_url('lib/props/codigos-impresiones/alm-proc-yudica/yudica.css')?>",
        // copyTagClasses: true,
        afterPrint: function() {
            cierraModalImpresion();

            const confirm = Swal.mixin({
                customClass: {
                    confirmButton: 'btn btn-primary'
                },
                buttonsStyling: false
            });

            confirm.fire({
               title: 'Impresión de etiqueta',
                text: "Finalizando impresión",
                type: 'success',
                showCancelButton: false,
                confirmButtonText: 'Hecho'
            }).then((result) => {
                // $("#modalCodigos").modal('hide');
 //              linkTo();

            });

        },
        base: base
    });

}


//////////////////////////////////////////////
// impresion de etiqueta
function imprimirInfoQRpedido() {
    var base = "<?php echo base_url()?>";
    $('.modalBodyCodigos').printThis({
        debug: false,
        importCSS: false,
        importStyle: true,
        pageTitle: "TRAZALOG TOOLS",
        printContainer: true,
        removeInline: true,
        //header: "<h1 style='text-align: center;'>Reporte Articulos Vencidos</h1>",
        loadCSS: "<?php  echo base_url('lib/props/codigos-impresiones/alm-proc-yudica/yudica.css')?>",
        // copyTagClasses: true,
        afterPrint: function() {
            cierraModalImpresionPedido();

            const confirm = Swal.mixin({
                customClass: {
                    confirmButton: 'btn btn-primary'
                },
                buttonsStyling: false
            });

            confirm.fire({
               title: 'Impresión de etiqueta',
                text: "Finalizando impresión",
                type: 'success',
                showCancelButton: false,
                confirmButtonText: 'Hecho'
            }).then((result) => {
                // $("#modalCodigos").modal('hide');
              linkTo();

            });

        },
        base: base
    });

}





// cerrar modal
function cierraModalImpresion() {
    // levanto modal con img de Codigo
    $("#modalCodigos").modal('hide');
    $('.modal-backdrop').remove();
//   linkTo();

}

// cerrar modal
function cierraModalImpresionPedido() {
    // levanto modal con img de Codigo
    $("#modalCodigos").modal('hide');
    $('.modal-backdrop').remove();
   linkTo();

}



</script>
