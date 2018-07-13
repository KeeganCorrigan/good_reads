class Book < ApplicationRecord
  has_many :book_users

  has_many :users, through: :book_users

  def average_rating
    users.joins(:reviews).average(:rating).to_f
  end

  def highest_rating
    users.joins(:reviews).maximum(:rating).to_f
  end

  def lowest_rating
    users.joins(:reviews).minimum(:rating).to_f
  end
end
