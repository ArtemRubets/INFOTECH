@if ($paginator->hasPages())

    <div>
        <p class="text-sm text-gray-700 leading-5">
            {!! __('Showing') !!}
            @if ($paginator->firstItem())
                <span class="font-medium">{{ $paginator->firstItem() }}</span>
                {!! __('to') !!}
                <span class="font-medium">{{ $paginator->lastItem() }}</span>
            @else
                {{ $paginator->count() }}
            @endif
            {!! __('of') !!}
            <span class="font-medium">{{ $paginator->total() }}</span>
            {!! __('results') !!}
        </p>
    </div>

    <nav aria-label="Page navigation example">
        <ul class="inline-flex items-center -space-x-px">
            @if (!$paginator->onFirstPage())
                <li>
                    <a href="{{ $paginator->previousPageUrl() }}"
                            class="block py-2 px-3 ml-0 leading-tight text-gray-500 bg-white rounded-l-lg border border-gray-300 hover:bg-gray-100 hover:text-gray-700 dark:bg-gray-800 dark:border-gray-700 dark:text-gray-400 dark:hover:bg-gray-700 dark:hover:text-white">
                        <span class="sr-only">{{ __('Previous') }}</span>
                        <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                            <path fill-rule="evenodd"
                                  d="M12.707 5.293a1 1 0 010 1.414L9.414 10l3.293 3.293a1 1 0 01-1.414 1.414l-4-4a1 1 0 010-1.414l4-4a1 1 0 011.414 0z"
                                  clip-rule="evenodd"></path>
                        </svg>
                    </a>
                </li>
            @endif


            @foreach ($elements as $element)
                @if (is_array($element))
                    @foreach ($element as $page => $url)
                        @php
                            $lastElement = $paginator->count();

                            $startPage = ($paginator->currentPage() - 3) > $lastElement - 4 ? $lastElement - 4 : $paginator->currentPage() - 3;
                            $endPage = ($paginator->currentPage() + 3) > 5 ? $paginator->currentPage() + 3 : 5;
                        @endphp

                        @if($page >= $startPage && $page <= $endPage)
                            <li>
                                @if($page == $paginator->currentPage())
                                    <span class="py-2 px-3 leading-tight text-gray-700 bg-gray-300 border border-gray-300 hover:bg-gray-200
                                         hover:text-gray-700">
                                        {{ $page }}
                                    </span>
                                @else
                                    <a href="{{ $paginator->url($page) }}"
                                       class="
                                            py-2 px-3 leading-tight text-gray-500 bg-white border border-gray-300 hover:bg-gray-100
                                            hover:text-gray-700">{{ $page }}
                                    </a>
                                @endif

                            </li>
                        @endif
                    @endforeach
                @endif
            @endforeach


            @if ($paginator->hasMorePages())
                <li>
                    <a href="{{ $paginator->nextPageUrl() }}"
                            class="block py-2 px-3 leading-tight text-gray-500 bg-white rounded-r-lg border border-gray-300 hover:bg-gray-100 hover:text-gray-700 dark:bg-gray-800 dark:border-gray-700 dark:text-gray-400 dark:hover:bg-gray-700 dark:hover:text-white">
                        <span class="sr-only">{{ __('Next') }}</span>
                        <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                            <path fill-rule="evenodd"
                                  d="M7.293 14.707a1 1 0 010-1.414L10.586 10 7.293 6.707a1 1 0 011.414-1.414l4 4a1 1 0 010 1.414l-4 4a1 1 0 01-1.414 0z"
                                  clip-rule="evenodd"></path>
                        </svg>
                    </a>
                </li>
            @endif
        </ul>
    </nav>
@endif
