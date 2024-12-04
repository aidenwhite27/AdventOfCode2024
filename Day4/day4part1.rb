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
        if char == 'X'
          
          ADJ.each do |pair|
            letter = 1
            new_x = x
            new_y = y

            while letter < WORD.size
              new_x += pair[0]
              new_y += pair[1]

              if ((new_x)<0) or ((new_x)>=width) or
                  ((new_y)<0) or ((new_y)>=height)
                break
              end
              
              if (arr[new_y][new_x]=='S') and (arr[new_y-pair[1]][new_x-pair[0]]=='A')
                sum += 1  
                break
              elsif arr[new_y][new_x]==WORD[letter]
                letter += 1
              else
                break
              end
            end

          end

        end
      end
    end  

  end

  puts sum
end
