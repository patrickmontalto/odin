def fibs(n)
  sequence = [0,1]
  if n == 1
    return sequence[0]
  elsif n == 2
    return sequence
  else
    (n-2).times do
      sequence << sequence[-2] + sequence[-1]
    end
  end
  sequence
end

puts "#{fibs(1).inspect}"

puts "#{fibs(2).inspect}"

puts "#{fibs(6).inspect}"

def fibs_rec(n, a = 0, b = 1, result = '0')
  n > 0 ? fibs_rec(n - 1, b, b + a, result += " #{b}") : result
end

def fibs_rec(n)
  return [0] if n == 0
  return [0,1] if n == 1
  sequence = fibs_rec (n-1)
  sequence << sequence[-2] + sequence[-1]
end


puts "Recursive:"

puts "#{fibs_rec(3).inspect}"