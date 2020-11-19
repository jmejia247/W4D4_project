def my_uniq(array)
    raise ArgumentError if !array.is_a?(Array)
    new_array = array.uniq
    new_array
end

class Array 
    def two_sum 
        pairs = []
        self.each_with_index do |ele, i|
            self.each_with_index do |ele2, i2|
                pairs << [i, i2] if i2 > i && ele + ele2 == 0
            end
        end
        pairs
    end
end

def my_transpose(array)
    array.transpose
end