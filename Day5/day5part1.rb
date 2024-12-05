if __FILE__ == $0
  sum = 0
  order = Hash.new
  isUpdates = false
  updates = Array.new

  File.open('day5input.txt', 'r') do |f|
    f.each_line do |line|
      line = line.chomp

      if isUpdates
        updates.push(line.split(","))
        next
      end

      if line.size == 0
        isUpdates = true
        next
      else
        vals = line.split("|")
        first = vals[0]
        second = vals[1]

        if order.include?(first)
          order[first] = order[first].push(second)
        else
          order[first] = [second]
        end
      end

    end
  end

  updates.each do |update|
    isValid = true
    mid = update[update.size/2]
    arr = update.reverse
      arr.each_index do |index|
        arr[index..].each do |num|
          if order[arr[index]].include?(num)
            isValid = false
            break
          end
        end

        if !isValid
         break
        end 
      end

    if isValid
      sum += Integer(mid)
    end

  end

  puts sum
end
