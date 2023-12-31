<div class="relative max-w-sm">
    <div class="absolute inset-y-0 left-0 flex items-center pl-3.5 pointer-events-none">
        <svg class="w-4 h-4 text-gray-500" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="currentColor" viewBox="0 0 20 20">
            <path d="M20 4a2 2 0 0 0-2-2h-2V1a1 1 0 0 0-2 0v1h-3V1a1 1 0 0 0-2 0v1H6V1a1 1 0 0 0-2 0v1H2a2 2 0 0 0-2 2v2h20V4ZM0 18a2 2 0 0 0 2 2h16a2 2 0 0 0 2-2V8H0v10Zm5-8h10a1 1 0 0 1 0 2H5a1 1 0 0 1 0-2Z"/>
        </svg>
    </div>
    <input datepicker datepicker-format="dd-mm-y" type="text" value="{{ old($attributes->get('name'), $model ? $model->{$attributes->get('name')} : '') }}"
        {!! $attributes
->class([
    'bg-red-50 border-red-500 text-red-900 placeholder-red-700 focus:ring-red-500 focus:border-red-500' => $errors->has($attributes->get('name')),
    'cursor-not-allowed bg-gray-200' => $disabled,
    'bg-gray-50' => !$disabled,
    ])
->merge([
    'class' => 'border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full pl-10 p-2.5',
    'disabled' => $disabled,
    'readonly' => $disabled,
    ]) !!}>
</div>

@error($attributes->get('name'))
<p class="mt-2 text-sm text-red-600 dark:text-red-500">{{ $message }}</p>
@enderror
