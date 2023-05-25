<?php

namespace App\Models\Reportes;

use Illuminate\Database\Eloquent\Model;

class Filtro extends Model
{
    protected $table = 'rpt_filtros';
    protected $primaryKey = 'id_filtro';
    public $timestamps = false;
    protected $guarded = [];

    public function scopeReporte($query)
    {
        return $query->where('id_rpt', '>', 0)->where('id_estatus', 1)->where('id_rol', '>', 0);
    }

    public function scopeSelectMultiple($query, $id_rpt)
    {
    	return $query->where([['id_rpt', $id_rpt], ['id_tip_filt', 2]])->pluck('valor');
    }
}