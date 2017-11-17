<?php
    require_once './model/Consulta.php';
    require_once './model/Paciente.php';
    require_once './model/User.php';

    class ConsultasController {
        private static $instance;
        
        public static function getInstance() {
            if (!isset(self::$instance)) {
                self::$instance = new self();
            }
    
            return self::$instance;
        }

        private function __construct() {
        }
        
        public function index(){
            AppController::allowed('consulta_show');
            $idPaciente = $_GET['idPaciente'];
            
            $context = [];

            $context['stylesheets'] = ['/public/css/users.css'];
            $context['javascripts'] = ['/public/js/users.js', '/public/js/consultas.js', '/public/js/validacion.js'];
            $context['pagename'] = 'Consultas - Index';
            $context['titulo'] = 'consultas';            
            $context['paciente'] = Paciente::getPaciente($idPaciente);
            
            if ($allConsulta = consulta::all($_GET['idPaciente'])) {
               
                $context['noResults'] = false;
                $context['allConsulta'] = $allConsulta;
                $context['consultasCant'] = count($allConsulta);
                /* permisos para acciones sobre consultas */
                $context['consulta_update'] = AppController::getInstance()->checkPermissions('consulta_update');
                $context['consulta_show'] = AppController::getInstance()->checkPermissions('consulta_show');
                $context['consulta_destroy'] = AppController::getInstance()->checkPermissions('consulta_destroy');
                $context['consulta_new'] = AppController::getInstance()->checkPermissions('consulta_new');
               
            }
            else {
                $context['stylesheets'][] = '/public/css/config-mantenimiento.css';
                $context['noResults'] = true;
            }

            $path = '/consultas/index.html.twig';
            TwigController::renderTwig($path, $context);
            die;

        }

        public function newConsulta(){
            AppController::allowed('consulta_new');
            $idPaciente = $_GET['idPaciente'];

            $context = [];
            
            $context['stylesheets'] = ['/public/css/pacientes.css'];
            $context['javascripts'] = ['/public/js/consultas.js','/public/js/validacion.js'];
            $context['pagename'] = 'Consultas - New';
            $context['titulo'] = 'Nueva consulta';
            $context['paciente'] = Paciente::getPaciente($idPaciente);
            
            $path = '/consultas/new.html.twig';
            
            TwigController::renderTwig($path, $context);
            die;
        }

        public function auxNewconsulta() { /*

            if ((!isset($_POST['apellido']) || ($apellido = trim($_POST['apellido'])) == "")
            || (!isset($_POST['nombre']) || ($nombre = trim($_POST['nombre'])) == "")
            || (!isset($_POST['fecha_nacimiento']) || ($fecha_nacimiento = trim($_POST['fecha_nacimiento'])) == "")
            || (!isset($_POST['idGenero']) || ($idGenero = trim($_POST['idGenero'])) == "")
            || (!isset($_POST['idTipoDoc']) || ($idTipoDoc = trim($_POST['idTipoDoc'])) == "")
            || (!isset($_POST['dni']) || ($dni = trim($_POST['dni'])) == "")
            || (!isset($_POST['domicilio']) || ($domicilio = trim($_POST['domicilio'])) == "")
            || (!isset($_POST['heladera']) || ($heladera = trim($_POST['heladera'])) == "")
            || (!isset($_POST['electricidad']) || ($electricidad = trim($_POST['electricidad'])) == "")
            || (!isset($_POST['mascota']) || ($mascota =trim($_POST['mascota'])) == "")
            || (!isset($_POST['idTipoVivienda']) || ($idTipoVivienda =trim($_POST['idTipoVivienda'])) == "")
            || (!isset($_POST['idTipoCalefaccion']) || ($idTipoCalefaccion =trim($_POST['idTipoCalefaccion'])) == "")
            || (!isset($_POST['idTipoAgua'])) || ($idTipoAgua = trim($_POST['idTipoAgua'])) == "")
            {
                AppController::req_fields();
                
            }
          
            if(!isset($_POST['idObraSocial'])){
                $idObraSocial = NULL;
            }
            else{
                $idObraSocial = trim($_POST['idObraSocial']);
            }

            if(!isset($_POST['telefono'])){
                $telefono = NULL;
            }
            else{
                $telefono = trim($_POST['telefono']);
            }

            consulta::newconsulta($apellido, $nombre, $fecha_nacimiento, $idGenero, $idTipoDoc, $dni, $telefono, $idObraSocial, $domicilio, $heladera, $electricidad, $mascota, $idTipoVivienda, $idTipoCalefaccion, $idTipoAgua);
            $this->index(); */
        }
    
        public function deleteConsulta() {
            $idconsulta = $_GET['idConsulta'];
    
            consulta::deleteConsulta($idConsulta);
            $this->index();
        }

        public function deleteHistoria() {
            $idPaciente = $_GET['idPaciente'];
    
            consulta::deleteHistoria($idPaciente);
            $this->index();
        }

        public function showConsulta(){
        
            AppController::allowed('consulta_show');
            $consulta = Consulta::getConsulta($_GET['idConsulta']); 
            $paciente = Paciente::getPaciente( $consulta->idPaciente );
            $usuario = User::id( $consulta->usuario );

            $context = [];
            
            $context['stylesheets'] = ['/public/css/pacientes.css'];
            $context['javascripts'] = ['/public/js/consultas.js'];
            $context['pagename'] = 'Consultas - Show';
            $context['consulta'] = $consulta;
            $context['titulo'] = 'Consulta';
            $context['paciente'] = $paciente;
            $context['usuario'] = $usuario;
            
            $path = '/consultas/show.html.twig';
            
            TwigController::renderTwig($path, $context);
            die;
        }

        public function updateConsulta(){
        
            AppController::allowed('consulta_update');

            $context = [];
            
            $context['stylesheets'] = ['/public/css/pacientes.css'];
            $context['javascripts'] = ['/public/js/consultas.js', '/public/js/validacion.js'];
            $context['pagename'] = 'Consultas - Update';
            $context['titulo'] = 'Actualizar consulta';
            $context['consulta'] =  consulta::getConsulta($_GET['idConsulta']);

            $path = '/consultas/update.html.twig';
            
            TwigController::renderTwig($path, $context);
            die;
        }

        public function auxUpdateconsulta() { /*
            if ((!isset($_POST['apellido']) || ($apellido = trim($_POST['apellido'])) == "")
            || (!isset($_POST['nombre']) || ($nombre = trim($_POST['nombre'])) == "")
            || (!isset($_POST['fecha_nacimiento']) || ($fecha_nacimiento = trim($_POST['fecha_nacimiento'])) == "")
            || (!isset($_POST['idGenero']) || ($idGenero = trim($_POST['idGenero'])) == "")
            || (!isset($_POST['idTipoDoc']) || ($idTipoDoc = trim($_POST['idTipoDoc'])) == "")
            || (!isset($_POST['dni']) || ($dni = trim($_POST['dni'])) == "")
            || (!isset($_POST['domicilio']) || ($domicilio = trim($_POST['domicilio'])) == "")
            || (!isset($_POST['heladera']) || ($heladera = trim($_POST['heladera'])) == "")
            || (!isset($_POST['electricidad']) || ($electricidad = trim($_POST['electricidad'])) == "")
            || (!isset($_POST['mascota']) || ($mascota =trim($_POST['mascota'])) == "")
            || (!isset($_POST['idTipoVivienda']) || ($idTipoVivienda =trim($_POST['idTipoVivienda'])) == "")
            || (!isset($_POST['idTipoCalefaccion']) || ($idTipoCalefaccion =trim($_POST['idTipoCalefaccion'])) == "")
            || (!isset($_POST['idTipoAgua'])) || ($idTipoAgua = trim($_POST['idTipoAgua'])) == "")
            {
                AppController::req_fields();
                
            }

            $idconsulta = $_POST['idconsulta'];
            $telefono = trim($_POST['telefono']);
            if(!isset($_POST['idObraSocial'])){
                $idObraSocial = 3;
            }
            else{
                $idObraSocial = trim($_POST['idObraSocial']);
            }

            consulta::updateconsulta($idconsulta, $apellido, $nombre, $fecha_nacimiento, $idGenero, $idTipoDoc, $dni, $telefono, $idObraSocial, $domicilio, $heladera, $electricidad, $mascota, $idTipoVivienda, $idTipoCalefaccion, $idTipoAgua);
            $this->index(); */
        } 
    }
?>