# frozen_string_literal: true

ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'
require 'minitest/reporters'

Minitest::Reporters.use!

class ActiveSupport::TestCase

  fixtures :all
  
  def missing_data_assertion(instance_var, class_instance)
    class_instance[instance_var] = ''
    sym = instance_var.to_sym
    assert_not class_instance.valid?, "user is invalid without #{instance_var}"
    assert_not_nil class_instance.errors[sym], "no validation error for #{instance_var} present"
  end

  def entry_valid?(item, class_instance, instance_var)
    class_instance[instance_var] = item
    assert class_instance.valid?, "#{item.inspect} should be valid"
  end

  def entry_invalid?(item, class_instance, instance_var)
    class_instance[instance_var] = item
    assert_not class_instance.valid?, "#{item.inspect} should not be valid"
  end


end
