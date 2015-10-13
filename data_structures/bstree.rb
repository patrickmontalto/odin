require './node'

class BST
  attr_accessor :array, :tree

  def initialize(array, tree=nil)
    @array = array
    @tree = tree

    build_tree(@array)
  end

  def build_tree(array, left = 0, right = array.length -1)
    return if left > right

    array = merge_sort(array)

    index_mid = left + (right-left)/2
    node = Node.new(array[index_mid])

    node.left_child = build_tree(array, left, index_mid-1)
    node.right_child = build_tree(array, index_mid+1, right)

    @tree = node
    @tree
  end

  def bfs(targetValue)
    queue = []
    root_value = @tree.value

    return @tree if root_value == targetValue

    left_child = @tree.left_child
    right_child = @tree.right_child

    queue << left_child if left_child != nil
    queue << right_child if right_child !== nil

    loop do
      return nil if queue.empty?

      node = queue.shift
      return node if node.value == targetValue

      queue << node.left_child if node.left_child != nil
      queue << node.right_child if node.right_child != nil
    end

  end

  def dfs(targetValue)
    stack = [@tree]

    loop do
      return nil if stack.empty?

      node = stack.pop
      return node if targetValue == node.value

      stack << node.left_child if node.left_child != nil
      stack << node.right_child if node.right_child != nil
    end
  end


  def merge_sort(array)
    len = array.length
    return array if len == 1        #Base case set to an array size of 1
    
    array1 = array[0..(len/2)-1]    #Split the array in half
    array2 = array[len/2..-1]       #Array two gets the longer half if it's an odd length
    a1 = merge_sort(array1)         #Split array1 in half again recursively
    a2 = merge_sort(array2)         #Split array2 in half again recursively
    merge(a1, a2)                   #Call the merge function on the split arrays        
  end

  #Helper method for Merge Sort
  def merge(array1, array2, merged_array=[])
    len_of_a1 = array1.length                 #Get length of arrays and compare to the array's index
    len_of_a2 = array2.length
    index1 = 0                          #Set the starting index for both arrays - always 0 since we are going left to right.
    index2 = 0

    while index1 < len_of_a1 and index2 < len_of_a2       #This loop continues until the end of one of the arrays is reached
      if array1[index1] < array2[index2]            #It compares the index values of both arrays, and appends the one that is lower in value
        merged_array << array1[index1]
        index1 += 1
      else
        merged_array << array2[index2]
        index2 += 1
      end
    end

    if index1 < len_of_a1                   #Appends any remaining values to the merged array
      merged_array += array1[index1..-1]            
    elsif index2 < len_of_a2
      merged_array += array2[index2..-1]
    end
    merged_array                        #Returns the merged array
  end

end

