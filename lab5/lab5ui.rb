# frozen_string_literal: true

require './lab5_2'

def wrap_correct(strings)
  correct_string_array(strings) do |word, index, string_index|
    print "The word #{word} at position #{index + 1} in string #{string_index + 1} must be replaced: "
    gets.chomp
  end
end

def init_ui
  print 'How many strings do you wish to process? '
  strings = []
  gets.to_i.times do |index|
    print "#{index}: "
    strings << gets.chomp
  end
  puts "Input data: #{strings}"
  puts "Output data: #{wrap_correct(strings)}"
end

init_ui
