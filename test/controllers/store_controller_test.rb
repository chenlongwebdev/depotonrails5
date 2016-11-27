require 'test_helper'
#product可以通过scaffold来自动生成，但是store不行，因为store在db中没有对应的table 这只是products的展示界面
class StoreControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get store_index_url
    assert_response :success
  end

end
