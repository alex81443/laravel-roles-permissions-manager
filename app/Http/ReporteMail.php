<?php

use Illuminate\Support\Facades\Auth;
use JasperPHP\JasperPHP as JasperPHP;
use Illuminate\Http\Request;
use App\Modelos\Reportes\Filtro;
use App\Modelos\Reportes\Reporte;
use App\Modelos\Reportes\SubReporte;
use App\Modelos\Reportes\TipFilt;
use App\Modelos\Modulo;
use Illuminate\Support\Facades\Crypt;
use Illuminate\Database\Eloquent\Collection;
use App\Http\Controllers\Controller;
use App\Mail\PruebaMail;
use App\Mail\SendMail;
use App\Modelos\Catalogos\Generales\Sucursal;
use App\Modelos\Catalogos\Sistema\Usuario;
use App\reportesEnviados;
use Illuminate\Support\Facades\Mail;
   
    function jaspermail($id_rpt, $params = null,$email,$cc=null, $cco=null)
    {
        $reporte=Reporte::find($id_rpt);
        
        $numero=rand(1,99);
        $fecha= date("Y-m-d"); 
        $jasper = new JasperPHP;
        
        $archivo = str_replace('.jrxml', '', $reporte->archivo);//extension
        $jrxml = base_path('jrxml/'.$archivo.'.jrxml');
        $compile = base_path('jrxml/'.$archivo.'.jasper');
        $output = public_path('files/reportesmail/'.$archivo.'_'.$fecha.'_'.$numero);
        $pdf = 'files/reportesmail/'.$archivo.'_'.$fecha.'_'.$numero.'.pdf';//nombre del pdf-->   id de usuario que manda reporte y fecha en que se genera
        $env = (object) config('database.connections.mysql');
        $selectmultiple = Filtro::SelectMultiple($reporte->id_rpt);

        if (file_exists(public_path($pdf))) {
        	unlink(public_path($pdf));
        }

        // dd($jrxml, $compile, $output);

        if ($params == null) {
            $params = array();
        }

        if ($selectmultiple->count() > 0) {
        	$xml = file_get_contents($jrxml);
        	$jrxml = base_path('jrxml/selectmultiple/'.$archivo.'.jrxml');
        	$compile = base_path('jrxml/selectmultiple/'.$archivo.'.jasper');
			#Checando si algun parametro es arreglo y convertirlo a lista en cadena
	        foreach ($params as $param => $value) {
	        	if ($selectmultiple->contains($param)) {
	        		$xml = str_replace('$P!{'.$param.'}', arrayToString($value), $xml);
	        		unset($params[$param]);
	        	}
	        }
        	file_put_contents($jrxml, $xml);
        }


        // Compile a JRXML to Jasper
        $jasper->compile($jrxml)->execute();

        // Depuración de errores
        /*exec($jasper->output().' 2>&1', $output);
        dd($output);*/
        
        // Para que funcione hay que borrar "->execute()" de la linea anterior

        // Process a Jasper file to PDF and RTF (you can use directly the .jrxml)

        if ($reporte->hace_consulta == 1) {
            $jasper->process(
                $compile,
                $output, #output
                array("pdf"),
                $params,
                array(
                  'driver' => $env->driver,
                  'username' => $env->username,
                  'password' => $env->password,
                  /*'username' => "kl79qypn0yh4",
                  'password' => "Th3_4v3ng3r$",*/
                  'host' => $env->host,
                  'database' => $env->database,
                  'port' => $env->port,
                )
            )->execute();
            
            
           //Aqui agregaria la funcion de enviar el correo  con el attach
        }
        else{
            $jasper->process(
                $compile,
                $output, #output
                array("pdf"),
                $params
            )->execute();
            //Aqui agregaria la funcion de enviar el correo con el attach
        }

        // Depuración de errores
        /*exec($jasper->output().' 2>&1', $output);
        dd($output, $params);*/

        // List the parameters from a Jasper file.
        $jasper->list_parameters(
            $compile
        )->execute();

        // Depuración de errores
        /*exec($jasper->output().' 2>&1', $output);
        dd($output, $params);*/

        /**
          Si el reporte es de
          Apertura o Cierre de sucursal
          Añadir la sucursal 
         */

        if ($archivo == 'suc_ape_ini' || $archivo == 'suc_ape_fin') {
            $header = $reporte->descripcion.': '.$params['Sucursal'];
            $asunto = $header;
            $data = array(
                'header'    =>  $header,
                'message'   =>  'Envio de: '.$header,
                );
        }
        else{
            $asunto = $reporte->descripcion;
            $data = array(
                'header'    =>  $reporte->descripcion,
                'message'   =>  'Envio de: '.$reporte->descripcion,
                );            
        }
        
        EnviarMail($email, $pdf, $asunto, $data, $cc, $cco);
        // Mail::to($email)->queue(new PruebaMail($pdf,$asunto,$data,$cc));

        if (is_array($cc)) {
            $cc = implode(', ', $cc);
        }
        reportesEnviados::create([
            'nombre'=>$archivo, 
            'ruta'=>$pdf, 
            'email'=>$email, 
            'cc'=>$cc, 
            'asunto'=>$asunto, 
            'id_estatus'=>1, 
            'id_rpt'=>$id_rpt

        ]);

        
        return $pdf;
    }
    function jasmaildata($id_rpt, $params = null,$email,$cc=null,$asunto,$data)
    {
        $reporte=Reporte::find($id_rpt);
        
        $numero=rand(1,99);
        $fecha= date("Y-m-d"); 
        $jasper = new JasperPHP;
        
        $archivo = str_replace('.jrxml', '', $reporte->archivo);//extension
        $jrxml = base_path('jrxml/'.$archivo.'.jrxml');
        $compile = base_path('jrxml/'.$archivo.'.jasper');
        $output = public_path('files/reportesmail/'.$archivo.'_'.$fecha.'_'.$numero);
        $pdf = 'files/reportesmail/'.$archivo.'_'.$fecha.'_'.$numero.'.pdf';//nombre del pdf-->   id de usuario que manda reporte y fecha en que se genera
        $env = (object) config('database.connections.mysql');
        $selectmultiple = Filtro::SelectMultiple($reporte->id_rpt);

        if (file_exists(public_path($pdf))) {
        	unlink(public_path($pdf));
        }

        // dd($jrxml, $compile, $output);

        if ($params == null) {
            $params = array();
        }

        if ($selectmultiple->count() > 0) {
        	$xml = file_get_contents($jrxml);
        	$jrxml = base_path('jrxml/selectmultiple/'.$archivo.'.jrxml');
        	$compile = base_path('jrxml/selectmultiple/'.$archivo.'.jasper');
			#Checando si algun parametro es arreglo y convertirlo a lista en cadena
	        foreach ($params as $param => $value) {
	        	if ($selectmultiple->contains($param)) {
	        		$xml = str_replace('$P!{'.$param.'}', arrayToString($value), $xml);
	        		unset($params[$param]);
	        	}
	        }
        	file_put_contents($jrxml, $xml);
        }


        // Compile a JRXML to Jasper
        $jasper->compile($jrxml)->execute();

        // Depuración de errores
        /*exec($jasper->output().' 2>&1', $output);
        dd($output);*/
        
        // Para que funcione hay que borrar "->execute()" de la linea anterior

        // Process a Jasper file to PDF and RTF (you can use directly the .jrxml)

        if ($reporte->hace_consulta == 1) {
            $jasper->process(
                $compile,
                $output, #output
                array("pdf"),
                $params,
                array(
                  'driver' => $env->driver,
                  'username' => $env->username,
                  'password' => $env->password,
                  /*'username' => "kl79qypn0yh4",
                  'password' => "Th3_4v3ng3r$",*/
                  'host' => $env->host,
                  'database' => $env->database,
                  'port' => $env->port,
                )
            )->execute();
            
            
           //Aqui agregaria la funcion de enviar el correo  con el attach
        }
        else{
            $jasper->process(
                $compile,
                $output, #output
                array("pdf"),
                $params
            )->execute();
            //Aqui agregaria la funcion de enviar el correo con el attach
        }

        // Depuración de errores
        /*exec($jasper->output().' 2>&1', $output);
        dd($output, $params);*/

        // List the parameters from a Jasper file.
        $jasper->list_parameters(
            $compile
        )->execute();

        // Depuración de errores
        /*exec($jasper->output().' 2>&1', $output);
        dd($output, $params);*/
        
     
        Mail::to($email)->queue(new PruebaMail($pdf,$asunto,$data,$cc));
        reportesEnviados::create([
            'nombre'=>$archivo, 
            'ruta'=>$pdf, 
            'email'=>$email, 
            'cc'=>$cc, 
            'asunto'=>$asunto, 
            'id_estatus'=>1, 
            'id_rpt'=>$id_rpt

        ]);

        
        return $pdf;
    }

    function ncierre($suc,$mensaje){
        $sucursal=Sucursal::find($suc);
        $nombreSucursal=$sucursal->descripcion;
        $gerenteMail=Usuario::find($sucursal->id_gte_vtas)->email;
        $pdf="";
        $asunto=$nombreSucursal;
        $cc="";//sin cc
        //$cc="alejandro.hernandez@deuxestudio.com";
        $email="mecott_rsl@hotmail.com";
        $data = array(
            'header'    =>  $asunto,
            'message'   =>  $mensaje
            );
        Mail::to($email)->queue(new PruebaMail($pdf,$asunto,$data,$cc));
    }
   
