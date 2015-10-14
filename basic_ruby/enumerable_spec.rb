require './enumerable_methods'

describe "Enumerable module methods" do

	before :each do
		@array = [3,12,14]
	end

	describe "#my_each" do
		it "should equal each output" do
			expect(@array.my_each {|x| x}).to eql @array.each {|x| x}
		end
	end

	describe "#my_each_with_index" do
		it 'should equal each_with_index output' do 
			expect(@array.my_each_with_index {|x,i| x }).to eql @array.each_with_index { |x,i| x }
		end
	end

	describe "#my_select" do
		it 'should select appropriate elements in array' do
			expect(@array.my_select { |x| x%3== 0 }).to eql [3,12]
		end
	end

	describe "#my_all?" do
		it "should return false for given condition" do
			expect(@array.my_all? {|x| x > 3}).to eql false
		end

		it "should return true for given condition" do
			expect(@array.my_all? {|x| x > 1}).to eql true
		end
	end

	describe "#my_any?" do
		it "should return false for a given condition" do
			expect(@array.my_any? { |x| x > 20 }).to eql false
		end

		it "should return true for a given condition" do
			expect(@array.my_any? { |x| x > 12}).to eql true
		end
	end

	describe "#my_none?" do
		it "should return false for a given condition" do
			expect(@array.my_none? { |x| x == 3}).to eql false
		end

		it "should return true for a given condition" do
			expect(@array.my_none? { |x| x%5 == 0}).to eql true
		end
	end

	describe "#my_count" do
		it "should count n occurrences in array" do
			array = [1,1,3,3,1,1]
			expect(array.my_count(1)).to eql (4)
		end
	end

	describe "#my_map" do
		it "should return new array elements yielded to block" do
			expect(@array.map {|x| x*2}).to eql [6,24,28]
		end
	end

	describe "#my_inject" do
		it "should yield result identical to inject" do
			expect(@array.my_inject {|sum, num| sum + num }).to eql 29
		end
	end

	describe "#multiply_els" do
		it "should multiply array elements as integers" do
			array = [2,4,5]
			expect(multiply_els(array)).to eql 40
		end
	end

end