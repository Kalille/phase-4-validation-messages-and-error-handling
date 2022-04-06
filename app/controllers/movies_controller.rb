class MoviesController < ApplicationController
  wrap_parameters false
  
  def index
    movies = Movie.all
    render json: movies
  end

  def show
    movie = Movie.find_by(id: params[:id])
    if movie
    render json: movie 
    else
        render json: {errors: " movie not found"}, status: :not_found
    end
  end

  def create
   
    movie = Movie.create(movie_params)
if movie
    render json: movie, status: :created
else
    render json: {errors: e.record.errors.full_messages}, status: :unprocessable_entity
end
  end

  private

  def movie_params
    params.permit(:title, :year, :length, :director, :description, :poster_url, :category, :discount, :female_director)
  end
  
end
