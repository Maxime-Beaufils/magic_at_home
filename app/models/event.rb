class Event < ApplicationRecord
  belongs_to :user_event_creator, class_name: "User", optional: true
  has_many :user_participant, through: :EventUsers, class_name: "User"

end
