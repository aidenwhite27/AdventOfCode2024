if __FILE__ == $0

  product = 0
  sum = 0

  File.open('day3input.txt', 'r') do |f|
    inputStr = f.read
    matches = inputStr.scan(/mul\(\d+\d*\d*,\d+\d*\d*\)/)

    matches.each do |str|
      factors = str.match(/(\d+\d*\d*),(\d+\d*\d*)/).captures
      product = Integer(factors[0]) * Integer(factors[1])
      sum += product
    end
  end

  puts sum
end
