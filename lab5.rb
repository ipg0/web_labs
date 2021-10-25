def calculate_expression x, y, z
    (1 + Math.cos(y - 2)) / (x**4 / 2 + Math.sin(z)**2)
end

def input_and_correct_strings
    print "Number of lines: "
    n = gets.to_i
    result = []
    n.times do | line |
        new_string = ''
        puts "[" + (line + 1).to_s + "] Your string"
        gets.chomp.rstrip.split.each_with_index do | word, index |
            new_string += word + ' ' unless (index % 2 == 1) and ((word[0] == 'c') or (word[0] == 'e'))
            if index % 2 == 1
                unless word[0] == 'e'
                    print "String " + word + " is invalid. New word: "
                    new_string += gets.chomp.rstrip + ' '
                end
            end
        end
        result << new_string.rstrip
    end
    return result
end

p input_and_correct_strings