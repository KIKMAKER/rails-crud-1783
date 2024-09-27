class Review < ApplicationRecord
  belongs_to :movie
  validates :content, presence: true
  belongs_to :user


end
