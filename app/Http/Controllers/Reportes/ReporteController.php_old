<?php

namespace App\Http\Controllers\Reportes;

use DB;
use Illuminate\Support\Facades\Auth;
use JasperPHP\JasperPHP as JasperPHP;
use Illuminate\Http\Request;
use App\Modelos\Catalogos\Sistema\Usuario;
use App\Modelos\Reportes\Filtro;
use App\Modelos\Reportes\Reporte;
use App\Modelos\Reportes\SubReporte;
use App\Modelos\Reportes\TipFilt;
use App\Modelos\Modulo;
use Illuminate\Support\Facades\Crypt;
use Illuminate\Database\Eloquent\Collection;
use App\Http\Controllers\Controller;
use App\Models\Modulo as ModelsModulo;
use App\Models\Reportes\Reporte as ReportesReporte;
use App\Models\User;

class ReporteController extends Controller
{
    public function __construct() { $this->middleware('auth'); }
    
    public function index($id_rol_det)
    {
        try {
            $puede_crear = false;
            $id_rol = Auth::user()->id_rol;
            $id_usuario = Auth::user()->id_usuario;
            if ($id_rol == 1 || Usuario::PuedeCrearRPT($id_usuario)) {
                $puede_crear = true;
            }     
            return view('reportes.index')
                ->with('titulo', 'Reportes')
                ->with('id_rol_det', $id_rol_det)
                ->with('puede_crear', $puede_crear);            
        } catch (Exception $e) {
            return redirect('default')->withErrors($e->getMessage());            
        }
    }

    public function create($id_rol_det)
    {
        try {
            parent::ValRol($id_rol_det);
            return view('reportes.reporte')
            ->with('titulo', 'Reporte')
            ->with('tipos_filtro', $this->tipos_filtro())
            ->with('modulos', $this->modulos())
            ->with('roles', $this->roles())
            ->with('id_rol_det', $id_rol_det);
        } catch(\Exception $e) {
            return redirect()->back()->withErrors($e->getMessage());
        }
    }

    public function create_subreporte($id_rol_det)
    {
        try {
            return view('reportes.subreporte')
            ->with('titulo', 'Reporte')
            ->with('reportes', Reporte::Activos())
            ->with('id_rol_det', $id_rol_det);            
        } catch (Exception $e) {
            return redirect()->back()->withErrors($e->getMessage());            
        }
    }

    public function store(Request $request, $id_rol_det)
    {
        try {
            parent::ValRol($id_rol_det);
            if (is_null($request->file('archivo')) || $request->file('archivo')->getClientOriginalExtension() !== 'jrxml') {
                return redirect()->back()->with('warning', 'No es un archivo de Jasper valido');
            }
            elseif (!$request->filtros) {
                return redirect()->back()->with('warning', 'Faltan filtros en el reporte');   
            }
            else{
                $archivo = $this->UploadFile($request->file('archivo'));
                #Información de Reporte
                $reporte = Reporte::create([
                    'clave' => $request->clave,
                    'descripcion' => $request->nombre,
                    'archivo' => $archivo,
                    'estatus' => $request->has('id_estatus') ? 1 : 0,
                    'hace_consulta' => $request->has('hace_consulta') ? 1 : 0,
                    'user_session' => $request->has('user_session') ? 1 : 0,
                    'modulo' => $request->modulo,
                    'roles' => json_encode($request->roles),
                ]);

                #Filtros del Reporte
                foreach ($request->filtros as $filtro) {
                    Filtro::create([
                        'id_rpt' => $reporte->id_rpt,
                        'id_tip_filt' => $filtro['tipo'],
                        'id_oper' => 1,
                        'etiqueta' => $filtro['etiqueta'],
                        'valor' => $filtro['id_filtro'],
                        'texto' => isset($filtro['valor']) ? $filtro['valor'] : '',
                        'consulta' => isset($filtro['query']) ? $filtro['query'] : '',
                        'orden' => $filtro['orden'],
                        'estatus' => $request->has('id_estatus') ? 1 : 0,
                    ]);
                }

                return redirect()->route('reporte.index', [$id_rol_det]);
            }            
        } catch (Exception $e) {
            return redirect()->back()->withErrors($e->getMessage());            
        }

    }

