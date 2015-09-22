# Even Fibonacci Numbers
# Finding the sum of even-valued terms in a fibonacci sequence not exceeding a given number

puts "Enter a number: "
number = gets.chomp.to_i

sum = 0
j = 0
k = 1
i = j + k
sum = 0
while (i < number) do 
  if (i%2 == 0)
    sum += i
  end
  j = k
  k = i
  i = j+k
end

puts "The sum is: " + "#{sum}"