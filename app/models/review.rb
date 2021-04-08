class Review < ApplicationRecord
  paginates_per 10

  has_one_attached :image

  validates :username, :content, :rating, presence: true
  validates :content, length: { maximum: 1000 }
  validates :username, length: { maximum: 20 }
  validates :rating, numericality: {
    greater_than_or_equal_to: 1, less_than_or_equal_to: 5, only_integer: true
  }
  
  scope :newest, -> { order(created_at: :desc) }
  scope :highest_rating, -> { order(rating: :desc) }
  scope :lowest_rating, -> { order(rating: :asc) }

  def self.applyQuery(query)
    if query == "hi-lo"
      Review.highest_rating
    elsif query == "lo-hi"
      Review.lowest_rating
    else
      Review.newest
    end
  end
end
