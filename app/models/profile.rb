class Profile < ApplicationRecord
  belongs_to :user, optional: true

  def address
    [street, zip, city, country, country].compact.join(', ')
  end
 geocoded_by :address

  after_validation :geocode
end
