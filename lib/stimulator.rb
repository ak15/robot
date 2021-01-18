require_relative '../lib/toy_robot.rb'
require_relative '../lib/table.rb'

class Stimulator
  class << self

    def start
      command = ""
      table = Table.new(5,5)
      robot = ToyRobot.new(table)
      puts 'Input Commands'
      while(command != 'report')
        input = gets.chomp.split
        begin
          command = input[0].downcase
          if command == 'place'
            x, y, direction = input[1].downcase.split(',')
            robot.place(x.to_i, y.to_i, direction)
          elsif command == 'move'
            robot.move
          elsif command == 'left'
            robot.rotate('left')
          elsif command == 'right'
            robot.rotate('right')
          end
        rescue RuntimeError => e
          puts e.message
        end
      end
      puts "#{robot.x_axis}, #{robot.y_axis}, #{robot.direction.upcase}"
    end
  end
end

Stimulator.start
=begin
ak@Atuls-MacBook-Pro ~/D/p/toy_robot> ruby lib/stimulator.rb
Input Commands
Place 0,0,North
Move
Report
0, 1, north
ak@Atuls-MacBook-Pro ~/D/p/toy_robot> ruby lib/stimulator.rb
Input Commands
Place 0,0,North
Left
Report
0, 0, WEST
ak@Atuls-MacBook-Pro ~/D/p/toy_robot> ruby lib/stimulator.rb
Input Commands
Place 1,2,east
move
move
left
move
report
3, 3, NORTH
=end
