<?php

namespace App\Models\Reportes;

use Illuminate\Database\Eloquent\Model;

class TipFilt extends Model
{
    protected $table = 'rpt_tip_filtros';
    protected $primaryKey = 'id_tip_filt';
    public $timestamps = false;
    protected $guarded = [];

	public function scopeTabla($query)
	{
		return $query->where('estatus', 1)->get();
	}
}