/*  function Decrypt($encryp)
    {
        $result = null;
        try {
            //$result = collect(json_decode(Crypt::decryptString($encryp),true))->all();
            $result = json_decode(Crypt::decryptString($encryp));
        } catch(\Exception $e) {
            $result = null;
        }
        return $result;
    }*/

    function arrayToString($value)
    {
    	if (is_array($value)) {
    		$string = "(";
    		for ($i=0; $i < count($value); $i++) {
    			$string .= "'" . $value[$i] . "',";        			
    		}
    		$string .= ")";
    		$value = str_replace(["(", ",)"], "", $string);
    		return $value;
    	}
    	else{
    		return $value;
    	}
    }

    function EnviarMail($email, $ruta, $asunto, $data, $cc = null, $cco = null)
    {//dd($email, $ruta, $asunto, $data, $cc = null, $cco = null);
        if (is_null($cc) && is_null($cco)) {
            Mail::to($email)
            ->send(new PruebaMail($ruta,null, $asunto, $data));               # code...
        }
        elseif (!is_null($cc) && is_null($cco)) {
            Mail::to($email)
            ->cc($cc)
            ->send(new PruebaMail($ruta,null, $asunto, $data));
        }
        elseif (is_null($cc) && !is_null($cco)) {
            Mail::to($email)
            ->bcc($cco)
            ->send(new PruebaMail($ruta,null, $asunto, $data));
        }
        else{
            Mail::to($email)
            ->cc($cc)
            ->bcc($cco)
            ->send(new PruebaMail($ruta,null, $asunto, $data));
        }   
    }
    
    
    function formadepagoSAT($id){
switch ($id) {
 
    case '01':
        return 'Efectivo';
        break;
    case '02':
        return  'Cheque nominativo';
        break;
    case '03':
        return 'Transferencia electrónica de fondos';
        break;
    case '04':
        return 'Tarjeta de crédito';
        break;
    case '05':
        return 'Monedero electrónico';
        break;
    case '06':
        return 'Dinero electrónico';
        break;
    case '08': 
        return 'Vales de despensa';
        break;
    case '12': 
        return 'Dación en pago';
        break;
    case '13': 
        return 'Pago por subrogación';
        break;
    case '14': 
        return 'Pago por consignación';
        break;
    case '15': 
        return 'Condonación';
        break;
    case '17': 
        return 'Compensación';
        break;
    case '23': 
        return 'Novación';
        break;
    case '24': 
        return 'Confusión';
        break;
    case '25': 
        return 'Remisión de deuda';
        break;
    case '26': 
        return 'Prescripción o caducidad';
        break;
    case '27': 
        return 'A satisfacción del acreedor';
        break;
    case '28': 
        return 'Tarjeta de débito';
        break;
    case '29': 
        return 'Tarjeta de servicios';
        break;
    case '30': 
        return 'Aplicación de anticipos';
        break;
    case '99': 
        return 'Por definir';
        break;

    default:
        # code...
        break;
}       

    }
