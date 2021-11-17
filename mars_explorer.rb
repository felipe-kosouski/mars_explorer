require 'matrix'

class ExplorableGround
    attr_reader :rows, :cols, :area_permited

    def initialize(rows, cols)
        @rows = rows
        @cols = cols
        @area_permited = create_explorable_ground
    end

    def create_explorable_ground
        Matrix.build(rows, cols) { |row, col| nil}
    end
end

class Probe
    attr_reader :explorable_ground, :position, :direction
    def initialize(explorable_ground, position, direction)
        @explorable_ground = explorable_ground
        @position = position
        @direction = direction
        set_position(position)
    end

    def can_move?(coordinate)
        x, y = coordinate
        max_x, max_y = @explorable_ground.rows, @explorable_ground.cols
        return true if x.between?(0, max_x-1) && y.between?(0, max_y-1)
        false
    end

    def set_position(position)
        x = position[0]
        y = position[1]
        @position = x, y
        @explorable_ground.area_permited[x, y] = self
    end
    

    def move
        start_x, start_y = @position
        new_x, new_y= start_x, start_y+1
        if can_move?([new_x, new_y])
            @position = new_x, new_y
            @explorable_ground.area_permited[start_x, start_y] = nil
            @explorable_ground.area_permited[new_x, new_y] = self    
            return [@position, @direction]
        end
        @position = start_x, start_y
        [@position, @direction]
    end

end


# puts "Enter the rows quantity"
# rows = gets.chomp.to_i

# puts "Enter the cols quantity"
# cols = gets.chomp.to_i
# @explorable_ground = ExplorableGround.new(rows, cols)

# puts @explorable_ground.create_explorable_ground