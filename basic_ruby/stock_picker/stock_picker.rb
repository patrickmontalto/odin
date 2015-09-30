def stock_picker(arr=[])
  difference = 0

  for i in arr[0..-2]
    for j in arr[arr.index(i)..-1]
      diff = j - i
      if diff > difference
        difference = diff
        buy = arr.index(i)
        sell = arr.index(j)
      end
    end
  end

[buy, sell]

end 