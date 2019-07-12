ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'
require "minitest/reporters"
Minitest::Reporters.use!
[Minitest::Reporters::SpecReporter.new, Minitest::Reporters::ProgressReporter.new]

class ActiveSupport::TestCase

  fixtures :all
  #For model tests to test presence of required attribute
  def missing_data_assertion(object_attr, class_name)
    #create instance of class 
    class_instance = class_name.constantize.new
    #set desired prop to be equal to ''
    class_instance[object_attr] = ''
    sym = object_attr.to_sym
    refute class_instance.valid?, "user is invalid without #{object_attr}"
    assert_not_nil class_instance.errors[sym], "no validation error for #{object_attr} present"
  end 
end
