class MovieImportJob < ApplicationJob
  queue_as :default

  def perform(movie_data)
    Movie.create(title: movie_data['title'], director: movie_data['director'])
  end
end
