$(document).ready(function() {
	//Sección clientes
	listaClientes();

	//Sección contratos
	
	//Sección proyectos
});

//Sección clientes 				###################################################################################
function totalClientes() {
	var vDatos = 'acc=totalClientes';
	var vUrl = 'assets/php/02Controladores/ccp.php';

	peticionAjax(vDatos, vUrl).done(function(vRes) {
		$('#aTotalClientes').text('').text(vRes);
	});
}

function listaClientes() {
	var vDatos = 'acc=listaClientes';
	var vUrl   = 'assets/php/02Controladores/ccp.php';

	peticionAjax(vDatos, vUrl).done(function(vRes) {
		$('#tblClientes > tbody > tr').remove();
		$('#tblClientes > tbody').append(vRes);

		totalClientes();
	});
}

function guardaCliente() {
	//alert('guardar cliente');
	var nombre = '&nombre=' + $('#txtNombreCliente').val();
	var rfc    = '&rfc=' + $('#txtRfcCliente').val();
	var rs     = '&rs=' + $('#txtRsCliente').val();
	var giro   = '&giro=' + $('#txtGiroCliente').val();
	var url    = '&url=' + $('#txtUrlCliente').val();
	var nota   = '&nota=' + $('#txtNotaCliente').val();
	var vDatos = 'acc=guardaCliente'+nombre+rfc+rs+giro+url+nota;
	var vUrl   = 'assets/php/02Controladores/ccp.php';
	//alert(vDatos);

	peticionAjax(vDatos, vUrl).done(function(vRes) {
		if(vRes[0] == 0){
			peticionAjax('acc=ultimoCliente', 'assets/php/02Controladores/ccp.php').done(function(cliente) {
				guardarAreasCliente(cliente);
				alert("Se ha guardado correctamente el cliente.");
			});
		} else {
			alert("No se guardo el cliente.");
		}
	});
}

function guardarAreasCliente(cliente) {
	$('.areaCliente').each(function(index) {
		alert('entro al each');
		var area       = '&area=' + $(this).find("td").eq(0).html();
		var comentario = '&comentario=' + $(this).find("td").eq(1).html()
		var vDatos     = 'acc=guardaAreaCliente&cliente='+cliente+area+comentario;
		var vUrl       = 'assets/php/02Controladores/ccp.php';
		alert(vDatos);

		peticionAjax(vDatos, vUrl).done(function(vArea) {
			if(vArea[0] == 1){
				alert("No se pudo guardar las áreas del cliente.");
			}	
		});
	});
}

//Sección contratos            ###################################################################################
function totalContratos(cliente) {
	var vDatos = 'acc=totalContratos';
	var vUrl = 'assets/php/02Controladores/ccp.php?cliente='+cliente;

	peticionAjax(vDatos, vUrl).done(function(vRes) {
		$('#aTotalContratos').text('').text(vRes);
	});
}

function listaContratos(cliente) {
	var vDatos = 'acc=listaContratos';
	var vUrl = 'assets/php/02Controladores/ccp.php?cliente='+cliente;

	peticionAjax(vDatos, vUrl).done(function(vRes) {
		$('#tblContratos > tbody > tr').remove();
		$('#tblContratos > tbody').append(vRes);

		totalContratos(cliente);
	});
}

//Sección proyectos           ###################################################################################
function totalProyectos(contrato) {
	var vDatos = 'acc=totalProyectos';
	var vUrl = 'assets/php/02Controladores/ccp.php?contrato='+contrato;

	peticionAjax(vDatos, vUrl).done(function(vRes) {
		$('#aTotalProyectos').text('').text(vRes);
	});
}

function listaProyectos(contrato) {
	var vDatos = 'acc=listaProyectos';
	var vUrl = 'assets/php/02Controladores/ccp.php?contrato='+contrato;

	peticionAjax(vDatos, vUrl).done(function(vRes) {
		$('#tblProyectos > tbody > tr').remove();
		$('#tblProyectos > tbody').append(vRes);

		totalProyectos(contrato);
	});
}