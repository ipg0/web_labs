# frozen_string_literal: true

def longest_common_prefix(fstr, gstr)
  fstr.chars.take_while.with_index do |char, index|
    index < gstr.length && char == gstr[index]
  end.join
end

def compose_h(path)
  File.write("#{path}/H",
             longest_common_prefix(
               File.open("#{path}/F").read,
               File.open("#{path}/G").read
             ))
end

def write_f(path)
  File.write("#{path}/F", yield('Contents of F: '))\
end

def write_g(path)
  File.write("#{path}/G", yield('Contents of G: '))
end

def execute(path, &block)
  write_f(path, &block)
  write_g(path, &block)
  compose_h path
rescue StandardError => err
  puts "An error occured: #{err.message}!"
end