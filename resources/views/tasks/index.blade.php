<x-app-layout>
    @section('title', $pageTitle)

    @if(session()->has('message') && !session()->exists('success'))
        <x-elements.toast-success>{{ session()->get('message') }}</x-elements.toast-success>
    @endif

    @if(session()->exists('success') && session()->get('success') === false )
        <x-elements.toast-error>{{ session()->get('message') }}</x-elements.toast-error>
    @endif

    <h2 class="text-4xl text-center mb-6 font-extrabold">{{ $pageTitle }}</h2>

    <div class="relative overflow-x-auto shadow-md sm:rounded-lg">
        <table class="w-full text-sm text-left text-gray-500">
            <thead class="text-xs text-gray-700 uppercase bg-gray-50">
            <tr>
                <th scope="col" class="px-6 py-3">
                    #
                </th>
                <th scope="col" class="px-6 py-3">
                    Title
                </th>
                <th scope="col" class="px-6 py-3">
                    Description
                </th>
                <th scope="col" class="px-6 py-3">
                    Status
                </th>
                <th scope="col" class="px-6 py-3">
                    Deadline
                </th>
                <th scope="col" class="px-6 py-3">
                    Actions
                </th>
            </tr>
            </thead>
            <tbody>

                @foreach($tasks as $task)
                    <tr class="bg-white border-b hover:bg-gray-50">
                        <td class="px-6 py-4">
                            {{ $loop->iteration }}
                        </td>
                        <th scope="row" class="px-6 py-4 font-medium text-gray-900 whitespace-nowrap dark:text-white">
                            <a class=" hover:underline text-blue-500" href="{{ route('tasks.show', $task->id) }}">{{ $task->title }}</a>
                        </th>
                        <td class="px-6 py-4 w-2/5">
                            {{ $task->description }}
                        </td>
                        <td class="px-6 py-4">
                            {{ $availableStatuses->where('value', $task->status)->pluck('title')->first() }}
                        </td>
                        <td class="px-6 py-4">
                            {{ $task->deadline }}
                        </td>
                        <td class="px-6 py-4">
                            @can('update', $task)
                                <x-elements.buttons.button-link-primary class="mr-3" href="{{ route('tasks.edit', $task->id) }}">{{ __('Edit') }}</x-elements.buttons.button-link-primary>
                            @endcan
                            @can('delete', $task)
                                <form class="inline-block" action="{{ route('tasks.destroy', $task->id) }}" method="POST">
                                    @csrf
                                    @method('DELETE')
                                    <x-elements.buttons.button-danger>{{ __('Delete') }}</x-elements.buttons.button-danger>
                                </form>
                            @endcan
                        </td>
                    </tr>
                @endforeach

            </tbody>

        </table>


    </div>

    <div class="pt-3 flex justify-between items-center">
        {{ $tasks->links('components.pagination') }}
    </div>



</x-app-layout>
