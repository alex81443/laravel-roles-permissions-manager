<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class reportesEnviados extends Model
{
    protected $table = 'rptemail';
    protected $primaryKey = 'id';
    protected $fillable = ['nombre', 
    'ruta', 'email', 'cc', 'asunto', 'id_estatus', 'id_rpt'];
}
