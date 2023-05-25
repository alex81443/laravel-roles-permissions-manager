<?php

namespace Database\Factories;

use App\Models\Color;
use Illuminate\Database\Eloquent\Factories\Factory;
use Illuminate\Support\Str;

class ColorFactory extends Factory
{
    protected $model = Color::class;

    public function definition()
    {
        return [
			'nombre' => $this->faker->name,
			'name' => $this->faker->name,
			'codigo' => $this->faker->name,
        ];
    }
}
