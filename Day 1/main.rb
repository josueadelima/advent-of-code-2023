# https://adventofcode.com/2023/day/1

file_path = ARGV[0]
lines = IO.readlines(file_path).map(&:chomp)
sum = 0

def get_number(str_number)
  letter_numbers = {
    one: 1,
    two: 2,
    three: 3,
    four: 4,
    five: 5,
    six: 6,
    seven: 7,
    eight: 8,
    nine: 9,
  }

  return letter_numbers[str_number.to_sym] if str_number.size > 1

  str_number
end

# Optimal solution
lines.each do |line|
  numbers = line.scan(/(?=(\d|one|two|three|four|five|six|seven|eight|nine))/)
  numbers.flatten!
  first = get_number(numbers.first)
  last = get_number(numbers.last)
  sum += "#{first}#{last}".to_i
end

pp sum

sum = 0

# Less optimal
lines.each do |line|
  numbers = line.match(/\d|one|two|three|four|five|six|seven|eight|nine/)
  numbers_reversed = line.reverse.match(/\d|eno|owt|eerht|ruof|evif|xis|neves|thgie|enin/)
  first = get_number(numbers[0])
  last = get_number(numbers_reversed[0].reverse)
  sum += "#{first}#{last}".to_i
end

pp sum
