<?php 

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Modulo extends Model
{
	use HasFactory;
	
    public $timestamps = true;

    protected $table = 'modulo';

    protected $fillable = ['nombre','orden','ruta','icono','nomod','permiso'];
	
    /**
     * @return \Illuminate\Database\Eloquent\Relations\HasMany
     */
    public function entidads()
    {
        return $this->hasMany('App\Models\Entidad', 'modulo_id', 'id');
    }
    
}
