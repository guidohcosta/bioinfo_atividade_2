require_relative './element.rb'
require_relative './sequence.rb'

def create_lib(data, base)
  data_f = File.open(data)
  base_f = File.open(base)

  output = parsed_output(data_f.read)
  content = base_string(base_f.read)

  sequences = output.map { |element| Sequence.new(content, element) }

  new_lib = sequences.each_with_index.inject('') do |acc, pair|
    sequence, index = pair
    acc += ">COPIA1_#{index}\n"
    acc += "#{sequence.lib}\n"
  end

  output = File.new('new_lib.out', 'w+')
  output.write(new_lib)
ensure
  output.close
end

def base_string(file)
  file.
    each_line.
    drop(1).
    join('').
    gsub("\n", '')
end

def parsed_output(data)
  data.
    split("\n").
    map { |line| line.split(';') }.
    map { |element| Element.new(element) }
end

create_lib(ARGV[0], ARGV[1])
