class MovieSubmissionJob < ApplicationJob
  queue_as :default

  def perform(movie_id, score, user_id)
    movie = Movie.find(movie_id)
    movie.user_movies.create(user_id: user_id, score: score)
  end
end
