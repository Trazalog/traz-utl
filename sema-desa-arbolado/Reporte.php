<?php defined('BASEPATH') OR exit('No direct script access allowed');

require_once APPPATH."libraries/PHPExcel.php";

class Reporte extends CI_Controller {
	function __construct(){

		parent::__construct();
		$this->load->helper('file');
		$this->load->model('Departamentos');
		$this->load->model('Areas');
		$this->load->model('Manzanas');
		$this->load->model('Calles');
		$this->load->model('Censos');
		$this->load->model('Reportes');

		if(!isset($this->session->userdata['first_name']) || $this->session->userdata['direccion'] != 'sema-desa-arbolado/web/Dash')
		{
			$this->session->set_userdata('direccionsalida','sema-desa-arbolado/web/Login');
			logout();
		}
	}
	///////////// INDEX ///////////////
	function index(){

		$data['censos'] = $this->Censos->listar()->censos->censo;
		$data['departamentos'] = $this->Departamentos->listar()->departamentos->departamento;
		$this->load->view('reporte/listar_total',$data);
	}

	function listar_gral_1(){

			$data['censos'] = $this->Censos->listar()->censos->censo;
			$data['departamentos'] = $this->Departamentos->listar()->departamentos->departamento;
			$this->load->view('reporte/listar_gral_1',$data);
	}

	function listar_gral_2(){

			$data['censos'] = $this->Censos->listar()->censos->censo;
			$data['departamentos'] = $this->Departamentos->listar()->departamentos->departamento;
			// $data['tipo_taza'] = $this->Reportes->tipo_taza()->tablas->tabla;
			// $data['listar_arbol_especie'] = $this->Reportes->listar_arbol_especie()->tablas->tabla;
			// $data['alineacion_arbol'] = $this->Reportes->alineacion_arbol()->tablas->tabla;
			// $data['estado'] = $this->Reportes->estado()->tablas->tabla;
			// $data['taza_inscrustada'] = $this->Reportes->taza_inscrustada()->tablas->tabla;
			// $data['acequia'] = $this->Reportes->acequia()->tablas->tabla;

			$this->load->view('reporte/listar_gral_2',$data);
	}

	public function buscar_por_filtros()
	{
		$censo_seleccionada = $this->input->post('censo_select');
		$fecha_desde = $this->input->post('fec_desde');
		$fecha_hasta = $this->input->post('fec_hasta');
		$newDate_inicio = date("Y-m-d", strtotime($fecha_desde));
		$newDate_fin = date("Y-m-d", strtotime($fecha_hasta));
		echo "OK";

	}

	//buscar por filtros para reporte totoal
	public function buscar_por_filtro_listar()
	{
		if($_GET)
			{
				$censo_seleccionada = $_GET["cens_id"];
				$fecha_desde = $_GET["fec_desde"];
				$fecha_hasta = $_GET["fec_hasta"];
				$departamento = $_GET["departamento"];
				$area = $_GET["area"];
				$manzana = $_GET["manzana"];
				$data['reportes'] = $this->Reportes->listar_reporte($censo_seleccionada, $fecha_desde, $fecha_hasta, $departamento, $area, $manzana);

				$this->load->view('reporte/listar_table_reporte',$data);
			}
		else	{
				$censo_seleccionada = $this->input->post('censo_select');
				$fecha_desde = $this->input->post('fec_desde');
				$fecha_hasta = $this->input->post('fec_hasta');
				$departamento = $this->input->post('departamento');
				$area = $this->input->post('area');
				$manzana = $this->input->post('manzana');
				$data['reportes'] = $this->Reportes->listar_reporte($censo_seleccionada, $fecha_desde, $fecha_hasta, $departamento, $area, $manzana);

				$this->load->view('reporte/listar_table_reporte',$data);
			}
	}