function metodopagoSAT($id){
    switch ($id) {
        case 'PUE':
            return 'Pago en una sola exhibición';
            break;

        case 'PPD':
            return 'Pago Diferido';
            break;
        
        
        default:
            # code...
            break;
    }

}

function regimenFiscalSAT($id){
switch ($id) {
    case '605': return 'Sueldos y Salarios e Ingresos Asimilados a Salarios'; break;
    case '606': return 'Arrendamiento'; break;
    case '608': return 'Demás ingresos'; break;
    case '611': return 'Ingresos por Dividendos (socios y accionistas)'; break;
    case '612': return 'Personas Físicas con Actividades Empresariales y Profesionales'; break;
    case '614': return 'Ingresos por intereses'; break;
    case '615': return 'Régimen de los ingresos por obtención de premios'; break;
    case '616': return 'Sin obligaciones fiscales'; break;
    case '621': return 'Incorporación Fiscal'; break;
    case '622': return 'Actividades Agrícolas, Ganaderas, Silvícolas y Pesqueras'; break;
    case '629': return 'De los Regímenes Fiscales Preferentes y de las Empresas Multinacionales'; break;
    case '630': return 'Enajenación de acciones en bolsa de valores'; break;
    case '601': return 'General de Ley Personas Morales'; break;
    case '603': return 'Personas Morales con Fines no Lucrativos'; break;
    case '607': return 'Régimen de Enajenación o Adquisición de Bienes'; break;
    case '609': return 'Consolidación'; break;
    case '620': return 'Sociedades Cooperativas de Producción que optan por Diferir sus Ingresos'; break;
    case '622': return 'Actividades Agrícolas, Ganaderas, Silvícolas y Pesqueras'; break;
    case '623': return 'Opcional para Grupos de Sociedades'; break;
    case '624': return 'Coordinados'; break;
    case '628': return 'Hidrocarburos'; break;
    
    
    default:
        # code...
        break;
}
}

