require 'test_helper'

class ReportControllerTest < ActionDispatch::IntegrationTest
  test "should get custlist" do
    get report_custlist_url
    assert_response :success
  end

end
