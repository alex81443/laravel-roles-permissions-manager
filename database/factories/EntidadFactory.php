<?php

namespace Database\Factories;

use App\Models\Entidad;
use Illuminate\Database\Eloquent\Factories\Factory;
use Illuminate\Support\Str;

class EntidadFactory extends Factory
{
    protected $model = Entidad::class;

    public function definition()
    {
        return [
			'nombre' => $this->faker->name,
			'orden' => $this->faker->name,
			'ruta' => $this->faker->name,
			'icono' => $this->faker->name,
			'modulo_id' => $this->faker->name,
        ];
    }
}
