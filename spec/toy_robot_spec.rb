require 'spec_helper'

describe 'ToyRobot' do

  let(:table) { Table.new(5,5) }
  let(:robot) { ToyRobot.new(table) }

  it 'initializes Toy Robot with table' do
    expect(robot.table).to eql(table)
  end

  it 'does not move robot before placement' do
    expect { robot.move }.to raise_error('Please Place Robot')
  end

  it 'places robot' do
    # perform
    robot.place(0, 0, 'north')
    # test
    expect(robot.x_axis).to eql(0)
    expect(robot.y_axis).to eql(0)
    expect(robot.direction).to eql('north')
  end

  it 'does not move robot if out of table' do
    # perform
    robot.place(5, 5, 'north')
    # test
    expect { robot.move }.to raise_error('Invalid Move')
  end

  it 'makes valid move' do
    # perform
    robot.place(0, 1, 'north')
    robot.move
    y_axis = robot.y_axis

    # test
    expect(robot.y_axis).to eql(2)
  end

  it 'rotates left' do
    # perform
    robot.place(0, 1, 'north')
    robot.rotate('left')
    # test
    expect(robot.direction).to eql('west')
  end


  it 'rotates right' do
    # perform
    robot.place(0, 1, 'north')
    robot.rotate('right')
    # test

    expect(robot.direction).to eql('east')
  end
end
