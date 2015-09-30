def stock_picker(arr=[])
  sell = arr[1..-1].max
  buy = arr[0..arr.index(sell)].min
  [buy, sell]
end