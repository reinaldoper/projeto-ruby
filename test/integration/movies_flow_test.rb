
class MoviesFlowTest < ActionDispatch::IntegrationTest
  test "can see the movies index" do
    get "/movies"
    assert "h1", "Movies"
  end
end
