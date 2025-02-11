<?php

namespace App\Http\Controllers\Admin;
use App\Http\Controllers\Controller;
use App\Models\Modulo;
use App\Models\Reportes\Filtro;
use App\Models\Reportes\Reporte;
use App\Models\Reportes\SubReporte;
use App\Models\Reportes\TipFilt;
use App\Models\Role;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use JasperPHP\JasperPHP;

class ReporteadorController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //return view('reportes.index');
        try {
            $puede_crear = false;
            $id_rol = Auth::user()->id_rol;
            $id_usuario = Auth::user()->id_usuario;
            if ($id_rol == 1 || User::PuedeCrearRPT($id_usuario)) {
                $puede_crear = true;
            }     
            return view('admin.reportes.index')
                ->with('titulo', 'Reportes')
                
                ->with('puede_crear', $puede_crear);            
        } catch (Exception $e) {
            return redirect('default')->withErrors($e->getMessage());            
        }
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        try {            
            return view('admin.reportes.reporte')
            ->with('titulo', 'Reporte')
            ->with('tipos_filtro', $this->tipos_filtro())
            ->with('modulos', $this->modulos())
            ->with('roles', $this->roles());
            
        } catch(\Exception $e) {
            return redirect()->back()->withErrors($e->getMessage());
        }
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
       // dd($request->all());
        try {
            
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

                return redirect()->route('admin.report.index');
            }            
        } catch (Exception $e) {
            return redirect()->back()->withErrors($e->getMessage());            
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $reporte=Reporte::find($id);
        try {
            
            if (($reporte->id_rpt == 0 || $reporte->estatus != 1)) {
                return redirect()->back()->with('warning', 'No existe el reporte.');
            } else {
                $filtros = $reporte->Filtros();
                if ($filtros->exists()) {
                    $filtros = $filtros->get();
                    return view('admin.reportes.rpt')->with(compact('reporte','filtros'));
                } else {
                    return redirect()->back()->with('warning', 'Reporte sin funcionalidad.');
                }
            }
        } catch(\Exception $e) {
            return redirect()->back()->withErrors($e->getMessage());
        }
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
       // dd($id);
        try {
            $reporte=Reporte::find($id);
            

            $reporte->filtros = DB::table('rpt_filtros')
                ->join('rpt_tip_filtros', 'rpt_filtros.id_tip_filt', '=', 'rpt_tip_filtros.id_tip_filt')
                ->where('rpt_filtros.id_rpt', $reporte->id_rpt)
                ->orderBy('rpt_filtros.orden', 'asc')
                ->get();
            $reporte->roles = collect((object) json_decode($reporte->roles));

            return view('admin.reportes.reporte')
            ->with('titulo', 'Reporte')
            ->with('list', $reporte)
            ->with('tipos_filtro', $this->tipos_filtro())
            ->with('modulos', $this->modulos())
            ->with('roles', $this->roles());
            
        } catch(\Exception $e) {
            return redirect()->back()->withErrors($e->getMessage());
        }

    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        dd("act");
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
    public function create_subreporte()
    {
        try {
            return view('admin.reportes.subreporte')
            ->with('titulo', 'Reporte')
            ->with('reportes', Reporte::Activos());
                     
        } catch (Exception $e) {
            return redirect()->back()->withErrors($e->getMessage());            
        }
    }

    public function store_subreporte(Request $request)
    {
        $jasper = new JasperPHP();
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
        exec($jasper->output().' 2>&1', $output);
        //dd($output);

        $reporte = SubReporte::updateOrCreate(
            ['id_rpt' => $request->id_rpt, 'archivo' => $archivo],
            ['hace_consulta' => $request->has('hace_consulta') ? 1 : 0]
        );

        return redirect()->route('admin.reporte.index')->with('success', 'Se guardó y compiló reporte con exito');

    }


    public function tipos_filtro()
    {
        return TipFilt::Tabla();
    }    
    public function modulos()
    {
        return Modulo::all();
        //return Modulo::Activos()->get();
    }

    public function roles()
    {
        $roles=Role::all();
        return $roles;
        //return DB::table('rol')->where('id_estatus', 1)->get();
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

    public function result(Request $request,Reporte $reporte)
    {
        try {
            
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
                    return view('admin.reportes.rpt')->with(compact('reporte','filtros','parametros', 'pdf'));
                } else {
                    
                    return back()->withInput()->with('warning', 'Reporte sin funcionalidad.');
                }
            }
        } catch(\Exception $e) {
            return back()->withInput()->withErrors($e->getMessage());
        }
    }

    public function reporte(Reporte $reporte)
    {
        try {
            
            if (($reporte->id_rpt == 0 || $reporte->estatus != 1)) {
                return redirect()->back()->with('warning', 'No existe el reporte.');
            } else {
                $filtros = $reporte->Filtros();
                if ($filtros->exists()) {
                    $filtros = $filtros->get();
                    return view('admin.reportes.rpt')->with(compact('reporte','filtros'));
                } else {
                    return redirect()->back()->with('warning', 'Reporte sin funcionalidad.');
                }
            }
        } catch(\Exception $e) {
            return redirect()->back()->withErrors($e->getMessage());
        }

}
}