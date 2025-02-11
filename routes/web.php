<?php

use App\Http\Controllers\Admin\PasarelasController;
use App\Http\Controllers\Admin\ReporteadorController;
use App\Http\Controllers\Reportes\ReporteController;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Route;
use JasperPHP\JasperPHP as JasperPHP;
use Illuminate\Support\Facades\URL;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});

Auth::routes();

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

//Route::get('reportes-data/{id_rol_det}', 'Reportes\ReporteController@reportes')->name('reportes');
/*Route::get('reportes/{id_rol_det}', 'Reportes\ReporteController@index')->name('reporte.index');
Route::get('reporte/create/{id_rol_det}', 'Reportes\ReporteController@create')->name('reporte.create');
Route::get('reporte/show/{id_rol_det}/{reporte}', 'Reportes\ReporteController@show')->name('reporte.show');
Route::post('reporte/store/{id_rol_det}', 'Reportes\ReporteController@store')->name('reporte.store');
Route::put('reporte/update/{id_rol_det}/{reporte}', 'Reportes\ReporteController@update')->name('reporte.update');
Route::get('reporte/delete/{id_rol_det}/{reporte}', 'Reportes\ReporteController@destroy')->name('reporte.delete');

Route::get('reportes/{reporte}/{encrypt}', 'Reportes\ReporteController@reporte')->name('reporte');
Route::post('reportes/{reporte}/{encrypt}', 'Reportes\ReporteController@result')->name('result');

Route::get('subreporte/create/{id_rol_det}', 'Reportes\ReporteController@create_subreporte')->name('subreporte.create');
Route::post('subreporte/store/{id_rol_det}', 'Reportes\ReporteController@store_subreporte')->name('subreporte.store');
*/
Route::group(['prefix'=>"admin",'as' => 'admin.','namespace' => 'App\Http\Controllers\Admin','middleware' => ['auth','AdminPanelAccess']], function () {

    Route::get('/', 'HomeController@index')->name('home');
    
    Route::resource('/report', 'ReporteadorController');
    Route::resource('/users', 'UserController');
    
    Route::resource('/roles', 'RoleController');
    Route::resource('/permissions', 'PermissionController')->except(['show']);
    Route::view('/posts', 'livewire.posts.index');
    Route::view('/entidades', 'livewire.entidads.index');
    Route::view('/permisos', 'livewire.permissions.index');
    Route::view('/modulos', 'livewire.modulos.index');
    Route::view('/roles2', 'livewire.roles.index');

    Route::view('/colores', 'livewire.colors.index');
    Route::view('/tallas', 'livewire.sizes.index');
    Route::view('/categorias', 'livewire.categories.index');
    Route::view('/perfil', 'livewire.perfil.index');
    
    Route::get('/conekta', [PasarelasController::class, 'conekta'])->name('pasarelas.conekta');
    Route::get('/checkout', [PasarelasController::class, 'checkoutRedirect'])->name('pasarelas.checkout');

    Route::get('/reportes', [ReporteController::class, 'reportes'])->name('reportes');
    
  
    Route::get('/subreporte/create', [ReporteadorController::class, 'create_subreporte'])->name('subreporte.create');
    Route::post('/subreporte/store', [ReporteadorController::class, 'store_subreporte'])->name('subreporte.store');
    //Route::post('/reportes/{reporte}', [ReporteadorController::class, 'result'])->name('result');
    Route::post('/reportes/{reporte}', [ReporteadorController::class, 'result'])->name('result');
	

//route('admin.report.update', [$list->id_rpt]) 
});