function usoCFDISAT($id){
    switch ($id) {

            case 'G01':	return 'Adquisición de mercancías';	break;			
            case 'G02':	return 'Devoluciones, descuentos o bonificaciones';	break;
            case 'G03':	return 'Gastos en general';	break;	
            case 'I01':	return 'Construcciones';	break;
            case 'I02':	return 'Mobiliario y equipo de oficina por inversiones';	break;
            case 'I03':	return 'Equipo de transporte';	break;
            case 'I04':	return 'Equipo de cómputo y accesorios';	break;
            case 'I05':	return 'Dados, troqueles, moldes, matrices y herramental';	break;	
            case 'I06':	return 'Comunicaciones telefónicas';	break;		
            case 'I07':	return 'Comunicaciones satelitales';	break;
            case 'I08':	return 'Otra maquinaria y equipo';	break;
            case 'D01':	return 'Honorarios médicos, dentales y gastos hospitalarios.';	break;
            case 'D02':	return 'Gastos médicos por incapacidad o discapacidad';	break;
            case 'D03':	return 'Gastos funerales.';	break;
            case 'D04':	return 'Donativos';	break;
            case 'D05':	return 'Intereses reales efectivamente pagados por créditos hipotecarios (casa habitación).';	break;
            case 'D06':	return 'Aportaciones voluntarias al SAR.';	break;
            case 'D07':	return 'Primas por seguros de gastos médicos.';	break;
            case 'D08':	return 'Gastos de transportación escolar obligatoria.';	break;
            case 'D09':	return 'Depósitos en cuentas para el ahorro, primas que tengan como base planes de pensiones.';	break;
            case 'D10':	return 'Pagos por servicios educativos (colegiaturas)';	break;
            case 'P01':	return 'Por definir';	break;        
        default:
            # code...
            break;
    }
}
function ivasSat($id){
    switch ($id) {
        case '001':
            return 'ISR';
            break;
        case '002':
            return 'IVA';
            break;
        case '003':
            return 'IEPS';
            break;
         
        default:
            # code...
            break;
    }
}
function objetoImpSAT($id){
    switch ($id) {
        case '01':
            return 'No objeto de impuesto.';
            break;
        case '02':
            return 'Sí objeto de impuesto.';
            break;
        case '03':
            return 'Sí objeto del impuesto y no obligado al desglose.';
            break;
        
        default:
            # code...
            break;
    }
}

function tipoComprobanteSat($id){
    switch ($id) {
        case 'I':
            return "Ingreso";
            break;
        case 'E':
            return "Egreso";
            break;
        case 'T':
            return "Traslado";
            break;
        case 'P':
            return "Pago";
            break;
        case 'N':
            return "Nómina";
            break;
        default:
            # code...
            break;
    }
    
}
