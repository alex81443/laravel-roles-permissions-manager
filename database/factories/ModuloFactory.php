<?php

namespace Database\Factories;

use App\Models\Modulo;
use Illuminate\Database\Eloquent\Factories\Factory;
use Illuminate\Support\Str;

class ModuloFactory extends Factory
{
    protected $model = Modulo::class;

    public function definition()
    {
        return [
			'nombre' => $this->faker->name,
			'orden' => $this->faker->name,
			'ruta' => $this->faker->name,
			'icono' => $this->faker->name,
        ];
    }
}
