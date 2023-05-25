<?php

namespace Database\Factories;

use App\Models\Size;
use Illuminate\Database\Eloquent\Factories\Factory;
use Illuminate\Support\Str;

class SizeFactory extends Factory
{
    protected $model = Size::class;

    public function definition()
    {
        return [
			'descripcion' => $this->faker->name,
			'nombreCorto' => $this->faker->name,
        ];
    }
}
