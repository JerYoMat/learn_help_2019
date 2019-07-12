ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'
require "minitest/reporters"
Minitest::Reporters.use!
[Minitest::Reporters::SpecReporter.new, Minitest::Reporters::ProgressReporter.new]

class ActiveSupport::TestCase

  fixtures :all

end
