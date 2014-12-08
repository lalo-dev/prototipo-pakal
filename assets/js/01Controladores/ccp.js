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
	var vUrl = 'assets/php/02Controladores/ccp.php';

	peticionAjax(vDatos, vUrl).done(function(vRes) {
		$('#tblClientes > tbody > tr').remove();
		$('#tblClientes > tbody').append(vRes);

		totalClientes();
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