def substrings(sentence, dictionary= [])
  strings = sentence.downcase.split
  result = {}

  dictionary.each do |entry|
    count = 0
    strings.each do |word|
      count += 1 if word.include?(entry)
    end
    result[entry] = count unless count == 0
  end
  
  result
end
