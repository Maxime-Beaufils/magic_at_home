class Event < ApplicationRecord
  belongs_to :user_event_creator, class_name: "User", optional: true
  has_many :user_participant, through: :EventUsers, class_name: "User"
  validates :title, presence: true
  attr_accessor :date_range

  def all_day_event?
    self.start == self.start.midnight && self.end == self.end.midnight ? true : false
  end
end
