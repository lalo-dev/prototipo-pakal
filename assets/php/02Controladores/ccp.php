<?php
	include_once("../01Clases/01Util/ConexionBD.php");

	$vConn = new ConexionBD();
	
	if(isset($_REQUEST['acc'])){
		
		$vAcc = $_REQUEST['acc'];
		
		switch($vAcc)
		{
			case "listaClientes":
					listaClientes();
				break;
		}
				
	}

	function listaClientes() {
		global $vConn;

		$vQuery = "SELECT nombre FROM clientes ORDER BY nombre DESC";
		$vRes = $vConn->ExecuteWithReturn($vQuery);

		$html = '';

		foreach ($vRes as $cliente) {
			$html .= 	"<tr>
							<td>
								<div class=\"btn-toolbar\">
									<div class=\"btn-group\">
										<button class=\"btn btn-primary dropdown-toggle btn-sm btn-alt\" data-toggle=\"dropdown\">
											<span class=\"caret\"></span>
										</button>
										<ul class=\"dropdown-menu dropdown-custom\">
											<li>
												<a href=\"javascript: app.mostrar('subsection','detail_customer','yes')\">
													<i class=\"fa fa-eye pull-right\"></i>Detalle
												</a>
												<a href=\"javascript: app.mostrar('subsection','form_customer','yes')\">
													<i class=\"fa fa-pencil pull-right\"></i>Editar
												</a>
											</li>
										</ul>
									</div>
								</div>
							</td>
							<td>
								<span><a href=\"javascript:void(0)\" onclick=\"$('#tblContratos,#totalContratos,#agregarContrato').show();\">".$cliente['nombre']."</a></span>
							</td>
							<td>
								<label class=\"switch switch-primary\">
									<input type=\"checkbox\" checked=\"\" /><span></span>
								</label>
							</td>
						</tr>";
		}

		echo $html;
	}
?>