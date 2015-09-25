puts "Welcome to FizzBuzz!"
sleep(1)
puts "What is your low number?"
low = gets.chomp.to_i

puts "What is your high number?"
high = gets.chomp.to_i 

puts "You have entered #{low} and #{high}.\nPlease enter s to start or a to abort."

command = gets.chomp
while (command != "s") && (command != "a")
	puts "You have entered an invalid command. Please try again\n s - start, a - abort."
	command = gets.chomp 
end

if command == "s"
	(low..high).each do |n|
		a = String.new
		a << "Fizz" if n%3 == 0
		a << "Buzz" if n%5 == 0
		puts a if !a.empty?
	end
elsif command == "a"
	puts "Goodbye."		
end

