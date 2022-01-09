# frozen_string_literal: true

def longest_common_prefix(fstr, gstr)
  fstr.chars.take_while.with_index do |char, index|
    index < gstr.length && char == gstr[index]
  end.join
end

def compose_h(filename_f, filename_g, filename_h)
  File.write(filename_h,
             longest_common_prefix(
               File.read(filename_f),
               File.read(filename_g)
             ))
end

def write_file(filename, contents)
  File.write(filename, contents)
end

def execute(path)
  write_file("#{path}/F", yield('Contents of F: '))
  write_file("#{path}/G", yield('Contents of G: '))
  compose_h("#{path}/F", "#{path}/G", "#{path}/H")
rescue StandardError => err
  puts "An error occurred: #{err.message}!"
end
