require 'spec_helper'
describe Player do
  let(:player) { Player.new("Jeff") }

  describe "#new" do
    it "creates a new player when given a string" do
      expect(player).to be_an_instance_of(Player)
    end

    it "rejects non-strings as names" do
      names = [1, [2,3], 3.00]
      for name in names
        expect { Player.new(name) }.to raise_error("Please enter a string")
      end
    end

  end
end

describe "Connect Four" do
	describe Game do

		let(:player1) { Player.new("Hank")}
		let(:player2) { Player.new("Bob") }
		let(:game) { Game.new(player1, player2) }


		describe "#new" do
			it "creates a new game" do
				expect(game).to be_an_instance_of Game
			end
      it "assigns black circle to player 1" do
        expect(game.player1.marker).to eql "\u25cf"
      end
      it "assigns white circle to player 2" do
        expect(game.player2.marker).to eql "\u25cb"
      end
			it "takes two player objects as arguments" do
				expect(game.player1).to be_an_instance_of Player
				expect(game.player2).to be_an_instance_of Player
			end
			it "puts a welcome message" do
				game = Game.allocate
				expect(game).to receive(:puts).with("Welcome to the game!")
				game.send(:initialize, player1, player2)
			end
			it "rejects non-player arguments" do
				game = Game.allocate
				expect(game).to receive(:puts).with("Those are not players")
				game.send(:initialize, "Bob", [0,1,2,3])
			end

		end

		describe "#start" do
		
			it "congratulates player upon winning" do
				expect(game).to receive(:puts).with("#{player1.name} has won!")
				allow(game).to receive(:check_board).and_return(player1)
				game.start
			end
		end

		describe "#get_move" do

			it "asks for appropriate players move" do
				allow(game).to receive(:gets).and_return("A")
				expect(game).to receive(:puts).with("#{player1.name}'s, please enter a column (A..G):")
				game.get_move(player1)
			end

			it "should receive input from player" do
				allow(game).to receive(:gets).and_return("A")
				expect(game).to receive(:gets)
				game.get_move(player1)
			end

		end

    describe "#valid_move?" do

      it "accepts valid columns" do
        letters = ("a".."g").to_a
        valid_moves = letters
        valid_moves.each do |valid_move|
          expect(game.valid_move?(valid_move)).to eql true
        end
      end

      it "accepts valid columns up to 5 rows" do
        game.board["a"] = [1,2,3,4,5]
        expect(game.valid_move?("a")).to eql true
      end

      it "rejects off-board moves" do
        expect(game.valid_move?("z")).to eql false
        expect(game.valid_move?("p1")).to eql false
        expect(game.valid_move?("b3")).to eql false
        expect(game.valid_move?("cd")).to eql false
      end
      it "rejects used moves" do
        game.board["a"] = [1,2,3,4,5,6]
        expect(game.valid_move?("a")).to eql false
      end
    end

    describe "#place_move" do
      it "places moves on the board" do
        game.place_move("a",player1)
        expect(game.board["a"][0]).to eql "\u25cf"
        game.place_move("b",player1)
        expect(game.board["b"][0]).to eql "\u25cf"
      end

      it "places markers sequentially in a column" do
        6.times { game.place_move("a",player1) }
        0.upto(5) { |i| expect(game.board["a"][i]).to eql "\u25cf"}
      end
    end

    describe "#print_board" do
      it "shows the current game board" do
        3.times { game.place_move("a",player1) }
        2.times { game.place_move("b",player2) }
        3.times { game.place_move("g",player1) }
        expect(game).to receive(:puts).with(
          " A | B | C | D | E | F | G 
 --+---+---+---+---+---+-- 
   |   |   |   |   |   |   
 --+---+---+---+---+---+-- 
   |   |   |   |   |   |   
 --+---+---+---+---+---+-- 
   |   |   |   |   |   |   
 --+---+---+---+---+---+-- 
 ● |   |   |   |   |   | ● 
 --+---+---+---+---+---+-- 
 ● | ○ |   |   |   |   | ● 
 --+---+---+---+---+---+-- 
 ● | ○ |   |   |   |   | ● 
 --+---+---+---+---+---+--")
        game.print_board
      end
    end

    describe "#check_board" do
      it "returns player when player wins vertically" do
        4.times { game.place_move("a", player1) }
        expect(game.check_board).to eql player1
      end
      it "returns false when no winners were found" do
        3.times { game.place_move("a",player1) }
        2.times { game.place_move("b",player2) }
        3.times { game.place_move("g",player1) }
        expect(game.check_board).to eql false
      end
      it "returns player when player wins horizontally" do
        game.place_move("a",player1)
        game.place_move("b",player1)
        game.place_move("c",player1)
        game.place_move("d",player1)
        expect(game.check_board).to eql player1
      end
    end

	end
end











