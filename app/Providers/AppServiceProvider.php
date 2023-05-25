<?php

namespace App\Providers;

use App\Models\Entidad;
use App\Models\Modulo;
use Illuminate\Pagination\Paginator;
use Illuminate\Support\ServiceProvider;
use JeroenNoten\LaravelAdminLte\Events\BuildingMenu;
use Illuminate\Support\Facades\Event;


class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     *
     * @return void
     */
    public function register()
    {
        //
    }

    /**
     * Bootstrap any application services.
     *
     * @return void
     */
    public function boot()
    {
        Paginator::useBootstrap();
        
        Event::listen(BuildingMenu::class, function (BuildingMenu $event) {

            //$event->menu->add(trans('menu.pages'));
           
          //  dump($nomodulos);
            $modulos = Modulo::/*where('nomod',1)->*/orderBy('orden')->get()->map(function (Modulo $page) {
                
                if($page['nomod']==0){
                return [
                    'key'=> $page['id'],
                    'text' => $page['nombre'],
                    'icon'       => $page['icono'],
                    'can'=>$page['permiso'],
                    //'url' => $page['ruta'],
                ];}else{
                    return [
                        //'key'=> $page['id'],
                        'text' => $page['nombre'],
                        'url' => $page['ruta'],
                        'icon'       => $page['icono'],
                        'can'=>$page['permiso'],
                    ]   ;
                }
            });
            
            $event->menu->add(...$modulos);
            //dump($modulos);

            
            foreach($modulos as $modulo){
               if(isset($modulo['key'])) {
            
            $items = Entidad::where('modulo_id',$modulo['key'])->get()->map(function (Entidad $page) {
                return [
                    'text' => $page['nombre'],
                    'url' => $page['ruta'],
                    'icon'       => $page['icono'],
                    'can'=>$page['permiso'],
                ];
            });
            $event->menu->addIn($modulo['key'],...$items);
        }
            
            
        }
            //Nota futura Agregar mas campos a modulos y entidades
            //entidades agregar nombre del permiso en modulos y entidades
            //la key deberá ser la id del modulo y de la entidad la key identifica si hay o no  menus

        });
        
    }
}
