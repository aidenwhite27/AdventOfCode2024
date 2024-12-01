if __FILE__ == $0
  col1 = Array.new
  col2 = Hash.new
  sum = 0

  File.open('day1input.txt', 'r') do |f|
    f.each_line do |line|
      vals = line.split(field_sep = ' ')
      
      col1.push(Integer(vals[0]))
      val2 = Integer(vals[1])

      if col2.include?(val2)
        col2[val2] += 1
      else
        col2[val2] = 1
      end
    end
  end

  col1.each do |num|
    if col2.include?(num)
      sum += num * col2[num]
    end
  end

  puts sum
end
