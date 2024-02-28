# test/models/user_movie_test.rb

require 'test_helper'

class UserMovieTest < ActiveSupport::TestCase
  setup do
    @user_movie = user_movies(:one) 
  end

  test "should be valid" do
    assert @user_movie.valid?
  end

  test "should require user_id" do
    @user_movie.user_id = nil
    assert_not @user_movie.valid?
  end

  test "should require movie_id" do
    @user_movie.movie_id = nil
    assert_not @user_movie.valid?
  end

end
