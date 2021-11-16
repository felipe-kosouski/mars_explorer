require 'matrix'

class ExplorableGround
    attr_reader :rows, :cols

    def initialize(rows, cols)
        @rows = rows
        @cols = cols
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

    def can_move?
        true
    end

    def set_position(position)
        x = position[0]
        y = position[1]
        @explorable_ground[x, y] = self
    end
    

    def move
        if self.can_move?
            start_x, start_y = @position
            new_x, new_y= start_x, start_y+1
            @position = new_x, new_y
            @explorable_ground[start_x, start_y] = nil
            @explorable_ground[new_x, new_y] = self
        end
    end
    

end


# puts "Enter the rows quantity"
# rows = gets.chomp.to_i

# puts "Enter the cols quantity"
# cols = gets.chomp.to_i
# @explorable_ground = ExplorableGround.new(rows, cols)

# puts @explorable_ground.create_explorable_ground