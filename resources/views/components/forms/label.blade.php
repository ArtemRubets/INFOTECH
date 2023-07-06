@props(['value'])
<label {{ $attributes->class(['text-red-700' => $errors->has($attributes->get('for'))])->merge(['class' => 'block mb-2 text-sm font-medium text-gray-900']) }}>
    {{ $value ?? $slot }}
</label>
