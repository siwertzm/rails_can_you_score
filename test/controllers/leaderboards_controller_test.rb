require "test_helper"

class LeaderboardsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get leaderboards_show_url
    assert_response :success
  end
end
