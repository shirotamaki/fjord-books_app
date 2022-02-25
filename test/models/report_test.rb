# frozen_string_literal: true

require 'test_helper'

class ReportTest < ActiveSupport::TestCase
  setup do
    @user = User.new(name: 'Alice', email: 'alice@example.com', password: 'password')
    @today = Time.current
    @report = Report.new(user: @user, title: 'Alice\'s memo', content: 'Alice\'s content', created_at: @today)
  end

  test '#editable?' do
    assert @report.editable?(@user)
  end

  test '#created_on' do
    assert_equal @today.to_date, @report.created_on
  end
end
