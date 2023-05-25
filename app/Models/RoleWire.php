<?php 

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class RoleWire extends Model
{
	use HasFactory;
	
    public $timestamps = true;

    protected $table = 'roles';

    protected $fillable = ['title','short_code'];
	
    /**
     * @return \Illuminate\Database\Eloquent\Relations\HasMany
     */
    public function rolePermissions()
    {
        return $this->hasMany('App\Models\RolePermission', 'role_id', 'id');
    }
    
    /**
     * @return \Illuminate\Database\Eloquent\Relations\HasMany
     */
    public function users()
    {
        return $this->hasMany('App\Models\User', 'role_id', 'id');
    }
    
}
