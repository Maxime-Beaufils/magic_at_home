class Profile < ApplicationRecord
  belongs_to :user, optional: true

#  def address
#    [place]
#  end
#  geocoded_by :address

#  after_validation :geocode
end
