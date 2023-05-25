<?php 
use JasperPHP\JasperPHP as JasperPHP;
use Illuminate\Support\Facades\URL;
Route::get('/reporte', function () {
    $jasper = new JasperPHP;

    // Compile a JRXML to Jasper
    $jasper->compile('reportes/Prueba.jrxml')->execute();

    // Depuración de errores
    /*exec($jasper->output().' 2>&1', $output);
    dd($output);*/
    // Para que funcione hay que borrar "->execute()" de la linea anterior

    // Process a Jasper file to PDF and RTF (you can use directly the .jrxml)
    $jasper->process(
       'reportes/Prueba.jasper',
        false, #output
        array("pdf", "rtf", "xls"),
        array(),
        array(
          'driver' => 'mysql',
          'username' => 'root',
          'host' => 'localhost',
          'database' => 'toga',
          'port' => '3306',
        )
    )->execute();

    // List the parameters from a Jasper file.
    $jasper->list_parameters(
        'reportes/Prueba.jasper'
    )->execute();

    return view('reporte')->with('file', 'reportes/Prueba.pdf');
});

Route::get('/reporteador', function() {
    return view('reporteador');
});

/// Reportes
Route::get('reportes-data/{id_rol_det}', 'Reportes\ReporteController@reportes')->name('reportes');
Route::get('reportes/{id_rol_det}', 'Reportes\ReporteController@index')->name('reporte.index');
Route::get('reporte/create/{id_rol_det}', 'Reportes\ReporteController@create')->name('reporte.create');
Route::get('reporte/show/{id_rol_det}/{reporte}', 'Reportes\ReporteController@show')->name('reporte.show');
Route::post('reporte/store/{id_rol_det}', 'Reportes\ReporteController@store')->name('reporte.store');
Route::put('reporte/update/{id_rol_det}/{reporte}', 'Reportes\ReporteController@update')->name('reporte.update');
Route::get('reporte/delete/{id_rol_det}/{reporte}', 'Reportes\ReporteController@destroy')->name('reporte.delete');

Route::get('reportes/{reporte}/{encrypt}', 'Reportes\ReporteController@reporte')->name('reporte');
Route::post('reportes/{reporte}/{encrypt}', 'Reportes\ReporteController@result')->name('result');

Route::get('subreporte/create/{id_rol_det}', 'Reportes\ReporteController@create_subreporte')->name('subreporte.create');
Route::post('subreporte/store/{id_rol_det}', 'Reportes\ReporteController@store_subreporte')->name('subreporte.store');