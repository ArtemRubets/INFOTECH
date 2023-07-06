<!-- Sidebar -->

<aside
    class="fixed top-0 left-0 z-40 w-64 h-screen pt-16 transition-transform -translate-x-full bg-white border-r border-gray-200 md:translate-x-0"
    aria-label="Sidenav"
    id="drawer-navigation"
>
    <div class="overflow-y-auto py-5 px-3 h-full bg-white">
        <ul class="space-y-2">
            <li>
                <x-elements.nav-link url="/" icon='<svg
                                     aria-hidden="true"
                                     class="w-6 h-6 text-gray-500 transition duration-75 group-hover:text-gray-900"
                                     fill="currentColor"
                                     viewBox="0 0 20 20"
                                     xmlns="http://www.w3.org/2000/svg"
                    >
                    <path d="M2 10a8 8 0 018-8v8h8a8 8 0 11-16 0z"></path>
                    <path d="M12 2.252A8.014 8.014 0 0117.748 8H12V2.252z"></path>
                    </svg>'>
                    {{ __('Home') }}
                </x-elements.nav-link>
            </li>
            <li>
                <x-elements.nav-link type="dropdown" pattern="tasks.*" icon='<svg class="flex-shrink-0 w-5 h-5 text-gray-500 transition duration-75 group-hover:text-gray-900"
                                    aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="currentColor" viewBox="0 0 18 18">
                                    <path
                                        d="M6.143 0H1.857A1.857 1.857 0 0 0 0 1.857v4.286C0 7.169.831 8 1.857 8h4.286A1.857 1.857 0 0 0 8 6.143V1.857A1.857 1.857 0 0 0 6.143 0Zm10 0h-4.286A1.857 1.857 0 0 0 10 1.857v4.286C10 7.169 10.831 8 11.857 8h4.286A1.857 1.857 0 0 0 18 6.143V1.857A1.857 1.857 0 0 0 16.143 0Zm-10 10H1.857A1.857 1.857 0 0 0 0 11.857v4.286C0 17.169.831 18 1.857 18h4.286A1.857 1.857 0 0 0 8 16.143v-4.286A1.857 1.857 0 0 0 6.143 10Zm10 0h-4.286A1.857 1.857 0 0 0 10 11.857v4.286c0 1.026.831 1.857 1.857 1.857h4.286A1.857 1.857 0 0 0 18 16.143v-4.286A1.857 1.857 0 0 0 16.143 10Z"></path>
                    </svg>'>
                    {{ __('Tasks') }}
                </x-elements.nav-link>

                <ul id="dropdown-pages" class="hidden py-2 space-y-2">
                    <li>
                        <x-elements.nav-dropdown-link :url="route('tasks.index')">
                            {{ __('Task List') }}
                        </x-elements.nav-dropdown-link>
                    </li>
                    <li>
                        <x-elements.nav-dropdown-link :url="route('tasks.create')">
                            {{ __('Create') }}
                        </x-elements.nav-dropdown-link>
                    </li>
                </ul>
            </li>

        </ul>
    </div>

</aside>
