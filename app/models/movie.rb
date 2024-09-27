class Movie < ApplicationRecord
  validates :title, uniqueness: true
  has_many :reviews,  dependent: :destroy

  def number_of_reviews
    self.reviews.count
  end

end
