<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;



class Firstlogin extends Model
{
    public $timestamps = true;

    protected $table = 'firstlogin';

    protected $fillable = ['id_usuario','id_role'];
	
}
