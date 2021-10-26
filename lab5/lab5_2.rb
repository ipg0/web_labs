# frozen_string_literal: true

def correct_word(word, index, string_index)
  if index.odd?
    case word[0].downcase
    when 'e'
      return ''
    when 'c'
      return "#{yield word, index, string_index} "
    end
  end
  "#{word} "
end

def correct_string(string, string_index, &block)
  string.rstrip
        .split
        .map
        .with_index do |word, index|
    correct_word(word, index, string_index, &block)
  end.join
end

def correct_string_array(strings, &block)
  strings.map.with_index do |string, string_index|
    correct_string(string, string_index, &block).rstrip
  end
end
