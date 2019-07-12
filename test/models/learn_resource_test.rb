# frozen_string_literal: true

require 'test_helper'
require 'pry'
class LearnResourceTest < ActiveSupport::TestCase
  setup do
    @resource = LearnResource.new(
      title: 'test resource',
      url: 'www.someresource.com',
      user_id: users(:test_user1).id
    )
    @topic1 = topics(:one)
    @topic2 = topics(:two)
  end

  teardown do
    @resource.delete
  end

  test 'is valid' do
    assert @resource.valid?
  end

  test 'requires title' do
    @resource.title = ''
    assert_not @resource.valid?
  end

  test 'belongs to user' do
    @resource.user_id = nil
    assert_not @resource.valid?
  end

  test 'resource has many topics' do
    @resource.save
    TipTopic.create(
      resource_id: @resource.id,
      topic_id: @topic1.id
    )
    TipTopic.create(
      resource_id: @resource.id,
      topic_id: @topic2.id
    )

    assert_equal(2, @resource.topics.size)
  end

  test 'url is unique' do
    @second_resource = LearnResource.new(
      title: 'test resource 2',
      url: 'www.someresource.com',
      user_id: users(:test_user1).id
    )
    assert_not @second_resource.valid?
  end
end
