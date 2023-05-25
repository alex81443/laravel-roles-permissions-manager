<?php

// use stdClass;
use App\Modelos\Reportes\Filtro;
use App\Modelos\Reportes\TipFilt;
use Illuminate\Support\Facades\DB;

function GetControl(Filtro $filtro, $old){
        $result = '';
        try {
            $tipfilt = TipFilt::find($filtro->id_tip_filt);
            switch ($tipfilt->tipo) {
                case 'SELECT':
                case 'SELECT_MULTIPLE':
                    $valores = GetConsulta($filtro,$old,$tipfilt->tipo);
                    if ($valores->ok) {
                        $result = str_replace('@valor',$filtro->valor,str_replace('@valores',$valores->result,$tipfilt->control));
                    } else {
                        $result = '<textarea readonly class="form-control text-danger" name="errores[]['.$filtro->etiqueta.']" id="'.$filtro->valor.'" rows="3">'.$valores->result.'</textarea>';
                    }
                    break;
                case 'DATE':
                case 'DATE_RANGE':
                    $value = (empty($old) ? '' : 'value="'.$old.'"');
                    $result = str_replace('@value',$value,str_replace('@valor',$filtro->valor,$tipfilt->control));
                    break;
            }
        } catch(\Exception $e) {
            $result = '<textarea class="form-control text-danger" name="errores[]['.$filtro->etiqueta.']" id="'.$filtro->valor.'" rows="3">'.$e->getMessage().'</textarea>';
        }
        return $result;
}


 function GetConsulta(Filtro $filtro, $old, $tipo){
    $result = new \stdClass();
    $result->ok = true;
    $result->result = '<option value="0">Sin Asignar</option>';
    try {
        $datos = collect(DB::select($filtro->consulta))->map(function($x){ return (array) $x; })->toArray();
        if ($datos) {
            $option = '';
            foreach ($datos as $dato) {
                $selected = ($tipo == 'SELECT_MULTIPLE' && !empty($old) ? (in_array($dato[$filtro->valor], $old) ? 'selected' : '') : ($old == $dato[$filtro->valor] ? 'selected' : ''));
                $option .= '<option '.$selected.' value="'.$dato[$filtro->valor].'">'.$dato[$filtro->texto].'</option>';
            }
            $result->result = $option;
        }
    } catch(\Exception $e) {
        $result->ok = false;
        $result->result = $e->getMessage();
    }
    return $result;
}