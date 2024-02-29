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

  def new_import
    render 'new_import'
  end

  def import
    if params[:json_data].blank?
      redirect_to new_import_movies_path, alert: 'Please select a JSON file.'
      return
    end
  
    json_data = params[:json_data]
    if File.extname(json_data.original_filename) != '.json'
      redirect_to new_import_movies_path, alert: 'Invalid file format. Please select a JSON file.'
      return
    end
  
    movies_data = JSON.parse(json_data.read)
    
    movies_data.each do |movie_data|
      Movie.create(title: movie_data['title'], director: movie_data['director'])
    end
  
    flash[:notice] = "Film importing completed."
    redirect_to movies_path
  end
  
  def new_bulk_score_submission
    @movies = Movie.all 
  end

  def submit_scores_in_bulk
    scores_data = permitted_bulk_scores_params[:scores_data]
    scores_data.each do |movie_id, score|
      movie = Movie.find(movie_id)
      movie.user_movies.create(user_id: current_user.id, score: score)
    end
    

    redirect_to movies_path, notice: "Bulk grade submission initiated in the background."
  end

  private

  def movie_params
    params.require(:movie).permit(:title, :director)
  end

  private

  def permitted_bulk_scores_params
    params.permit(scores_data: {})
  end

end
