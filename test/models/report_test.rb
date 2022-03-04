# frozen_string_literal: true

require 'test_helper'

class ReportTest < ActiveSupport::TestCase
  setup do
    @user = users(:Alice)
    @today = Time.current
    @report = reports(:today_weather)
  end

  test '#editable?' do
    assert @report.editable?(@user)
  end

  test '#created_on' do
    assert_equal @today.to_date, @report.created_on
  end
end
