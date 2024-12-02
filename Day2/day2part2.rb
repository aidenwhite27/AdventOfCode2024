def isRowSafe(vals)
  minDiff = 1
  maxDiff = 3
  isSafe = 1
  isIncreasing = 1

  vals.each_index do |index|
    if index == 0
      next
    end

    if index == 1
      if Integer(vals[0]) - Integer(vals[1]) > 0
        isIncreasing = -1
      end
    end

    prev = Integer(vals[index-1])
    diff = Integer(prev) - Integer(vals[index])
    if (diff * isIncreasing) < 0
      if isIncreasing > 0
        if (diff * -1 < minDiff) || (diff * -1 > maxDiff)
          isSafe = 0
          break
        end
      else
        if (diff < minDiff) || (diff > maxDiff)
          isSafe = 0
          break
        end
      end
    else
      isSafe = 0
      break
    end
  
  end
  
  if isSafe == 1
    return 1
  end
  
  return 0
end


if __FILE__ == $0

  sum = 0

  File.open('day2input.txt', 'r') do |f|
    f.each_line do |line|
      isSafe = 0  
      vals = line.split()

      vals.each_index do |index|
        valsBad = Array.new(vals)
        valsBad.delete_at(index)

        if isRowSafe(valsBad) == 1
          isSafe = 1
          break
        end
      end

      sum += isSafe
    end
  end

  puts sum
end
