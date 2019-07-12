# frozen_string_literal: true

require 'test_helper'
require 'pry'
def test_user_missing(object_attr)
  missing_data_assertion(object_attr, @user)
end

class UserTest < ActiveSupport::TestCase
  setup do
    @user = User.new(
      name: 'model test',
      email: 'test@model.com',
      github_username: 'test1',
      password: 'password'
    )
  end

  test 'is valid user' do
    assert @user.valid?
  end

  test 'user requires name' do
    test_user_missing('name')
  end

  test 'user requires email' do
    test_user_missing('email')
  end

  test 'user requires github username' do
    test_user_missing('github_username')
  end

  test 'email should not be too long' do
    @user.email = 'a' * 246 + '.email.com'
    assert_not @user.valid?
  end

  test 'email validation should accept valid addresses' do
    valid_addresses = %w[
      user@example.com
      USER@foo.COM
      A_US-ER@foo.bar.org
      first.last@foo.jp
      alice+bob@baz.cn
      gg.g@g.g
    ]
    valid_addresses.each { |address| entry_valid?(address, @user, 'email') }
  end

  test 'email validation should reject invalid addresses' do
    invalid_addresses = %w[
      user@example,com
      user_at_foo.org
      user.name@example.
      foo@bar_baz.com
      foo@bar+baz.com
    ]
    invalid_addresses.each { |address| entry_invalid?(address, @user, 'email') }
  end

  test 'email address should be unique' do
    duplicate_user = @user.dup
    duplicate_user.email = @user.email.upcase
    @user.save
    assert_not duplicate_user.valid?
  end

  test 'all email should be saved to db as lower case' do
    mixed_case_email = 'NoobSkool@NoOB.Com'
    @user.email = mixed_case_email
    @user.save
    assert_equal mixed_case_email.downcase, @user.reload.email
  end

  test 'password should be present (nonblank)' do
    @user.password = ' ' * 6
    assert_not @user.valid?
  end

  test 'password should have a minimum length' do
    @user.password = 'a' * 5
    assert_not @user.valid?
  end
end
