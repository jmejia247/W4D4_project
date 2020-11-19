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

def stock_picker(stock_prices)
    days_to_buy = []
    reference = stock_prices.first
    stock_prices.each_with_index do |price, i|
        reference = stock_prices[i] if price < reference
    end
    days_to_buy << stock_prices.index(reference)
    largest = reference
    (days_to_buy[0]..stock_prices.length - 1).each do |i|
        largest = stock_prices[i] if stock_prices[i] > largest
    end
    days_to_buy << stock_prices.index(largest)
    days_to_buy
end