<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class ConektaModel extends Model
{
    use HasFactory;
    public $timestamps = true;
    protected $table = 'conekta';
    protected $fillable = ['metodo','private_key','public_key','private_key_test','public_key_test','estatus','produccion'];
}
