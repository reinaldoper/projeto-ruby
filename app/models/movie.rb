class Movie < ApplicationRecord
  has_many :user_movies
  has_many :users, through: :user_movies

  def average_score
    user_movies.average(:score).to_f
  end

  def self.create_movies_in_bulk_from_json(json_data)
    movies_data = JSON.parse(json_data, symbolize_names: true)
    
    Movie.transaction do
      Movie.create(movies_data)
    end
  end

  def self.submit_scores_in_bulk(scores_data)
    UserMovie.transaction do
      UserMovie.create(scores_data)
    end
  end
end
