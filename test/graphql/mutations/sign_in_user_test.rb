require 'test_helper'

class Mutations::SignInUserTest < ActiveSupport::TestCase
  def perform(args = {})
    Mutations::SignInUser.new(object: nil, context: { session: {} }).resolve(args)
  end

  def create_user
    User.create!(
      name: 'Test User',
      email: 'email@example.com',
      password: '[omitted]'
    )
  end

  test 'success' do
    user = create_user

    result = perform(
      email: {
        email: user.email,
        password: user.password
      }
    )

    assert result[:token].present?
    assert_equal result[:user], user
  end

  test 'failure because no credentails' do
    assert_nil perform
  end

  test 'failure because wrong email' do
    create_user
    assert_nil perform(email: { email: 'wrong' })
  end

  test 'failure because wrong password' do
    user = create_user
    assert_nil perform(email: { email: user.email, password: 'wrong' })
  end
end
