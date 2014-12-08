<?php
	include_once("../01Clases/01Util/ConexionBD.php");

	$vConn = new ConexionBD();
	
	if(isset($_REQUEST['acc'])){
		
		$vAcc = $_REQUEST['acc'];
		
		switch($vAcc)
		{
			case "buscarClientes":
					guardaGraficas();
				break;
		}
				
	}


	function sistemaUnidades(){
		global $vConn;

		$vQuery = " SELECT * FROM Selection ORDER BY SelectionDate DESC LIMIT 0,1; ";
		$vRes =  $vConn->ExecuteWithReturn($vQuery);

		/*Formando JSON Respuesta segun Selection*/
		$vSeleccion = json_encode(array(
						"System"    => $vRes[0]["Unit"],
						"BladeType" => $vRes[0]["BladeType"]
					));

		echo $vSeleccion;
	}
?>