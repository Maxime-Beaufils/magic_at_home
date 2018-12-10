class Game < ApplicationRecord
  belongs_to :user_creator, class_name: "User", optional: true
  belongs_to :user_opponent, class_name: "User", optional: true
  has_many :game_comments

  def address
    [place]
  end
  geocoded_by :address

  after_validation :geocode
end
