if __FILE__ == $0
  col1 = Array.new
  col2 = Array.new
  sum = 0

  File.open('day1input.txt', 'r') do |f|
    f.each_line do |line|
      vals = line.split(field_sep = ' ')
      col1.push(Integer(vals[0]))
      col2.push(Integer(vals[1]))
    end
  end

  col1.sort!
  col2.sort!

  col1.each_index do |index|
    val1 = col1[index]
    val2 = col2[index]
    if val1 > val2
      sum += val1 - val2
    else
      sum += val2 - val1
    end
  end

  puts sum
end
