# Load in the file, truncate to meet crtiteria, and select random word
require 'yaml'

class Hangman
  def initialize
    dictionary = File.open("5desk.txt", 'r') { |file| file.read }
    words = dictionary.split.select { |word| word.length.between?(5,12) }
    @word = words[rand(words.size)].downcase.split('')
    @game_over = false
    @turns = 6
    @guessed_letters = []
    @board = Array.new(@word.length,'_')
  end

  def play(resume = "")
    if resume == "resume"
      puts "Welcome back! You have #{@turns} turns left!"
      display_board
    end
    puts "The word is #{@word.join}" ## DEBUGGING
    result = "You ran out of guesses. The word was #{@word.join}"
    while !@game_over
      @guess = get_letter
      feedback(@guess)
      display_board
      display_info
      @game_over = true if @turns == 0 
      if @board.join == @word.join
        @game_over = true
        result = "You've won! Congratulations."
      end
    end
    puts result
  end

  def get_letter
    guess = ''
    while guess.length != 1
      puts "Enter a letter (A-Z) or say 'guess word':"
      guess = gets.chomp.downcase
      break if guess == 'guess word' || guess == "save game"
    end
    guess
  end

  def feedback(guess)
    if guess.size == 1 && ('a'..'z').include?(guess)
      @guessed_letters << guess
      if @word.include?(guess)
        #add letters to @board where they belong
        @word.each_with_index do |letter, index|
          if letter == guess
            @board[index] = letter
          end
        end
      else
        @turns -=1
        @message = "That's wrong, partner. Try again."
      end
    elsif guess == "guess word"
      # prompt for word and check if they match
      puts "You think you got it? Enter the word:"
      guess = gets.chomp.downcase
      if @word.join == guess
        puts "Darn it, you guessed it! Great job."
        @board = @word
        @game_over = true
      else
        puts "Nope, nice try though! Hehehe..."
        @turns -= 1
      end
    elsif guess == "save game"
      save_game
      guess = get_letter
      feedback(guess)
    else
      puts "You entered an invalid guess (#{guess}). Try again."
      guess = get_letter
      feedback(guess)
    end
  end

  def display_board
    puts @board.join(" ")
  end

  def display_info
    if @game_over == false
      if @turns != 0
        message = "You have #{@turns} turns left before they hang 'em high! \n Used letters: #{@guessed_letters}" 
      else
        message = "Game over, buddy!"
      end
      puts message
    end
  end

  def save_game
    print "Enter name for savefile: "
    save_name = gets.chomp.downcase

    Dir.mkdir('save_files') unless Dir.exist? 'save_files'
    file_name = "save_files/#{save_name}.yaml"

    File.open(file_name, 'w') { |file| file.puts YAML.dump(self) }

    puts "Game saved as #{file_name} !"
  end


end

def load_game
  files = Dir.entries("save_files")
  files.delete_if { |file_name| file_name == "." || file_name == ".." }
  file_number = ""
  until (0..files.size-1).to_a.include?(file_number)
    puts "Enter the number of the save file from below: "
    list_files(files)
    file_number = gets.chomp.to_i
  end

  file_name = files[file_number]
  content = File.open("save_files/#{file_name}", 'r') { |file| file.read }
  YAML.load(content) 
end

def list_files(files)
  n = 0
  files.each do |file|
    puts "#{n} -- #{file}"
    n += 1
  end
end

## Introduction to game
puts "Welcome to Hangman!"
puts "Do you want to load a previous game? (y/n)"
load = gets.chomp.downcase
if load == 'y'
  game = load_game
  game.play("resume")
else
  puts "Randomly selected a word. Let's begin..."
  game = Hangman.new
  sleep(1)
  puts "Say 'save game' to save the game at any time!"
  game.play
end

