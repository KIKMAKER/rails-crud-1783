class ReviewsController < ApplicationController

  def index
    @movie = Movie.find(params[:movie_id])
    @reviews = @movie.reviews
  end

  def show
    @review = Review.find(params[:id])
  end

  # def new
  #   @movie = Movie.find(params[:movie_id])
  #   @review = Review.new
  # end

  def create
    @movie = Movie.find(params[:movie_id])
    @review = Review.new(review_params)
    @review.movie = @movie
    @review.user = current_user

    authorize @review

    if @review.save
      redirect_to movie_path(@movie)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @review = Review.find(params[:id])

  end

  def update
    @review = Review.find(params[:id])

  end


  def destroy
    @review = Review.find(params[:id])
    authorize @review
    @review.destroy
    redirect_to movie_path(@review.movie)
  end

  private
  def review_params
    params.require(:review).permit(:content)
  end
end
