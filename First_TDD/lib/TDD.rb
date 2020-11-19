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

class TowersOfHanoi

    attr_reader :board

    def initialize 
        @board = Array.new(3) {Array.new}
        (1..3).each do |num|
            @board[0] << num 
        end
    end

    def valid_moves?(user_move)
        start, finish = user_move
        #it's not a valid move if :there is a disk smaller 
        #valid move if it's empty or the disk is bigger than self
        if !@board[finish].empty? 
            return false if @board[finish][0] < @board[start][0]
        end
        
        #return false if @board[finish][0] < @board[start][0]
        return true 
    end

    def move 
        user_pos = self.get_move
        start, finish = user_pos 
        if valid_moves?(user_pos)
            @board[finish].unshift(@board[start].shift)
        end
            
    end

    def get_move 
        p "What row do you want to move from, and move to? Enter two numbers, example '0 0'"
        pos = gets.chomp
        final = []
        position = pos.split(" ")
        position.each do |idx|
            final << idx.to_i 
        end
        raise "this spot is empty" if @board[final[0]].empty?
        final 
    end

    def render 
        (0...3).each do |i1|
            puts @board[i1]
        end
    end

    def play 
        self.render 
        until game_over? 
            self.get_move 
            self.move 
            self.render
        end
        puts "Good job!"
    end

    def game_over?
        return true if @board[1] == [1, 2, 3] || @board[2] == [1, 2, 3]
        false
    end
end
