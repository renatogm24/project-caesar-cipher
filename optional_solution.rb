  def caesar_cipher(phrase, number)
    response = ""
    str = phrase.split("")
    shift = number.to_i
    #  .ord converts ASCII to keyocede
    str.each do |key| 
      n=key.ord
       # if its between small a-z
      if n>=65 && n<=90
      n = ((n + shift) - 65 ) % 26 + 65
    #  if its between numpad 1 and f11
      elsif n >= 97 && n <= 122
      n = ((n + shift) - 97 ) % 26 + 97
      end
    # converting keycode to ASCII charecter 
      response += n.chr
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