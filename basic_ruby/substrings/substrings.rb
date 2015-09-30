def substrings(sentence, dictionary= [])
  strings = sentence.downcase.split
  result = {}

  if dictionary.include?(str)
    count = 0
    dictionary.each do |entry|
      count += 1 if entry.downcase.include?(str)
    end
    result[str] = count
  end
  result
end