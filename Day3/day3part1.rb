if __FILE__ == $0

  product = 0
  sum = 0
  enabled = 1

  File.open('day3input.txt', 'r') do |f|
    inputStr = f.read
    matches = inputStr.scan(/do\(\)|don't\(\)|mul\(\d+\d*\d*,\d+\d*\d*\)/)

    matches.each do |str|
      if str == "do()"
        enabled = 1
      elsif str == "don't()"
        enabled = 0
      else
        factors = str.match(/(\d+\d*\d*),(\d+\d*\d*)/).captures
        product = Integer(factors[0]) * Integer(factors[1]) * enabled
        sum += product
      end
    end
  end

  puts sum
end
