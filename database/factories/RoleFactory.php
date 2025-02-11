<?php

namespace Database\Factories;

use App\Models\Role;
use Illuminate\Database\Eloquent\Factories\Factory;
use Illuminate\Support\Str;

class RoleFactory extends Factory
{
    protected $model = Role::class;

    public function definition()
    {
        return [
			'title' => $this->faker->name,
			'short_code' => $this->faker->name,
        ];
    }
}
