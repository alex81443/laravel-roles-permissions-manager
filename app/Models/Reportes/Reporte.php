<?php

namespace App\Models\Reportes;

use Illuminate\Database\Eloquent\Model;

class Reporte extends Model
{
    protected $table = 'reportes';
    protected $primaryKey = 'id_rpt';
    public $timestamps = false;
    protected $guarded = [];

    public function Filtros() {
        return Filtro::where('id_rpt',$this->id_rpt)->where('estatus',1)->orderBy('orden');
    }

    public function scopeTabla($query)
    {
    	return $query->whereIn('estatus', [1,2])->get();
    }

     public function scopeActivos($query)
    {
        return $query->where('estatus', 1)->get();
    }
}