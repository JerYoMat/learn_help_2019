# frozen_string_literal: true

require 'test_helper'
require 'pry'

# Model tests for LearnResources
class LearnResourceTest < ActiveSupport::TestCase
  setup do
    user = users(:test_user1)
    @resource = LearnResource.new(
      title: 'test resource',
      url: 'www.someresource.com',
      user_id: user.id
    )
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

  test 'url is unique' do
    @resource.save 
    @second_resource = LearnResource.new(
      title: 'test resource 2',
      url: 'www.someresource.com',
      user_id: users(:test_user1).id
    )
    assert_not @second_resource.save
  end
end
