def my_uniq(array)
    raise ArgumentError if !array.is_a?(Array)
    new_array = array.uniq
    new_array
end