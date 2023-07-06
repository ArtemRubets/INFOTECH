<?php

namespace App\Http\Requests;

use App\Helpers\Enums\TaskStatuses;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Validation\Rules\Enum;

class TaskRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     */
    public function authorize(): bool
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, \Illuminate\Contracts\Validation\ValidationRule|array|string>
     */
    public function rules(): array
    {
        return [
            'title' => ['required', 'max:191'],
            'description' => ['required'],
            'status' => [new Enum(TaskStatuses::class)],
            'deadline' => ['required', 'date', 'date_format:d-m-Y']
        ];
    }
}
