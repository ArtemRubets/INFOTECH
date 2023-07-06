<?php

namespace App\Http\Controllers;

use App\Helpers\Enums\TaskStatuses;
use App\Http\Requests\TaskRequest;
use App\Models\Task;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Gate;
use Illuminate\Support\Facades\Redirect;

class TaskController extends BaseController
{

    public function __construct()
    {
        $this->availableStatuses = collect([
            [
                'title' => 'Todo',
                'value' => TaskStatuses::Todo,
            ],
            [
                'title' => 'Done',
                'value' => TaskStatuses::Done,
            ],
            [
                'title' => 'In Progress',
                'value' => TaskStatuses::InProgress,
            ],
        ]);
    }

    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $this->tasks = Task::query()->orderByDesc('created_at')->paginate(10);

        $this->pageTitle = 'Task list';

        return view('tasks.index', $this->data);
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        $this->pageTitle = 'Create new task';

        return view('tasks.form', $this->data);
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(TaskRequest $request)
    {
        $data = $request->validated();

        DB::beginTransaction();

        try {
            Task::create($data);

            DB::commit();

            return Redirect::route('tasks.index')->with('message', 'The task created successfully');

        } catch (\Exception $exception) {
            DB::rollBack();

            return Redirect::route('tasks.index')->with([
                'success' => false,
                'message' => $this->getErrorMessage($exception),
            ]);
        }
    }

    /**
     * Display the specified resource.
     */
    public function show(Task $task)
    {
        $this->task = $task;
        $this->pageTitle = 'View task';

        return view('tasks.form', $this->data);
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Task $task)
    {
        Gate::authorize('update', $task);

        $this->pageTitle = 'Task update';
        $this->task = $task;

        return view('tasks.form', $this->data);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(TaskRequest $request, Task $task)
    {
        Gate::authorize('update', $task);

        $data = $request->validated();

        DB::beginTransaction();

        try {
            $task->update($data);

            DB::commit();

            return Redirect::route('tasks.index')->with('message', 'The task updated successfully');

        } catch (\Exception $exception) {
            DB::rollBack();

            return Redirect::route('tasks.index')->with([
                'success' => false,
                'message' => $this->getErrorMessage($exception),
            ]);
        }
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Task $task)
    {
        Gate::authorize('delete', $task);

        DB::beginTransaction();

        try {

            $task->delete();

            DB::commit();

            return Redirect::route('tasks.index')->with('message', 'The task deleted successfully');

        } catch (\Exception $exception) {
            DB::rollBack();

            return Redirect::route('tasks.index')->with([
                'success' => false,
                'message' => $this->getErrorMessage($exception),
            ]);
        }
    }
}
