require 'matrix'

class ExplorableGround
    attr_reader :rows, :cols

    def initialize(rows, cols)
        @rows = rows
        @cols = cols
    end

    def create_explorable_ground
        Matrix.build(rows, cols) { |row, col| col-row}
    end
    
end

puts "Enter the rows quantity"
rows = gets.chomp.to_i

puts "Enter the cols quantity"
cols = gets.chomp.to_i
@explorable_ground = ExplorableGround.new(rows, cols)

puts @explorable_ground.create_explorable_ground