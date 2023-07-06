<?php

namespace App\Helpers\Enums;

enum TaskStatuses :string
{
    case Todo = 'todo';
    case Done = 'done';
    case InProgress = 'in_progress';
}
