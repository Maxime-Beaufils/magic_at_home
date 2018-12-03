require 'test_helper'

class DashboardsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get dashboards_index_url
    assert_response :success
  end

  test "should get profil" do
    get dashboards_profil_url
    assert_response :success
  end

end
