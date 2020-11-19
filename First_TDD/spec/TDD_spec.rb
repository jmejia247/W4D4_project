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

