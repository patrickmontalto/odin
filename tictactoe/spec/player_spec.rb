require_relative '../player'

describe Player do

	describe "#new" do
		it "creates a player with two arguments" do
			expect(Player.new("Hank", "X")).to be_an_instance_of Player
		end

		it "gives an ArgumentError when not given 2 args" do
			expect( lambda {Player.new("Hank", "X", "O")}).to raise_exception ArgumentError
		end
	end

end