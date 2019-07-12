require 'test_helper'

class UnitTest < ActiveSupport::TestCase
  setup do
    @unit = Unit.new(title: 'test', order: 99)
    @other_unit = units(:one)
  end

  test 'is valid' do
    assert @unit.valid?
  end

  test 'requires title' do
    @unit.title = ''
    assert_not @unit.valid?
  end 

  test 'requires order' do
    @unit.order = nil
    assert_not @unit.valid?
  end 


  test 'unit order is unique' do
    @unit.order = @other_unit.order
    assert_not @unit.valid? 
  end 


end
