class Viager < ApplicationRecord
  belongs_to :old
  # has_attachment :photos, maximum: 15
  mount_uploader :photo, PhotoUploader
end
