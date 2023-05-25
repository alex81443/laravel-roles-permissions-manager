<?php 

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Entidad extends Model
{
	use HasFactory;
	
    public $timestamps = true;

    protected $table = 'entidad';

    protected $fillable = ['nombre','orden','ruta','icono','modulo_id','permiso'];
	
    /**
     * @return \Illuminate\Database\Eloquent\Relations\HasOne
     */
    public function modulo()
    {
        return $this->hasOne('App\Models\Modulo', 'id', 'modulo_id');
    }
    
}
