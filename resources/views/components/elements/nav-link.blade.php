@if( (isset($type) && isset($pattern)) && $type === 'dropdown')

    <button
        type="button"
        aria-controls="dropdown-pages"
        data-collapse-toggle="dropdown-pages"

        {{ $attributes->class(['bg-gray-200' => \Illuminate\Support\Facades\Route::currentRouteNamed($pattern)])->merge([
            'class' => '
                flex
                items-center
                p-2
                w-full
                text-base
                font-medium
                text-gray-900
                rounded-lg
                transition
                duration-75
                group
                hover:bg-gray-200'
        ]) }}>

        {!! $icon !!}
        <span class="flex-1 ml-3 text-left whitespace-nowrap"
        >{{ $slot }}</span>
        <svg
            aria-hidden="true"
            class="w-6 h-6"
            fill="currentColor"
            viewBox="0 0 20 20"
            xmlns="http://www.w3.org/2000/svg"
        >
            <path
                fill-rule="evenodd"
                d="M5.293 7.293a1 1 0 011.414 0L10 10.586l3.293-3.293a1 1 0 111.414 1.414l-4 4a1 1 0 01-1.414 0l-4-4a1 1 0 010-1.414z"
                clip-rule="evenodd"
            ></path>
        </svg>
    </button>

@else
    <a
        href="{{ $url }}"

        {{ $attributes->class(['bg-gray-200' => \Illuminate\Support\Facades\URL::current() == $url])->merge([
            'class' => '
                flex
                items-center
                p-2
                text-base
                font-medium
                text-gray-900
                rounded-lg
                group
                hover:bg-gray-200'
        ]) }}>

        {!! $icon !!}
        <span class="ml-3">{{ $slot }}</span>
    </a>
@endif