    public function store_subreporte(Request $request, $id_rol_det)
    {
        $jasper = new JasperPHP;
        $archivo = $this->UploadFile($request->file('archivo'));
        $archivo = str_replace('.jrxml', '', $archivo);
        $jrxml = base_path('jrxml/'.$archivo.'.jrxml');
        /*$jasper = base_path('jrxml/'.$archivo.'.jasper');

        if (file_exists($jrxml)) {
            unlink($jrxml);
        }

        if (file_exists($jasper)) {
            unlink($jasper);
        }*/        

        // Compile a JRXML to Jasper
        $jasper->compile($jrxml)->execute();
        /*exec($jasper->output().' 2>&1', $output);
        dd($output);*/

        $reporte = SubReporte::updateOrCreate(
            ['id_rpt' => $request->id_rpt, 'archivo' => $archivo],
            ['hace_consulta' => $request->has('hace_consulta') ? 1 : 0]
        );

        return redirect()->route('reporte.index', [$id_rol_det])->with('success', 'Se guardó y compiló reporte con exito');

    }

    public function show($id_rol_det, Reporte $reporte)
    {
        try {
            parent::ValRol($id_rol_det);

            $reporte->filtros = DB::table('rpt_filtros')
                ->join('rpt_tip_filtros', 'rpt_filtros.id_tip_filt', '=', 'rpt_tip_filtros.id_tip_filt')
                ->where('rpt_filtros.id_rpt', $reporte->id_rpt)
                ->orderBy('rpt_filtros.orden', 'asc')
                ->get();
            $reporte->roles = collect((object) json_decode($reporte->roles));

            return view('reportes.reporte')
            ->with('titulo', 'Reporte')
            ->with('list', $reporte)
            ->with('tipos_filtro', $this->tipos_filtro())
            ->with('modulos', $this->modulos())
            ->with('roles', $this->roles())
            ->with('id_rol_det', $id_rol_det);
        } catch(\Exception $e) {
            return redirect()->back()->withErrors($e->getMessage());
        }
    }

    public function update(Request $request, $id_rol_det, Reporte $reporte)
    {
        try {
            parent::ValRol($id_rol_det);
            if (!is_null($request->file('archivo')) && $request->file('archivo')->getClientOriginalExtension() !== 'jrxml') {
                return redirect()->back()->with('warning', 'No es un archivo de Jasper valido');
            }
            elseif (!$request->filtros) {
                return redirect()->back()->with('warning', 'Faltan filtros en el reporte');   
            }
            else{
                #Información de Reporte
                if (is_null($request->file('archivo'))) { #Si no hay archivo nuevo
                    Reporte::where('id_rpt', $reporte->id_rpt)->update([
                        'clave' => $request->clave,
                        'descripcion' => $request->nombre,
                        'estatus' => $request->has('id_estatus') ? 1 : 2,
                        'hace_consulta' => $request->has('hace_consulta') ? 1 : 0,
                        'user_session' => $request->has('user_session') ? 1 : 0,
                        'modulo' => $request->modulo,
                        'roles' => json_encode($request->roles)
                    ]);
                }
                else{
                    $archivo = $this->UploadFile($request->file('archivo'));
                    Reporte::where('id_rpt', $reporte->id_rpt)->update([
                        'clave' => $request->clave,
                        'descripcion' => $request->nombre,
                        'archivo' => $archivo,
                        'estatus' => $request->has('id_estatus') ? 1 : 2,
                        'hace_consulta' => $request->has('hace_consulta') ? 1 : 0,
                        'user_session' => $request->has('user_session') ? 1 : 0,
                        'modulo' => $request->modulo,
                        'roles' => json_encode($request->roles)
                    ]);
                }


                #Filtros del Reporte
                Filtro::where('id_rpt', $reporte->id_rpt)
                        ->delete();
                foreach ($request->filtros as $filtro) {
                    Filtro::create([
                        'id_rpt' => $reporte->id_rpt,
                        'id_tip_filt' => $filtro['tipo'],
                        'id_oper' => 1,
                        'etiqueta' => $filtro['etiqueta'],
                        'valor' => $filtro['id_filtro'],
                        'texto' => isset($filtro['valor']) ? $filtro['valor'] : '',
                        'consulta' => isset($filtro['query']) ? $filtro['query'] : '',
                        'orden' => $filtro['orden'],
                        'estatus' => 1,
                    ]);
                }

                return redirect()->route('reporte.index', [$id_rol_det]);
            }            
        } catch (Exception $e) {
            return redirect()->back()->withErrors($e->getMessage());            
        }
    }

