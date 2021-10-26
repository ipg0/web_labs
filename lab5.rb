# frozen_string_literal: true

def calculate_expression(x, y, z)
  (1 + Math.cos(y - 2)) / (x**4 / 2 + Math.sin(z)**2)
end

def correct_string(initial_string)
  corrected_string = ''
  initial_string.chomp.rstrip.split.each_with_index do |word, index|
    corrected_string += "#{word} " unless index.odd? && ((word[0] == 'c') | (word[0] == 'e'))
    if index.odd? && word[0] == 'c'
      print "Word #{word} must be replaced. New word: "
      corrected_string += "#{gets.chomp.rstrip} "
    end
  end
  corrected_string
end

def fetch_input
  print 'Number of strings: '
  n = gets.to_i
  n.times do |line|
    print "[#{line + 1}] Your string: "
    initial_string = gets
    corrected_string = correct_string initial_string
    puts "Initial string: #{initial_string}"
    puts "Corrected string: #{corrected_string}"
  end
end

fetch_input