	//buscar por filtros para reporte gral 1
	public function buscar_por_filtro_listar_gral_1()
	{
		if($_GET)
			{
				$censo_seleccionada = $_GET["cens_id"];
				$fecha_desde = $_GET["fec_desde"];
				$fecha_hasta = $_GET["fec_hasta"];
				$departamento = $_GET["departamento"];
						$area = $_GET["area"];
				$manzana = $_GET["manzana"];

				$data['reportes'] = $this->Reportes->listar_reporte($censo_seleccionada, $fecha_desde, $fecha_hasta, $departamento, $area, $manzana)->arboles->arbol;

				$this->load->view('reporte/listar_table_reporte_gral_1',$data);
			}
		else	{
			$censo_seleccionada = $this->input->post('censo_select');
			$fecha_desde = $this->input->post('fec_desde');
			$fecha_hasta = $this->input->post('fec_hasta');
			$departamento = $this->input->post('departamento');
			$area = $this->input->post('area');
			$manzana = $this->input->post('manzana');

				$data['reportes'] = $this->Reportes->listar_reporte($censo_seleccionada, $fecha_desde, $fecha_hasta, $departamento, $area, $manzana)->arboles->arbol;
				$this->load->view('reporte/listar_table_reporte_gral_1',$data);
			}
	}

	//buscar por filtros para reporte gral 2
	public function buscar_por_filtro_listar_gral_2()
	{
		if($_GET)
			{
				$censo_seleccionada = $_GET["cens_id"];
				$fecha_desde = $_GET["fec_desde"];
				$fecha_hasta = $_GET["fec_hasta"];
				$departamento = $_GET["departamento"];
				$area = $_GET["area"];
				$manzana = $_GET["manzana"];

				$calle = $_GET["calle"];
				$tipo_taza = $_GET["tipo_taza"];
				$especie = $_GET["especie"];
				$aliniacion_arbol = $_GET["aliniacion_arbol"];
				$estado_sanitario = $_GET["estado_sanitario"];
				$tapa_taza_incrustada = $_GET["tapa_taza_incrustada"];
				$acequia = $_GET["acequia"];

			
				$data['reportes'] = $this->Reportes->listar_reporte_gral2($censo_seleccionada, $fecha_desde, $fecha_hasta, $departamento, $area, $manzana, $calle, $tipo_taza, $especie, $aliniacion_arbol, $estado_sanitario, $tapa_taza_incrustada, $acequia)->arboles->arbol;

				$this->load->view('reporte/listar_table_reporte_gral_2',$data);
			}
		else	{
			$censo_seleccionada = $this->input->post('censo_select');
			$fecha_desde = $this->input->post('fec_desde');
			$fecha_hasta = $this->input->post('fec_hasta');
			$departamento = $this->input->post('departamento');
			$area = $this->input->post('area');
			$manzana = $this->input->post('manzana');

			$calle = $this->input->post('calle');
			$tipo_taza = $this->input->post('tipo_taza');
			$especie = $this->input->post('especie');
			$aliniacion_arbol = $this->input->post('aliniacion_arbol');
			$estado_sanitario = $this->input->post('estado_sanitario');
			$tapa_taza_incrustada = $this->input->post('tapa_taza_incrustada');
			$acequia = $this->input->post('acequia');

			$data['reportes'] = $this->Reportes->listar_reporte($censo_seleccionada, $fecha_desde, $fecha_hasta, $departamento, $area, $manzana, $calle, $tipo_taza, $especie, $aliniacion_arbol, $estado_sanitario, $tapa_taza_incrustada, $acequia)->arboles->arbol;
				
				$this->load->view('reporte/listar_table_reporte_gral_2',$data);
			}
	}

	function AreaXdepartamento(){
		if($_GET){
				$departamento = $_GET["departamento"];

				$data['areas'] = $this->Reportes->AreaXdepartamento($departamento)->areas->area;
		}
		else	{

					$departamento = $this->input->post('departamento');


					$data['areas'] = $this->Reportes->AreaXdepartamento($departamento)->areas->area;
					echo json_encode($data);
				}
	}

	function ManzanaXarea(){
		if($_GET){
			$area = $_GET["area"];

			$data['manzanas'] = $this->Reportes->ManzanaXarea($area)->manzanas->manzana;

			}
		else	{

			$area = $this->input->post('area');


			$data['manzanas'] = $this->Reportes->ManzanaXarea($area)->manzanas->manzana;
			echo json_encode($data);
		}
	}

	function CallesXdepartamento(){
		if($_GET){
			$departamento = $_GET["departamento"];

			$data['calles'] = $this->Reportes->CallesXdepartamento($departamento)->calles->calle;
			echo json_encode($data);
			}
		else	{

			$departamento = $this->input->post('departamento');


			$data['calles'] = $this->Reportes->CallesXdepartamento($departamento)->calles->calle;
			echo json_encode($data);
		}
	}

