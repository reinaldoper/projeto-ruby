
require "application_system_test_case"

class UserVisitsMoviesTest < ApplicationSystemTestCase
  test "visiting the index" do
    visit movies_url
    assert_selector "h1", text: "Movies"
  end
end
