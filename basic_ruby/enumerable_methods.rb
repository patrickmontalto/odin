module Enumerable
  def my_each
    for i in self
      yield(i)
    end
  end

  def my_each_with_index
    i = 0
    return_array = []
    while i < self.size
      yield(self[i], i)
      return_array << self[i]
      i +=1
    end
    return_array
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
    while !found
      break if i == self.size
      found = yield(self[i])
      i += 1
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



