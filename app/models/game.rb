class Game < ApplicationRecord
  belongs_to :user_creator, class_name: "User"
  belongs_to :user_opponent, class_name: "User", optional: true
end
