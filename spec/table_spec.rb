require 'spec_helper'

describe 'Table' do

  it 'initializes table with rows and columns' do
    # initialize
    table = Table.new(4,5)
    # perform
    expect(table.rows).to eql(4)
    expect(table.columns).to eql(5)
    # test
  end
end
