require 'test_helper'

def test_topic_missing(object_attr)
  missing_data_assertion(object_attr, @topic)
end

class TopicTest < ActiveSupport::TestCase
  setup do
    @unit = units(:one)
    @topic = Topic.new(
      title: 'topic model',
      order: 3,
      unit_id: @unit.id 
    )
    @other_topic = topics(:one)
  end

  test 'is valid' do 
    assert @topic.valid? 
  end
  
  test 'topic requires title' do
    test_topic_missing('title')
  end

  test 'topic must belong_to unit' do 
    @topic.unit_id = nil
    assert_not @topic.valid? 
  end
  
  test 'topic requires order' do 
    @topic.order = nil
    assert_not @topic.valid? 
  end

  test 'topic order is unique' do 
    @topic.order = @other_topic.order
    assert_not @topic.valid? 
  end 
end
