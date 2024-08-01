# https://adventofcode.com/2023/day/2

file_path = ARGV[0]
lines = IO.readlines(file_path).map(&:chomp)

def get_name_id(line)
  line.match(/\d+/)[0].to_i
end

def get_max_red(line)
  line.scan(/(\d+) red/).flatten.map(&:to_i).max
end

def get_max_blue(line)
  line.scan(/(\d+) blue/).flatten.map(&:to_i).max
end

def get_max_green(line)
  line.scan(/(\d+) green/).flatten.map(&:to_i).max
end

def parse_line(line)
  [
    get_name_id(line),
    get_max_red(line),
    get_max_green(line),
    get_max_blue(line),
  ]
end

def valid_line(red, green, blue)
  max_red = 12
  max_green = 13
  max_blue = 14

  red <= max_red && green <= max_green && blue <= max_blue
end

# Part one
sum = 0
lines.each do |line|
  parsed_line = parse_line(line)
  sum += parsed_line[0] if valid_line(parsed_line[1], parsed_line[2], parsed_line[3])
end
pp sum

# Part two
sum = 0
lines.each do |line|
  parsed_line = parse_line(line)
  parsed_line.shift
  sum += parsed_line.reduce(:*)
end
pp sum