	// retorna formulario de arbol por info_id
	function getDetalle()
	{
		$id = $this->input->post('id');
		$data['html'] = json_decode($this->Reportes->Detalles($id))->formulario;

		// transforma el json traido del DS en un html que se inserta en el modal formulario
		$data['html'] =  form($data['html']);
		echo json_encode($data);
	}
	function getImagen()
	{
		$id = $this->input->post('id');
		$data['html'] = json_decode($this->Reportes->Imagen($id))->imagenes->imagen;

		echo json_encode($data);
	}

	/**
	* exporta a Excel datos bscados por filtros
	* @param aarray con datos de filtros
	* @return palnilla excel
	*/
	function reporteTotalExcel()
	{
		if($_GET)
			{
				set_time_limit(6000);
				ini_set('memory_limit','-1');

				$censo_seleccionada = $_GET["cens_id"];
				$fecha_desde = $_GET["fec_desde"];
				$fecha_hasta = $_GET["fec_hasta"];
				$departamento = $_GET["departamento"];
				$area = $_GET["area"];
				$manzana = $_GET["manzana"];
				$reporte = $this->Reportes->listar_reporte($censo_seleccionada, $fecha_desde, $fecha_hasta, $departamento, $area, $manzana);

				if ($reporte == null) {
					echo "<h3>No se encontraron datos para mostrar...</h3>";
				} else {
					//Cargamos la librería de excel.
					        $cacheMethod = PHPExcel_CachedObjectStorageFactory::cache_to_phpTemp;
						$cacheSettings = array('memoryCacheSize'=>'512MB');
						PHPExcel_Settings::setCacheStorageMethod($cacheMethod, $cacheSettings);

						$this->load->library('excel'); $this->excel->setActiveSheetIndex(0);
						$this->excel->getActiveSheet()->setTitle('Listado Total');
						$objWriter = PHPExcel_IOFactory::createWriter($this->excel, 'CSV');
						$objWriter->setDelimiter(',');
         					$objWriter->setEnclosure('');
					//Le aplicamos ancho las columnas.
						//foreach(range('A','AN') as $columnID) {
							//$this->excel->getActiveSheet()->getColumnDimension($columnID)->setAutoSize(true);
							//$this->excel->getActiveSheet()->getStyle("A{$columnID}")->getFont()->setBold(true);
						//}
					//Contador de filas
						$contador = 1;
					//Definimos los títulos de la cabecera.
						$this->excel->getActiveSheet()->setCellValue("A{$contador}", 'Nro. Arbol');
						$this->excel->getActiveSheet()->setCellValue("B{$contador}", 'Lat/Long');
						$this->excel->getActiveSheet()->setCellValue("C{$contador}", 'Levantamiento Pavimento');
						$this->excel->getActiveSheet()->setCellValue("D{$contador}", 'Secas');
						$this->excel->getActiveSheet()->setCellValue("E{$contador}", 'Altura de medición del cap');
						$this->excel->getActiveSheet()->setCellValue("F{$contador}", 'Media');
						$this->excel->getActiveSheet()->setCellValue("G{$contador}", 'Censista');
						$this->excel->getActiveSheet()->setCellValue("H{$contador}", 'Observaciones');
						$this->excel->getActiveSheet()->setCellValue("I{$contador}", 'Altura del Fuste M');
						$this->excel->getActiveSheet()->setCellValue("J{$contador}", 'Bajas');
						$this->excel->getActiveSheet()->setCellValue("K{$contador}", 'Area Geográfica');
						$this->excel->getActiveSheet()->setCellValue("L{$contador}", 'Fructificaciones Fúngicas');
						$this->excel->getActiveSheet()->setCellValue("M{$contador}", 'Manzana');
						$this->excel->getActiveSheet()->setCellValue("N{$contador}", 'Descopado y Brotación');
						$this->excel->getActiveSheet()->setCellValue("O{$contador}", 'Cuello visible');
						$this->excel->getActiveSheet()->setCellValue("P{$contador}", 'Acequia');
						$this->excel->getActiveSheet()->setCellValue("Q{$contador}", 'Clorosis');
						$this->excel->getActiveSheet()->setCellValue("R{$contador}", 'Vereda');
						$this->excel->getActiveSheet()->setCellValue("S{$contador}", 'Fecha');
						$this->excel->getActiveSheet()->setCellValue("T{$contador}", 'Altura');
						$this->excel->getActiveSheet()->setCellValue("U{$contador}", 'Codominancia');
						$this->excel->getActiveSheet()->setCellValue("V{$contador}", 'Interfiere Cables');
						$this->excel->getActiveSheet()->setCellValue("W{$contador}", 'Circunf Altura Pecho CM Cap');
						//$this->excel->getActiveSheet()->setCellValue("X{$contador}", 'Copa M Medida 2');
						//$this->excel->getActiveSheet()->setCellValue("Y{$contador}", 'Copa M Medida 1');
						$this->excel->getActiveSheet()->setCellValue("Z{$contador}", 'Postes Cerca');
						$this->excel->getActiveSheet()->setCellValue("AA{$contador}", 'Alta');
						$this->excel->getActiveSheet()->setCellValue("AB{$contador}", 'Otro');
						$this->excel->getActiveSheet()->setCellValue("AC{$contador}", 'Especie');
						$this->excel->getActiveSheet()->setCellValue("AD{$contador}", 'Descortezamiento');
						$this->excel->getActiveSheet()->setCellValue("AF{$contador}", 'Levant. de Veredas');
						$this->excel->getActiveSheet()->setCellValue("AG{$contador}", 'Bifurcado');
						$this->excel->getActiveSheet()->setCellValue("AH{$contador}", 'Descubiertas');
						$this->excel->getActiveSheet()->setCellValue("AI{$contador}", 'Basal');
						$this->excel->getActiveSheet()->setCellValue("AJ{$contador}", 'Codominantes');
						$this->excel->getActiveSheet()->setCellValue("AK{$contador}", 'Dens. del follaje');
						$this->excel->getActiveSheet()->setCellValue("AL{$contador}", 'Barrio');
						$this->excel->getActiveSheet()->setCellValue("AM{$contador}", 'Taza');
						$this->excel->getActiveSheet()->setCellValue("AN{$contador}", 'Altura Total M');



					//Definimos la data del cuerpo
						foreach($reporte as $l){
							//Incrementamos una fila más, para ir a la siguiente.
							$contador++;
							//Informacion de las filas de la consulta.
							$this->excel->getActiveSheet()->setCellValue("A{$contador}", $l->arbo_id);
							$this->excel->getActiveSheet()->setCellValue("B{$contador}", $l->lat_long);
							$this->excel->getActiveSheet()->setCellValue("C{$contador}", $l->LEVANTAMIENTO_DE_PAVIMENTO);
							$this->excel->getActiveSheet()->setCellValue("D{$contador}", $l->SECAS);
							$this->excel->getActiveSheet()->setCellValue("E{$contador}", $l->ALTURA_MEDICION_DEL_CAP);
							$this->excel->getActiveSheet()->setCellValue("F{$contador}", $l->MEDIA);
							$this->excel->getActiveSheet()->setCellValue("G{$contador}", $l->censista);
							$this->excel->getActiveSheet()->setCellValue("H{$contador}", $l->OBSERVACIONES);
							$this->excel->getActiveSheet()->setCellValue("I{$contador}", $l->ALTURA_DEL_FUSTE__M_);
							$this->excel->getActiveSheet()->setCellValue("J{$contador}", $l->BAJAS);
							$this->excel->getActiveSheet()->setCellValue("K{$contador}", $l->area_geografica);
							$this->excel->getActiveSheet()->setCellValue("L{$contador}", $l->FRUCTIFICACIONES_FUNGICAS);
							$this->excel->getActiveSheet()->setCellValue("M{$contador}", $l->manzana);
							$this->excel->getActiveSheet()->setCellValue("N{$contador}", $l->DESCOPADO_Y_BROTACION);
							$this->excel->getActiveSheet()->setCellValue("O{$contador}", $l->CUELLO_VISIBLE);
							$this->excel->getActiveSheet()->setCellValue("P{$contador}", $l->ACEQUIA);
							$this->excel->getActiveSheet()->setCellValue("Q{$contador}", $l->CLOROSIS);
							$this->excel->getActiveSheet()->setCellValue("R{$contador}", $l->VEREDA);
							$this->excel->getActiveSheet()->setCellValue("S{$contador}", $l->fecha);
							$this->excel->getActiveSheet()->setCellValue("T{$contador}", $l->altura);
							$this->excel->getActiveSheet()->setCellValue("U{$contador}", $l->CODOMINANCIA);
							$this->excel->getActiveSheet()->setCellValue("V{$contador}", $l->INTERFIERE_CABLES);
							$this->excel->getActiveSheet()->setCellValue("W{$contador}", $l->CIRCUNFERENCIA_ALTURA_PECHO__CM__CAP);
							$this->excel->getActiveSheet()->setCellValue("X{$contador}", $l->{'$COPA__M__-_MEDIDA_2'});
							$this->excel->getActiveSheet()->setCellValue("Y{$contador}", $l->{'$COPA__M__-_MEDIDA_1'});
							$this->excel->getActiveSheet()->setCellValue("Z{$contador}", $l->POSTES_CERCA);
							$this->excel->getActiveSheet()->setCellValue("AA{$contador}", $l->ALTA);
							$this->excel->getActiveSheet()->setCellValue("AB{$contador}", $l->OTRO);
							$this->excel->getActiveSheet()->setCellValue("AC{$contador}", $l->especie);
							$this->excel->getActiveSheet()->setCellValue("AD{$contador}", $l->DESCORTEZAMIENTO);
							$this->excel->getActiveSheet()->setCellValue("AF{$contador}", $l->LEVANTAMIENTO_DE_VEREDAS);
							$this->excel->getActiveSheet()->setCellValue("AG{$contador}", $l->BIFURCADO);
							$this->excel->getActiveSheet()->setCellValue("AH{$contador}", $l->DESCUBIERTAS);
							$this->excel->getActiveSheet()->setCellValue("AI{$contador}", $l->BASAL);
							$this->excel->getActiveSheet()->setCellValue("AJ{$contador}", $l->CODOMINANTES);
							$this->excel->getActiveSheet()->setCellValue("AK{$contador}", $l->DENSIDAD_DEL_FOLLAJE);
							$this->excel->getActiveSheet()->setCellValue("AL{$contador}", $l->barrio);
							$this->excel->getActiveSheet()->setCellValue("AM{$contador}", $l->taza);
							$this->excel->getActiveSheet()->setCellValue("AN{$contador}", $l->ALTURA_TOTAL__M_);
						}

					//Le ponemos un nombre al archivo que se va a generar.
						$fecha = date('d-m-Y');
						$archivo = "reporte_total_{$fecha}.csv";
						header('Content-Type: application/vnd.ms-excel');
						header('Content-Disposition: attachment;filename="'.$archivo.'"');
						header('Cache-Control: max-age=0');
					//Hacemos una salida al navegador con el archivo Excel.
						$objWriter->save('php://output');
						$this->excel->disconnectWorksheets();
						$this->excel->garbageCollect();
						unset($this->excel);
				}
			}
	}

