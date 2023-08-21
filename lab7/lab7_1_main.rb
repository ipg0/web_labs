# frozen_string_literal: true

require './lab7_1'

generate_file

puts "File generated: #{File.read 'F'}"
puts "Words of length 2: #{count_words_of_length}"
