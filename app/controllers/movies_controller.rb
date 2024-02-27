class MoviesController < ApplicationController
  before_action :authenticate_user!

  def index
    @movies = Movie.all
    respond_to do |format|
      format.html
      format.json { render json: @movies.to_json(methods: :average_score) }
    end
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)
    if @movie.save
      redirect_to movies_path, notice: "Movie was successfully created."
    else
      render :new
    end
  end

  def import
    json_data = params[:json_data]
    ImportMoviesJob.perform_async(json_data)

    redirect_to movies_path, notice: "Importação de filmes iniciada em segundo plano."
  end

  def submit_scores_in_bulk
    scores_data = params[:scores_data]
    SubmitScoresInBulkJob.perform_async(scores_data)

    redirect_to movies_path, notice: "Submissão de notas em massa iniciada em segundo plano."
  end

  private

  def movie_params
    params.require(:movie).permit(:title, :director)
  end
end
