require "TDD"

describe "#my_uniq" do
    subject (:array) { [1, 2, 1, 3, 3]}
    let (:new_array) { [1, 2, 3]} 
    let (:other_array) { [3, 2, 1]}

    it "takes in an array as an arg" do 
        expect { my_uniq("not_array") }.to raise_error(ArgumentError)
        expect { my_uniq(array)}.not_to raise_error
    end

    it "should remove duplicates" do 
        expect(my_uniq(array)).to eq(new_array) # result == new_array
    end

    it "should not mutate original array" do 
        expect(my_uniq(array)).to_not be(array) # result.id != array.id
    end

    it "should return elements in order they first appeared" do
       expect(my_uniq(array)).to_not eq(other_array)
    end
end


describe Array do 
    subject (:array) {[-1, 0, 2, -2, 1]}
    let (:answer) {[[0, 4], [2, 3]]}
    let (:not_answer) {[[2, 3], [0, 4]]}
    describe "#two_sum" do 
        it "should return all pairs of indices whose elements that sum to zero" do 
            expect(array.two_sum).to eq(answer)
        end

        it "should not return elements out of order" do 
            expect(array.two_sum).to_not eq(not_answer)
        end 
    end
end

describe "#my_transpose" do
    subject (:rows) {[
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8]
    ]}

    let (:answer) {[
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8]
    ]}

    it "should not return the original array" do
        expect(my_transpose(rows)).to_not eq(rows)
    end

    it "should make the columns into rows" do 
        expect(my_transpose(rows)).to eq(answer)
    end
end