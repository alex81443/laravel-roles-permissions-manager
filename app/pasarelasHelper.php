<?php

use App\Models\ConektaModel;

function getApisConekta(){
    try{
        $pasarela = ConektaModel::find(1);
        if($pasarela->produccion == 0){
            dump("estas en test");
            $apis = collect([
                'public' => $pasarela->public_key_test,
                'private' => $pasarela->private_key_test,
            ]);
            return $apis;
        }else{
            dump("estas en produccion");
            $apis = collect([
                'public' => $pasarela->public_key,
                'private' => $pasarela->private_key,
            ]);
            return $apis;
        }
    }catch(\Exception $e){
        dd($e);
    }
}
