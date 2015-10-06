def bubble_sort_by(array=[])
	sorted = false
	while !sorted
		actions = 0
		array[0..-2].each_with_index do |value,index|
			result = yield(array[index],array[index+1])
			actions += 1 if result > 0
			array[index],array[index+1] = array[index+1], array[index] if result > 0
		end
		sorted = true if actions == 0
	end
	puts array.inspect
end

arr = ["hello", "how", "hi", "heyo"]
bubble_sort_by(arr) { |left, right| left.length - right.length}