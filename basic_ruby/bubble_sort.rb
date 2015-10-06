def bubble_sort(array = [])
	sorted = false
	while !sorted
		actions = 0
		array[0..-2].each_with_index do |value,index|
			actions += 1 if array[index] > array[index+1]
			array[index],array[index+1] = array[index+1], array[index] if array[index] > array[index+1]
		end
		sorted = true if actions == 0
	end
	puts array.inspect
end


bubble_sort([4,3,78,2,0,2])
 