	/**
	* exporta a xcel datos buscado por fitros
	* @param array con datos de filtros
	* @return planilla excel
	*/
	function reporteGral1Excel()
	{
		if($_GET)
		{
				set_time_limit(6000);
                                ini_set('memory_limit','-1');

				$censo_seleccionada = $_GET["cens_id"];
				$fecha_desde = $_GET["fec_desde"];
				$fecha_hasta = $_GET["fec_hasta"];
				$departamento = $_GET["departamento"];
				$area = $_GET["area"];
				$manzana = $_GET["manzana"];

				$reporte = $this->Reportes->listar_reporte($censo_seleccionada, $fecha_desde, $fecha_hasta, $departamento, $area, $manzana);

				if ($reporte == null) {
					echo "<h3>No se encontraron datos para mostrar...</h3>";
				} else {
					//Cargamos la librería de excel.
						$cacheMethod = PHPExcel_CachedObjectStorageFactory::cache_to_phpTemp;
                                                $cacheSettings = array('memoryCacheSize'=>'512MB');
                                                PHPExcel_Settings::setCacheStorageMethod($cacheMethod, $cacheSettings);

						$this->load->library('excel'); $this->excel->setActiveSheetIndex(0);
						$this->excel->getActiveSheet()->setTitle('Listado Gral 1');
						$objWriter = PHPExcel_IOFactory::createWriter($this->excel, 'CSV');
						$objWriter->setDelimiter(',');
                                                $objWriter->setEnclosure('');

					//Le aplicamos ancho las columnas.
						//foreach(range('A','J') as $columnID) {
							//$this->excel->getActiveSheet()->getColumnDimension($columnID)->setAutoSize(true);
							//$this->excel->getActiveSheet()->getStyle("A{$columnID}")->getFont()->setBold(true);
						//}
					//Contador de filas
						$contador = 1;

					//Definimos los títulos de la cabecera.
						$this->excel->getActiveSheet()->setCellValue("A{$contador}", 'Número');
						$this->excel->getActiveSheet()->setCellValue("B{$contador}", 'Departamento');
						$this->excel->getActiveSheet()->setCellValue("C{$contador}", 'Area Geográfica');
						$this->excel->getActiveSheet()->setCellValue("D{$contador}", 'Manzana');
						$this->excel->getActiveSheet()->setCellValue("E{$contador}", 'Long/Lat');
						$this->excel->getActiveSheet()->setCellValue("F{$contador}", 'Calle');
						$this->excel->getActiveSheet()->setCellValue("G{$contador}", 'Nro.');
						$this->excel->getActiveSheet()->setCellValue("H{$contador}", 'Barrio');
						$this->excel->getActiveSheet()->setCellValue("I{$contador}", 'Tipo Taza');
						$this->excel->getActiveSheet()->setCellValue("J{$contador}", 'Especie');

					//Definimos la data del cuerpo.
					foreach($reporte as $l){
						//Incrementamos una fila más, para ir a la siguiente.
							$contador++;
						//Informacion de las filas de la consulta.
							$this->excel->getActiveSheet()->setCellValue("A{$contador}", $l->arbo_id);
							$this->excel->getActiveSheet()->setCellValue("B{$contador}", $l->departamento);
							$this->excel->getActiveSheet()->setCellValue("C{$contador}", $l->area_geografica);
							$this->excel->getActiveSheet()->setCellValue("D{$contador}", $l->manzana);
							$this->excel->getActiveSheet()->setCellValue("E{$contador}", $l->lat_long_gps);
							$this->excel->getActiveSheet()->setCellValue("F{$contador}", $l->calle);
							$this->excel->getActiveSheet()->setCellValue("G{$contador}", $l->altura);
							$this->excel->getActiveSheet()->setCellValue("H{$contador}", $l->barrio);
							$this->excel->getActiveSheet()->setCellValue("I{$contador}", $l->taza);
							$this->excel->getActiveSheet()->setCellValue("J{$contador}", $l->especie);
					}

					//Le ponemos un nombre al archivo que se va a generar.
						$fecha = date('d-m-Y');
						$archivo = "reporte_gral_1_{$fecha}.csv";
						header('Content-Type: application/vnd.ms-excel');
						header('Content-Disposition: attachment;filename="'.$archivo.'"');
						header('Cache-Control: max-age=0');
					//Hacemos una salida al navegador con el archivo Excel.
						$objWriter->save('php://output');
						$this->excel->disconnectWorksheets();
                                                $this->excel->garbageCollect();
                                                unset($this->excel);

				}

		}
	}

