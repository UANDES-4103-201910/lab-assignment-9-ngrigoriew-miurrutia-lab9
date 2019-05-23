require 'test_helper'

class TicketTypeControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get ticket_type_index_url
    assert_response :success
  end

end
