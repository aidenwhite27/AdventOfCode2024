if __FILE__ == $0
  sum = 0
  rows = Array.new
  x = 0
  y = 0
  moves = [[0,-1],[1,0],[0,1],[-1,0]]
  moveIndex = 0

  File.open('day6input.txt', 'r') do |f|
    count = 0
    f.each_line do |line|
      line.each_char.with_index do |char, index|
        if line[index] == '^'
          x = index
          y = count
        end
      end
      rows.push(line)
      count += 1
    end
  end

  height = rows.size
  width = rows[0].size

  rows[y][x] = 'X'
  while ((x > 0) and (x < width) and (y > 0) and (y < height))
    nextX = x + moves[moveIndex][0]
    nextY = y + moves[moveIndex][1]

    if ((nextX < 0) or (nextX >= width) or (nextY < 0) or (nextY >= height))
      break
    end 

    if rows[nextY][nextX] == '#'
      if moveIndex == 3
        moveIndex = 0
      else
        moveIndex += 1
      end
    end

    x = x + moves[moveIndex][0]
    y = y + moves[moveIndex][1]

    rows[y][x] = 'X'
  end 

  rows.each do |row|
    row.each_char do |char|
      # print char
      if char == 'X'
        sum += 1
      end
    end
    # print "\n"
  end

  puts sum
end
