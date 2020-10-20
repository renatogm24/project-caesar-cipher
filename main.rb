def caesar_cipher(phrase,number)
    response = ""
    shift = number.to_i
    alphabet = ("a".."z").to_a
    phrase.split("").to_a.each do |character|
        is_capitalized = character.match(/[A-Z]/)
        if alphabet.include?(character.downcase)
          index = alphabet.find_index(character.downcase)
          index_shifted = (index + shift) % 26 
          response += is_capitalized ? alphabet[index_shifted].capitalize : alphabet[index_shifted]
        else
          response += " "
        end
    end
    return response
end

puts "This program applies the caesar cipher from a phrase and shif number the user introduces"

begin
    print "Enter a phrase (only letters):"
    phrase = gets.chomp
end until phrase.chomp.match?(/^[[:alpha:][:blank:]]+$/)

begin
    print "Enter a shift number:"
    number = gets.chomp
end until number.chomp.match?(/\A[-+]?[0-9]*\.?[0-9]+\Z/)

puts "Ciphered phrase (#{number.to_i}) :"
puts caesar_cipher(phrase,number)