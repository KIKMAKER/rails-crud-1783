class MoviesController < ApplicationController
  before_action :set_movie, except: [:index, :new, :create, :top_rated]
  def index
    @movies = policy_scope(Movie)
  end

  def show
    # set movie before action
    authorize @movie
    @review = Review.new
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

  def top_rated
    @movies = Movie.where(rating: 10)
  end

  def director
    # @movie = Movie.find(params[:id])
    @director = @movie.director
  end

  private

  def set_movie
    @movie = Movie.find(params[:id])
  end

  def movie_params
    params.require(:movie).permit(:title, :rating, :director)
  end
end
