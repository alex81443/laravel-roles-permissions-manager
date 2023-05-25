<?php

namespace App\Models\Reportes;
use Illuminate\Database\Eloquent\Model;

class SubReporte extends Model
{
    protected $table = 'rpt_subreportes';
    protected $primaryKey = 'id_sub_rpt';
    public $timestamps = false;
    protected $guarded = [];


     public function scopeActivos($query)
    {
        return $query->get();
    }}
