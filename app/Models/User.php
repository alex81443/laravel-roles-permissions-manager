<?php

namespace App\Models;

use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Spatie\MediaLibrary\HasMedia;
use Spatie\MediaLibrary\InteractsWithMedia;

class User extends Authenticatable implements HasMedia
{
    use HasFactory, Notifiable, InteractsWithMedia;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'name',
        'email',
        'password',
        'role_id',
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password',
        'remember_token',
    ];

    /**
     * The attributes that should be cast to native types.
     *
     * @var array
     */
    protected $casts = [
        'email_verified_at' => 'datetime',
    ];

    public function setPasswordAttribute($input)
    {
        if ($input) {
            $this->attributes['password'] = app('hash')->needsRehash($input) ? Hash::make($input) : $input;
        }
    }

    public function role(){
        return $this->belongsTo(Role::class);
    }


    static function boot(){
        parent::boot();

        static::created(function(Model $model){
            if($model->role_id == ""){
                $model->update([
                    'role_id' => Role::where('title','user')->first()->id,
                ]);
            }
        });

    }

    public function adminlte_image()
    {
        $usuario=Auth::user();
        
        return $usuario->getFirstMediaUrl('profile_picture');
    }

    public function adminlte_desc()
    {
        return 'That\'s a nice guy';
    }

    public function adminlte_profile_url()
    {
        return 'admin/perfil';
    }

    public function registerMediaCollections(): void
	{
	    $this->addMediaCollection('profile_picture')
	    ->singleFile();
	}

    public function scopePuedeCrearRPT($query, $id_usuario)
    {
        return $query->where([['id', $id_usuario], ['puede_crear_rpt', 1]])->exists();
    }

    public function scopePuedeEditarRPT($query, $id_usuario)
    {
        return $query->where([['id', $id_usuario], ['puede_editar_rpt', 1]])->exists();
    }
}
