<x-app-layout>
    @section('title', $pageTitle)

    @php
        $routeName = \Illuminate\Support\Facades\Route::currentRouteName();
    @endphp

    <h2 class="text-4xl text-center mb-6 font-extrabold">{{ $pageTitle }}</h2>

    <form action="{{ isset($task) ? route('tasks.update', $task) : route('tasks.store') }}" method="POST">
        @csrf

        @isset($task)
            @method('PUT')
        @endisset

        <div class="mb-6 grid md:grid-cols-4 md:gap-6">
            <div class="col-span-2">
                <x-forms.label for="title">{{ __('Title') }}</x-forms.label>
                <x-forms.text-input type="text" name="title" :disabled="$routeName === 'tasks.show'" :model="isset($task) ? $task : null" id="title"/>
            </div>
            <div>
                <x-forms.label for="status">{{ __('Select task status') }}</x-forms.label>
                <x-forms.select id="status" :disabled="$routeName === 'tasks.show'" name="status" :model="isset($task) ? $task : null" :options="$availableStatuses"/>
            </div>
            <div>
                <x-forms.label for="deadline">{{ __('Deadline') }}</x-forms.label>
                <x-forms.date-picker id="deadline" :disabled="$routeName === 'tasks.show'" :model="isset($task) ? $task : null" name="deadline" placeholder="Select date"/>
            </div>
        </div>

        <div class="mb-6 grid md:grid-cols-1">
            <div>
                <x-forms.label for="description">{{ __('Description') }}</x-forms.label>
                <x-forms.textarea id="description" :disabled="$routeName === 'tasks.show'" name="description" :model="isset($task) ? $task : null" class="resize-none" rows="4" placeholder="Type description..."></x-forms.textarea>
            </div>
        </div>

        @if($routeName !== 'tasks.show')
            <x-primary-button>{{ __('Submit') }}</x-primary-button>
        @endif
    </form>
</x-app-layout>
