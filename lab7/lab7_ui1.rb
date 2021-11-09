# frozen_string_literal: true

require './lab7_1'

def init_ui
  print 'Path to execute: '
  execute(gets.chomp) do |prompt|
    print prompt
    gets.chomp
  end
end

init_ui
