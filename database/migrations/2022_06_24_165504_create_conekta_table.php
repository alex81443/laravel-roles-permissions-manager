<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateConektaTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('conekta', function (Blueprint $table) {
            $table->id();
            $table->string('metodo');
            $table->string('private_key');
            $table->string('public_key');
            $table->string('private_key_test');
            $table->string('public_key_test');
            $table->integer('estatus');
            $table->integer('produccion');
            $table->timestamps();
            //$table->softDeletes();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('conekta');
    }
}
