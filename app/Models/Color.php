<?php 

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Color extends Model
{
	use HasFactory,SoftDeletes;
	
    public $timestamps = true;

    protected $table = 'colors';

    protected $fillable = ['nombre','name','codigo'];
	
}
