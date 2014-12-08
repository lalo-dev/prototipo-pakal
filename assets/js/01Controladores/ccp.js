$(document).ready(function() {
	//Sección clientes
	listaClientes();

	//Sección contratos
	
	//Sección proyectos
});

//Sección clientes
function totalClientes() {
	var vDatos = 'acc=totalClientes';
	var vUrl = 'assets/php/02Controladores/ccp.php';

	peticionAjax(vDatos, vUrl).done(function(vRes) {
		$('#totalClientes').text(vRes);
	});
}

function listaClientes() {
	var vDatos = 'acc=listaClientes';
	var vUrl = 'assets/php/02Controladores/ccp.php';

	peticionAjax(vDatos, vUrl).done(function(vRes) {
		$('#tblClientes >tbody').append(vRes);
	});
}

//Sección contratos
function listaContratos() {
	$.when(
		$.ajax({
			data: "acc=listaContratos",
			type: "POST",
			url: "assets/php/02Controladores/clientes.php"
		})
	).done(function(clientes) {

	});
}

//Sección proyectos
function listaProyectos() {
	$.when(
		$.ajax({
			data: "acc=listaProyectos",
			type: "POST",
			url: "assets/php/02Controladores/clientes.php"
		})
	).done(function(clientes) {

	});
}