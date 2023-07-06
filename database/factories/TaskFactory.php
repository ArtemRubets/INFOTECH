<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Task>
 */
class TaskFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        return [
            'title' => fake()->words(asText:  true),
            'description' => fake()->sentences(2, true),
            'status' => fake()->randomElement(['done', 'todo', 'in_progress']),
            'deadline' => fake()->dateTimeThisMonth(),
        ];
    }
}
