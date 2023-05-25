<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use JasperPHP\JasperPHP as JasperPHP;

class ReporteController extends Controller
{
    public function prueba () {
        $jasper = new JasperPHP;

        // Compile a JRXML to Jasper
        $jasper->compile(public_path() . '/reportes/hello_world.jrxml')->execute();

        // Depuración de errores
        // exec($jasper->output().' 2>&1', $output);
        // dd($output);
        // Para que funcione hay que borrar "->execute()" de la linea anterior

        // Process a Jasper file to PDF and RTF (you can use directly the .jrxml)
        $jasper->process(
           public_path() . '/reportes/hello_world.jasper',
            false,
            array("pdf"),
            array("php_version" => '3345345345345')
        )->output();

         exec($jasper->output().' 2>&1', $output);
         dd($output);

        // List the parameters from a Jasper file.
        $jasper->list_parameters(
            'reportes/hello_world.jasper'
        )->execute();

        return view('reporte')->with('file', 'reportes/hello_world.pdf');
    }
}
