require 'test_helper'

class MoviesControllerTest < ActionDispatch::IntegrationTest
  setup do
    get login_path, params: { session: { email: 'admin@rotten', password: 'admin' } }
  end

  test "should get index" do
    get movies_url
    assert :success
  end
end
