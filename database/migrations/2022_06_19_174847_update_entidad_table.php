<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class UpdateEntidadTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('modulo', function (Blueprint $table) {
            $table->string('permiso')->nullable();
        });
        Schema::table('entidad', function (Blueprint $table) {
            $table->string('permiso')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('modulo', function (Blueprint $table) {
            $table->dropColumn('permiso');
        });
        Schema::table('entidad', function (Blueprint $table) {
            $table->dropColumn('permiso');
        });
    }
}