    public function destroy($id_rol_det, Reporte $reporte)
    {
        $reporte->update([
            'estatus' => 3
        ]);
        return redirect()->route('reporte.index', [$id_rol_det])->with('success', 'Reporte Eliminado');
    }

    public function reporte(Reporte $reporte,$encrypt)
    {
        try {
            parent::ValRol($encrypt);
            if (($reporte->id_rpt == 0 || $reporte->estatus != 1)) {
                return redirect()->back()->with('warning', 'No existe el reporte.');
            } else {
                $filtros = $reporte->Filtros();
                if ($filtros->exists()) {
                    $filtros = $filtros->get();
                    return view('reportes.rpt')->with(compact('reporte','encrypt','filtros'));
                } else {
                    return redirect()->back()->with('warning', 'Reporte sin funcionalidad.');
                }
            }
        } catch(\Exception $e) {
            return redirect()->back()->withErrors($e->getMessage());
        }
    }

    /**
     * @param  Request  $request
     * @param  Reporte  $reporte
     * @param  string  $encrypt
     * @return \Illuminate\Http\Response
     */
    public function result(Request $request,Reporte $reporte,$encrypt)
    {
        try {
            parent::ValRol($encrypt);
            if (($reporte->id_rpt == 0 || $reporte->estatus != 1)) {
                return back()->withInput()->with('warning', 'No existe el reporte.');
            } else {
                $filtros = $reporte->Filtros();
                if ($filtros->exists()) {
                    $filtros = $filtros->get();
                    if ($request->has('errores')) {
                        return back()->withInput()->withErrors($request->input('errores'));
                    }
                    foreach($filtros as $filtro) {
                        if (!$request->has($filtro->valor)) {
                            return back()->withInput()->with('warning', 'Filtro ('.$filtro->etiqueta.') requerido.');
                        }
                    }
                    $parametros = $request->except('_token');
                    //dd($reporte,$parametros);
                    $pdf = $this->jasper($reporte, $parametros);
                    //dd($pdf);
                    // Aquí va el código de jasper para mostrarlo en las misma view
                    return view('reportes.rpt')->with(compact('reporte','encrypt','filtros','parametros', 'pdf'));
                } else {
                    return back()->withInput()->with('warning', 'Reporte sin funcionalidad.');
                }
            }
        } catch(\Exception $e) {
            return back()->withInput()->withErrors($e->getMessage());
        }
    }

