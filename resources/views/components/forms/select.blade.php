<select {!!
$attributes
->class([
    'bg-red-50 border-red-500 text-red-900 placeholder-red-700 focus:ring-red-500 focus:border-red-500' => $errors->has($attributes->get('name')),
    'cursor-not-allowed bg-gray-200' => $disabled,
    'bg-gray-50' => !$disabled,
    ])
->merge([
    'class' => 'border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5',
    'disabled' => $disabled,
    'readonly' => $disabled,
    ]) !!}>
    @foreach($options as $option)
        <option
            @if(old($attributes->get('name'), $model ? $model->{$attributes->get('name')}->value : '') === $option['value']->value) selected @endif
            value="{{ $option['value'] }}">{{ $option['title'] }}</option>
    @endforeach
</select>
@error($attributes->get('name'))
<p class="mt-2 text-sm text-red-600 dark:text-red-500">{{ $message }}</p>
@enderror
