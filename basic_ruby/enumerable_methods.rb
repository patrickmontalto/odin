module Enumerable
  def my_each
    for i in self
      yield(i)
    end
  end

  def my_each_with_index
    i = 0
    while i < self.size
      yield(self[i], i)
      i +=1
    end
  end

  def my_select
    return_array = []
    for i in self
      return_array << i if yield(i) == true
    end
    return_array
  end

  def my_all?
    result = true
    i = 0
    while i < self.size
      result = false if yield(self[i]) == false
      i += 1
    end
    result
  end

  def my_any?
    found = false
    i = 0
    while i !found
      break if i == self.size
      found = yield(self[i])
    end
    found
  end

  def my_none?
    none = true
    i = 0
    while i < self.size
      none = false if yield(self[i])
      i += 1 
    end
    none
  end

  def my_count(number)
    count = 0
    for i in self
      count += 1 if i == number
    end
    count
  end

  def my_map
    return_array = []
    for i in self
      return_array << yield(i)
    end
    return_array
  end

  def my_inject(sum = 0)
    for i in self
      sum = yield(sum, i)
    end
    sum
  end

end

def multiply_els(array = [])
  array.my_inject(1) {|sum, num| sum*num}
end


###################
# DEBUGGING
###################

array = [3,12,14]

# Test my_each
array.my_each do |x|
  puts x
end

# Test my_each_with_index
array.my_each_with_index  {|x, i| puts "#{x} is at index: #{i}" }

# Test my_select
puts (array.my_select {|x| x%3 == 0}).inspect

# Test my all.
print "should return false: "
puts array.my_all? {|x| x > 3}
print "should return true: "
puts array.my_all? {|x| x > 1}

# Test any? 
print "should return true: "
puts array.any? {|x| x > 12}
print "should return false: "
puts array.any? {|x| x > 20}

# Test my_none?
print "should return true: "
puts array.my_none? {|x| x < 2}
print "should return false: "
puts array.my_none? {|x| x < 20}

# Test my_count
print "should return 3: "
puts [1,2,1,1,4].my_count(1)

# Test my_map
print "should return [4, 9, 16]: "
puts ([2,3,4].my_map {|x| x**2 }).inspect

# Test my_inject
print "should return 30: "
puts ([2,3,4].my_inject(1) {|sum, num| sum + num**2})

# Test multiply_els
print "should return 40: "
puts multiply_els([2,4,5])



