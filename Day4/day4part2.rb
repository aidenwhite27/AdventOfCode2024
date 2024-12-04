ADJ = [[-1,-1],[0,-1],[1,-1],
       [-1,0],        [1,0],
       [-1,1],[0,1],[1,1]]
WORD = 'XMAS'

if __FILE__ == $0
  sum = 0

  File.open('day4input.txt', 'r') do |f|
    arr = Array.new

    f.each_line do |line|
      arr.push(line)
    end
    
    height = arr.size
    width = arr[0].size

    arr.each_index do |y|
      arr[y].each_char.with_index do |char, x|
        isBorder = false
        if char == 'A'

          ADJ.each do |pair|
            new_x = x + pair[0]
            new_y = y + pair[1]

            if ((new_x)<0) or ((new_x)>=width) or
                ((new_y)<0) or ((new_y)>=height)
              isBorder = true
              break
            end
          end

          if isBorder
            next
          end
         
          if ((arr[y-1][x-1]=='M') and (arr[y-1][x+1]=='M') and
              (arr[y+1][x-1]=='S') and (arr[y+1][x+1]=='S')) or
            ((arr[y-1][x-1]=='M') and (arr[y-1][x+1]=='S') and
             (arr[y+1][x-1]=='M') and (arr[y+1][x+1]=='S')) or
             ((arr[y-1][x-1]=='S') and (arr[y-1][x+1]=='M') and 
              (arr[y+1][x-1]=='S') and (arr[y+1][x+1]=='M')) or
            ((arr[y-1][x-1]=='S') and (arr[y-1][x+1]=='S') and
             (arr[y+1][x-1]=='M') and (arr[y+1][x+1]=='M'))          
            
            sum += 1
          end

        end
      end
    end  

  end

  puts sum
end
