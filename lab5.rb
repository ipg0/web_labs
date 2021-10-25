def calculate_expression x, y, z
    (1 + Math.cos(y - 2)) / (x**4 / 2 + Math.sin(z)**2)
end

def correct_strings
    print "Number of strings: "
    n = gets.to_i
    n.times do | line |
        corrected_string = ''
        print "[" + (line + 1).to_s + "] Your string: "
        initial_string = gets
        initial_string.chomp.rstrip.split.each_with_index do | word, index |
            corrected_string += word + ' ' unless (index % 2 == 1) and ((word[0] == 'c') or (word[0] == 'e'))
            if index % 2 == 1 && word[0] == 'c'
                print "Word " + word + " must be replaced. New word: "
                corrected_string += gets.chomp.rstrip + ' '
            end
        end
        puts "Initial string: " + initial_string
        puts "Corrected string: " + corrected_string
    end
end

correct_strings