	/**
	* exporta a excel datos buscados por filtros
	* @param array con datos de filtros
	* @return planilla excel
	*/
	function reporteGral2Excel()
	{
		if($_GET)
		{
			set_time_limit(6000);
                        ini_set('memory_limit','-1');

			$censo_seleccionada = $_GET["cens_id"];
			$fecha_desde = $_GET["fec_desde"];
			$fecha_hasta = $_GET["fec_hasta"];
			$departamento = $_GET["departamento"];
			$area = $_GET["area"];
			$manzana = $_GET["manzana"];
			$calle = $_GET["calle"];
			$tipo_taza = $_GET["tipo_taza"];
			$especie = $_GET["especie"];
			$aliniacion_arbol = $_GET["aliniacion_arbol"];
			$estado_sanitario = $_GET["estado_sanitario"];
			$tapa_taza_incrustada = $_GET["tapa_taza_incrustada"];
			$acequia = $_GET["acequia"];

			$reporte = $this->Reportes->listar_reporte_gral2($censo_seleccionada, $fecha_desde, $fecha_hasta, $departamento, $area, $manzana, $calle, $tipo_taza, $especie, $aliniacion_arbol, $estado_sanitario, $tapa_taza_incrustada, $acequia)->arboles->arbol;

			if ($reporte == null) {
				echo "<h3>No se encontraron datos para mostrar...</h3>";
			} else {
				//Cargamos la librería de excel.


  					$cacheMethod = PHPExcel_CachedObjectStorageFactory::cache_to_phpTemp;
                                        $cacheSettings = array('memoryCacheSize'=>'512MB');
                                        PHPExcel_Settings::setCacheStorageMethod($cacheMethod, $cacheSettings);


					$this->load->library('excel'); $this->excel->setActiveSheetIndex(0);
					$this->excel->getActiveSheet()->setTitle('Listado Gral 2');
					$objWriter = PHPExcel_IOFactory::createWriter($this->excel, 'CSV');
					$objWriter->setDelimiter(',');
                                        $objWriter->setEnclosure('');
				//Le aplicamos ancho las columnas.
					//foreach(range('A','N') as $columnID) {
						//$this->excel->getActiveSheet()->getColumnDimension($columnID)->setAutoSize(true);
						//$this->excel->getActiveSheet()->getStyle("A{$columnID}")->getFont()->setBold(true);
					//}
				//Contador de filas
					$contador = 1;
				//Definimos los títulos de la cabecera.
					$this->excel->getActiveSheet()->setCellValue("A{$contador}", 'Número');
					$this->excel->getActiveSheet()->setCellValue("B{$contador}", 'Departamento');
					$this->excel->getActiveSheet()->setCellValue("C{$contador}", 'Area Geográfica');
					$this->excel->getActiveSheet()->setCellValue("D{$contador}", 'Manzana');
					$this->excel->getActiveSheet()->setCellValue("E{$contador}", 'Long/Lat');
					$this->excel->getActiveSheet()->setCellValue("F{$contador}", 'Calle');
					$this->excel->getActiveSheet()->setCellValue("G{$contador}", 'Nro.');
					$this->excel->getActiveSheet()->setCellValue("H{$contador}", 'Barrio');
					$this->excel->getActiveSheet()->setCellValue("I{$contador}", 'Tipo Taza');
					$this->excel->getActiveSheet()->setCellValue("J{$contador}", 'Especie');
					$this->excel->getActiveSheet()->setCellValue("K{$contador}", 'Alineacion del arbol');
					$this->excel->getActiveSheet()->setCellValue("L{$contador}", 'Estado Sanitario General');
					$this->excel->getActiveSheet()->setCellValue("M{$contador}", 'Tapa de Taza Incrust.');
					$this->excel->getActiveSheet()->setCellValue("N{$contador}", 'Acequia');
				//Definimos la data del cuerpo.
					foreach($reporte as $l){
							//Incrementamos una fila más, para ir a la siguiente.
							$contador++;
							//Informacion de las filas de la consulta.
							$this->excel->getActiveSheet()->setCellValue("A{$contador}", $l->arbo_id);
							$this->excel->getActiveSheet()->setCellValue("B{$contador}", $l->departamento);
							$this->excel->getActiveSheet()->setCellValue("C{$contador}", $l->area_geografica);
							$this->excel->getActiveSheet()->setCellValue("D{$contador}", $l->manzana);
							$this->excel->getActiveSheet()->setCellValue("E{$contador}", $l->lat_long_gps);
							$this->excel->getActiveSheet()->setCellValue("F{$contador}", $l->calle);
							$this->excel->getActiveSheet()->setCellValue("G{$contador}", $l->altura);
							$this->excel->getActiveSheet()->setCellValue("H{$contador}", $l->barrio);
							$this->excel->getActiveSheet()->setCellValue("I{$contador}", $l->taza);
							$this->excel->getActiveSheet()->setCellValue("J{$contador}", $l->especie);
							$this->excel->getActiveSheet()->setCellValue("K{$contador}", $l->ALINEACION_DEL_ARBOL);
							$this->excel->getActiveSheet()->setCellValue("L{$contador}", $l->ESTADO_SANITARIO_GENERAL);
							$this->excel->getActiveSheet()->setCellValue("M{$contador}", $l->TAPA_DE_TAZA_INSCRUSTADA);
							$this->excel->getActiveSheet()->setCellValue("N{$contador}", $l->ACEQUIA);
					}
				//Le ponemos un nombre al archivo que se va a generar.
					$fecha = date('d-m-Y');
					$archivo = "reporte_gral_2_{$fecha}.csv";
					header('Content-Type: application/vnd.ms-excel');
					header('Content-Disposition: attachment;filename="'.$archivo.'"');
					header('Cache-Control: max-age=0');
				//Hacemos una salida al navegador con el archivo Excel.
					$objWriter->save('php://output');
					$this->excel->disconnectWorksheets();
                                        $this->excel->garbageCollect();
                                        unset($this->excel);

			}
		}
	}
		
}
?>
