$(document).ready(function() {
	
});

//Sección clientes
function listaClientes() {
	$.when(
		$.ajax({
			data: "acc=listaClientes",
			type: "POST",
			url: "php/02Controladores/clientes.php"
		})
	).done(function(clientes) {

	});
}

//Sección contratos
function listaContratos() {
	$.when(
		$.ajax({
			data: "acc=listaContratos",
			type: "POST",
			url: "php/02Controladores/clientes.php"
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
			url: "php/02Controladores/clientes.php"
		})
	).done(function(clientes) {

	});
}