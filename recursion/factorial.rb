def factorial(number)
  n = number - 1
  if n == 0
    1
  else
    number * factorial(n)
  end
end

puts factorial(3)