require_relative '../tictactoe'
require 'spec_helper'

describe TicTacToe do
	before :each do
		players = ["Bob", "Kurt"]
		@game = TicTacToe.new(players)
	end

	describe "#new" do
		it "takes an array of player parameters" do
			expect(@game).to be_an_instance_of TicTacToe
		end

		it "gives an error when not given array of 2 name strings" do
			expect( lambda {TicTacToe.new("Hank") } ).to raise_exception("Expected array of 2 player name strings")
		end

		it "assigns players correctly" do
			expect(@game.player1.name).to eql "Bob"
			expect(@game.player2.name).to eql "Kurt"
		end

		it "initializes the board properly" do
			expect(@game.board).to eql [[1,2,3],[4,5,6],[7,8,9]]
		end

	end

	describe "#place_shape" do
		it "marks the board with players shape at provided location" do
			@game.place_shape(@game.player1.shape,1)
			expect(@game.board).to eql [["O",2,3],[4,5,6],[7,8,9]]
		end
	end

	describe "#play" do
		it "rejects locations not from 1 to 9" do
			@game.stub(:gets) do
				@counter ||= 0
	  		response = if @counter > 3 # an arbitrary threshold
              		 	"10"
            			 else
             			 	"1"
            			 end
				@counter += 1
  			response
			end
			expect(@game).to receive(:print_board)
			@game.play(@game.player1)
		end
	end
	
	describe "#winner_check" do
		context 'where O wins' do
			it "recognizes a diagonal win" do
				@game.instance_variable_set(:@board, [["O",2,3],[4,"O",6],[7,8,"O"]])
				expect(@game.winner_check(@game.player1)).to eql true
			end
			it "recognizes a win across a row" do
				@game.instance_variable_set(:@board, [["O","O","O"],[4,5,6],[7,8,9]])
				expect(@game.winner_check(@game.player1)).to eql true
			end
			it "recognizes a win down a column" do
				@game.instance_variable_set(:@board, [["O",2,3],["O",5,6],["O",8,9]])
				expect(@game.winner_check(@game.player1)).to eql true
			end
		end
		context 'where X wins' do
			it "recognizes a diagonal win" do
				@game.instance_variable_set(:@board, [["X",2,3],[4,"X",6],[7,8,"X"]])
				expect(@game.winner_check(@game.player2)).to eql true
			end
			it "recognizes a win across a row" do
				@game.instance_variable_set(:@board, [["X","X","X"],[4,5,6],[7,8,9]])
				expect(@game.winner_check(@game.player2)).to eql true
			end
			it "recognizes a win down a column" do
				@game.instance_variable_set(:@board, [["X",2,3],["X",5,6],["X",8,9]])
				expect(@game.winner_check(@game.player2)).to eql true
			end
		end
	end

	describe "#check_board" do
		it "returns true when the board is full" do
			@game.instance_variable_set(:@used_loc, [1,2,3,4,5,6,7,8,9])
			expect(@game.check_board).to eql true
		end
		it "returns false when the board is not full" do
			@game.instance_variable_set(:@used_loc, [1,2,3]) 
			expect(@game.check_board).to eql false
		end
	end
	

end