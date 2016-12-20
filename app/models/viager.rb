class Viager < ApplicationRecord
  belongs_to :old

  mount_uploader :photo, PhotoUploader

  geocoded_by :full_address
  after_validation :geocode, if: :address_changed?

  def full_address
    self.address + ', ' + self.city
  end



end
