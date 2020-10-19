def caesar_cipher(phrase,number)
    response = ""
    phrase.split("").to_a.each do |letter_phrase|
        is_capitalized = letter_phrase.match(/[A-Z]/)
        ("a".."z").each_with_index do |letter, index|
            if index+number.to_i >= 26
                index2 = index + number.to_i - 26*((index + number.to_i)/26)
            elsif index+number.to_i < 0
                index2 = index + number.to_i + 26*((index + number.to_i)/-26)
            else
                index2 = index + number.to_i
            end
            if letter_phrase.downcase == " "
                response += " "
                break
            elsif letter_phrase.downcase == letter
                response += is_capitalized ? ("a".."z").to_a[index2].capitalize : ("a".."z").to_a[index2]
                break
            end
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