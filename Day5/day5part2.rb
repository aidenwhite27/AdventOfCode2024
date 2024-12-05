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
    mid = update.size / 2
    arr = update.reverse
    pos = Hash.new(0)
      arr.each_index do |index|
        arr[index..].each do |num|
          if order[arr[index]].include?(num)
            isValid = false

            arr.each do |val|
              arr.each do |val2|
                if order[val].include?(val2)
                  pos[val] += 1
                end
              end
            end

            sorted = pos.sort_by {|k, v| Integer(v)}[mid-1][0]
            sum += Integer(sorted)
            break
          end
        end

        if !isValid
          break
        end

      end

  end

  puts sum
end