    public function reportes()
    { $id_rol_det=23;
        $id_rol = Auth::user()->role_id;
        
        $id_usuario = Auth::user()->id_usuario;
        $reportes = ReportesReporte::Tabla()->whereIn('estatus', [1, 2]);

        $rpt = collect();
//dd($rpt);        
        for ($i=0; $i < $reportes->count(); $i++) { 
            $roles = collect(json_decode($reportes[$i]->roles));
            
            if ($roles->contains($id_rol) || $id_rol == 1 || User::PuedeEditarRPT($id_usuario)) {
                
                $rpt[$i] = $reportes[$i];
                $rpt[$i]->modulo = ModelsModulo::find($reportes[$i]->modulo)->descripcion;
                if ($id_rol == 1 || User::PuedeEditarRPT($id_usuario)) {
                    $rpt[$i]->edit = '<a href="'.route('admin.report.edit', [$reportes[$i]->id_rpt]).'" class="btn btn-lg btn-outline-secondary" role="button" data-toggle="tooltip" data-placement="top" title="Ejecutar"><i class="icon-editar"></i></a>';
                }
                else{
                    $rpt[$i]->edit = '';
                }
                if ($reportes[$i]->estatus == 1){
                   $rpt[$i]->exec = '<a href="'.route('admin.report.show', [$reportes[$i]->id_rpt]).'" class="btn btn-lg btn-outline-secondary" role="button" data-toggle="tooltip" data-placement="top" title="Ejecutar"><i class="icon-editar"></i></a>';
                    $rpt[$i]->estatus ='Activo';                    
                }
                elseif ($reportes[$i]->estatus == 2){
                    $rpt[$i]->exec = '<a href="'.route('admin.report.show', [$reportes[$i]->id_rpt]).'"disabled class="disabled btn btn-lg btn-outline-secondary" role="button" data-toggle="tooltip" data-placement="top" title="Ejecutar"><i class="icon-editar"></i></a>';
                    $rpt[$i]->estatus ='Inactivo';
                }

            }
        }
        //dd($rpt);
        return $rpt->values();
    }

    public function tipos_filtro()
    {
        return TipFilt::Tabla();
    }    


    public function UploadFile($file)
    {
        if (!is_null($file)) {
            $path = base_path('jrxml/');
            $file->move($path, $file->getClientOriginalName());
            $id_archivo = $file->getClientOriginalName();
        }
        else{
            $id_archivo = false;
        }

        return $id_archivo;
    }

    public function modulos()
    {
        return Modulo::Activos()->get();
    }

    public function roles()
    {
        return DB::table('rol')->where('id_estatus', 1)->get();
    }

    public function jasper($reporte, $params = null)
    {
        $jasper = new JasperPHP;
        $archivo = str_replace('.jrxml', '', $reporte->archivo);
        $jrxml = base_path('jrxml/'.$archivo.'.jrxml');
        $compile = base_path('jrxml/'.$archivo.'.jasper');
        $output = public_path('files/reportes');
        $pdf = 'files/reportes/'.$archivo.'.pdf';
        $env = (object) config('database.connections.mysql');
        $selectmultiple = Filtro::SelectMultiple($reporte->id_rpt);

        if (file_exists(public_path($pdf))) {
        	unlink(public_path($pdf));
        }

         //dd($jrxml, $compile, $output);

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
	        		$xml = str_replace('$P!{'.$param.'}', $this->arrayToString($value), $xml);
	        		unset($params[$param]);
	        	}
	        }
        	file_put_contents($jrxml, $xml);
        }

        if ($reporte->user_session == 1) {
            $params['user_session'] = Auth::user()->id_usuario;
        }

        // Compile a JRXML to Jasper
        $jasper->compile($jrxml)->execute();

        // Depuración de errores
       /* exec($jasper->output().' 2>&1', $output);
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
                  'port' => $env->port
                )
            )->execute();
        }
        else{
            $jasper->process(
                $compile,
                $output, #output
                array("pdf"),
                $params
            )->execute();
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

        return $pdf;
    }

    public function Decrypt($encryp)
    {
        $result = null;
        try {
            //$result = collect(json_decode(Crypt::decryptString($encryp),true))->all();
            $result = json_decode(Crypt::decryptString($encryp));
        } catch(\Exception $e) {
            $result = null;
        }
        return $result;
    }

    public function arrayToString($value)
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
}