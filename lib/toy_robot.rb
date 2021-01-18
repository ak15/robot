class ToyRobot
  attr_reader :table, :x_axis, :y_axis, :direction

  DIRECTIONS = %w[north east south west].freeze

  def initialize(table)
    @table = table
    # @direction = 'SOUTH WEST' its confusing because the direction is placed
    # initially and place also passes direction first time Requirement issue
  end

  def place(x, y, direction)
    raise 'Invalid Position' unless valid_axis?(x, y)
    raise 'Invalid Direction' unless DIRECTIONS.include?(direction)

    @direction = direction
    @x_axis = x
    @y_axis = y
  end

  def move
    raise 'Please Place Robot' if not_placed?

    case direction
    when 'north'
      move_x = 0
      move_y = 1
    when 'east'
      move_x = 1
      move_y = 0
    when 'south'
      move_x = 0
      move_y = -1
    when 'west'
      move_x = -1
      move_y = 0
    else
      move_x = nil
      move_y = nil
    end

    raise 'Invalid Move' unless valid_move?(move_x, move_y)

    @x_axis += move_x
    @y_axis += move_y
  end

  def rotate(side)
    raise 'Please Place Robot' if not_placed?
    raise 'Invalid Side' unless valid_side?(side)

    rotate = side == 'left' ? -1 : 1
    index = DIRECTIONS.index(direction)
    @direction = DIRECTIONS.rotate(rotate)[index]
  end

  def valid_axis?(x, y)
    x >= 0 && x <= table.columns && y >= 0 && y <= table.rows
  end

  def not_placed?
    direction.nil? || x_axis.nil? || y_axis.nil?
  end

  def valid_side?(side)
    %w[left right].include?(side)
  end

  def valid_move?(x, y)
    valid_axis?((x + x_axis), (y + y_axis))
  end
end
