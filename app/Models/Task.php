<?php

namespace App\Models;

use App\Helpers\Enums\TaskStatuses;
use Carbon\Carbon;
use DateTimeInterface;
use Illuminate\Database\Eloquent\Casts\Attribute;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class Task extends Model
{
    use HasFactory;

    protected $casts = [
        'status' => TaskStatuses::class,
    ];

    protected $fillable = [
        'title',
        'description',
        'status',
        'deadline',
    ];

    protected function deadline(): Attribute
    {
        return Attribute::make(
            get: fn (string|\DateTime $value) => Carbon::createFromFormat('Y-m-d', $value)->format('d-m-Y'),
            set: fn (string|\DateTime $value) => Carbon::createFromFormat('d-m-Y', $value)->format('Y-m-d')
        );
    }

    public function user(): BelongsTo
    {
        return $this->belongsTo(User::class);
    }
}
