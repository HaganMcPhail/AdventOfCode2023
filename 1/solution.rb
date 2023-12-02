lines = File.open("input.txt").readlines.map(&:chomp)
@word_map = {
  "one" => 1,
  "two" => 2,
  "three" => 3,
  "four" => 4,
  "five" => 5,
  "six" => 6,
  "seven" => 7,
  "eight" => 8,
  "nine" => 9
}

def solve(lines)
  # part1(lines)
  part2(lines)
end

def part1(lines)
  sum = 0
  lines.each do |line|
    first = line[/\d/]
    last = line.reverse[/\d/]
    sum += "#{first}#{last}".to_i
    puts sum
  end
end

def part2(lines)
  sum = 0
  lines.each do |line|
    first = find_first_word_or_digit(line)
    last = find_last_word_or_digit(line)
    puts "#{first}#{last}"
    puts sum += "#{first}#{last}".to_i
  end
end

def find_first_word_or_digit(string)
  string.each_char.with_index do |char, index|
    return char if char =~ /\d/
    @word_map.keys.each do |word|
      return @word_map[word] if string[index, word.length] == word
    end
  end
  nil
end

def find_last_word_or_digit(string)
  string.reverse.each_char.with_index do |char, index|
    return char if char =~ /\d/
    @word_map.keys.each do |word|
      return @word_map[word] if string.reverse[index, word.length] == word.reverse
    end
  end
  nil
end

solve(lines)