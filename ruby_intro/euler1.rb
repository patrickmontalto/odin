# Multiples of 3 and 5
# Finding the sum of all the multiples of 3 or 5 below a given number
puts "Enter a number: "
number = gets.chomp.to_i
i = 0
sum = 0
while i < number do
  if ((i % 3 == 0) ||(i % 5 == 0))
    sum += i
  end
  i += 1
end

puts "The sum is: " + "#{sum}"
