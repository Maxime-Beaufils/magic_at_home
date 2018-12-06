class Profile < ApplicationRecord
  belongs_to :user

#  def address
#    [place]
#  end
#  geocoded_by :address

#  after_validation :geocode
end
