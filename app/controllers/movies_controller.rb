class MoviesController < ApplicationController
  before_action :set_movie, except [:index, :new, :create]
  def index
    @movies = Movie.all
  end

  def show

  end

  def new
    @movie = Movie.new
  end

  def create
    movie = Movie.new(movie_params)
    if movie.save
      redirect_to movie_path(movie)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit

  end

  def update

    if @movie.update(movie_params)
      redirect_to movie_path(@movie)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @movie.delete
    redirect_to movies_path
  end

  private

  def set_movie
    @movie = Movie.find(params[:id])
  end

  def movie_params
    params.require(:movie).permit(:title, :rating, :director)
  end
end
