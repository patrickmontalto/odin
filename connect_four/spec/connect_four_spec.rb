require 'spec_helper'

describe "Connect Four" do
	describe Game do

		let(:player1) { Player.new("Hank")}
		let(:player2) { Player.new("Bob") }
		let(:game) { Game.new(player1, player2) }


		describe "#new" do
			it "creates a new game" do
				expect(game).to be_an_instance_of Game
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
				allow(game).to receive(:winner).and_return(player1)
				game.start
			end
		end

	end
end