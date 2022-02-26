# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  setup do
    @alice = User.create!(email: 'alice@example.com', password: 'password')
    @bob = User.create!(email: 'bob@example.com', password: 'password')
    @relationship = Relationship.new(following: @alice, follower: @bob)
  end

  test '#name_or_email' do
    user = User.new(email: 'alice@example.com', name: '')
    assert_equal 'alice@example.com', user.name_or_email

    user.name = 'Alice'
    assert_equal 'Alice', user.name_or_email
  end

  test '#following?' do
    assert_not @alice.following?(@bob)
    @alice.follow(@bob)
    assert @alice.following?(@bob)
  end

  test 'followed_by?' do
    assert_not @alice.following?(@bob)
    @alice.follow(@bob)
    assert @bob.followed_by?(@alice)
  end

  test '#follow' do
    assert_not @alice.following?(@bob)
    @alice.follow(@bob)
    assert @bob.followers.include?(@alice)
  end

  test '#unfollow' do
    @alice.follow(@bob)
    assert @bob.followers.include?(@alice)
    @alice.unfollow(@bob)
    assert_not @bob.followers.include?(@alice)
  end
end
