<?php 

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Permission extends Model
{
	use HasFactory;
	
    public $timestamps = true;

    protected $table = 'permissions';

    protected $fillable = ['name','entidad_id'];
	
    /**
     * @return \Illuminate\Database\Eloquent\Relations\HasMany
     */
    public function rolePermissions()
    {
        return $this->hasMany('App\Models\RolePermission', 'permission_id', 'id');
    }
    
}
