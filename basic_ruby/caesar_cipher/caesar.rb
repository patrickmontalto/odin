# Caesar Cipher for Basic Ruby. It will shift each letter left by the number provided
def caesar_cipher(str, n)
  alphabet = %w(a b c d e f g h i j k l m n o p q r s t u v w x y z)
  string = str.split('')
  new_string = String.new

  string.each do |char|
    if alphabet.include?(char.downcase)
      shifted_index = alphabet.index(char.downcase)-n # get shifted index
      shifted_char = alphabet[shifted_index]
      shifted_char = shifted_char.upcase if char == char.upcase # get shifted char and capitalize unless not capitalized
    else
      shifted_char = char
    end
    new_string += shifted_char
  end
  new_string
end